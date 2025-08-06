#line 1 "G:/Mi unidad/UPIITA/AR UPIITA/Diseños de Minisumos/Black Shadow/Programación/milis.c"



volatile uint32_t ms_ticks = 0;


void millis_init(void) {


 T0CON = 0b00000011;
 TMR0 = 131;
 INTCON.TMR0IE = 1;
 INTCON.TMR0IF = 0;
 INTCON.GIE = 1;
}


void interrupt ISR(void) {
 if (INTCON.TMR0IF) {
 INTCON.TMR0IF = 0;
 TMR0 = 131;
 ms_ticks++;
 }

}


uint32_t millis(void) {
 uint32_t temp;
 INTCON.GIE = 0;
 temp = ms_ticks;
 INTCON.GIE = 1;
 return temp;
}
