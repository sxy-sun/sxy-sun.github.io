---
title: Inductive Sensors
date: 2023-02-19 19:54:00 -0500
categories: [Robotics, Sensing]
tags: [sensing] 
math: true
---

> This is my notes from the class I am taking "CEE 575 Infrastructure Sensing" offered by Prof. Branko Kerkez at University of Michigan. This will be archived under category `Robotics`->`Sensing`.

---

## Electromagnetic Induction

[Electromagnetic induction](https://en.wikipedia.org/wiki/Electromagnetic_induction): We know that a current flowing in a wire would produce a magnetic field. To increase the measurable effect of the field we can spin the wire into a coil.

![](/assets/figures/2023-images/2023-02-19-inductive-sensors/01.png)

For one turn of the coil, the *magnetic flux* is:

$$
\Phi=\frac{ni}{\mathcal{R}}
$$

- where $\mathcal{R}$ is the [reluctance](https://en.wikipedia.org/wiki/Magnetic_reluctance), a property of the core material. Magnetic reluctance is analogous to electrical resistance in an electrical circuit.

$$
\mathcal{R}=\frac{\mathcal{l}}{\mu_0 \mu A}
$$

- $\mathcal{l}$ - total length of flux path
  - A path which is followed by magnetic lines of force and in which the magnetic flux density is significant.
- $\mu_0$ - [permeability](https://en.wikipedia.org/wiki/Permeability_(electromagnetism)) of vacuum
- $\mu$ - permeability of core material
- A - cross sectional area of the coil

$$
\Psi=n\Phi = \frac{n^2 i}{\mathcal{R}}
$$

- where $\Phi$ is magnetic flux for one turn of the coil, unit Tesla. And $\Psi$ is the total flux, unit Weber.

**Definition:** The [inductance](https://en.wikipedia.org/wiki/Inductance) L of a coil is the total flux per unit current:

$$
L = \frac{\Psi}{i}=\frac{n^2}{\mathcal{R}}
$$

- The relationship between *inductance* and *current* is: change in current causes a measurable voltage.
![](/assets/figures/2023-images/2023-02-19-inductive-sensors/02.png)  

$$
V_o = L \cdot \frac{di}{dt}
$$

Further, change in the *magnetic field* can induce a change in *current* and vice versa.

$$
\frac{d\Psi}{dt} \propto  \frac{di}{dt} \rightarrow V\propto  \frac{d \Psi}{dt}
$$

**Mutual Inductance**
- An alternating current flow in one coil can induce a current flow in another coil.
![](/assets/figures/2023-images/2023-02-19-inductive-sensors/03.png) 

$$
V_2 = - M \frac{di_1}{dt}
$$

- where M is coefficient of mutual inductance.
  - In general, it depends on the reluctance(distance and material between coils) with which a magnetic flux can flow between inductors. 
- $i_1$ would induce another current flow $i_2$ in the RHS circuit

## Usage
### The Linear Variable Differential Transformer (LVDT)

[Linear variable differential transformer](https://en.wikipedia.org/wiki/Linear_variable_differential_transformer) is a type of electrical transformer used for measuring linear displacement (position).
- A [video explanation](https://www.youtube.com/watch?v=E-kDsP0wq6w)

![](/assets/figures/2023-images/2023-02-19-inductive-sensors/04.png) 

The red bar is the core moving in x direction, and Vs is the source power. According to effect of mutual inductance, we know $V_1 = -M_1\frac{di_s}{dt}$ and $V_2 = -M_2\frac{di_s}{dt}$. Red bar's change $\Delta x$ in position will cause a change in $M_1$ and $M_2$ due to reluctance changes. Thus,

$$
V_0 = V_1 - V_2 = (-M_1\frac{di_s}{dt}) - (-M_2\frac{di_s}{dt}) = (M_2 - M_1)\frac{di_s}{dt}
$$

Why we need 2 secondary coils here? - It gives the linearity, ($M_2-M_1$) can show it's linear. With one coil, the change in M is non-linear.

**How do we measure?**

![](/assets/figures/2023-images/2023-02-19-inductive-sensors/05.png) 
- At $x=0$, $V_0=0$, $M_1=M_2$
- Connect in *open-wiring* configuration
- As core moves, it will change $M_1, M_2$, this will change the induced voltages $V_1, V_2$, and the amplitude of $V_0$ is linear with $\Delta x$.

### Electromagnetic Flow Meter
- [Electromagnetic flow meters](https://www.emerson.com/en-us/automation/measurement-instrumentation/flow-measurement/about-magnetic) are comprised of a transmitter and sensor that together measure water flow. 

![](/assets/figures/2023-images/2023-02-19-inductive-sensors/06.png) 
- If a conductor of length l(m) is moving perpendicular to a magnetic field $\Phi$ at a velocity e (m/s), the voltage $V_o$ is induced: 

$$
V_0=\Phi l e
$$

- One might more familiar with the form $V = Blv$ but they are the same.
- With Faraday's law, we can build flow meter from it.

![](/assets/figures/2023-images/2023-02-19-inductive-sensors/07.png) 


In the case of a flow meter, the conductor is the liquid. We know that 

$$
  Q = A \cdot e \qquad A = \frac{\pi D^2}{4}
$$

- e is the velocity of the flow m/s
- A is the cross-sectional area of the pipe
- Q is the flow of the liquid $m^3/s$
- D is the diameter

$$
V_0=\Phi l e=\Phi D \frac{4Q}{\pi D^2}=\frac{4\Phi Q}{\pi D}
$$

- Measuring the voltage can help us to measure the flow, although it is very difficult to build flow meter.