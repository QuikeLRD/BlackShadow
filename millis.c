#include "milis.h"

// Variable global para contar milisegundos
volatile unsigned long ms_ticks = 0;

// Inicialización de Timer0 para interrupción cada 1 ms
void millis_init(void) {
    // Para PIC18F26K22 a 8MHz (Fosc/4 = 2MHz, prescaler 16 = 125kHz)
    // 125 ticks = 1 ms, Timer0 8 bits, inicia en 131 (256-125)
    T0CON = 0b00000011; // Timer0 ON, 8 bits, prescaler 16
    TMR0L = 131;
    INTCON.TMR0IE = 1;  // Habilita interrupción Timer0
    INTCON.TMR0IF = 0;  // Limpia bandera
    INTCON.GIE = 1;     // Habilita interrupciones globales
}

// Devuelve el tiempo actual en milisegundos
unsigned long millis(void) {
    unsigned long temp;
    // Opcional: deshabilitar interrupciones para lectura segura
    INTCON.GIE = 0;
    temp = ms_ticks;
    INTCON.GIE = 1;
    return temp;
}
