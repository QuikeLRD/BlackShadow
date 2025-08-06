
_millis:

;millis.c,5 :: 		unsigned long millis(void) {
;millis.c,8 :: 		INTCON.GIE = 0;
	BCF         INTCON+0, 7 
;millis.c,9 :: 		temp = ms_ticks;
	MOVF        _ms_ticks+0, 0 
	MOVWF       R4 
	MOVF        _ms_ticks+1, 0 
	MOVWF       R5 
	MOVF        _ms_ticks+2, 0 
	MOVWF       R6 
	MOVF        _ms_ticks+3, 0 
	MOVWF       R7 
;millis.c,10 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;millis.c,11 :: 		return temp;
	MOVF        R4, 0 
	MOVWF       R0 
	MOVF        R5, 0 
	MOVWF       R1 
	MOVF        R6, 0 
	MOVWF       R2 
	MOVF        R7, 0 
	MOVWF       R3 
;millis.c,12 :: 		}
L_end_millis:
	RETURN      0
; end of _millis
