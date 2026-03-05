# System-Identification


This project focuses on identifying the dynamic behavior of a second-order system using experimental data and system identification techniques.

## Project Description
The analyzed system represents a hydraulic process consisting of two interconnected tanks. The system dynamics are modeled as a second-order linear system described by a transfer function.

The goal of the project is to estimate the system parameters and validate the obtained model using different identification methods. 

## Methods Used

### Non-Parametric Identification
- Step response analysis
- Linear regression for determining the dominant time constant
- Estimation of system parameters:
  - Proportional gain (K)
  - Dominant time constant (T1)
  - Non-dominant time constant (T2)

The identified transfer function describes the dynamic behavior of the system. :contentReference[oaicite:1]{index=1}

### Frequency-Based Identification
- Chirp input signal
- Estimation of natural frequency and damping factor
- Validation of the obtained transfer function model

### Parametric Identification
Using data generated with SPAB signals, several model structures were tested:

- ARMAX
- OE (Output Error)
- SSest (State-space estimation)

These models were validated using residual analysis and correlation tests. :contentReference[oaicite:2]{index=2}

## Tools Used
- MATLAB
- Simulink
- System Identification techniques

## Results
The obtained models successfully approximate the real system behavior.  
The best models achieved a fit of approximately **92–93%**, confirming the validity of the identification process. :contentReference[oaicite:3]{index=3}

## Author
Ana-Maria Oneț  
Technical University of Cluj-Napoca  
Automation and Applied Informatics
