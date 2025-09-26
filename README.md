# BlackShadow minisumo Firmware

**BlackShadow** es un robot minisumo autónomo profesional, desarrollado en C++ con el objetivo de competir en torneos nacionales e internacionales de miniróbotica. Este proyecto implementa lógica de combate, evasión y búsqueda de oponentes, integrando control de hardware, manejo de sensores en tiempo real y una arquitectura modular basada en máquinas de estados.

---

## Descripción

El firmware está diseñado para robots minisumo de competencia, gestionando de forma autónoma la detección de oponentes, la evasión de bordes y la ejecución de estrategias de ataque. Utiliza sensores de línea y de oponente, así como control preciso de motores mediante PWM, para maximizar el desempeño durante los combates.

---

## Características principales

- **Arquitectura basada en máquinas de estados** para gestión de modos de combate, recuperación y búsqueda.
- **Control de motores por PWM** para movimientos precisos y maniobras rápidas.
- **Manejo eficiente de interrupciones** para respuesta inmediata ante detección de línea o bordes.
- **Temporización no bloqueante** usando temporizadores de milisegundos para asegurar fluidez en la toma de decisiones.
- **Estructura modular y flexible**, fácilmente adaptable a diferentes microcontroladores y plataformas de hardware.

---

## Estructura del repositorio

- `Configuraciones.h` — Definiciones de hardware, enums, constantes y configuración adaptable.
- `milis.h` — Utilidad para temporización no bloqueante.
- Archivos `.c` / `.cpp` — Implementación de lógicas de combate, movimiento y máquinas de estados.

---

## Requisitos de hardware

- Microcontrolador: PIC18F26K22
- Módulo de control de motores: DRV8871
- Sensores de línea: Micro Line sensor M1
- Sensores IR: JS40F Digital distance sensor

---
## Funcionalidades implementadas

- Detección y evasión automática de línea/borde.
- Estrategias de búsqueda y ataque al oponente.
- Control preciso y seguro de motores.
- Recuperación ante posibles errores o condiciones peligrosas.
- Lógica no bloqueante para máxima eficiencia en tiempo real.

---
