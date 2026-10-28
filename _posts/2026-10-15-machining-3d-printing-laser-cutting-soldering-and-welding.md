---
title: "Machining, 3D Printing, Laser Cutting, Soldering, and Welding"
date: 2026-10-15
last_modified_at: 2026-10-28
categories: [Tech Blog]
media_subpath: /assets/figures/2026-images/2026-10-15-machining-3d-printing-laser-cutting-soldering-and-welding
---

Recently, I’ve been thinking that versatility is a very important skill for a robotics engineer in the age of AI. The University of Michigan has two places to learn manufacturing skills, from basic machining and 3D printing to CNC and welding, the training map is below. This post is where I keep track of what I’ve learned and built.

- [Wilson Center Training](https://teamprojects.engin.umich.edu/home/training/)
- [Robotics Makerspace Training](https://teamprojects.engin.umich.edu/makerspace-training/) 

![My workshop training roadmap, showing prerequisites and progress through Wilson Center and FRB courses](training-roadmap.svg){: width="1380"}

## Table of Contents

- [Workshop Basics](#workshop-basics)
  - [Basic Workshop Safety I](#basic-workshop-safety-i) <span class="training-status training-status--completed">Completed</span>
  - [Wilson Center Basics II](#wilson-center-basics-ii) <span class="training-status training-status--completed">Completed</span>
  - [FRB Basics II - Soldering, CO2 Laser Cutting, 3D Printing](#frb-basics-ii) <span class="training-status training-status--completed">Completed</span>
  - [Introduction to Soft Goods](#introduction-to-soft-goods) <span class="training-status training-status--planned">Planned</span>
- [Machining](#machining)
  - [Manual Mill](#manual-mill) <span class="training-status training-status--planned">Planned</span>
  - [Manual Lathe](#manual-lathe) <span class="training-status training-status--planned">Planned</span>
- [Digital Fabrication](#digital-fabrication)
  - [Universal R9000](#universal-r9000) <span class="training-status training-status--completed">Completed</span>
  - [ProtoMAX Waterjet](#protomax-waterjet) <span class="training-status training-status--planned">Planned</span>
  - [ShopBot CNC Router](#shopbot-cnc-router) <span class="training-status training-status--completed">Completed</span>
- [Welding](#welding)
  - [TIG 1](#tig-1) <span class="training-status training-status--planned">Planned</span>
  - [TIG 2](#tig-2) <span class="training-status training-status--inactive">Not scheduled</span>
  - [MIG Welding](#mig-welding) <span class="training-status training-status--inactive">Not scheduled</span>
  - [Aluminum Welding](#aluminum-welding) <span class="training-status training-status--inactive">Not scheduled</span>

## Workshop Basics

### Basic Workshop Safety I

**Location:** Canvas  
**Status:** Completed · October 13, 2026

This is the starting point for all training sessions. It introduces basic workshop safety rules through Canvas modules and quizzes that must be passed.

### Wilson Center Basics II

**Location:** Wilson Student Team Project Center  
**Status:** Completed · October 21, 2026

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
**Status:** Completed · October 23, 2026

I built a small battery-powered light box with an engraved Michigan "M" on a clear acrylic panel.

| Finished Light Box | LEDs On |
| --- | --- |
| ![Completed Michigan M light box with LEDs off](frb-basic-result1.png){: width="300"} | ![Completed light box with five blue LEDs on](frb-basic-result2.png){: width="300"} |
{: .photo-table}

**Kit components**

![Light box kit with enclosure, acrylic panel, PCB, LEDs, resistors, switch, coin-cell battery and holder, and hardware](frb-basic2-components.JPG){: width="400"}

The kit included the designs, a preprinted enclosure, inserts, screws, and electronic components.

**3D printing**

The workflow is **CAD model → slicer → printer**. We used [Bambu Studio](https://github.com/bambulab/BambuStudio) to turn the supplied switch-cover model into print instructions for a Bambu Lab printer.

I've used Fusion 360 and Bambu Studio before. Below is an earlier Chiikawa print I made with that workflow on a Bambu Lab X1 Carbon.

![](hachi-3dprinting.JPG){: width="400"}

**CO2 laser cutting**

We cut and engraved the acrylic panel on a Universal Laser Systems VLS CO2 laser cutter. **Adobe Illustrator** is used to prepare the drawing; **Universal Control Panel (UCP)** handles job settings, previews, and machine control. [VLS user guide](https://ulsinc.com/assets/pdf/VLS_Platform_User_Guide_2026.02.0103.pdf).

| ULS VLS Laser Cutter | Acrylic Panel in the Machine |
| --- | --- |
| ![Universal Laser Systems VLS CO2 laser cutter](uls-vls-laser-cutter.JPG){: width="300"} | ![Acrylic panel with the Michigan M engraved in the laser cutter](co2-laser-cutting.JPG){: width="300"} |
{: .photo-table}

The sample board shows three operations:

- **Raster engraving:** The laser scans back and forth, removing surface material across a filled area. This works for text, logos, and images, such as the filled "M" on the acrylic panel.
- **Line engraving:** The laser follows the lines and curves in the drawing, leaving a shallow mark without cutting through. This works for outlines, borders, and reference marks.
- **Vector cutting:** The laser follows a path with settings that cut through the full material thickness. This creates the part's outer shape and openings, such as the acrylic panel's screw holes.

![Sample board showing raster engraving, vector engraving, and vector cutting](laser-functions.JPG){: width="400"}

**Soldering and assembly**

I soldered the LEDs, resistors, switch, and coin-cell battery holder onto the PCB. I had soldered before but hadn't done it in a while. I messed up the first joint, then got the skill back for the rest.

| Battery Holder and Switch | LEDs and Resistors |
| --- | --- |
| ![Coin-cell battery holder and switch soldered onto the back of the PCB](soldering1.JPG){: width="225"} | ![Front of the PCB with the first LED and resistor soldered in place](soldering2.JPG){: width="225"} |
{: .photo-table}


### Introduction to Soft Goods

**Status:** Planned · October 29, 2026

## Machining

### Manual Mill

**Location:** Wilson Center  
**Canvas Training:** Completed<br>
**In-Person Training:** Planned · November 11, 2026

A manual mill rotates the cutting tool while the workpiece stays in place. The main tools include:
- **Shell Mill:** Removes material from a large surface area.
- **End Mill:** Cuts sideways, and some can plunge vertically.
- **Boring Bar:** Enlarges an existing hole.
- **Drill Chuck:** Holds drill bits for drilling, not sideways cutting.
- **Auto Drawbar:** Tightens and loosens the drawbar for faster tool changes.

**To get started, we need to first set zeros.** The **Digital Readout (DRO)** displays the position of each axis. We need to establish the workpiece origin so we can use the DRO to position the cutter according to the drawing. 
- **For the X/Y axes**, the workshop's DRO only displays X and Y, so we use an **edge finder** to locate their zero positions. 
  - Slowly move the spinning edge finder toward the workpiece. When it touches the edge, its tip spins straight, then suddenly deflects to the side. At that point, the spindle center is still one edge finder radius away from the edge, so we need to compensate for that distance. For example, with a 0.100" radius, we can move the spindle center 0.100" toward the edge and then set the DRO to zero, or enter `X = -0.100"` when approaching from the negative X direction.
- For the **Z-axis** zero, there are two methods:
  1. **Cutting to Dimension:** Slowly move the spinning cutter toward the workpiece surface until it produces a small chip. This establishes the Z reference but removes a small amount of material.
  2. **Setting Z-Height:** Use the knee and its mechanical dial. Raise the knee until the workpiece lightly touches the cutter, then set the dial to zero. Lower the knee for clearance. When ready to cut, raise it back to the reference height, then continue by the desired cutting depth.

**Reaming** improves the size and finish of an existing hole. Use a slower RPM, cutting fluid, and a slow, steady feed without peck drilling.

**Tapping** creates internal threads in drilled holes. We use a tap guide on the mill to keep the tap aligned, but still turn it manually. Turn approximately one full turn forward and half a turn backward to break the chips.

### Manual Lathe

**Location:** Wilson Center  
**Canvas Training:** Completed<br>
**In-Person Training:** Planned · November 3, 2026

We use a Harrison M300 manual lathe. Unlike a mill where the cutting tool rotates, a lathe rotates the workpiece while the cutting tool removes material.

The lathe has two main axes:
- **X-axis:** Moves toward or away from the workpiece center, controlling the diameter.
- **Z-axis:** Moves along the workpiece, controlling the cutting position and length.

**Backlash** is the small amount of free movement when reversing a handwheel. To maintain accuracy, approach the target position from the same direction.

| Component | Function |
|---|---|
| **Chuck** | Holds and rotates the workpiece. |
| **Saddle** | Moves the cutting tool along the Z-axis. |
| **Cross Slide** | Moves the cutting tool along the X-axis. |
| **Compound Rest** | Can be rotated for angled cuts. |
| **Tool Post** | Holds the cutting tool in place. |
| **Tailstock** | Holds a drill chuck for drilling or a live center for support. |
| **Live Center** | Supports long workpieces and rotates with them. |


**Three common cutting tools**:
- **Turning Tool:** Cuts the Outer Diameter (OD).
- **Boring Bar:** Enlarges the Inner Diameter (ID) of an existing hole.
- **Parting Blade:** Cuts a finished part off the stock.

**How to set zeros on lathe:**
- On a manual mill, we mainly find zero by touching the workpiece. On a lathe, we establish our references by making small cuts.
- **Facing**: When setting Z, we make a shallow cut across the end face of the workpiece by moving the tool along X-axis. Set `Z = 0` on the Digital Readout (DRO), the newly cut face becomes the Z reference for measuring cutting length.
- **Test cut**: When setting X, we make a shallow cut along the workpiece's outer diameter, then move the tool away along Z without changing X. Measure the new OD with a micrometer and enter that diameter as the X value on the DRO, rather than setting X to zero.

For **drilling**, the drill bit is held in the **tailstock** while the workpiece rotates. We use peck drilling and cutting fluid. For larger holes, we can drill a smaller hole first, then enlarge it with a **boring bar**.

For **finishing**, the workpiece rotates at a low speed (80–120 RPM) while we use a **file** to smooth the surface. 

**Parting** uses a **parting blade** to cut a finished part off the stock. Unlike turning, the blade moves along the X-axis toward the center until the part is separated. If using the paper trick to find the cutting position, also account for the paper thickness (0.003–0.004").


**Further CNC training:** Not currently planned

CNC mill and lathe courses require operator status, including 30 hours of machine time and 10 completed parts. These are outside my current training plan.

## Digital Fabrication

### Universal R9000

**Location:** FRB Robotics Makerspace  
**Status:** Completed · October 28, 2026

I really enjoyed this workshop. The **Universal R9000** feels much more modern than the laser in Basics II. The touchscreen and FRB's operating handbook made it easy to follow along.

The machine has both **CO2 and fiber lasers** for cutting and engraving materials such as wood and acrylic, as well as marking metal surfaces. There is also a **rotary attachment** for engraving cylindrical objects.

| ULTRA R9000 | Rotary Attachment |
| --- | --- |
| ![Universal Laser Systems ULTRA R9000 at FRB Makerspace](R9000.JPG){: width="300"} | ![Rotary attachment inside the R9000 for holding cylindrical objects](R9000-rotary.JPG){: width="300"} |
{: .photo-table}

There are **two cameras**. The lid camera gives a bird's-eye view of the whole work area. The camera on the moving laser head captures a closer view. Both help show where the material is and make it easier to line up the design on it.

The design is loaded from a USB drive through the touchscreen. Drawings can be made in Illustrator and exported as **PDFs**, a format the machine accepts.

**Drawing colors separate the operations.** A common convention is:

| Color | Operation | What the laser does |
| --- | --- | --- |
| Black | Raster engraving | Engraves filled areas, such as text and images |
| Red | Cutting | Follows lines to cut through the material |
| Blue | Line engraving | Follows lines to mark the surface without cutting through |

Each color is assigned an operation in the software. These assignments can be changed, as explained in the [R9000 user guide](https://ulsinc.com/assets/pdf/ultra_r_series_laser_system_user_guide_2021.03.0101.pdf).

The finished samples below show the same design engraved on wood and marked on metal.

- Backstory of the design: the guy in the middle represents a medieval fencing master. The four animals (elephant, lion, lynx, and tiger) represent four qualities of a good fighter. Very interesting and inspiring.

![Matching artwork engraved on wood and marked on metal during R9000 training](R9000-final.JPG){: width="400"}

### ProtoMAX Waterjet

**Location:** FRB Robotics Makerspace  
**Status:** Planned · November 03, 2026

This course introduces the ProtoMAX abrasive waterjet cutter.

### ShopBot CNC Router

**Location:** Wilson Center  
**Status:** Completed · October 22, 2026

**Software:** The workflow is CAD → CAM → machine control. Create the design in Fusion 360, then use [VCarve Pro](https://www.shopbotdocs.com/products/software) to create and preview toolpaths. VCarve also supports drawing simple 2D designs directly. Export a ShopBot `.sbp` file and load it into ShopBot's control software. The workshop mainly covers machine operation, so we'll need to learn more of the software outside.

**Machine:** We use an older ShopBot PRSalpha CNC router. Its spindle moves along X, Y, and Z to cut material on a large bed. The brush skirt and hose collect dust around the cutter.

**Setup notes:** With the spindle disabled, install the cutter and secure the workpiece. Power on and reset the machine. In keypad mode, arrow keys move X/Y; Page Up/Down move Z. Set the X/Y origin to match the CAM setup. With the cutter installed, use the [Z-zero plate](https://store.shopbottools.com/collections/top-sellers/products/z-zero-plate) to set the tool height from the material or bed surface, matching the CAM setting. Remove the plate and turn on dust collection before cutting.

| ShopBot PRSalpha CNC Router | Router Tools |
| --- | --- |
| ![ShopBot PRSalpha CNC router with dust collection](cnc-shopbot-router.JPG){: width="300"} | ![Collets, wrenches, and cutters at the ShopBot station](shopbot-router-tools.JPG){: width="300"} |
{: .photo-table}

Tools in the photo:

- **Collets:** The slotted sleeves hold different cutter shank sizes in the spindle.
- **Wrenches:** The smaller wrench holds the spindle shaft; the larger one turns the collet nut to tighten or release the cutter.
- **V-bit:** The pointed cutter makes V-shaped grooves, lettering, and chamfers.
- **Surfacing bit:** The wide cutter on the right flattens the spoilboard, the sacrificial board under the workpiece.
- **Drill bits and end mills:** The tray contains both. Drill bits make holes; end mills cut sideways to make slots, pockets, and outlines.

We were advised to bring our own router bits.

## Welding

**Location:** Canvas  
**Canvas Training:** Completed

Welding training also starts with an online Canvas module, followed by in-person training at the Wilson Center. The module introduces the basics of arc welding.

Welding joins metal parts by using an electric arc to melt the metal at the joint. **Shielding gas** protects the molten metal from the air, preventing oxidation and porosity (tiny holes in the weld).

There are two main types of welding:
- **TIG (Tungsten Inert Gas, or GTAW, Gas Tungsten Arc Welding):** Similar to soldering, the electrode and filler metal are separate. A tungsten electrode creates the arc, while a separate filler rod adds material. Unlike soldering, TIG also melts the base metal. It is slower but offers more precise control, making it suitable for thinner materials and detailed work.
- **MIG (Metal Inert Gas, or GMAW, Gas Metal Arc Welding):** Similar to 3D printing, a metal wire is continuously fed into the weld. The wire acts as both the electrode and filler metal. MIG is generally faster and suitable for larger welds.

### TIG 1

**Location:** Wilson Center  
**Status:** Planned · November 30, 2026

TIG 1 is the prerequisite for the other welding sessions.

**Prepping for Welding:** Clean metal is important for TIG welding. We use a **sand blaster** to remove rust, paint, and dirt, followed by a **wire wheel** to clean the surface. Never wear gloves when using the wire wheel.

**Butt Joint:** Joins two pieces of metal edge to edge. Thicker materials may need beveled edges and a small gap for better weld penetration. Multiple passes may be needed.

**Fixturing and Distortion:** Welding creates heat that can cause metal to bend as it cools. Use clamps or jigs to hold the workpiece, distribute heat, and allow cooling between passes.

**Duty Cycle:** Describes how long a welder can operate without overheating. For example, a 60% duty cycle means 6 minutes of welding and 4 minutes of cooling within a 10-minute period at the rated current.

**TIG Torch:** Consists of a tungsten electrode, collet, collet body, back cap, and gas cup. The tungsten creates the arc, while the gas cup directs shielding gas around the weld.

**Tungsten Sharpening:** The tungsten electrode needs a properly shaped tip to maintain a stable arc. We use a tungsten grinder to sharpen the tip when it becomes dull or contaminated.

**Welder Setup:** Connect the power, ground clamp, foot pedal, and shielding gas. Use AC for aluminum and DC for steel and stainless steel. Set the current and gas flow according to the material and equipment.

**How to Weld:** Hold the torch like a pencil and keep your hand steady. First, create a weld puddle, then add filler metal with a consistent rhythm.

### TIG 2

**Location:** Wilson Center  
**Status:** Not scheduled


### MIG Welding

**Location:** Wilson Center  
**Status:** Not scheduled

### Aluminum Welding

**Location:** Wilson Center  
**Status:** Not scheduled
