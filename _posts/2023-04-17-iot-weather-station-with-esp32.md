---
title: IoT Weather Station with ESP32 and BME280
date: 2023-04-17 02:00:00 -0400
categories: [Side Project, Electronics]
tags: [esp32, IoT] 
math: true
img_path: /assets/figures/2023-images/2023-04-17-iot-weather-station-with-esp32
---

In this article, I will outline one of my school projects on using the BME280 sensor module with the ESP32 as the motherboard to read temperature and humidity. And at the same time, retrieve local weather using OpenWeather API. Finally, display the two sets of readings on an OLED screen. 

This article is feasible for beginners who want to use University's WIFI but have trouble connecting.

|room readings| local weather |
| ------- |------- |
|![](room.jpg)| ![](local.jpg)|


## Items
- ESP32
  - [ESP32](https://catalog.us-east-1.prod.workshops.aws/workshops/5b127b2f-f879-48b9-9dd0-35aff98c7bbc/en-US/module1/esp32) is a low-cost, low-power Microcontroller with an integrated Wi-Fi and Bluetooth. It is the successor to the ESP8266 which is also a low-cost Wi-Fi microchip albeit with limited vastly limited functionality.
  - [Amazon](https://a.co/d/h4Dk0s0)
- BME280
  - The BME280 sensor module reads barometric pressure, temperature, and humidity. It uses I2C or SPI communication protocol to exchange data with a microcontroller.
  - [Amazon](https://a.co/d/8YTLJWW) - Soldering needed
- OLED Display 
  - [Amazon](https://a.co/d/1mLKAoa)
- Miscellanea
  - LED bulbs, Buttons, Breadboard, Resistors, Jumpwires, Pin header


## Wiring
> Suggestions: implement wiring and coding at the same time for each functionality. When one feature is tested, then add more onto the board.

![](wiring.jpg)

![](wiring_left.jpg)

![](wiring_right.jpg)


### Soldering
One of the great learning I have from this project is I learned how to do soldering. Thanks to the Youtube tutorials. The soldering station I used is from [Amazon](https://a.co/d/7LJXkvm). These 2 image shows the result of soldering a pin header to an audio amplifier PAM8302. I didn't end up using it. But you do need to know how to solder unless you are buying a pre-soldered BME280.

|Setup| Result |
| ------- |------- |
|![](soldering1.jpg)| ![](soldering2.jpg)|

## Programming
### IDE
I used VS Code with PlatformIO IDE following this [tutorial](https://randomnerdtutorials.com/vs-code-platformio-ide-esp32-esp8266-arduino/). From my own experience, I think for beginners who have experience in programming, this approach is easier compared to Arduino IDE.

### Code
The github repo can be found [here](https://github.com/sxy-sun/weather_station_IoT).

### Potential problems

- WPA2 Enterprise
  - Most of the tutorials online shows how to connect to home wifi, which only requires 2 lines of code:
  ```c++
  // Replace with your network credentials
  const char* ssid     = "REPLACE_WITH_YOUR_SSID";
  const char* password = "REPLACE_WITH_YOUR_PASSWORD";
  ...
  WiFi.begin(ssid, password);
  ```
  - However, the university wifi (I'm using University of Michigan's on-campus WiFi) has different setup. Luckily I found a [github repo](https://github.com/debsahu/Esp32_EduWiFi) about how to connect, but there was another problem that, there will be compile errors show that from [this line](https://github.com/debsahu/Esp32_EduWiFi/blob/18142ed7cd3223e6931028133cc6ad01d1a50780/Arduino/Esp32_EduWiFi/Esp32_EduWiFi.ino#L128) of code:
  ```
  error: 'esp_wpa2_config_t' was not declared in this scope
     esp_wpa2_config_t wpa2_config = WPA2_CONFIG_INIT_DEFAULT();
     ^~~~~~~~~~~~~~~~~
  ```
  This is because the code is outdated. From this [issue case](https://github.com/esphome/issues/issues/2646) I found that the solution is in this [commit](https://github.com/esphome/esphome/pull/2815/commits/5638d96626b4418a30a27747364f6f0c7ebfbee2).

## Video Demo
<iframe width="560" height="315" src="https://www.youtube.com/embed/YoT-wcManlM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>