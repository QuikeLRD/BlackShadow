
_WAIT:

;Configuraciones.c,46 :: 		void WAIT(){
;Configuraciones.c,47 :: 		while (DAT == 0) {
L_WAIT0:
	BTFSC       PORTB+0, 7 
	GOTO        L_WAIT1
;Configuraciones.c,48 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__WAIT200
	BCF         PORTA+0, 5 
	GOTO        L__WAIT201
L__WAIT200:
	BSF         PORTA+0, 5 
L__WAIT201:
	BTFSC       PORTA+0, 5 
	GOTO        L__WAIT202
	BCF         PORTA+0, 4 
	GOTO        L__WAIT203
L__WAIT202:
	BSF         PORTA+0, 4 
L__WAIT203:
;Configuraciones.c,49 :: 		delay_ms(100); // Menor delay: parpadeo más rápido
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_WAIT2:
	DECFSZ      R13, 1, 1
	BRA         L_WAIT2
	DECFSZ      R12, 1, 1
	BRA         L_WAIT2
	DECFSZ      R11, 1, 1
	BRA         L_WAIT2
	NOP
;Configuraciones.c,50 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__WAIT204
	BCF         PORTA+0, 5 
	GOTO        L__WAIT205
L__WAIT204:
	BSF         PORTA+0, 5 
L__WAIT205:
	BTFSC       PORTA+0, 5 
	GOTO        L__WAIT206
	BCF         PORTA+0, 4 
	GOTO        L__WAIT207
L__WAIT206:
	BSF         PORTA+0, 4 
L__WAIT207:
;Configuraciones.c,51 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_WAIT3:
	DECFSZ      R13, 1, 1
	BRA         L_WAIT3
	DECFSZ      R12, 1, 1
	BRA         L_WAIT3
	DECFSZ      R11, 1, 1
	BRA         L_WAIT3
	NOP
;Configuraciones.c,52 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__WAIT208
	BCF         PORTA+0, 7 
	GOTO        L__WAIT209
L__WAIT208:
	BSF         PORTA+0, 7 
L__WAIT209:
	BTFSC       PORTA+0, 7 
	GOTO        L__WAIT210
	BCF         PORTA+0, 4 
	GOTO        L__WAIT211
L__WAIT210:
	BSF         PORTA+0, 4 
L__WAIT211:
;Configuraciones.c,53 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_WAIT4:
	DECFSZ      R13, 1, 1
	BRA         L_WAIT4
	DECFSZ      R12, 1, 1
	BRA         L_WAIT4
	DECFSZ      R11, 1, 1
	BRA         L_WAIT4
	NOP
;Configuraciones.c,54 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__WAIT212
	BCF         PORTA+0, 7 
	GOTO        L__WAIT213
L__WAIT212:
	BSF         PORTA+0, 7 
L__WAIT213:
	BTFSC       PORTA+0, 7 
	GOTO        L__WAIT214
	BCF         PORTA+0, 6 
	GOTO        L__WAIT215
L__WAIT214:
	BSF         PORTA+0, 6 
L__WAIT215:
;Configuraciones.c,55 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_WAIT5:
	DECFSZ      R13, 1, 1
	BRA         L_WAIT5
	DECFSZ      R12, 1, 1
	BRA         L_WAIT5
	DECFSZ      R11, 1, 1
	BRA         L_WAIT5
	NOP
;Configuraciones.c,56 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__WAIT216
	BCF         PORTA+0, 7 
	GOTO        L__WAIT217
L__WAIT216:
	BSF         PORTA+0, 7 
L__WAIT217:
	BTFSC       PORTA+0, 7 
	GOTO        L__WAIT218
	BCF         PORTA+0, 5 
	GOTO        L__WAIT219
L__WAIT218:
	BSF         PORTA+0, 5 
L__WAIT219:
	BTFSC       PORTA+0, 5 
	GOTO        L__WAIT220
	BCF         PORTA+0, 4 
	GOTO        L__WAIT221
L__WAIT220:
	BSF         PORTA+0, 4 
L__WAIT221:
;Configuraciones.c,57 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_WAIT6:
	DECFSZ      R13, 1, 1
	BRA         L_WAIT6
	DECFSZ      R12, 1, 1
	BRA         L_WAIT6
	NOP
	NOP
;Configuraciones.c,58 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,59 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_WAIT7:
	DECFSZ      R13, 1, 1
	BRA         L_WAIT7
	DECFSZ      R12, 1, 1
	BRA         L_WAIT7
	DECFSZ      R11, 1, 1
	BRA         L_WAIT7
	NOP
;Configuraciones.c,60 :: 		}
	GOTO        L_WAIT0
L_WAIT1:
;Configuraciones.c,61 :: 		}
L_end_WAIT:
	RETURN      0
; end of _WAIT

_INTERRUPT_ISR:

;Configuraciones.c,62 :: 		void INTERRUPT_ISR(void) {
;Configuraciones.c,64 :: 		if (INTCON.TMR0IF) {
	BTFSS       INTCON+0, 2 
	GOTO        L_INTERRUPT_ISR8
;Configuraciones.c,65 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Configuraciones.c,66 :: 		TMR0L = 131;
	MOVLW       131
	MOVWF       TMR0L+0 
;Configuraciones.c,67 :: 		ms_ticks++;
	MOVLW       1
	ADDWF       _ms_ticks+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _ms_ticks+1, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _ms_ticks+2, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _ms_ticks+3, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       _ms_ticks+0 
	MOVF        R1, 0 
	MOVWF       _ms_ticks+1 
	MOVF        R2, 0 
	MOVWF       _ms_ticks+2 
	MOVF        R3, 0 
	MOVWF       _ms_ticks+3 
;Configuraciones.c,68 :: 		}
L_INTERRUPT_ISR8:
;Configuraciones.c,70 :: 		INTERRUPT();
	CALL        _INTERRUPT+0, 0
;Configuraciones.c,71 :: 		}
L_end_INTERRUPT_ISR:
	RETURN      0
; end of _INTERRUPT_ISR

_INTERRUPT:

;Configuraciones.c,73 :: 		void INTERRUPT(){
;Configuraciones.c,76 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT9
;Configuraciones.c,77 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,78 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,79 :: 		linea_detectada = 1;        //Activamos bandera global
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,80 :: 		}
L_INTERRUPT9:
;Configuraciones.c,82 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT10
;Configuraciones.c,83 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,84 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,85 :: 		linea_detectada = 1;
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,86 :: 		}
L_INTERRUPT10:
;Configuraciones.c,87 :: 		}
L_end_INTERRUPT:
L__INTERRUPT224:
	RETFIE      1
; end of _INTERRUPT

_SELEC:

;Configuraciones.c,90 :: 		void SELEC(){
;Configuraciones.c,92 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
	MOVLW       0
	BTFSC       PORTA+0, 3 
	MOVLW       1
	MOVWF       SELEC_seleccion_L0+0 
	CLRF        SELEC_seleccion_L0+1 
	MOVLW       0
	MOVWF       SELEC_seleccion_L0+1 
	CLRF        R3 
	BTFSC       PORTA+0, 2 
	INCF        R3, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
	CLRF        R3 
	BTFSC       PORTA+0, 1 
	INCF        R3, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
	CLRF        R3 
	BTFSC       PORTA+0, 0 
	INCF        R3, 1 
	MOVLW       3
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__SELEC226:
	BZ          L__SELEC227
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC226
L__SELEC227:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;Configuraciones.c,94 :: 		switch(seleccion){
	GOTO        L_SELEC11
;Configuraciones.c,95 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC13:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC228
	BCF         PORTA+0, 5 
	GOTO        L__SELEC229
L__SELEC228:
	BSF         PORTA+0, 5 
L__SELEC229:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC230
	BCF         PORTA+0, 7 
	GOTO        L__SELEC231
L__SELEC230:
	BSF         PORTA+0, 7 
L__SELEC231:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC232
	BCF         PORTA+0, 6 
	GOTO        L__SELEC233
L__SELEC232:
	BSF         PORTA+0, 6 
L__SELEC233:
;Configuraciones.c,98 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,100 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC14:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC234
	BCF         PORTA+0, 5 
	GOTO        L__SELEC235
L__SELEC234:
	BSF         PORTA+0, 5 
L__SELEC235:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC236
	BCF         PORTA+0, 4 
	GOTO        L__SELEC237
L__SELEC236:
	BSF         PORTA+0, 4 
L__SELEC237:
;Configuraciones.c,101 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC17
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC17
L__SELEC187:
;Configuraciones.c,102 :: 		L0=L3=L2=L1=1;
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC238
	BCF         PORTA+0, 5 
	GOTO        L__SELEC239
L__SELEC238:
	BSF         PORTA+0, 5 
L__SELEC239:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC240
	BCF         PORTA+0, 4 
	GOTO        L__SELEC241
L__SELEC240:
	BSF         PORTA+0, 4 
L__SELEC241:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC242
	BCF         PORTA+0, 6 
	GOTO        L__SELEC243
L__SELEC242:
	BSF         PORTA+0, 6 
L__SELEC243:
;Configuraciones.c,104 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,105 :: 		}
	GOTO        L_SELEC18
L_SELEC17:
;Configuraciones.c,106 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC21
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC21
L__SELEC186:
;Configuraciones.c,107 :: 		L0=L3=1; L2=L1=0;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC244
	BCF         PORTA+0, 6 
	GOTO        L__SELEC245
L__SELEC244:
	BSF         PORTA+0, 6 
L__SELEC245:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC246
	BCF         PORTA+0, 5 
	GOTO        L__SELEC247
L__SELEC246:
	BSF         PORTA+0, 5 
L__SELEC247:
;Configuraciones.c,108 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,109 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC22:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC22
	DECFSZ      R12, 1, 1
	BRA         L_SELEC22
	DECFSZ      R11, 1, 1
	BRA         L_SELEC22
	NOP
;Configuraciones.c,110 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,111 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC23:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC23
	DECFSZ      R12, 1, 1
	BRA         L_SELEC23
	DECFSZ      R11, 1, 1
	BRA         L_SELEC23
	NOP
	NOP
;Configuraciones.c,112 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,113 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC24:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC24
	DECFSZ      R12, 1, 1
	BRA         L_SELEC24
	DECFSZ      R11, 1, 1
	BRA         L_SELEC24
	NOP
;Configuraciones.c,116 :: 		}
	GOTO        L_SELEC25
L_SELEC21:
;Configuraciones.c,117 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC26
;Configuraciones.c,118 :: 		L2=0; L0=L3=L1=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC248
	BCF         PORTA+0, 4 
	GOTO        L__SELEC249
L__SELEC248:
	BSF         PORTA+0, 4 
L__SELEC249:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC250
	BCF         PORTA+0, 6 
	GOTO        L__SELEC251
L__SELEC250:
	BSF         PORTA+0, 6 
L__SELEC251:
;Configuraciones.c,119 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,120 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC27:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC27
	DECFSZ      R12, 1, 1
	BRA         L_SELEC27
	DECFSZ      R11, 1, 1
	BRA         L_SELEC27
	NOP
;Configuraciones.c,121 :: 		IZQ_L();
	CALL        _IZQ_L+0, 0
;Configuraciones.c,122 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC28:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC28
	DECFSZ      R12, 1, 1
	BRA         L_SELEC28
	DECFSZ      R11, 1, 1
	BRA         L_SELEC28
	NOP
;Configuraciones.c,126 :: 		}    //Caso a revisar
	GOTO        L_SELEC29
L_SELEC26:
;Configuraciones.c,127 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC30
;Configuraciones.c,128 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC252
	BCF         PORTA+0, 5 
	GOTO        L__SELEC253
L__SELEC252:
	BSF         PORTA+0, 5 
L__SELEC253:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC254
	BCF         PORTA+0, 4 
	GOTO        L__SELEC255
L__SELEC254:
	BSF         PORTA+0, 4 
L__SELEC255:
;Configuraciones.c,130 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,131 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_SELEC31:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC31
	DECFSZ      R12, 1, 1
	BRA         L_SELEC31
	NOP
	NOP
;Configuraciones.c,132 :: 		DER_L();
	CALL        _DER_L+0, 0
;Configuraciones.c,133 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_SELEC32:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC32
	DECFSZ      R12, 1, 1
	BRA         L_SELEC32
	NOP
	NOP
;Configuraciones.c,134 :: 		}
L_SELEC30:
L_SELEC29:
L_SELEC25:
L_SELEC18:
;Configuraciones.c,136 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,138 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC33:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC256
	BCF         PORTA+0, 5 
	GOTO        L__SELEC257
L__SELEC256:
	BSF         PORTA+0, 5 
L__SELEC257:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC258
	BCF         PORTA+0, 4 
	GOTO        L__SELEC259
L__SELEC258:
	BSF         PORTA+0, 4 
L__SELEC259:
;Configuraciones.c,139 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,141 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,143 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC34:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC260
	BCF         PORTA+0, 6 
	GOTO        L__SELEC261
L__SELEC260:
	BSF         PORTA+0, 6 
L__SELEC261:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC262
	BCF         PORTA+0, 5 
	GOTO        L__SELEC263
L__SELEC262:
	BSF         PORTA+0, 5 
L__SELEC263:
;Configuraciones.c,144 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,145 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_SELEC35:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC35
	DECFSZ      R12, 1, 1
	BRA         L_SELEC35
	DECFSZ      R11, 1, 1
	BRA         L_SELEC35
	NOP
;Configuraciones.c,146 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,147 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_SELEC36:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC36
	DECFSZ      R12, 1, 1
	BRA         L_SELEC36
	DECFSZ      R11, 1, 1
	BRA         L_SELEC36
	NOP
	NOP
;Configuraciones.c,152 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,154 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC37:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC264
	BCF         PORTA+0, 7 
	GOTO        L__SELEC265
L__SELEC264:
	BSF         PORTA+0, 7 
L__SELEC265:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC266
	BCF         PORTA+0, 4 
	GOTO        L__SELEC267
L__SELEC266:
	BSF         PORTA+0, 4 
L__SELEC267:
;Configuraciones.c,155 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,156 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC38:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC38
	DECFSZ      R12, 1, 1
	BRA         L_SELEC38
	DECFSZ      R11, 1, 1
	BRA         L_SELEC38
	NOP
	NOP
;Configuraciones.c,157 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,158 :: 		delay_ms(750);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_SELEC39:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC39
	DECFSZ      R12, 1, 1
	BRA         L_SELEC39
	DECFSZ      R11, 1, 1
	BRA         L_SELEC39
	NOP
	NOP
;Configuraciones.c,159 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,161 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC40:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC268
	BCF         PORTA+0, 5 
	GOTO        L__SELEC269
L__SELEC268:
	BSF         PORTA+0, 5 
L__SELEC269:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC270
	BCF         PORTA+0, 4 
	GOTO        L__SELEC271
L__SELEC270:
	BSF         PORTA+0, 4 
L__SELEC271:
;Configuraciones.c,162 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,163 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,165 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC41:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC272
	BCF         PORTA+0, 7 
	GOTO        L__SELEC273
L__SELEC272:
	BSF         PORTA+0, 7 
L__SELEC273:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC274
	BCF         PORTA+0, 4 
	GOTO        L__SELEC275
L__SELEC274:
	BSF         PORTA+0, 4 
L__SELEC275:
;Configuraciones.c,166 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,168 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,170 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC42:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC276
	BCF         PORTA+0, 7 
	GOTO        L__SELEC277
L__SELEC276:
	BSF         PORTA+0, 7 
L__SELEC277:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC278
	BCF         PORTA+0, 5 
	GOTO        L__SELEC279
L__SELEC278:
	BSF         PORTA+0, 5 
L__SELEC279:
	BSF         PORTA+0, 4 
;Configuraciones.c,172 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,174 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC43:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC280
	BCF         PORTA+0, 5 
	GOTO        L__SELEC281
L__SELEC280:
	BSF         PORTA+0, 5 
L__SELEC281:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC282
	BCF         PORTA+0, 7 
	GOTO        L__SELEC283
L__SELEC282:
	BSF         PORTA+0, 7 
L__SELEC283:
;Configuraciones.c,176 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,178 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC44:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC284
	BCF         PORTA+0, 6 
	GOTO        L__SELEC285
L__SELEC284:
	BSF         PORTA+0, 6 
L__SELEC285:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC286
	BCF         PORTA+0, 7 
	GOTO        L__SELEC287
L__SELEC286:
	BSF         PORTA+0, 7 
L__SELEC287:
;Configuraciones.c,181 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,183 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC45:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC288
	BCF         PORTA+0, 4 
	GOTO        L__SELEC289
L__SELEC288:
	BSF         PORTA+0, 4 
L__SELEC289:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC290
	BCF         PORTA+0, 5 
	GOTO        L__SELEC291
L__SELEC290:
	BSF         PORTA+0, 5 
L__SELEC291:
;Configuraciones.c,184 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,186 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC46:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC292
	BCF         PORTA+0, 7 
	GOTO        L__SELEC293
L__SELEC292:
	BSF         PORTA+0, 7 
L__SELEC293:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC294
	BCF         PORTA+0, 6 
	GOTO        L__SELEC295
L__SELEC294:
	BSF         PORTA+0, 6 
L__SELEC295:
	BSF         PORTA+0, 5 
;Configuraciones.c,187 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,189 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC47:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC296
	BCF         PORTA+0, 4 
	GOTO        L__SELEC297
L__SELEC296:
	BSF         PORTA+0, 4 
L__SELEC297:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC298
	BCF         PORTA+0, 7 
	GOTO        L__SELEC299
L__SELEC298:
	BSF         PORTA+0, 7 
L__SELEC299:
;Configuraciones.c,190 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,192 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC48:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC300
	BCF         PORTA+0, 5 
	GOTO        L__SELEC301
L__SELEC300:
	BSF         PORTA+0, 5 
L__SELEC301:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC302
	BCF         PORTA+0, 4 
	GOTO        L__SELEC303
L__SELEC302:
	BSF         PORTA+0, 4 
L__SELEC303:
	BSF         PORTA+0, 7 
;Configuraciones.c,193 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,195 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC49:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC304
	BCF         PORTA+0, 5 
	GOTO        L__SELEC305
L__SELEC304:
	BSF         PORTA+0, 5 
L__SELEC305:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC306
	BCF         PORTA+0, 4 
	GOTO        L__SELEC307
L__SELEC306:
	BSF         PORTA+0, 4 
L__SELEC307:
	BSF         PORTA+0, 6 
;Configuraciones.c,196 :: 		break;
	GOTO        L_SELEC12
;Configuraciones.c,198 :: 		default: L0=L1=L2=L3=0;
L_SELEC50:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC308
	BCF         PORTA+0, 5 
	GOTO        L__SELEC309
L__SELEC308:
	BSF         PORTA+0, 5 
L__SELEC309:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC310
	BCF         PORTA+0, 7 
	GOTO        L__SELEC311
L__SELEC310:
	BSF         PORTA+0, 7 
L__SELEC311:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC312
	BCF         PORTA+0, 6 
	GOTO        L__SELEC313
L__SELEC312:
	BSF         PORTA+0, 6 
L__SELEC313:
;Configuraciones.c,199 :: 		}
	GOTO        L_SELEC12
L_SELEC11:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC314
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC314:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC13
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC315
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC315:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC14
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC316
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC316:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC317
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC317:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC318
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC318:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC319
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC319:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC320
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC320:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC41
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC321
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC321:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC42
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC322
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC322:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC43
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC323
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC323:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC44
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC324
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC324:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC45
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC325
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC325:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC46
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC326
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC326:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC47
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC327
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC327:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC48
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC328
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC328:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC49
	GOTO        L_SELEC50
L_SELEC12:
;Configuraciones.c,202 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,206 :: 		void combate_estado() {
;Configuraciones.c,207 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado51
;Configuraciones.c,208 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,209 :: 		RUT_LINEA();
	CALL        _RUT_LINEA+0, 0
;Configuraciones.c,210 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,211 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,212 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,213 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,214 :: 		}
L_combate_estado51:
;Configuraciones.c,215 :: 		switch (estado_combate) {
	GOTO        L_combate_estado52
;Configuraciones.c,216 :: 		case CMB_ESPERA:
L_combate_estado54:
;Configuraciones.c,217 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado57
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado57
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado57
L__combate_estado195:
;Configuraciones.c,218 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,219 :: 		}
	GOTO        L_combate_estado58
L_combate_estado57:
;Configuraciones.c,220 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado61
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado61
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado61
L__combate_estado194:
;Configuraciones.c,221 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,222 :: 		}
	GOTO        L_combate_estado62
L_combate_estado61:
;Configuraciones.c,223 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado65
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado65
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado65
L__combate_estado193:
;Configuraciones.c,224 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,225 :: 		}
	GOTO        L_combate_estado66
L_combate_estado65:
;Configuraciones.c,226 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado69
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado69
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado69
L__combate_estado192:
;Configuraciones.c,227 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,228 :: 		}
	GOTO        L_combate_estado70
L_combate_estado69:
;Configuraciones.c,229 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado73
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado73
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado73
L__combate_estado191:
;Configuraciones.c,230 :: 		estado_combate = CMB_DER;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,231 :: 		}
	GOTO        L_combate_estado74
L_combate_estado73:
;Configuraciones.c,232 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado77
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado77
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado77
L__combate_estado190:
;Configuraciones.c,233 :: 		estado_combate = CMB_BUSCAR;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,234 :: 		sub_cmb_buscar = SUB_BUSCAR_IZQ;
	CLRF        _sub_cmb_buscar+0 
;Configuraciones.c,235 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,236 :: 		}
	GOTO        L_combate_estado78
L_combate_estado77:
;Configuraciones.c,237 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado81
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado81
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado81
L__combate_estado189:
;Configuraciones.c,238 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,239 :: 		}
	GOTO        L_combate_estado82
L_combate_estado81:
;Configuraciones.c,240 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado85
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado85
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado85
L__combate_estado188:
;Configuraciones.c,241 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,242 :: 		}
	GOTO        L_combate_estado86
L_combate_estado85:
;Configuraciones.c,244 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,245 :: 		}
L_combate_estado86:
L_combate_estado82:
L_combate_estado78:
L_combate_estado74:
L_combate_estado70:
L_combate_estado66:
L_combate_estado62:
L_combate_estado58:
;Configuraciones.c,246 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,248 :: 		case CMB_REC:
L_combate_estado87:
;Configuraciones.c,249 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado330
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado331
L__combate_estado330:
	BSF         PORTA+0, 5 
L__combate_estado331:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado332
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado333
L__combate_estado332:
	BSF         PORTA+0, 7 
L__combate_estado333:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado334
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado335
L__combate_estado334:
	BSF         PORTA+0, 6 
L__combate_estado335:
;Configuraciones.c,250 :: 		REC_M();
	CALL        _REC_M+0, 0
;Configuraciones.c,251 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,253 :: 		case CMB_IZQ:
L_combate_estado88:
;Configuraciones.c,254 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado336
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado337
L__combate_estado336:
	BSF         PORTA+0, 5 
L__combate_estado337:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado338
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado339
L__combate_estado338:
	BSF         PORTA+0, 7 
L__combate_estado339:
;Configuraciones.c,255 :: 		IZQ_M();
	CALL        _IZQ_M+0, 0
;Configuraciones.c,256 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,258 :: 		case CMB_HIT:
L_combate_estado89:
;Configuraciones.c,259 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado340
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado341
L__combate_estado340:
	BSF         PORTA+0, 5 
L__combate_estado341:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado342
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado343
L__combate_estado342:
	BSF         PORTA+0, 6 
L__combate_estado343:
;Configuraciones.c,260 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,261 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,263 :: 		case CMB_IZQ_GOLPE:
L_combate_estado90:
;Configuraciones.c,264 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado344
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado345
L__combate_estado344:
	BSF         PORTA+0, 6 
L__combate_estado345:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado346
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado347
L__combate_estado346:
	BSF         PORTA+0, 5 
L__combate_estado347:
;Configuraciones.c,265 :: 		IZQ_GIRO();
	CALL        _IZQ_GIRO+0, 0
;Configuraciones.c,266 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,268 :: 		case CMB_DER:
L_combate_estado91:
;Configuraciones.c,269 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado348
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado349
L__combate_estado348:
	BSF         PORTA+0, 7 
L__combate_estado349:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado350
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado351
L__combate_estado350:
	BSF         PORTA+0, 6 
L__combate_estado351:
;Configuraciones.c,270 :: 		DER_M();
	CALL        _DER_M+0, 0
;Configuraciones.c,271 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,273 :: 		case CMB_BUSCAR:
L_combate_estado92:
;Configuraciones.c,274 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado352
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado353
L__combate_estado352:
	BSF         PORTA+0, 6 
L__combate_estado353:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado354
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado355
L__combate_estado354:
	BSF         PORTA+0, 7 
L__combate_estado355:
;Configuraciones.c,275 :: 		BUSCAR();
	CALL        _BUSCAR+0, 0
;Configuraciones.c,276 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,278 :: 		case CMB_DER_HIT:
L_combate_estado93:
;Configuraciones.c,279 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado356
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado357
L__combate_estado356:
	BSF         PORTA+0, 7 
L__combate_estado357:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado358
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado359
L__combate_estado358:
	BSF         PORTA+0, 6 
L__combate_estado359:
;Configuraciones.c,280 :: 		DER_GIRO();
	CALL        _DER_GIRO+0, 0
;Configuraciones.c,281 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,283 :: 		case CMB_HIT_FULL:
L_combate_estado94:
;Configuraciones.c,284 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado360
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado361
L__combate_estado360:
	BSF         PORTA+0, 7 
L__combate_estado361:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado362
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado363
L__combate_estado362:
	BSF         PORTA+0, 6 
L__combate_estado363:
	BSF         PORTA+0, 4 
;Configuraciones.c,285 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,286 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,288 :: 		default:
L_combate_estado95:
;Configuraciones.c,289 :: 		LIBRE(); // Detén motores, ponlo en modo seguro
	CALL        _LIBRE+0, 0
;Configuraciones.c,290 :: 		estado_combate = CMB_ESPERA; // Vuelve a esperar nueva condición
	CLRF        _estado_combate+0 
;Configuraciones.c,291 :: 		estado_movimiento = MOV_IDLE; // Resetea movimiento si lo usas
	CLRF        _estado_movimiento+0 
;Configuraciones.c,292 :: 		break;
	GOTO        L_combate_estado53
;Configuraciones.c,293 :: 		}
L_combate_estado52:
	MOVF        _estado_combate+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado54
	MOVF        _estado_combate+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado87
	MOVF        _estado_combate+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado88
	MOVF        _estado_combate+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado89
	MOVF        _estado_combate+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado90
	MOVF        _estado_combate+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado91
	MOVF        _estado_combate+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado92
	MOVF        _estado_combate+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado93
	MOVF        _estado_combate+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado94
	GOTO        L_combate_estado95
L_combate_estado53:
;Configuraciones.c,294 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,296 :: 		void Start(){
;Configuraciones.c,297 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,298 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,299 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,300 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,301 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,302 :: 		return;
;Configuraciones.c,303 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,304 :: 		void Stop(){
;Configuraciones.c,305 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,306 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,307 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,308 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,309 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,310 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,317 :: 		void REC(){
;Configuraciones.c,319 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,321 :: 		PWM1_Set_Duty(200); // IN1 = PWM
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,322 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,325 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,326 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,327 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,328 :: 		void DER(){
;Configuraciones.c,329 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,330 :: 		PWM1_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,331 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,333 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,334 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,336 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_DER_Z:

;Configuraciones.c,337 :: 		void DER_Z(){
;Configuraciones.c,338 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,339 :: 		PWM1_Set_Duty(230);
	MOVLW       230
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,340 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,342 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,343 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,346 :: 		}
L_end_DER_Z:
	RETURN      0
; end of _DER_Z

_IZQ:

;Configuraciones.c,349 :: 		void IZQ(){
;Configuraciones.c,350 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,351 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,352 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,354 :: 		PWM3_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,355 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,356 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_IZQ_L:

;Configuraciones.c,358 :: 		void IZQ_L(){
;Configuraciones.c,359 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,360 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,361 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,363 :: 		PWM3_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,364 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,366 :: 		}
L_end_IZQ_L:
	RETURN      0
; end of _IZQ_L

_DER_L:

;Configuraciones.c,367 :: 		void DER_L(){
;Configuraciones.c,368 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,369 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,370 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,372 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,373 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,377 :: 		}
L_end_DER_L:
	RETURN      0
; end of _DER_L

_REV:

;Configuraciones.c,379 :: 		void REV(){
;Configuraciones.c,380 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,381 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,382 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,383 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,384 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,386 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,388 :: 		void LIBRE(){
;Configuraciones.c,390 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,391 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,392 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,393 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,394 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,398 :: 		void GIRO180(){
;Configuraciones.c,399 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,400 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,401 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,402 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,403 :: 		PWM4_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,405 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,407 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,408 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,409 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36096:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36096
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36096
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36096
	NOP
	NOP
;Configuraciones.c,410 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,412 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,414 :: 		void BRAKE(){
;Configuraciones.c,416 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,417 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,418 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,419 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,420 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,423 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,424 :: 		void HARD(){
;Configuraciones.c,425 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,426 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,427 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,428 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,431 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,432 :: 		void PUSH(){
;Configuraciones.c,433 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,435 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,436 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,439 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,440 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,442 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,443 :: 		void HIT(){
;Configuraciones.c,445 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,446 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT97:
	DECFSZ      R13, 1, 1
	BRA         L_HIT97
	DECFSZ      R12, 1, 1
	BRA         L_HIT97
	NOP
	NOP
;Configuraciones.c,447 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,448 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT98:
	DECFSZ      R13, 1, 1
	BRA         L_HIT98
	DECFSZ      R12, 1, 1
	BRA         L_HIT98
	DECFSZ      R11, 1, 1
	BRA         L_HIT98
	NOP
	NOP
;Configuraciones.c,449 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_HIT_NO_BLOQUEANTE:

;Configuraciones.c,450 :: 		void HIT_NO_BLOQUEANTE(){
;Configuraciones.c,451 :: 		unsigned long now = millis(); // Usa tu función de tiempo
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+0 
	MOVF        R1, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+1 
	MOVF        R2, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+2 
	MOVF        R3, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+3 
;Configuraciones.c,453 :: 		switch (estado_movimiento) {
	GOTO        L_HIT_NO_BLOQUEANTE99
;Configuraciones.c,454 :: 		case MOV_IDLE:
L_HIT_NO_BLOQUEANTE101:
;Configuraciones.c,455 :: 		PUSH(); // Avanza rápido
	CALL        _PUSH+0, 0
;Configuraciones.c,456 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,457 :: 		estado_movimiento = MOV_HIT_REC;
	MOVLW       1
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,458 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE100
;Configuraciones.c,460 :: 		case MOV_HIT_REC:
L_HIT_NO_BLOQUEANTE102:
;Configuraciones.c,462 :: 		if (now - tiempo_movimiento >= 20) {
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       R1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       R2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       R3 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _tiempo_movimiento+0, 0 
	SUBWF       R1, 1 
	MOVF        _tiempo_movimiento+1, 0 
	SUBWFB      R2, 1 
	MOVF        _tiempo_movimiento+2, 0 
	SUBWFB      R3, 1 
	MOVF        _tiempo_movimiento+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE381
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE381
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE381
	MOVLW       20
	SUBWF       R1, 0 
L__HIT_NO_BLOQUEANTE381:
	BTFSS       STATUS+0, 0 
	GOTO        L_HIT_NO_BLOQUEANTE103
;Configuraciones.c,463 :: 		PUSH(); // Empuje fuerte
	CALL        _PUSH+0, 0
;Configuraciones.c,464 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,465 :: 		estado_movimiento = MOV_HIT_PUSH;
	MOVLW       2
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,466 :: 		}
L_HIT_NO_BLOQUEANTE103:
;Configuraciones.c,467 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE100
;Configuraciones.c,469 :: 		case MOV_HIT_PUSH:
L_HIT_NO_BLOQUEANTE104:
;Configuraciones.c,471 :: 		if (S2 == 0) {
	BTFSC       PORTC+0, 6 
	GOTO        L_HIT_NO_BLOQUEANTE105
;Configuraciones.c,473 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,474 :: 		tiempo_movimiento = now; // Actualiza tiempo si quieres tiempo máximo de empuje
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,475 :: 		} else {
	GOTO        L_HIT_NO_BLOQUEANTE106
L_HIT_NO_BLOQUEANTE105:
;Configuraciones.c,477 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,478 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,479 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,480 :: 		}
L_HIT_NO_BLOQUEANTE106:
;Configuraciones.c,487 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE100
;Configuraciones.c,488 :: 		}
L_HIT_NO_BLOQUEANTE99:
	MOVF        _estado_movimiento+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE101
	MOVF        _estado_movimiento+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE102
	MOVF        _estado_movimiento+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE104
L_HIT_NO_BLOQUEANTE100:
;Configuraciones.c,489 :: 		}
L_end_HIT_NO_BLOQUEANTE:
	RETURN      0
; end of _HIT_NO_BLOQUEANTE

_IZQ_M:

;Configuraciones.c,490 :: 		void IZQ_M(){
;Configuraciones.c,491 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_M_now_L0+3 
;Configuraciones.c,492 :: 		switch (sub_cmb_izq) {
	GOTO        L_IZQ_M107
;Configuraciones.c,494 :: 		case SUB_IZQ_INICIO:
L_IZQ_M109:
;Configuraciones.c,495 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,496 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,497 :: 		sub_cmb_izq = SUB_IZQ_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,498 :: 		break;
	GOTO        L_IZQ_M108
;Configuraciones.c,500 :: 		case SUB_IZQ_GIRO:
L_IZQ_M110:
;Configuraciones.c,501 :: 		if (now - t_cmb_izq >= 100) {
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       R1 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       R2 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       R3 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_izq+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_izq+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_izq+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_izq+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M383
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M383
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M383
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M383:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M111
;Configuraciones.c,502 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,503 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,504 :: 		sub_cmb_izq = SUB_IZQ_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,505 :: 		} else {
	GOTO        L_IZQ_M112
L_IZQ_M111:
;Configuraciones.c,506 :: 		IZQ(); // si necesitas mantener comando
	CALL        _IZQ+0, 0
;Configuraciones.c,507 :: 		}
L_IZQ_M112:
;Configuraciones.c,508 :: 		break;
	GOTO        L_IZQ_M108
;Configuraciones.c,510 :: 		case SUB_IZQ_HARD:
L_IZQ_M113:
;Configuraciones.c,511 :: 		if (now - t_cmb_izq >= 100) {
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       R1 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       R2 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       R3 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_izq+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_izq+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_izq+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_izq+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M384
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M384
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M384
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M384:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M114
;Configuraciones.c,512 :: 		sub_cmb_izq = SUB_IZQ_INICIO;
	CLRF        _sub_cmb_izq+0 
;Configuraciones.c,513 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,514 :: 		} else {
	GOTO        L_IZQ_M115
L_IZQ_M114:
;Configuraciones.c,515 :: 		HARD(); // si necesitas mantener comando
	CALL        _HARD+0, 0
;Configuraciones.c,516 :: 		}
L_IZQ_M115:
;Configuraciones.c,517 :: 		break;
	GOTO        L_IZQ_M108
;Configuraciones.c,518 :: 		}
L_IZQ_M107:
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M109
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M110
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M113
L_IZQ_M108:
;Configuraciones.c,519 :: 		}
L_end_IZQ_M:
	RETURN      0
; end of _IZQ_M

_DER_M:

;Configuraciones.c,520 :: 		void DER_M() {
;Configuraciones.c,521 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_M_now_L0+3 
;Configuraciones.c,523 :: 		switch (sub_cmb_der) {
	GOTO        L_DER_M116
;Configuraciones.c,524 :: 		case SUB_DER_INICIO:
L_DER_M118:
;Configuraciones.c,525 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,526 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,527 :: 		sub_cmb_der = SUB_DER_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,528 :: 		break;
	GOTO        L_DER_M117
;Configuraciones.c,530 :: 		case SUB_DER_GIRO:
L_DER_M119:
;Configuraciones.c,532 :: 		if (S6 ==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M120
;Configuraciones.c,533 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,534 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,535 :: 		break;
	GOTO        L_DER_M117
;Configuraciones.c,536 :: 		}
L_DER_M120:
;Configuraciones.c,537 :: 		if (now - t_cmb_der >= 100) {
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       R1 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       R2 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       R3 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_der+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_der+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_der+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_der+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M386
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M386
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M386
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M386:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M121
;Configuraciones.c,538 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,539 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,540 :: 		sub_cmb_der = SUB_DER_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,541 :: 		} else {
	GOTO        L_DER_M122
L_DER_M121:
;Configuraciones.c,542 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,543 :: 		}
L_DER_M122:
;Configuraciones.c,544 :: 		break;
	GOTO        L_DER_M117
;Configuraciones.c,546 :: 		case SUB_DER_HARD:
L_DER_M123:
;Configuraciones.c,548 :: 		if (S6==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M124
;Configuraciones.c,549 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,550 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,551 :: 		break;
	GOTO        L_DER_M117
;Configuraciones.c,552 :: 		}
L_DER_M124:
;Configuraciones.c,553 :: 		if (now - t_cmb_der >= 100) {
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       R1 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       R2 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       R3 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_der+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_der+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_der+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_der+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M387
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M387
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M387
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M387:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M125
;Configuraciones.c,554 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,555 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,556 :: 		} else {
	GOTO        L_DER_M126
L_DER_M125:
;Configuraciones.c,557 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,558 :: 		}
L_DER_M126:
;Configuraciones.c,559 :: 		break;
	GOTO        L_DER_M117
;Configuraciones.c,560 :: 		}
L_DER_M116:
	MOVF        _sub_cmb_der+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M118
	MOVF        _sub_cmb_der+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M119
	MOVF        _sub_cmb_der+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M123
L_DER_M117:
;Configuraciones.c,561 :: 		}
L_end_DER_M:
	RETURN      0
; end of _DER_M

_REC_M:

;Configuraciones.c,562 :: 		void REC_M() {
;Configuraciones.c,563 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       REC_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       REC_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       REC_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       REC_M_now_L0+3 
;Configuraciones.c,564 :: 		switch (sub_cmb_rec) {
	GOTO        L_REC_M127
;Configuraciones.c,565 :: 		case SUB_REC_INICIO:
L_REC_M129:
;Configuraciones.c,566 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,567 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,568 :: 		sub_cmb_rec = SUB_REC_REC;
	MOVLW       1
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,569 :: 		break;
	GOTO        L_REC_M128
;Configuraciones.c,571 :: 		case SUB_REC_REC:
L_REC_M130:
;Configuraciones.c,572 :: 		if (now - t_cmb_rec >= 50) { // Espera 250 ms
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       R1 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       R2 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       R3 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_rec+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_rec+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_rec+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_rec+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M389
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M389
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M389
	MOVLW       50
	SUBWF       R1, 0 
L__REC_M389:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M131
;Configuraciones.c,573 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,574 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,575 :: 		sub_cmb_rec = SUB_REC_LIBRE;
	MOVLW       2
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,576 :: 		}
L_REC_M131:
;Configuraciones.c,577 :: 		break;
	GOTO        L_REC_M128
;Configuraciones.c,579 :: 		case SUB_REC_LIBRE:
L_REC_M132:
;Configuraciones.c,580 :: 		if (now - t_cmb_rec >= 100) { // Espera 200 ms
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       R1 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       R2 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       R3 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_rec+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_rec+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_rec+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_rec+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M390
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M390
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M390
	MOVLW       100
	SUBWF       R1, 0 
L__REC_M390:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M133
;Configuraciones.c,581 :: 		sub_cmb_rec = SUB_REC_FIN;
	MOVLW       3
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,582 :: 		}
L_REC_M133:
;Configuraciones.c,583 :: 		break;
	GOTO        L_REC_M128
;Configuraciones.c,585 :: 		case SUB_REC_FIN:
L_REC_M134:
;Configuraciones.c,586 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,587 :: 		sub_cmb_rec = SUB_REC_INICIO; // Reinicia para próxima vez
	CLRF        _sub_cmb_rec+0 
;Configuraciones.c,588 :: 		break;
	GOTO        L_REC_M128
;Configuraciones.c,589 :: 		}
L_REC_M127:
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M129
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M130
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M132
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M134
L_REC_M128:
;Configuraciones.c,590 :: 		}
L_end_REC_M:
	RETURN      0
; end of _REC_M

_IZQ_GIRO:

;Configuraciones.c,591 :: 		void IZQ_GIRO(){
;Configuraciones.c,592 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_GIRO_now_L0+3 
;Configuraciones.c,593 :: 		switch (sub_cmb_izq_giro) {
	GOTO        L_IZQ_GIRO135
;Configuraciones.c,594 :: 		case SUB_IZQ_GIRO:
L_IZQ_GIRO137:
;Configuraciones.c,596 :: 		IZQ(); // función de giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,597 :: 		t_cmb_izq_giro = now;
	MOVF        IZQ_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_izq_giro+0 
	MOVF        IZQ_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_izq_giro+1 
	MOVF        IZQ_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_izq_giro+2 
	MOVF        IZQ_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_izq_giro+3 
;Configuraciones.c,598 :: 		sub_cmb_izq_giro = SUB_IZQ_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,599 :: 		break;
	GOTO        L_IZQ_GIRO136
;Configuraciones.c,601 :: 		case SUB_IZQ_BUSCAR_CENTRO:
L_IZQ_GIRO138:
;Configuraciones.c,603 :: 		if (SL1 == 0 && S2 == 1 && S6 == 0) {
	BTFSC       PORTC+0, 0 
	GOTO        L_IZQ_GIRO141
	BTFSS       PORTC+0, 6 
	GOTO        L_IZQ_GIRO141
	BTFSC       PORTB+0, 4 
	GOTO        L_IZQ_GIRO141
L__IZQ_GIRO196:
;Configuraciones.c,604 :: 		sub_cmb_izq_giro = SUB_IZQ_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,605 :: 		}
L_IZQ_GIRO141:
;Configuraciones.c,606 :: 		break;
	GOTO        L_IZQ_GIRO136
;Configuraciones.c,608 :: 		case SUB_IZQ_ATAQUE:
L_IZQ_GIRO142:
;Configuraciones.c,610 :: 		HIT_NO_BLOQUEANTE(); // función de ataque
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,611 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,612 :: 		sub_cmb_izq_giro = SUB_IZQ_GIRO; // Reinicia para próxima vez
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,613 :: 		break;
	GOTO        L_IZQ_GIRO136
;Configuraciones.c,614 :: 		}
L_IZQ_GIRO135:
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO137
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO138
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO142
L_IZQ_GIRO136:
;Configuraciones.c,615 :: 		}
L_end_IZQ_GIRO:
	RETURN      0
; end of _IZQ_GIRO

_DER_GIRO:

;Configuraciones.c,616 :: 		void DER_GIRO(){
;Configuraciones.c,617 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_GIRO_now_L0+3 
;Configuraciones.c,618 :: 		switch(sub_cmb_der_giro){
	GOTO        L_DER_GIRO143
;Configuraciones.c,619 :: 		case SUB_DER_GIRO_INICIO:
L_DER_GIRO145:
;Configuraciones.c,620 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,621 :: 		t_cmb_der_giro = now;
	MOVF        DER_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_der_giro+0 
	MOVF        DER_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_der_giro+1 
	MOVF        DER_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_der_giro+2 
	MOVF        DER_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_der_giro+3 
;Configuraciones.c,622 :: 		sub_cmb_der_giro = SUB_DER_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,623 :: 		break;
	GOTO        L_DER_GIRO144
;Configuraciones.c,625 :: 		case SUB_DER_BUSCAR_CENTRO:
L_DER_GIRO146:
;Configuraciones.c,626 :: 		if(SL1 ==0 && S2 ==1 && S6==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_DER_GIRO149
	BTFSS       PORTC+0, 6 
	GOTO        L_DER_GIRO149
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_GIRO149
L__DER_GIRO197:
;Configuraciones.c,627 :: 		sub_cmb_der_giro = SUB_DER_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,628 :: 		}
L_DER_GIRO149:
;Configuraciones.c,629 :: 		break;
	GOTO        L_DER_GIRO144
;Configuraciones.c,631 :: 		case SUB_DER_ATAQUE:
L_DER_GIRO150:
;Configuraciones.c,632 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,633 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,634 :: 		sub_cmb_der_giro = SUB_DER_GIRO_INICIO;
	CLRF        _sub_cmb_der_giro+0 
;Configuraciones.c,635 :: 		break;
	GOTO        L_DER_GIRO144
;Configuraciones.c,636 :: 		}
L_DER_GIRO143:
	MOVF        _sub_cmb_der_giro+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_GIRO145
	MOVF        _sub_cmb_der_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_GIRO146
	MOVF        _sub_cmb_der_giro+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_GIRO150
L_DER_GIRO144:
;Configuraciones.c,638 :: 		}
L_end_DER_GIRO:
	RETURN      0
; end of _DER_GIRO

_BUSCAR:

;Configuraciones.c,639 :: 		void BUSCAR(){
;Configuraciones.c,640 :: 		switch (sub_cmb_buscar) {
	GOTO        L_BUSCAR151
;Configuraciones.c,641 :: 		case SUB_BUSCAR_IZQ:
L_BUSCAR153:
;Configuraciones.c,642 :: 		IZQ(); // Ejecuta giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,643 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR154
;Configuraciones.c,644 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,645 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
	GOTO        L_BUSCAR155
L_BUSCAR154:
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _t_cmb_buscar+0, 0 
	SUBWF       R4, 1 
	MOVF        _t_cmb_buscar+1, 0 
	SUBWFB      R5, 1 
	MOVF        _t_cmb_buscar+2, 0 
	SUBWFB      R6, 1 
	MOVF        _t_cmb_buscar+3, 0 
	SUBWFB      R7, 1 
	MOVF        R7, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR394
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR394
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR394
	MOVF        R4, 0 
	SUBLW       200
L__BUSCAR394:
	BTFSC       STATUS+0, 0 
	GOTO        L_BUSCAR156
;Configuraciones.c,646 :: 		sub_cmb_buscar = SUB_BUSCAR_DER;
	MOVLW       1
	MOVWF       _sub_cmb_buscar+0 
;Configuraciones.c,647 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,648 :: 		}
L_BUSCAR156:
L_BUSCAR155:
;Configuraciones.c,649 :: 		break;
	GOTO        L_BUSCAR152
;Configuraciones.c,650 :: 		case SUB_BUSCAR_DER:
L_BUSCAR157:
;Configuraciones.c,651 :: 		DER(); // Ejecuta giro derecha
	CALL        _DER+0, 0
;Configuraciones.c,652 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR158
;Configuraciones.c,653 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,654 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
	GOTO        L_BUSCAR159
L_BUSCAR158:
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _t_cmb_buscar+0, 0 
	SUBWF       R4, 1 
	MOVF        _t_cmb_buscar+1, 0 
	SUBWFB      R5, 1 
	MOVF        _t_cmb_buscar+2, 0 
	SUBWFB      R6, 1 
	MOVF        _t_cmb_buscar+3, 0 
	SUBWFB      R7, 1 
	MOVF        R7, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR395
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR395
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR395
	MOVF        R4, 0 
	SUBLW       200
L__BUSCAR395:
	BTFSC       STATUS+0, 0 
	GOTO        L_BUSCAR160
;Configuraciones.c,655 :: 		estado_combate = CMB_ESPERA; // O vuelve a búsqueda, como prefieras
	CLRF        _estado_combate+0 
;Configuraciones.c,656 :: 		}
L_BUSCAR160:
L_BUSCAR159:
;Configuraciones.c,657 :: 		break;
	GOTO        L_BUSCAR152
;Configuraciones.c,658 :: 		}
L_BUSCAR151:
	MOVF        _sub_cmb_buscar+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_BUSCAR153
	MOVF        _sub_cmb_buscar+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_BUSCAR157
L_BUSCAR152:
;Configuraciones.c,659 :: 		}
L_end_BUSCAR:
	RETURN      0
; end of _BUSCAR

_RUT_LINEA:

;Configuraciones.c,660 :: 		void RUT_LINEA(){
;Configuraciones.c,661 :: 		if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_RUT_LINEA163
	BTFSC       PORTB+0, 1 
	GOTO        L_RUT_LINEA163
L__RUT_LINEA198:
;Configuraciones.c,662 :: 		L0 = L3 = 1; L2 = L1 = 0;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__RUT_LINEA397
	BCF         PORTA+0, 6 
	GOTO        L__RUT_LINEA398
L__RUT_LINEA397:
	BSF         PORTA+0, 6 
L__RUT_LINEA398:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__RUT_LINEA399
	BCF         PORTA+0, 5 
	GOTO        L__RUT_LINEA400
L__RUT_LINEA399:
	BSF         PORTA+0, 5 
L__RUT_LINEA400:
;Configuraciones.c,663 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,664 :: 		t_cmb_linea = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,665 :: 		sub_cmb_linea = LINEA_HARD_180;
	MOVLW       1
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,666 :: 		}
	GOTO        L_RUT_LINEA164
L_RUT_LINEA163:
;Configuraciones.c,667 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_RUT_LINEA165
;Configuraciones.c,668 :: 		L2 = 0; L0 = L3 = L1 = 1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__RUT_LINEA401
	BCF         PORTA+0, 4 
	GOTO        L__RUT_LINEA402
L__RUT_LINEA401:
	BSF         PORTA+0, 4 
L__RUT_LINEA402:
	BTFSC       PORTA+0, 4 
	GOTO        L__RUT_LINEA403
	BCF         PORTA+0, 6 
	GOTO        L__RUT_LINEA404
L__RUT_LINEA403:
	BSF         PORTA+0, 6 
L__RUT_LINEA404:
;Configuraciones.c,669 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,670 :: 		t_cmb_linea = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,671 :: 		sub_cmb_linea = LINEA_HARD_IZQ;
	MOVLW       4
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,672 :: 		}
	GOTO        L_RUT_LINEA166
L_RUT_LINEA165:
;Configuraciones.c,673 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_RUT_LINEA167
;Configuraciones.c,674 :: 		L0 = 0; L3 = L2 = L1 = 1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__RUT_LINEA405
	BCF         PORTA+0, 5 
	GOTO        L__RUT_LINEA406
L__RUT_LINEA405:
	BSF         PORTA+0, 5 
L__RUT_LINEA406:
	BTFSC       PORTA+0, 5 
	GOTO        L__RUT_LINEA407
	BCF         PORTA+0, 4 
	GOTO        L__RUT_LINEA408
L__RUT_LINEA407:
	BSF         PORTA+0, 4 
L__RUT_LINEA408:
;Configuraciones.c,675 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,676 :: 		t_cmb_linea = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,677 :: 		sub_cmb_linea = LINEA_HARD_DER;
	MOVLW       6
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,678 :: 		}
L_RUT_LINEA167:
L_RUT_LINEA166:
L_RUT_LINEA164:
;Configuraciones.c,679 :: 		}
L_end_RUT_LINEA:
	RETURN      0
; end of _RUT_LINEA

_LOGICA_LINEA:

;Configuraciones.c,681 :: 		void LOGICA_LINEA() {
;Configuraciones.c,682 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       LOGICA_LINEA_now_L0+0 
	MOVF        R1, 0 
	MOVWF       LOGICA_LINEA_now_L0+1 
	MOVF        R2, 0 
	MOVWF       LOGICA_LINEA_now_L0+2 
	MOVF        R3, 0 
	MOVWF       LOGICA_LINEA_now_L0+3 
;Configuraciones.c,684 :: 		switch (sub_cmb_linea) {
	GOTO        L_LOGICA_LINEA168
;Configuraciones.c,685 :: 		case LINEA_HARD_180:
L_LOGICA_LINEA170:
;Configuraciones.c,686 :: 		if (now - t_cmb_linea >= 100) {
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       R1 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       R2 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       R3 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_linea+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_linea+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_linea+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_linea+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA410
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA410
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA410
	MOVLW       100
	SUBWF       R1, 0 
L__LOGICA_LINEA410:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA171
;Configuraciones.c,687 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,688 :: 		t_cmb_linea = now;
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,689 :: 		sub_cmb_linea = LINEA_GIRO180;
	MOVLW       2
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,690 :: 		}
L_LOGICA_LINEA171:
;Configuraciones.c,691 :: 		break;
	GOTO        L_LOGICA_LINEA169
;Configuraciones.c,693 :: 		case LINEA_GIRO180:
L_LOGICA_LINEA172:
;Configuraciones.c,694 :: 		if (now - t_cmb_linea >= 300) {
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       R1 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       R2 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       R3 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_linea+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_linea+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_linea+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_linea+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA411
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA411
	MOVLW       1
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA411
	MOVLW       44
	SUBWF       R1, 0 
L__LOGICA_LINEA411:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA173
;Configuraciones.c,695 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,696 :: 		t_cmb_linea = now;
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,697 :: 		sub_cmb_linea = LINEA_HARD_FINAL_180;
	MOVLW       3
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,698 :: 		}
L_LOGICA_LINEA173:
;Configuraciones.c,699 :: 		break;
	GOTO        L_LOGICA_LINEA169
;Configuraciones.c,701 :: 		case LINEA_HARD_FINAL_180:
L_LOGICA_LINEA174:
;Configuraciones.c,702 :: 		if (now - t_cmb_linea >= 100) {
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       R1 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       R2 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       R3 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_linea+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_linea+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_linea+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_linea+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA412
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA412
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA412
	MOVLW       100
	SUBWF       R1, 0 
L__LOGICA_LINEA412:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA175
;Configuraciones.c,703 :: 		sub_cmb_linea = LINEA_WAIT; // Estado listo/inactivo
	MOVLW       8
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,704 :: 		}
L_LOGICA_LINEA175:
;Configuraciones.c,705 :: 		break;
	GOTO        L_LOGICA_LINEA169
;Configuraciones.c,707 :: 		case LINEA_HARD_IZQ:
L_LOGICA_LINEA176:
;Configuraciones.c,708 :: 		if (now - t_cmb_linea >= 100) {
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       R1 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       R2 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       R3 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_linea+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_linea+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_linea+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_linea+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA413
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA413
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA413
	MOVLW       100
	SUBWF       R1, 0 
L__LOGICA_LINEA413:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA177
;Configuraciones.c,709 :: 		IZQ_L();
	CALL        _IZQ_L+0, 0
;Configuraciones.c,710 :: 		t_cmb_linea = now;
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,711 :: 		sub_cmb_linea = LINEA_IZQ_L;
	MOVLW       5
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,712 :: 		}
L_LOGICA_LINEA177:
;Configuraciones.c,713 :: 		break;
	GOTO        L_LOGICA_LINEA169
;Configuraciones.c,715 :: 		case LINEA_IZQ_L:
L_LOGICA_LINEA178:
;Configuraciones.c,716 :: 		if (now - t_cmb_linea >= 100) {
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       R1 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       R2 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       R3 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_linea+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_linea+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_linea+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_linea+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA414
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA414
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA414
	MOVLW       100
	SUBWF       R1, 0 
L__LOGICA_LINEA414:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA179
;Configuraciones.c,717 :: 		sub_cmb_linea = LINEA_WAIT; // Estado listo/inactivo
	MOVLW       8
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,718 :: 		}
L_LOGICA_LINEA179:
;Configuraciones.c,719 :: 		break;
	GOTO        L_LOGICA_LINEA169
;Configuraciones.c,721 :: 		case LINEA_HARD_DER:
L_LOGICA_LINEA180:
;Configuraciones.c,722 :: 		if (now - t_cmb_linea >= 50) {
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       R1 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       R2 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       R3 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_linea+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_linea+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_linea+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_linea+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA415
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA415
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA415
	MOVLW       50
	SUBWF       R1, 0 
L__LOGICA_LINEA415:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA181
;Configuraciones.c,723 :: 		DER_L();
	CALL        _DER_L+0, 0
;Configuraciones.c,724 :: 		t_cmb_linea = now;
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,725 :: 		sub_cmb_linea = LINEA_DER_L;
	MOVLW       7
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,726 :: 		}
L_LOGICA_LINEA181:
;Configuraciones.c,727 :: 		break;
	GOTO        L_LOGICA_LINEA169
;Configuraciones.c,729 :: 		case LINEA_DER_L:
L_LOGICA_LINEA182:
;Configuraciones.c,730 :: 		if (now - t_cmb_linea >= 20) {
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       R1 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       R2 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       R3 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       R4 
	MOVF        _t_cmb_linea+0, 0 
	SUBWF       R1, 1 
	MOVF        _t_cmb_linea+1, 0 
	SUBWFB      R2, 1 
	MOVF        _t_cmb_linea+2, 0 
	SUBWFB      R3, 1 
	MOVF        _t_cmb_linea+3, 0 
	SUBWFB      R4, 1 
	MOVLW       0
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA416
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA416
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA416
	MOVLW       20
	SUBWF       R1, 0 
L__LOGICA_LINEA416:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA183
;Configuraciones.c,731 :: 		sub_cmb_linea = LINEA_WAIT; // Estado listo/inactivo
	MOVLW       8
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,732 :: 		}
L_LOGICA_LINEA183:
;Configuraciones.c,733 :: 		break;
	GOTO        L_LOGICA_LINEA169
;Configuraciones.c,735 :: 		case LINEA_WAIT:
L_LOGICA_LINEA184:
;Configuraciones.c,736 :: 		default:
L_LOGICA_LINEA185:
;Configuraciones.c,738 :: 		break;
	GOTO        L_LOGICA_LINEA169
;Configuraciones.c,739 :: 		}
L_LOGICA_LINEA168:
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA170
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA172
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA174
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA176
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA178
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA180
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA182
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA184
	GOTO        L_LOGICA_LINEA185
L_LOGICA_LINEA169:
;Configuraciones.c,740 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
