---
title: Resistive Sensors
date: 2023-01-22 18:30:00 -0500
categories: [Notes, Infrastructure Sensing]
tags: [sensing] 
math: true
---

> This will be the first post of a series of my notes for the class I am taking "CEE 575 Infrastructure Sensing" offered by Prof. Branko Kerkez at University of Michigan. This will be archived under category `Notes`->`Infrastructure Sensing`. 

---

> For our purposes, a sensor is a  device that receives a stimulus and responds with a signal. 

## Measuring Temperature
[Thermistor](https://en.wikipedia.org/wiki/Thermistor): a temperature-dependent resistor, changing resistance with changes in temperature. Since for some materials, resistance is a function of temperature, we have:

$$ R = f(T) \rightarrow T=f^{-1}(R) $$

- To compute T, usually there is a graph we could look up.
- They are very sensitive and react to very small changes in temperature. They are best used when a specific temperature needs to be maintained, and when monitoring temperatures within 50°C of ambient.

[Thermocouple](https://en.wikipedia.org/wiki/Thermocouple): a temperature sensor that uses two different materials and measures voltage across two materials to measure temperature difference between hot and cold regions. It gives relative measurements.

$$\Delta V=\alpha \Delta T$$

- Change in voltage gives the change in temp, where $\alpha$ is material property, a constant.
- One of the most commonly used sensor for temperature. 
- [Thermocouple Explained](https://www.youtube.com/watch?v=mNoI62URtAk&t=2s)

Using both thermistor and thermocouple we will be able to measure the absolute temperature, since the thermistor can reflect its own temperature and the thermocouple can reflect the relatvie temperature. 

![](/assets/figures/2023-images/2023-01-22-resistive-sensors-01.png)

Here in the image, we use thermistor to measure the block's temperature we call it `Temp(cold)`. Then we have two material stick out of the block to measure the temperature we are investing and we call it `Temp(hot)` here. The thermocouple will give the relatvie temperature $\Delta T$ and the thermistor will give $T_0$, and we can derive absolute temperature from them.

## Measuring Force
> How to measure force? You cannot directly measure the force but you can calculate it.

$$
R=\rho \frac{L}{A} \qquad (1)
$$

- R - Resistance, L - Length, A - Area, $\rho$ - Resistivity (Electrical constant)

$$
\sigma = \frac{F}{A} \qquad \varepsilon = \frac{\Delta L}{L} \qquad \sigma=E\varepsilon
$$

- $\sigma$ is stress
- $\varepsilon$ is strain
- E is called **young's modulus** which is a property of the material that tells us how easily it can stretch and deform.

To calculate change in resistance, based on equation(1) we have $ dR = \frac{dR}{dL}dL-\frac{dR}{dA}dA+\frac{dR}{d\rho}d\rho $ , then:

$$
dR = \frac{\rho}{A}dL-\frac{\rho L}{A^2}dA+\frac{L}{A}d\rho
$$

Note that for most of the cases, the resistivity term could be neglected. <br>
Then divided by R:

$$
\frac{dR}{R}=\frac{dL}{L}-\frac{dA}{A}+\frac{d\rho}{\rho} \qquad (2)
$$

- Note there that the L is the original length and R is the original resistance.
- where $\frac{dL}{L}$ is *longitudinal strain* $\varepsilon_L$
- For $\frac{dA}{A}$ we need to account for *radial strain* $\varepsilon_r$, which needs *Poisson's ratio* $\nu$.
  - What is [Poisson's ratio](https://en.wikipedia.org/wiki/Poisson%27s_ratio)? - It is a measure of the *Poisson effect*, the deformation (expansion or contraction) of a material in directions perpendicular to the specific direction of loading.

$$
\varepsilon_r=-\nu \frac{dL}{L}=-\nu \varepsilon_L
$$

Plug $\frac{dA}{A}=-2\nu\varepsilon_L$ into equation(2) we have:

$$
\frac{dR}{R}=(1+2\nu)\varepsilon_L+\frac{d\rho}{\rho}
$$

- Since we have a content in the equation, we could have $\frac{\Delta R}{R}=G \varepsilon_L + \frac{d\rho}{\rho}$ where **G** is called **"gage factor"** which is a material property.

Such result, namely the change in resistance has linear relation with the strain, is used in products such as strain gage.


A **load cell** converts a force such as tension, compression, pressure, or torque into an electrical signal that can be measured and standardized. A **strain gage** is a sensor whose measured electrical resistance varies with changes in strain. 

What is the difference between *load cell* and *strain gage*? - A strain gage is a single transducer used to convert the mechanical deformation into readable electrical output. Whereas, a load cell comprises an array of strain gages that convert the mechanical load into readable units.

EX: Load Cells

$$
\sigma = \frac{F}{A} \qquad \varepsilon = \frac{F}{AE} 
$$
- $\sigma$ is stress
- $\varepsilon$ is strain
- E is called young's modulus 


Then we have:

$$
\frac{\Delta R}{R}=G \cdot \varepsilon = G \cdot \frac{F}{AE} 
$$


How to relate force F to the change in resistance? Combine formulas we have above:

$$
F = \frac{AE}{G}(\frac{\Delta R}{R})
$$

## Measuring Resistance
> We use changes in resistance to measure temperature and force. However, we cannot directly measure the resistance R, but we can measure voltage.

$$
R = \frac{V}{I}
$$

### Option #1 Constant known current source
If we know the exact voltage and current, we can always calculate the resistance based on Rx = V/i. 

### Option #2 Unknown current
However, since the sensor's resistance is changing, the current of the circuit will change as well. Thus, we have two unknown variables *R* and *i*, but only one equation Rx = V/i.

**Voltage Divider**: To solve this, we can use a math trick - transact resistance into measuring voltage by putting 2 resistors into series. 

![](/assets/figures/2023-images/2023-01-22-resistive-sensors-02.png)

Since current is constant everywhere, $V = iR = i(R_x+R_2) \rightarrow i = \frac{V}{R_x+R_2}$ where $R_x$ is the sensor and $R_2$ is the regular resistor. We can also calculate $V_0=iR_2=V\cdot \frac{R_2}{(R_x+R_2)}$.

From equation above, we can solve for $R_x = \frac{R_2(V-V_0)}{V_0}$ by measuring $V_0$. Usually $R_2, R_x$ are matched at equilibrium. $(R_2 \approx R_x)$

### Option #3 Wheatstone bridge
However, when sensors getting noisy, we want to create linearity. We can upgrade to [**Wheatstone Bridge**](https://en.wikipedia.org/wiki/Wheatstone_bridge). It is basically 2 voltage dividers.

![](/assets/figures/2023-images/2023-01-22-resistive-sensors-03.png)

$$ V_0=V\cdot \frac{R_2}{R_2+R_1}-V\cdot \frac{R_4}{R_x+R_4} $$

- Measuring $V_0$ to get $R_x$ with known $R_1, R_2, R_4$

Then, WHY is a wheatstone bridge better than a voltage divider? 
- Because when the $\Delta R$ is too small, $R_x \approx R_2 \rightarrow V_2 \approx \frac{1}{2} V$, we will always have an offset at 1/2 V even when the resistance doesn't change. We want V0 to be at 0 namely with no offset at equilibrium because in a practical way, we want to see that, say, when the strain gage is pressed the value goes down, and when the gage is strained, the value goes up. Also because the relation is not linear, which could cause problem when the sensors getting noisy.

#### Single point wheatstone bridge
Making all the resistor's resistance matched the sensor's resistance in equilibrium $R_1=R_2=R_3=R_x$. Then, we could have

$$
V_0 = V \cdot(\frac{R_1}{R_x+R_1}-\frac{R_1}{R_1+R_1}) = V \cdot(\frac{R_1}{R_x+R_1}-\frac{1}{2}) 
$$

- When the sensor is unstrained, we would have reading 0. The relation is still non-linear but we get rid of offset.



#### Half bridge
By adding one more sensor, namely replacing one of the resistors to be strain gage, this puts out twice of the voltage V0, and we can twice the sensitivity as one point bridge.

![](/assets/figures/2023-images/2023-01-22-resistive-sensors-04.png)

#### Full bridge
To further improve the measurement, we could replace all the resistors to be strain gage and place them as the image shown below. Two on the top surface and two on the bottom surface.

![](/assets/figures/2023-images/2023-01-22-resistive-sensors-05.png)

$$
V_0 = V \cdot[(\frac{R_x+\Delta R}{(R_x+\Delta R)+(R_x-\Delta R)}-\frac{R_x-\Delta R}{(R_x+\Delta R)+(R_x-\Delta R)})] 
$$

$$
V_0 = V\cdot\frac{(R_x+\Delta R)-(R_x-\Delta R)}{2R_x}=V\cdot\frac{\Delta R}{R_x}
$$

Now with full bridge, we have linearity and even higher sensitivity. But it costs more expense in labor and money.