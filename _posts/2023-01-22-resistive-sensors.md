---
title: Resistive Sensors
date: 2023-01-22 00:18:30 -0500
categories: [Notes, Infrastructure Sensing]
tags: [sensing]     # TAG names should always be lowercase
---

> This will be the first post of a series of my notes for the class I am taking "CEE 575 Infrastructure Sensing" offered by Prof. Branko Kerkez at University of Michigan. This will be archived under category `Notes`->`Infrastructure Sensing`. 

---

> For our purposes, a sensor is a  device that receives a stimulus and responds with a signal. 

# Measuring Temperature
[Thermistor](https://en.wikipedia.org/wiki/Thermistor): a temperature-dependent resistor, changing resistance with changes in temperature. Since for some materials, resistance is a function of temperature, we have:
- To compute T, usually there is a graph we could look up.
- They are very sensitive and react to very small changes in temperature. They are best used when a specific temperature needs to be maintained, and when monitoring temperatures within 50°C of ambient.

[Thermocouple](https://en.wikipedia.org/wiki/Thermocouple): a temperature sensor that uses two different materials and measures voltage across two materials to measure temperature difference between hot and cold regions. It gives relative measurements.

- Change in voltage gives the change in temp, where is material property, a constant.
- One of the most commonly used sensor for temperature. 
- [Thermocouple Explained](https://www.youtube.com/watch?v=mNoI62URtAk&t=2s)

Using both thermistor and thermocouple we will be able to measure the absolute temperature, since the thermistor can reflect its own temperature and the thermocouple can reflect the relatvie temperature. 