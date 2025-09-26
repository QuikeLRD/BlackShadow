#BlackShadow

**BlackShadow** es un sistema de control avanzado para un robot minisumo autónomo, desarrollado en C, C++ y Assembly. Este proyecto implementa lógica de combate, evasión y búsqueda de oponentes, integrando control eficiente de hardware, manejo de sensores en tiempo real y una arquitectura modular basada en máquinas de estados.

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
- Archivos `.asm` — Rutinas de bajo nivel para inicialización y control específico de hardware.

---

## Requisitos de hardware

- Microcontrolador (por ejemplo, PIC, AVR, STM32, Arduino, etc.)
- Módulo de control de motores (puente H, drivers PWM)
- Sensores de línea (al menos dos para los bordes izquierdo y derecho)
- Sensores de oponente (IR, ultrasónicos, etc.)
- Chasis y motores para minisumo
- Fuente de alimentación adecuada

---

## Compilación y uso

1. Configura tu entorno de desarrollo según tu microcontrolador (MPLAB X, Arduino IDE, PlatformIO, etc.).
2. Ajusta los parámetros de hardware en `Configuraciones.h` para tu robot específico.
3. Compila el firmware y cárgalo en el microcontrolador.
4. Coloca el robot en la pista y enciéndelo para iniciar la lógica de combate autónoma.

---

## Ejemplo de máquina de estados

```c
void combate_estado() {
    if (linea_detectada || sub_cmb_linea != LINEA_IDLE) {
        // Rutina de recuperación de línea
        // ...
        return;
    }
    switch (estado_combate) {
        case CMB_ESPERA:
            // Lógica de detección de oponente
            break;
        case CMB_REC:
            // Rutina de retroceso
            break;
        // Otros estados...
    }
}
```

---

## Funcionalidades implementadas

- Detección y evasión automática de línea/borde.
- Estrategias de búsqueda y ataque al oponente.
- Control preciso y seguro de motores.
- Recuperación ante posibles errores o condiciones peligrosas.
- Lógica no bloqueante para máxima eficiencia en tiempo real.

---

## Autor

Desarrollado por [QuikeLRD](https://github.com/QuikeLRD).

---

## Licencia

Este proyecto se distribuye con fines educativos y profesionales. Consulta el archivo de licencia o contacta al autor para más información.

---
