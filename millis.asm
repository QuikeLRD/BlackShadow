
_millis_init:

;millis.c,7 :: 		void millis_init(void) {
;millis.c,10 :: 		T0CON = 0b00000011; // Timer0 ON, 8 bits, prescaler 16
	MOVLW       3
	MOVWF       T0CON+0 
;millis.c,11 :: 		TMR0L = 131;
	MOVLW       131
	MOVWF       TMR0L+0 
;millis.c,12 :: 		INTCON.TMR0IE = 1;  // Habilita interrupción Timer0
	BSF         INTCON+0, 5 
;millis.c,13 :: 		INTCON.TMR0IF = 0;  // Limpia bandera
	BCF         INTCON+0, 2 
;millis.c,14 :: 		INTCON.GIE = 1;     // Habilita interrupciones globales
	BSF         INTCON+0, 7 
;millis.c,15 :: 		}
L_end_millis_init:
	RETURN      0
; end of _millis_init

_millis:

;millis.c,18 :: 		unsigned long millis(void) {
;millis.c,21 :: 		INTCON.GIE = 0;
	BCF         INTCON+0, 7 
;millis.c,22 :: 		temp = ms_ticks;
	MOVF        _ms_ticks+0, 0 
	MOVWF       R4 
	MOVF        _ms_ticks+1, 0 
	MOVWF       R5 
	MOVF        _ms_ticks+2, 0 
	MOVWF       R6 
	MOVF        _ms_ticks+3, 0 
	MOVWF       R7 
;millis.c,23 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;millis.c,24 :: 		return temp;
	MOVF        R4, 0 
	MOVWF       R0 
	MOVF        R5, 0 
	MOVWF       R1 
	MOVF        R6, 0 
	MOVWF       R2 
	MOVF        R7, 0 
	MOVWF       R3 
;millis.c,25 :: 		}
L_end_millis:
	RETURN      0
; end of _millis
