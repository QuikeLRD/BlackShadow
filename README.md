# BlackShadow minisumo Firmware

**BlackShadow** is a professional autonomous minisumo robot, developed in C++ for national and international minirobotics competitions. This project implements combat logic, evasion, and opponent search, integrating hardware control, real-time sensor management, and a modular architecture based on state machines.

---

## Description

The firmware is designed for competition minisumo robots, autonomously handling opponent detection, edge evasion, and execution of attack strategies. It uses line and opponent sensors, as well as precise motor control via PWM, to maximize performance during matches.

---

## Main Features

- **State machine-based architecture** for managing combat, recovery, and search modes.
- **PWM motor control** for precise movements and rapid maneuvers.
- **Efficient interrupt management** for immediate response to line or edge detection.
- **Non-blocking timing** using millisecond timers to ensure smooth decision-making.
- **Modular and flexible structure**, easily adaptable to different microcontrollers and hardware platforms.

---

## Repository Structure

- `Configuraciones.h` — Hardware definitions, enums, constants, and adaptable configuration.
- `milis.h` — Utility for non-blocking timing.
- `.c` / `.cpp` files — Implementation of combat logic, movement, and state machines.

---

## Hardware Requirements

- Microcontroller: PIC18F26K22
- Motor driver module: DRV8871
- Line sensors: Micro Line sensor M1
- IR sensors: JS40F Digital distance sensor

---

## Implemented Functionalities

- Automatic line/edge detection and evasion.
- Opponent search and attack strategies.
- Precise and safe motor control.
- Recovery from possible errors or dangerous conditions.
- Non-blocking logic for maximum real-time efficiency.

---
