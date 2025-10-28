---
title: Diving into C++ - Beginner but Not Beginner
date: 2024-03-08 17:35:00 -0400
categories: [Tech, C++]
tags: [cpp, cmake] 
---

I recently started working with a large C++ codebase at my job, which sparked my interest in really learning C++. Until now, I've only used C++ when necessary, without fully diving into it.

Therefore, I've decided to document the things I learn in this blog post. It will serve as a future reference for me, including all the trivial details that I previously overlooked.

My environment is Ubuntu 22.04, so this post might be relevant primarily for Linux users.

## Get Started
C++ is a compiled language, requiring a compiler to transform source code into object code that a machine can execute.

Check if we have a compiler already:
```bash
gcc --version
```

If not, install one:
```bash
sudo apt update && sudo apt install build-essential
```
build-essenial contains: gcc, g++, make (and other packages)
- GCC (GNU Compiler Collection)
- gcc (GNU C Compiler)
- g++ (GNU C++ Compiler)

Now with compiler installed, how to use it? Started with the classic hello world program:

```c++
#include <iostream>

int main() {
    std::cout << "Hello World!" << std::endl;
    return 0;
}
```

To compile and run this program:
```bash
g++ hello_world.cpp -o hello_world
# Then run the executable
./hello_world
```

However, using the `g++` command directly for compiling can quickly become cumbersome as your C++ projects grow in size. In industrial settings, it's uncommon to compile entire projects with just `g++`. 

To avoid memorizing complex `g++` commands and manually recompiling files after changes, we turn to automation tools.


## GNU Make
To simplify the build process, as Linux user, we can use [GNU make](https://www.gnu.org/software/make/manual/html_node/index.html). It is a build automation tool that builds executables and libraries from source code by reading files called makefiles, which specify how to derive the target program. 

The standard name for a Makefile is simply "Makefile" or "makefile". This convention allows you to run the `make` command without specifying a particular file, as `make` will automatically look for them in the current directory.

```bash
make
```
- This command would just run whatever command makefile tells it to.

```bash
make clean
```
- This removes the executable and cleans the project directory.

A makefile is easier than using g++ directly, but they are not easy to write, because they look like [this](https://www.gnu.org/software/make/manual/html_node/Simple-Makefile.html). So, we want to use an even higher-level tool to avoid dealing with these tricky commands.

## CMake
[CMake](https://cmake.org/cmake/help/latest/index.html#) is a tool to manage building of source code. It provides a way to control the building process of software projects in a platform-independent manner.

With CMake, developers write a configuration file named `CMakeLists.txt` to specify how to build their projects. CMake uses this file to produce build files specific to the developer's platform, which can be used by native build tools—such as GNU Make on Unix-like systems, Ninja, Visual Studio on Windows, and Xcode on macOS—to actually compile and link the software.

It is designed to be used in conjunction with the native build environment. A typical build process on Ubuntu would look like this:
```bash
mkdir build
cd build
cmake ..
make
```
- Specify the project's build instructions, dependencies, and any special build requirements in the `CMakeLists.txt` file.
- `cmake` automatically looks for a file named `CMakeLists.txt` in the given directory, and then generate the build files. This step people usually create a separate `build` directory to keep source directory clean.

> Note: "CMakeLists.txt", the file name has to be exactly this string. 

### CMakeLists.txt
Here is a minimal CMakeLists.txt:
```cmake
# Specify the minimum version of CMake required
cmake_minimum_required(VERSION 3.10)

# Define the project name, version, and the language used
project(MyProject VERSION 1.0 LANGUAGES CXX)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add an executable to the project using the specified source files
add_executable(MyExecutable main.cpp)
```
- Without `cmake_minimum_required()`, `project()`, and `add_executable()`, this file will not work.
