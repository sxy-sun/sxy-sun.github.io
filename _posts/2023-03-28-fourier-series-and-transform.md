---
title: Fourier Series and Fourier Transform
date: 2023-03-28 00:53:00 -0400
categories: [Robotics, Math]
tags: [fourier transform] 
math: true
---

Fourier Transform is everywhere in the engineering world, and it is always good to understand the tools in your hand.
This post is about to answer the following questions:
- What is Fourier Series?
- What is Fourier Transform?
- Why do we need to know them?

## Fourier Series
### Periodic signals
We define a signal as a math function $f: t \rightarrow x$, maps scalar or vector input to a scalar output. For example, we could have $x(t) = A\sin(\omega t + \theta)$ maps a scalar time input t to a sinusoidal output x(t). Such function is a periodic function, where A is amplitude, $\omega$ is frequency, and $\theta$ is phase.

A function x is said to have a period T if 

$$
x(t+T)=x(t) \forall t
$$

The function repeats itself every one interval T. A well-behaved T-periodic function x(t) can be approximated as sum of [orthogonal basis function](https://en.wikipedia.org/wiki/Orthogonal_functions) $\psi_k$, such that 

$$
\hat{x}(t)=\sum^{\infty}_{k=0}\alpha_k \psi_k(t)
$$

- Basically, $\hat{x}(t)$ is an approximation of x(t) that we obtain by adding together a number of other functions, each multiplied by some factors, where $\hat{x}(t) \rightarrow x(t)$ as $k\rightarrow \infty$.
- And *Fourier Series*, is just a special case where all of the $\psi_k(t)$ will be sines and cosines.

### Definition
- What is **Fourier Series**?
  - A [Fourier series](https://en.wikipedia.org/wiki/Fourier_series) is an [expansion](https://en.wikipedia.org/wiki/Series_expansion) of a periodic function into a sum of trigonometric functions. 
  - The Fourier series represents a periodic function f(x) with period T as: <br>
    $f(x) = a_0 + ∑^{\infty}_{k=1}[a_k \cos(k\omega_0x) + b_k \sin(k\omega_0x)]$ <br> where $\omega_0 =\frac{2\pi}{T}$ is the fundamental frequency, and the coefficients $a_k, b_k$ are called Fourier coefficients, which are calculated using the Fourier integral.
  - In reality, we can not sum to infinity. The accuracy by which $\hat{x}$ approximates x(t) depends on the total number of terms we have. The larger values of k give a better estimate of x(t).
- **Motivation**: The Fourier series can be used to approximate any periodic function, which means that any periodic function with a finite number of discontinuities or singularities can be represented by a Fourier series. 




## Fourier Transform (FT)
### Definition
- What is **Fourier transform**?
  - The [Fourier transform](https://en.wikipedia.org/wiki/Fourier_transform) is a transform that converts a function into a form that describes the frequencies present in the original function. The output of the transform is a complex-valued function of frequency. In other words, it takes a signal that varies over time and breaks it down into its individual frequency components. 
- **Motivation**: In many cases, an analysis of how the signal is changing over time will also not help us. In such cases, we have to look toward other metrics. The motivation for the Fourier transform lies in the fact that many real-world signals, such as sound waves and electromagnetic waves, can be decomposed into simpler sinusoidal waveforms. By analyzing a signal in the frequency domain, we can gain insight into its underlying structure and properties, which can be difficult to discern in the time domain.  

The Fourier transform of a continuous-time signal x(t) is defined as:

$$
X(\omega)=F[x(t)] =\int^{\infty}_{-\infty}x(t)e^{-j\omega t}dt
$$

The Fourier transform simply states that that the non periodic signals whose area under the curve is finite can also be represented into integrals of the sines and cosines after being multiplied by a certain weight.

Although both Fourier series and Fourier transform are given by Fourier, but the difference between them is Fourier series is applied on periodic signals and Fourier transform is applied for non periodic signals.

#### Inverse Fourier Transform
The signal x(t) can be recovered from $X(\omega)$ via the inverse Fourier Transform

$$
x(t) = F^{-1}[X(\omega)]=\frac{1}{2\pi} \int^{\infty}_{-\infty}X(\omega)e^{j\omega t}d\omega
$$

- where x(t) is the time-domain signal, $X(\omega)$ is the frequency-domain representation of the signal.


### Discrete-time Fourier transform (DTFT)
The [Discrete-Time Fourier Transform (DTFT)](https://en.wikipedia.org/wiki/Discrete-time_Fourier_transform) is a **mathematical formula** used to represent a **discrete-time signal** in the frequency domain. It is analogous to the continuous-time Fourier transform, but is used for signals that are sampled at discrete intervals rather than continuous signals.


The discrete-time Fourier transform (DTFT) of a sequence $x[n]$ is defined as:

$$
X(\omega)= \sum^{\infty}_{n=-\infty}x[n]e^{-j\omega n}
$$

- where $x[n]$ is a discrete-time signal and $X(\omega)$ is the continuous-time Fourier transform of the signal. The DTFT produces a continuous function of frequency, and it is defined for all frequencies $\omega \in [-\pi, \pi]$.

The inverse DTFT is used to transform a frequency-domain representation back to the time-domain. It is defined as: 

$$
\frac{1}{2\pi} \int_{0}^{2\pi} X(\omega)e^{j\omega n} d\omega
$$

It is important to note that the DTFT assumes that the sequence is infinite in both directions. In practice, we are usually dealing with finite sequences, so we use the Discrete Fourier Transform (DFT) instead, which is a discrete approximation of the DTFT.

### Discrete Fourier transform (DFT)
The [Discrete Fourier Transform (DFT)](https://en.wikipedia.org/wiki/Discrete_Fourier_transform) is a **mathematical formula** used to transform a discrete-time signal from the time-domain into its frequency-domain representation. It is a finite version of the Discrete-Time Fourier Transform (DTFT), and is typically used for signals that are sampled at a finite number of intervals.

The DFT of a time-domain sequence $x_n$ of length N is defined as:

$$
X_k = \sum_{n=0}^{N-1} x_n e^{-j2\pi kn/N} \quad k=0,1,…,N−1
$$

- where $x_n$ is a length-$N$ sequence of discrete-time samples, and $X_k$ is the $k$th frequency bin of the DFT. The DFT produces a discrete set of frequency values, and it is defined only at the frequencies $k/N$ for $k = 0, 1, \ldots, N-1$.

One of the key differences between the DTFT and DFT is that the DTFT produces a continuous function of frequency, while the DFT produces a discrete set of frequency values. This means that the output of the DTFT is a continuous function of frequency, which can be difficult to analyze and store in a computer, whereas the output of the DFT is a discrete set of frequency values, which can be easily stored and manipulated in a computer.

The inverse DFT is:

$$
x_n = \frac{1}{N} \sum_{k=0}^{N-1} X_k e^{j2\pi kn/N}
$$


The DFT is computationally efficient and is widely used in signal processing applications, particularly for the analysis and manipulation of digital signals. It is typically implemented using the Fast Fourier Transform (FFT) algorithm.

### Fast Fourier transform (FFT)
The [Fast Fourier Transform (FFT)](https://en.wikipedia.org/wiki/Fast_Fourier_transform) is a **computational algorithm** used to efficiently compute the Discrete Fourier Transform (DFT) of a discrete-time signal. It reduces the computational complexity of the DFT from O(N^2) to O(NlogN), making it practical to compute the DFT for large values of N.
- The FFT algorithm achieves this efficiency by recursively dividing the DFT into smaller DFTs and then combining the results. It takes advantage of the periodicity properties of the DFT and the symmetries of the complex exponential functions to minimize the number of computations required. 

```matlab
% Compute FFT of x
X = fft(x);
```
 
---

*This post has part of my notes from the class I am taking “CEE 575 Infrastructure Sensing” offered by Prof. Branko Kerkez at University of Michigan.* 