---
title: First Time 3D Printing
date: 2023-12-8 19:19:00 -0400
categories: [Project, 3D Printing]
tags: [3d printing] 
media_subpath: /assets/figures/2023-images/2023-12-18-first-time-3d-printing
---

I was surprised to realize that, despite two years of robotics education, I hadn't been motivated to learn about 3D printing. I didn't really have a chance to print anything for my classes, and I couldn't see how it'd be useful for me. 

Recently, I figured out that I could use 3D printing to resolve the issue with the annoyingly long cords of my webcam and microphone by making my own stands and mounts. So, in this post, I'm going to share my journey of diving into 3D printing for the first time.
## Results

|Camera Stand | Microphone Stand|
| ------- |------- |
|![](camera.jpg){: width="300"}| ![](microphone.jpg){: width="300"}|

## What do you need to get start

### Hardware
I primarily use [Creality Ender-3 V3 SE](https://store.creality.com/products/ender-3-v3-se-3d-printer), which is one of the best beginner-level 3D printers available today. It's surprisingly easy to use. To get started on this journey, you'll need a few things: a 3D printer (like the Ender-3), 3D printing filament, an SD card, and a laptop equipped with drawing software.

### Software
- Fusion 360 (Need license): a CAD software creates the digital 3D model of the object you want to print.
  - Usually you would export the drawing with `.stl` type, which cannot be loaded directly to the printer.
- Ultimaker Cura (FREE): a slicing software takes the 3D model and translates it into G-code, which is the language that 3D printers understand.
  - By using Cura, you can export `.gcode` file which can be loaded directly to the printer.

The workflow starts with you creating designs in Fusion 360. Once you've completed a design, you export it as an .stl file to your laptop. Next, import this .stl file into Cura, where you'll slice the model and configure your preferred printing settings. After that, you export the final design as a .gcode file onto your SD card. Now, you can insert the SD card directly into your 3D printer and wait for your creation to materialize.

Personally, I find the slicing software quite intuitive, provided you're familiar with the terminology. However, the drawing aspect can be challenging. There are times when it's frustratingly difficult to create the shape you want, or you can't find the appropriate tool. YouTube tutorials are a great resource, but even with their help, my drawing skills are currently limited to using basic tools. An expert might accomplish in one click what takes me several attempts.

## What did I make

### Microphone Stand
One major issue with my microphone is the thick long cord, which is not only cumbersome but also aesthetically displeasing. Additionally, the tripod base takes up a significant amount of desk space, which is less than ideal for my setup. While I'm not usually one to fuss over cable management, the exposed cord has become increasingly irritating.

![](microphone_original.jpg){: width="400" }

Firstly, I decided to replace the microphone's stand, and the outcome was quite pleasing. Take a look at the results below, it already looks much better.
<center>
<iframe src="https://umich4087.autodesk360.com/shares/public/SHd38bfQT1fb47330c9931dd15eb34853bf4?mode=embed" width="600" height="400" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"  frameborder="0"></iframe>
</center>

![](microphone_progress1.jpg){: width="600" }


Next, I added a cord organizer at the base of the stand, and it looks cleaner!

<center>
<iframe src="https://umich4087.autodesk360.com/shares/public/SHd38bfQT1fb47330c994ff17710b7aae043?mode=embed" width="600" height="400" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"  frameborder="0"></iframe>
</center>
![](microphone_progress2.jpg){: width="600"}

Eventually it looks like this when we put the two pieces together.
![](microphone_progress3.jpg){: width="600"}



### Webcam Stand
My webcam came with a clip for attaching it to the monitor, but it never really secured the camera in place, often resulting in an weird downward angle during Zoom meetings. This obviously needed to be changed.

The base of the webcam stand is similar to that of the microphone, featuring a cord organizer and a cap. The standout feature of this stand is the ball joint I added, which allows the top of the stand to move and be positioned at any angle I desire.

Here is the 3D model:

<center>
<iframe src="https://umich4087.autodesk360.com/shares/public/SHd38bfQT1fb47330c997d743b3c36b0c35a?mode=embed" width="600" height="400" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"  frameborder="0"></iframe>
</center>

![](ball-joint.jpg){: width="600" }

To attach the ball joint stand to the base, I used M2.5 threaded inserts and M2.5 x 8mm Screws.

Overall, I am very pleased with the outcomes of both setups and excited to build more!