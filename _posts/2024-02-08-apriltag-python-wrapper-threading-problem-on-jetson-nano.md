---
title: AprilTag Python Wrapper Threading Problem on Jetson Nano
date: 2024-02-08
categories: [Tech Blog]

---


> This post is to document my debugging process.

## Background
The project focused on implementing AprilTag detection on an Nvidia Jetson Nano using an Arducam. The objective was to stream video while displaying pose estimations (x, y, z, yaw, pitch, roll) directly onto the video page. This capability is crucial in robotics, enabling remote access to the robot camera knowing the relative pose from the robot to the goal.

We are using Ubuntu 20.04 on Nvidia Jetson Nano, and the project was implemented in Python3 using a Python Wrapper from the AprilTag library.

Project Pipeline:
1. Capture the video stream using OpenCV `VideoCapture()` with an accelerated GStreamer pipeline as the source.
2. Utilize the OpenCV & Flask for real-time video streaming in web browser. This method is chosen over remote desktop solutions like NoMachine, which tend to be slow.
3. Install [Apriltag library](https://github.com/AprilRobotics/apriltag) from the official GitHub repository and incorporate it into the Python program.
4. Use OpenCV `solvePnP()` function to calculate the pose based on real-time AprilTag detections.

This method turned out to be quite successful, managing to keep the lag to roughly 0.5 seconds when viewing the video stream on a laptop browser.

However, as I continued testing there was an unexpected error that would sometimes interrupt the program.

```python
Error on request:
Traceback (most recent call last):
  File "/home/mbot/.local/lib/python3.8/site-packages/werkzeug/serving.py", line 362, in run_wsgi
    execute(self.server.app)
  File "/home/mbot/.local/lib/python3.8/site-packages/werkzeug/serving.py", line 325, in execute
    for data in application_iter:
  File "/home/mbot/.local/lib/python3.8/site-packages/werkzeug/wsgi.py", line 256, in __next__
    return self._next()
  File "/home/mbot/.local/lib/python3.8/site-packages/werkzeug/wrappers/response.py", line 32, in _iter_encoded
    for item in iterable:
  File "apriltag_streamer.py", line 77, in generate_frames
    self.detections = self.detector.detect(gray)
RuntimeError: Unable to create 1 threads for detector
```

## Investigation

### Checking system limits
The error seems related to thread creation, so my first approach was to check the system limit.
```bash
$ cat /proc/sys/kernel/threads-max
```
- This command reveals the maximum number of threads the entire system can support simultaneously. In my case, the output was 27876.

```bash
$ ulimit -a
```
- This command displays the limits on the resources available to individual users, including the number of processes and threads a user can run concurrently. My output showed a "Max user processes" of 13938. 

These configured limits alone do not rule out a runtime thread creation limit.

### Checking number of thread creation of the program
The error message reported a detector thread count of 1, but the exact number of threads spawned by our program remained unclear. To clarify, I implemented a thread monitoring mechanism using the `threading` library. The findings indicated a total of just four threads:
- Main thread: This is the primary execution thread of the Python application.
- Thread 1: A daemon thread, likely initiated by Flask's development server for processing incoming web requests.
- Thread 2: This thread is specifically responsible for managing client connections to the video streaming endpoint.
- Thread 3: Dedicated to the AprilTag detection process.

The Python `threading` count does not necessarily include native threads created by C extensions, so it cannot rule out excessive thread creation.

### Checking resource usage
The `free` command displays the total amount of free and used physical and swap memory in the system.
```bash
$ free
---
# idle state
              total        used        free      shared  buff/cache   available
Mem:        4058960     2339876      652624       61200     1066460     1545752
Swap:       2029472       56308     1973164
# full load running apriltag
              total        used        free      shared  buff/cache   available
Mem:        4058960     2558724      430468       61200     1069768     1258984
Swap:       2029472       56308     1973164
```

The `ps` command (Process Status) can be used to display information about active processes. 
```bash
$ ps aux | grep python3
```
When running the program under full load:
- Most of time memory usage was only 5%, which aligns with `free`'s result
- The CPU usage was always up to 130% to 200%, which means it used about 1.3 to 2 CPU cores, the Jetson nano has a quad-core processor so that's also not a problem.

### Reducing the load
Originally, the video source was set to 30 frames per second (fps), with the AprilTag detection configured to process every sixth frame (skipping 5 frames in between). After changing the code to skip more frames and reducing the video fps to 22, the error persisted.

Then, I disabled the Flask application from streaming video to an HTTP live stream, the error persisted.

Up to this point, it appears that the issue with thread creation may not be consistent. It might be random spikes in resource use from somewhere we haven't figured out yet. The next step is to actually see how the `RuntimeError` was set in the library. 

### Digging into the library code
The error was triggered [here](https://github.com/AprilRobotics/apriltag/blob/f8ce18516c25e04574c63eda0053ebe1c2342c6c/apriltag_pywrap.c#L246C8-L246C106) when there is no detection && `errno == EAGAIN` :
```c
if (N == 0 && errno == EAGAIN){
    PyErr_Format(PyExc_RuntimeError, "Unable to create %d threads for detector", self->td->nthreads);
    goto done;
}
```
- `EAGAIN` indicates a resource is temporarily unavailable, which can reflect insufficient resources or thread/process limits.
- This check was introduced in this [pull request](https://github.com/AprilRobotics/apriltag/pull/224).

Regarding the line:
```c
PyErr_Format(PyExc_RuntimeError, "Unable to create %d threads for detector", self->td->nthreads);
```
- `PyExc_RuntimeError` refers to Python's `RuntimeError` exception. By specifying this as the first argument to `PyErr_Format`, the function signals that it should raise a `RuntimeError` for the reported error.
- To handle this error and avoid immediate program termination, we can add a try-except block to catch the exception in the code.

## Workaround
I added a bounded retry loop to handle the reported thread creation error. A temporary spike in resource usage was one possibility, but I did not confirm it. If a matching `RuntimeError` is caught, the loop waits briefly before retrying. If all attempts fail, the last exception is re-raised.

The code looks like this:
```python
max_retries = 3
for attempt in range(max_retries):
    try:
        detections = detector.detect(image)
        break  # Success, exit the retry loop
    except RuntimeError as e:
        if "Unable to create" in str(e) and attempt < max_retries - 1:
            print(f"Detection failed due to thread creation issue, retrying... Attempt {attempt + 1}")
            time.sleep(1)  # wait for one second then retry
        else:
            raise  # Re-raise the last exception if retries exhausted
```
- The code makes at most 3 detection attempts: the initial attempt and up to 2 retries for the matching thread creation error. Other errors are re-raised immediately.

During testing, the program typically resumed after the first retry, and the video stream appeared smooth. The workaround allowed the program to recover in these cases, but the root cause remained unconfirmed.
