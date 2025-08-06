#line 1 "G:/Mi unidad/UPIITA/AR UPIITA/Dise�os de Minisumos/Black Shadow/Programaci�n/millis.c"
#line 1 "g:/mi unidad/upiita/ar upiita/dise�os de minisumos/black shadow/programaci�n/milis.h"



void millis_init(void);
unsigned long millis(void);

extern volatile unsigned long ms_ticks;
#line 4 "G:/Mi unidad/UPIITA/AR UPIITA/Dise�os de Minisumos/Black Shadow/Programaci�n/millis.c"
volatile unsigned long ms_ticks = 0;


void millis_init(void) {


 T0CON = 0b00000011;
 TMR0L = 131;
 INTCON.TMR0IE = 1;
 INTCON.TMR0IF = 0;
 INTCON.GIE = 1;
}


void interrupt ISR(void) {
 if (INTCON.TMR0IF) {
 INTCON.TMR0IF = 0;
 TMR0L = 131;
 ms_ticks++;
 }

}


unsigned long millis(void) {
 unsigned long temp;

 INTCON.GIE = 0;
 temp = ms_ticks;
 INTCON.GIE = 1;
 return temp;
}
