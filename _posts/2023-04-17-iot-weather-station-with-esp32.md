---
title: IoT Weather Station with ESP32 and BME280
date: 2023-04-17 02:00:00 -0400
categories: [Side Project, Electronics]
tags: [esp32, IoT] 
math: true
img_path: /assets/figures/2023-images/2023-04-17-iot-weather-station-with-esp32
---

In this article, I will outline the process of using the BME280 sensor module with the ESP32 as the motherboard to read temperature and humidity. At the same time, retrieve local weather using OpenWeather API. Finally, display the two sets of readings on an OLED screen. 

This article is especially feasible for beginners who want to use University's WiFi but have trouble connecting.

**Room readings**
![](room.png){: width="500" }

**Local weather**
![](local.png){: width="500" }

To build such a project, the first step we need to purchase all the components we need. The list below includes all the components I have purchased for this project.

## Items
- **ESP32**
  - [ESP32](https://catalog.us-east-1.prod.workshops.aws/workshops/5b127b2f-f879-48b9-9dd0-35aff98c7bbc/en-US/module1/esp32) is a low-cost, low-power Microcontroller with an integrated Wi-Fi and Bluetooth. 
    -  Note that ESP32 is the chip microcontroller, espressif manufactures their own development board, but there is also other company like [this one](https://a.co/d/8E2EJhQ) builds development board based on ESP32. So espressif's core product is the microcontroller, anybody can create their own board if you know how to create a PCB.
  - [This](https://a.co/d/h4Dk0s0) is what I got, I personally don't like it because the pin's name is printed on the back so you have to refer to the manual when wiring the components.
- BME280
  - The BME280 sensor module reads barometric pressure, temperature, and humidity. It uses I2C or SPI communication protocol to exchange data with a microcontroller.
  - [Amazon](https://a.co/d/21BLqDm) - Soldering needed
- OLED Display 
  - [Amazon](https://a.co/d/7P7eH4r)
- Miscellanea
  - LED bulbs (Green/Red), Buttons, Breadboard, Resistors (220 Ohm), Jumpwires, Pin header
    - Note that all these listings are necessary for this project.
- Optional
  - Soldering station (I bought a [cheap one](https://a.co/d/7hWibIp) because I want to learn how to do soldering and will use it in other projects. It is unnecessary unless you cannot find a soldering station anywhere for quick use.)

![](fullview.png)

## Wiring
> Suggestion: implement wiring and coding at the same time for each functionality. When one feature is tested, then add more onto the board.

The power rails are connected as marked in the image below for simplicity.
- The upper two rails are connected to the SCL and SDA pins because both BME280 and the display need to connect to these two pins.
- The lower two rails are connected to 3.3V and Ground pin.

![](wiring_rails.png){: width="600"}

Now let's look into the details.

The wiring of the display is simple. As shown in the image below, we just need to connect the 4 pins as marked on the board accordingly.

![](wiring_display.png){: width="600"}

On the left-hand side, the BME280’s wiring is also directive. We need to connect the four pins accordingly same as what we did for the display.

For the button, as shown in the image, the solid blue lines are interior connected, such that I put the button sits on the ravine so the two sides are isolated unless you press the button. When you press the button, the dashed line will be connected, so the board will know that you have pressed the button. Then we just need to connect one side to the ground and another side to any of the GPIO pins you'd like to use.

For the two LEDs. Let’s take the Green one as an example. Firstly, [polarity matters](https://learn.sparkfun.com/tutorials/light-emitting-diodes-leds/how-to-use-them#). The positive side of the LED is called the “anode” and is marked by having a longer leg. The shorter leg is the negative side, called the “cathode.” Current flows from the anode to the cathode. You should connect the longer leg to the GPIO pin you’d like to use and the shorter leg to the ground pin. You cannot see it from the image, but that's how it is connected beneath.

![](wiring_left.png){: width="600"}

### Soldering
One of the great learning I have from this project is I learned how to do soldering. Thanks to the Youtube tutorials. The soldering station I used is from [Amazon](https://a.co/d/7LJXkvm). These 2 image shows the result of soldering a pin header to an audio amplifier PAM8302. I didn't end up using it. But you do need to know how to solder unless you are buying a pre-soldered BME280.

|Setup| Result |
| ------- |------- |
|![](soldering1.jpg)| ![](soldering2.jpg)|

## Programming
### IDE
I used VS Code with PlatformIO IDE following this [tutorial](https://randomnerdtutorials.com/vs-code-platformio-ide-esp32-esp8266-arduino/). From my own experience, I think for beginners who have experience in programming, this approach is easier compared to Arduino IDE.

### Features
![](code_loop.png) 
As the image shown above, in this project we have
1. A button to switch the readings from the BME280 sensor and the local weather from the Internet.
2. Room temperature and humidity from the BME280 sensor.
3. LED indicators to show the air condition.
4. Under the `LEDIndicator` function we have IFTTT setup to send hydration alert to slack channel when the red LED is light up.
  - ![](slack_alert.png)
5. Using [OpenWeather API](https://openweathermap.org/api) to retrive local weather



### Code
The code is open source and can the github repo can be found [here](https://github.com/sxy-sun/weather_station_IoT). The project is written in C++ and the code is clean and commented, hope it helps!

### Potential problems

- WPA2 Enterprise
  - Most of the tutorials online shows how to connect to home wifi, which only requires 3 lines of code:
  ```c++
  // Replace with your network credentials
  const char* ssid     = "REPLACE_WITH_YOUR_SSID";
  const char* password = "REPLACE_WITH_YOUR_PASSWORD";
  ...
  WiFi.begin(ssid, password);
  ```
  - However, the university wifi (I'm using University of Michigan's on-campus WiFi) has different setup. Luckily I found a [github repo](https://github.com/debsahu/Esp32_EduWiFi) about how to connect, but there was another problem that, there will be compile errors from [this line](https://github.com/debsahu/Esp32_EduWiFi/blob/18142ed7cd3223e6931028133cc6ad01d1a50780/Arduino/Esp32_EduWiFi/Esp32_EduWiFi.ino#L128) of code:
  ```
  error: 'esp_wpa2_config_t' was not declared in this scope
     esp_wpa2_config_t wpa2_config = WPA2_CONFIG_INIT_DEFAULT();
     ^~~~~~~~~~~~~~~~~
  ```
  This is because the code is outdated. From this [issue case](https://github.com/esphome/issues/issues/2646) I found that the solution is in this [commit](https://github.com/esphome/esphome/pull/2815/commits/5638d96626b4418a30a27747364f6f0c7ebfbee2).

  -  This is the wifi setup this project using:

![](code_wifi.png){: width="700"}

## Video Demo
<iframe width="560" height="315" src="https://www.youtube.com/embed/YoT-wcManlM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>