#ifndef MILIS_H
#define MILIS_H

void millis_init(void);    // <<---- ESTA DECLARACI�N ES NECESARIA
unsigned long millis(void);

extern volatile unsigned long ms_ticks;

#endif