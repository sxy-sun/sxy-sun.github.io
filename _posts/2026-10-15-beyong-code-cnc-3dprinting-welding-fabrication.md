---
title: "Beyond Code: CNC, 3D Printing, Soldering, Welding & Fabrication"
date: 2026-10-15 00:00:00 -0400
categories: [Tech Blog]
media_subpath: /assets/figures/2026-images/2026-10-15-beyong-code-cnc-3dprinting-welding-fabricatoin
---

Recently, I’ve been thinking that versatility is the most important skill for a robotics engineer in the age of AI. The University of Michigan has two places to learn manufacturing skills, from basic machining and 3D printing to CNC and welding, so I decided to learn everything they offer. The training map is below. This post is where I keep track of what I’ve learned and built.

- [Wilson Center Training](https://teamprojects.engin.umich.edu/home/training/)
- [Robotics Makerspace Training](https://teamprojects.engin.umich.edu/makerspace-training/) 

![](training-map.png){: width="600"} 

## Table of Contents

- [Getting Started](#getting-started)
  - [Basic Workshop Safety I](#basic-workshop-safety-i)
  - [Wilson Center Basics II](#wilson-center-basics-ii)
  - [FRB Basics II - Soldering, CO2 Laser Cutting, 3D Printing](#frb-basics-ii)
- [Machining](#machining)
  - [Manual Mill](#manual-mill)
  - [Manual Lathe](#manual-lathe)
  - [CNC ProtoTRAK Mill](#cnc-prototrak-mill)
  - [Haas VF-2 Mill](#haas-vf-2-mill)
  - [CNC TL-1 Lathe](#cnc-tl-1-lathe)
  - [Haas SL-20 Lathe](#haas-sl-20-lathe)
- [Laser Cutting & Fabrication](#laser-cutting--fabrication)
  - [Universal R9000](#universal-r9000)
  - [Fablight Metal Laser Cutter](#fablight-metal-laser-cutter)
  - [ProtoMAX Waterjet](#protomax-waterjet)
  - [ShopBot CNC Router](#shopbot-cnc-router)
- [Welding](#welding)
  - [TIG 1](#tig-1)
  - [TIG 2](#tig-2)
  - [MIG Welding](#mig-welding)
  - [Aluminum Welding](#aluminum-welding)

## Getting Started

### Basic Workshop Safety I

**Location:** Canvas  
**Completed:** October 13, 2026

This is the starting point for all training sessions. It introduces basic workshop safety rules through Canvas modules and quizzes that must be passed.

### Wilson Center Basics II

**Location:** Wilson Student Team Project Center  
**Completed:** October 15, 2026

This is the starting point for all hands-on training at the Wilson Center. It consists of two parts. The first is on Canvas, with videos and quizzes covering the basics and introducing the final project.

The second part is an in-person project. I made two aluminum pieces using the workshop tools below.

| Final Result - A pencil holder||
| --- | --- |
| ![Completed assembly, front view](result1.JPG){: width="300"} | ![Completed assembly, side view](result2.JPG){: width="300"} |
{: .photo-table}

| Photo | Tool and notes |
| --- | --- |
| ![Shear](shear.JPG){: width="300"} | **Shear.** This machine was used to cut the sheet aluminum to size. |
| ![Manual hole punch](punch.JPG){: width="300"} | **Manual hole punch.** This machine was used to punch the holes in the sheet aluminum. |
| ![Horizontal bandsaw](bandsaw.JPG){: width="300"} | **Horizontal bandsaw.** This machine was used to cut the aluminum stock for the bottom piece. |
| ![Drill press](drill-press.JPG){: width="300"} | **Drill press.** This machine was used to drill the blind holes in the bottom piece. |
{: .photo-table}

Dial calipers were used to measure the pieces and mark cut lines and hole locations. Files and deburring tools were used to smooth the edges and holes. A brake was used to bend the sheet aluminum, and a hand tap was used to cut internal threads in the bottom piece.

### FRB Basics II - Soldering, CO2 Laser Cutting, 3D Printing {#frb-basics-ii}

**Location:** Ford Robotics Building  
**Planned:** October 23, 2026

This course introduces soldering, CO2 laser cutting, and 3D printing.

## Machining

### Manual Mill

**Location:** Wilson Center  
**Canvas Training:** Completed  
**In-Person Training:** Upcoming

The Canvas training introduced the basic tools and operations of a manual milling machine.
- **Shell Mill:** Removes a large area of material from the surface of a workpiece.
- **End Mill:** Available in different diameters. Can cut sideways, and some can plunge vertically.
- **Boring Bar:** Used to enlarge an existing hole.
- **Drill Chuck:** Holds drill bits for drilling. Cannot be used for sideways cutting.
- **Auto Drawbar:** Automatically tightens and loosens the drawbar for faster tool changes.

The spindle speed must be adjusted while the machine is running.

#### Setting Zero

The **Digital Readout (DRO)** displays the position of each axis. We need to establish the workpiece origin so we can use the DRO to position the cutter according to the drawing. The workshop's DRO only displays X and Y, so we use an **edge finder** to locate their zero positions.

1. Install the edge finder in the collet and tighten it.
2. Start the spindle and slowly move the edge finder toward the workpiece.
3. When the edge finder touches the material, its tip begins spinning straight.
4. Continue moving slowly until the tip suddenly deflects to the side, indicating the workpiece edge.

The spindle center is still one edge finder radius away from the actual edge. If the edge finder's radius is 0.100", we can compensate by:

1. Moving the spindle center 0.100" toward the edge, then setting the DRO to zero.
2. Or setting the current DRO position to -0.100" when approaching from the negative direction.

For the **Z-axis**, there are two methods:

1. **Cutting to Dimension:** Slowly move the spinning cutter toward the workpiece surface until it produces a small chip, then set the Z reference to zero. This removes a small amount of material.
2. **Setting Z-Height:** Use the knee and its mechanical dial. Raise the knee until the workpiece lightly touches the cutter, then set the dial to zero. Lower the knee for clearance. When ready to cut, raise it back to the reference height, then continue by the desired cutting depth.

#### Reaming

Reaming improves the size and finish of an existing hole.
- Use a slower RPM.
- Do not peck drill.
- Use cutting fluid.
- Feed slowly and steadily.

#### Tapping

Tapping creates internal threads in a previously drilled hole.

1. Use a tap guide to keep the tap aligned with the hole.
2. Apply gentle pressure with the guide while starting the tap.
3. Turn the tap approximately one full turn forward and half a turn backward to break the chips.
4. Repeat until the required thread depth is reached.

### Manual Lathe

**Location:** Wilson Center  
**Completed:** TBD

### CNC ProtoTRAK Mill

**Location:** Wilson Center  
**Completed:** TBD


### Haas VF-2 Mill

**Location:** Wilson Center  
**Completed:** TBD

### CNC TL-1 Lathe

**Location:** Wilson Center  
**Completed:** TBD

### Haas SL-20 Lathe

**Location:** Wilson Center  
**Completed:** TBD


## Laser Cutting & Fabrication

### Universal R9000

**Location:** FRB Robotics Makerspace  
**Completed:** TBD

This course introduces the Universal R9000 laser cutter.

### Fablight Metal Laser Cutter

**Location:** FRB Robotics Makerspace  
**Completed:** TBD

This course introduces the Fablight FL4500 Tube & Sheet fiber laser cutter.

### ProtoMAX Waterjet

**Location:** FRB Robotics Makerspace  
**Completed:** TBD

This course introduces the ProtoMAX abrasive waterjet cutter.

### ShopBot CNC Router

**Location:** Wilson Center  
**Completed:** TBD

## Welding

### TIG 1

**Location:** Wilson Center  
**Completed:** TBD


### TIG 2

**Location:** Wilson Center  
**Completed:** TBD


### MIG Welding

**Location:** Wilson Center  
**Completed:** TBD

### Aluminum Welding

**Location:** Wilson Center  
**Completed:** TBD
