
_INTERRUPT_ISR:

;Configuraciones.c,41 :: 		void INTERRUPT_ISR(void) {
;Configuraciones.c,43 :: 		if (INTCON.TMR0IF) {
	BTFSS       INTCON+0, 2 
	GOTO        L_INTERRUPT_ISR0
;Configuraciones.c,44 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Configuraciones.c,45 :: 		TMR0L = 131;
	MOVLW       131
	MOVWF       TMR0L+0 
;Configuraciones.c,46 :: 		ms_ticks++;
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
;Configuraciones.c,47 :: 		}
L_INTERRUPT_ISR0:
;Configuraciones.c,49 :: 		INTERRUPT();
	CALL        _INTERRUPT+0, 0
;Configuraciones.c,50 :: 		}
L_end_INTERRUPT_ISR:
	RETURN      0
; end of _INTERRUPT_ISR

_INTERRUPT:

;Configuraciones.c,52 :: 		void INTERRUPT(){
;Configuraciones.c,55 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT1
;Configuraciones.c,56 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,57 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,58 :: 		linea_detectada = 1;        //Activamos bandera global
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,59 :: 		}
L_INTERRUPT1:
;Configuraciones.c,61 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT2
;Configuraciones.c,62 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,63 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,64 :: 		linea_detectada = 1;
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,65 :: 		}
L_INTERRUPT2:
;Configuraciones.c,66 :: 		}
L_end_INTERRUPT:
L__INTERRUPT186:
	RETFIE      1
; end of _INTERRUPT

_SELEC:

;Configuraciones.c,69 :: 		void SELEC(){
;Configuraciones.c,71 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC188:
	BZ          L__SELEC189
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC188
L__SELEC189:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;Configuraciones.c,73 :: 		switch(seleccion){
	GOTO        L_SELEC3
;Configuraciones.c,74 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC5:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC190
	BCF         PORTA+0, 5 
	GOTO        L__SELEC191
L__SELEC190:
	BSF         PORTA+0, 5 
L__SELEC191:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC192
	BCF         PORTA+0, 7 
	GOTO        L__SELEC193
L__SELEC192:
	BSF         PORTA+0, 7 
L__SELEC193:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC194
	BCF         PORTA+0, 6 
	GOTO        L__SELEC195
L__SELEC194:
	BSF         PORTA+0, 6 
L__SELEC195:
;Configuraciones.c,77 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,79 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC6:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC196
	BCF         PORTA+0, 5 
	GOTO        L__SELEC197
L__SELEC196:
	BSF         PORTA+0, 5 
L__SELEC197:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC198
	BCF         PORTA+0, 4 
	GOTO        L__SELEC199
L__SELEC198:
	BSF         PORTA+0, 4 
L__SELEC199:
;Configuraciones.c,80 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC9
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC9
L__SELEC171:
;Configuraciones.c,81 :: 		L0=L3=L2=L1=1;
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC200
	BCF         PORTA+0, 5 
	GOTO        L__SELEC201
L__SELEC200:
	BSF         PORTA+0, 5 
L__SELEC201:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC202
	BCF         PORTA+0, 4 
	GOTO        L__SELEC203
L__SELEC202:
	BSF         PORTA+0, 4 
L__SELEC203:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC204
	BCF         PORTA+0, 6 
	GOTO        L__SELEC205
L__SELEC204:
	BSF         PORTA+0, 6 
L__SELEC205:
;Configuraciones.c,83 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,84 :: 		}
	GOTO        L_SELEC10
L_SELEC9:
;Configuraciones.c,85 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC13
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC13
L__SELEC170:
;Configuraciones.c,86 :: 		L0=L3=1; L2=L1=0;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC206
	BCF         PORTA+0, 6 
	GOTO        L__SELEC207
L__SELEC206:
	BSF         PORTA+0, 6 
L__SELEC207:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC208
	BCF         PORTA+0, 5 
	GOTO        L__SELEC209
L__SELEC208:
	BSF         PORTA+0, 5 
L__SELEC209:
;Configuraciones.c,87 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,88 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC14:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC14
	DECFSZ      R12, 1, 1
	BRA         L_SELEC14
	DECFSZ      R11, 1, 1
	BRA         L_SELEC14
	NOP
;Configuraciones.c,89 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,90 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC15:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC15
	DECFSZ      R12, 1, 1
	BRA         L_SELEC15
	DECFSZ      R11, 1, 1
	BRA         L_SELEC15
	NOP
	NOP
;Configuraciones.c,91 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,92 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC16:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC16
	DECFSZ      R12, 1, 1
	BRA         L_SELEC16
	DECFSZ      R11, 1, 1
	BRA         L_SELEC16
	NOP
;Configuraciones.c,95 :: 		}
	GOTO        L_SELEC17
L_SELEC13:
;Configuraciones.c,96 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC18
;Configuraciones.c,97 :: 		L2=0; L0=L3=L1=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC210
	BCF         PORTA+0, 4 
	GOTO        L__SELEC211
L__SELEC210:
	BSF         PORTA+0, 4 
L__SELEC211:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC212
	BCF         PORTA+0, 6 
	GOTO        L__SELEC213
L__SELEC212:
	BSF         PORTA+0, 6 
L__SELEC213:
;Configuraciones.c,98 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,99 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC19:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC19
	DECFSZ      R12, 1, 1
	BRA         L_SELEC19
	DECFSZ      R11, 1, 1
	BRA         L_SELEC19
	NOP
;Configuraciones.c,100 :: 		IZQ_L();
	CALL        _IZQ_L+0, 0
;Configuraciones.c,101 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC20:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC20
	DECFSZ      R12, 1, 1
	BRA         L_SELEC20
	DECFSZ      R11, 1, 1
	BRA         L_SELEC20
	NOP
;Configuraciones.c,105 :: 		}    //Caso a revisar
	GOTO        L_SELEC21
L_SELEC18:
;Configuraciones.c,106 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC22
;Configuraciones.c,107 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC214
	BCF         PORTA+0, 5 
	GOTO        L__SELEC215
L__SELEC214:
	BSF         PORTA+0, 5 
L__SELEC215:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC216
	BCF         PORTA+0, 4 
	GOTO        L__SELEC217
L__SELEC216:
	BSF         PORTA+0, 4 
L__SELEC217:
;Configuraciones.c,109 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,110 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_SELEC23:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC23
	DECFSZ      R12, 1, 1
	BRA         L_SELEC23
	NOP
	NOP
;Configuraciones.c,111 :: 		DER_L();
	CALL        _DER_L+0, 0
;Configuraciones.c,112 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_SELEC24:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC24
	DECFSZ      R12, 1, 1
	BRA         L_SELEC24
	NOP
	NOP
;Configuraciones.c,113 :: 		}
L_SELEC22:
L_SELEC21:
L_SELEC17:
L_SELEC10:
;Configuraciones.c,115 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,117 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC25:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC218
	BCF         PORTA+0, 5 
	GOTO        L__SELEC219
L__SELEC218:
	BSF         PORTA+0, 5 
L__SELEC219:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC220
	BCF         PORTA+0, 4 
	GOTO        L__SELEC221
L__SELEC220:
	BSF         PORTA+0, 4 
L__SELEC221:
;Configuraciones.c,118 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,120 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,122 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC26:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC222
	BCF         PORTA+0, 6 
	GOTO        L__SELEC223
L__SELEC222:
	BSF         PORTA+0, 6 
L__SELEC223:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC224
	BCF         PORTA+0, 5 
	GOTO        L__SELEC225
L__SELEC224:
	BSF         PORTA+0, 5 
L__SELEC225:
;Configuraciones.c,123 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,124 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_SELEC27:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC27
	DECFSZ      R12, 1, 1
	BRA         L_SELEC27
	DECFSZ      R11, 1, 1
	BRA         L_SELEC27
	NOP
;Configuraciones.c,125 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,126 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_SELEC28:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC28
	DECFSZ      R12, 1, 1
	BRA         L_SELEC28
	DECFSZ      R11, 1, 1
	BRA         L_SELEC28
	NOP
	NOP
;Configuraciones.c,131 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,133 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC29:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC226
	BCF         PORTA+0, 7 
	GOTO        L__SELEC227
L__SELEC226:
	BSF         PORTA+0, 7 
L__SELEC227:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC228
	BCF         PORTA+0, 4 
	GOTO        L__SELEC229
L__SELEC228:
	BSF         PORTA+0, 4 
L__SELEC229:
;Configuraciones.c,134 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,135 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC30:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC30
	DECFSZ      R12, 1, 1
	BRA         L_SELEC30
	DECFSZ      R11, 1, 1
	BRA         L_SELEC30
	NOP
	NOP
;Configuraciones.c,136 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,137 :: 		delay_ms(750);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_SELEC31:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC31
	DECFSZ      R12, 1, 1
	BRA         L_SELEC31
	DECFSZ      R11, 1, 1
	BRA         L_SELEC31
	NOP
	NOP
;Configuraciones.c,138 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,140 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC32:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC230
	BCF         PORTA+0, 5 
	GOTO        L__SELEC231
L__SELEC230:
	BSF         PORTA+0, 5 
L__SELEC231:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC232
	BCF         PORTA+0, 4 
	GOTO        L__SELEC233
L__SELEC232:
	BSF         PORTA+0, 4 
L__SELEC233:
;Configuraciones.c,141 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,142 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,144 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC33:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC234
	BCF         PORTA+0, 7 
	GOTO        L__SELEC235
L__SELEC234:
	BSF         PORTA+0, 7 
L__SELEC235:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC236
	BCF         PORTA+0, 4 
	GOTO        L__SELEC237
L__SELEC236:
	BSF         PORTA+0, 4 
L__SELEC237:
;Configuraciones.c,145 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,147 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,149 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC34:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC238
	BCF         PORTA+0, 7 
	GOTO        L__SELEC239
L__SELEC238:
	BSF         PORTA+0, 7 
L__SELEC239:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC240
	BCF         PORTA+0, 5 
	GOTO        L__SELEC241
L__SELEC240:
	BSF         PORTA+0, 5 
L__SELEC241:
	BSF         PORTA+0, 4 
;Configuraciones.c,151 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,153 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC35:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC242
	BCF         PORTA+0, 5 
	GOTO        L__SELEC243
L__SELEC242:
	BSF         PORTA+0, 5 
L__SELEC243:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC244
	BCF         PORTA+0, 7 
	GOTO        L__SELEC245
L__SELEC244:
	BSF         PORTA+0, 7 
L__SELEC245:
;Configuraciones.c,155 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,157 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC36:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC246
	BCF         PORTA+0, 6 
	GOTO        L__SELEC247
L__SELEC246:
	BSF         PORTA+0, 6 
L__SELEC247:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC248
	BCF         PORTA+0, 7 
	GOTO        L__SELEC249
L__SELEC248:
	BSF         PORTA+0, 7 
L__SELEC249:
;Configuraciones.c,160 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,162 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC37:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC250
	BCF         PORTA+0, 4 
	GOTO        L__SELEC251
L__SELEC250:
	BSF         PORTA+0, 4 
L__SELEC251:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC252
	BCF         PORTA+0, 5 
	GOTO        L__SELEC253
L__SELEC252:
	BSF         PORTA+0, 5 
L__SELEC253:
;Configuraciones.c,163 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,165 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC38:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC254
	BCF         PORTA+0, 7 
	GOTO        L__SELEC255
L__SELEC254:
	BSF         PORTA+0, 7 
L__SELEC255:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC256
	BCF         PORTA+0, 6 
	GOTO        L__SELEC257
L__SELEC256:
	BSF         PORTA+0, 6 
L__SELEC257:
	BSF         PORTA+0, 5 
;Configuraciones.c,166 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,168 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC39:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC258
	BCF         PORTA+0, 4 
	GOTO        L__SELEC259
L__SELEC258:
	BSF         PORTA+0, 4 
L__SELEC259:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC260
	BCF         PORTA+0, 7 
	GOTO        L__SELEC261
L__SELEC260:
	BSF         PORTA+0, 7 
L__SELEC261:
;Configuraciones.c,169 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,171 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC40:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC262
	BCF         PORTA+0, 5 
	GOTO        L__SELEC263
L__SELEC262:
	BSF         PORTA+0, 5 
L__SELEC263:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC264
	BCF         PORTA+0, 4 
	GOTO        L__SELEC265
L__SELEC264:
	BSF         PORTA+0, 4 
L__SELEC265:
	BSF         PORTA+0, 7 
;Configuraciones.c,172 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,174 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC41:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC266
	BCF         PORTA+0, 5 
	GOTO        L__SELEC267
L__SELEC266:
	BSF         PORTA+0, 5 
L__SELEC267:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC268
	BCF         PORTA+0, 4 
	GOTO        L__SELEC269
L__SELEC268:
	BSF         PORTA+0, 4 
L__SELEC269:
	BSF         PORTA+0, 6 
;Configuraciones.c,175 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,177 :: 		default: L0=L1=L2=L3=0;
L_SELEC42:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC270
	BCF         PORTA+0, 5 
	GOTO        L__SELEC271
L__SELEC270:
	BSF         PORTA+0, 5 
L__SELEC271:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC272
	BCF         PORTA+0, 7 
	GOTO        L__SELEC273
L__SELEC272:
	BSF         PORTA+0, 7 
L__SELEC273:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC274
	BCF         PORTA+0, 6 
	GOTO        L__SELEC275
L__SELEC274:
	BSF         PORTA+0, 6 
L__SELEC275:
;Configuraciones.c,178 :: 		}
	GOTO        L_SELEC4
L_SELEC3:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC276
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC276:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC5
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC277
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC277:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC6
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC278
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC278:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC279
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC279:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC26
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC280
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC280:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC29
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC281
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC281:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC282
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC282:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC283
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC283:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC284
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC284:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC285
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC285:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC286
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC286:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC287
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC287:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC288
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC288:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC289
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC289:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC290
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC290:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC41
	GOTO        L_SELEC42
L_SELEC4:
;Configuraciones.c,181 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,185 :: 		void combate_estado() {
;Configuraciones.c,186 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado43
;Configuraciones.c,187 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,188 :: 		LOGICA_LINEA();
	CALL        _LOGICA_LINEA+0, 0
;Configuraciones.c,189 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,190 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,191 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,192 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,193 :: 		}
L_combate_estado43:
;Configuraciones.c,194 :: 		switch (estado_combate) {
	GOTO        L_combate_estado44
;Configuraciones.c,195 :: 		case CMB_ESPERA:
L_combate_estado46:
;Configuraciones.c,196 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado49
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado49
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado49
L__combate_estado179:
;Configuraciones.c,197 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,198 :: 		}
	GOTO        L_combate_estado50
L_combate_estado49:
;Configuraciones.c,199 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado53
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado53
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado53
L__combate_estado178:
;Configuraciones.c,200 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,201 :: 		}
	GOTO        L_combate_estado54
L_combate_estado53:
;Configuraciones.c,202 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado57
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado57
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado57
L__combate_estado177:
;Configuraciones.c,203 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,204 :: 		}
	GOTO        L_combate_estado58
L_combate_estado57:
;Configuraciones.c,205 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado61
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado61
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado61
L__combate_estado176:
;Configuraciones.c,206 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,207 :: 		}
	GOTO        L_combate_estado62
L_combate_estado61:
;Configuraciones.c,208 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado65
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado65
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado65
L__combate_estado175:
;Configuraciones.c,209 :: 		estado_combate = CMB_DER;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,210 :: 		}
	GOTO        L_combate_estado66
L_combate_estado65:
;Configuraciones.c,211 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado69
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado69
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado69
L__combate_estado174:
;Configuraciones.c,212 :: 		estado_combate = CMB_BUSCAR;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,213 :: 		sub_cmb_buscar = SUB_BUSCAR_IZQ;
	CLRF        _sub_cmb_buscar+0 
;Configuraciones.c,214 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,215 :: 		}
	GOTO        L_combate_estado70
L_combate_estado69:
;Configuraciones.c,216 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado73
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado73
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado73
L__combate_estado173:
;Configuraciones.c,217 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,218 :: 		}
	GOTO        L_combate_estado74
L_combate_estado73:
;Configuraciones.c,219 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado77
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado77
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado77
L__combate_estado172:
;Configuraciones.c,220 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,221 :: 		}
	GOTO        L_combate_estado78
L_combate_estado77:
;Configuraciones.c,223 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,224 :: 		}
L_combate_estado78:
L_combate_estado74:
L_combate_estado70:
L_combate_estado66:
L_combate_estado62:
L_combate_estado58:
L_combate_estado54:
L_combate_estado50:
;Configuraciones.c,225 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,227 :: 		case CMB_REC:
L_combate_estado79:
;Configuraciones.c,228 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado292
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado293
L__combate_estado292:
	BSF         PORTA+0, 5 
L__combate_estado293:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado294
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado295
L__combate_estado294:
	BSF         PORTA+0, 7 
L__combate_estado295:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado296
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado297
L__combate_estado296:
	BSF         PORTA+0, 6 
L__combate_estado297:
;Configuraciones.c,229 :: 		REC_M();
	CALL        _REC_M+0, 0
;Configuraciones.c,230 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,232 :: 		case CMB_IZQ:
L_combate_estado80:
;Configuraciones.c,233 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado298
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado299
L__combate_estado298:
	BSF         PORTA+0, 5 
L__combate_estado299:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado300
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado301
L__combate_estado300:
	BSF         PORTA+0, 7 
L__combate_estado301:
;Configuraciones.c,234 :: 		IZQ_M();
	CALL        _IZQ_M+0, 0
;Configuraciones.c,235 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,237 :: 		case CMB_HIT:
L_combate_estado81:
;Configuraciones.c,238 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado302
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado303
L__combate_estado302:
	BSF         PORTA+0, 5 
L__combate_estado303:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado304
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado305
L__combate_estado304:
	BSF         PORTA+0, 6 
L__combate_estado305:
;Configuraciones.c,239 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,240 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,242 :: 		case CMB_IZQ_GOLPE:
L_combate_estado82:
;Configuraciones.c,243 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado306
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado307
L__combate_estado306:
	BSF         PORTA+0, 6 
L__combate_estado307:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado308
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado309
L__combate_estado308:
	BSF         PORTA+0, 5 
L__combate_estado309:
;Configuraciones.c,244 :: 		IZQ_GIRO();
	CALL        _IZQ_GIRO+0, 0
;Configuraciones.c,245 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,247 :: 		case CMB_DER:
L_combate_estado83:
;Configuraciones.c,248 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado310
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado311
L__combate_estado310:
	BSF         PORTA+0, 7 
L__combate_estado311:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado312
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado313
L__combate_estado312:
	BSF         PORTA+0, 6 
L__combate_estado313:
;Configuraciones.c,249 :: 		DER_M();
	CALL        _DER_M+0, 0
;Configuraciones.c,250 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,252 :: 		case CMB_BUSCAR:
L_combate_estado84:
;Configuraciones.c,253 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado314
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado315
L__combate_estado314:
	BSF         PORTA+0, 6 
L__combate_estado315:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado316
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado317
L__combate_estado316:
	BSF         PORTA+0, 7 
L__combate_estado317:
;Configuraciones.c,254 :: 		BUSCAR();
	CALL        _BUSCAR+0, 0
;Configuraciones.c,255 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,257 :: 		case CMB_DER_HIT:
L_combate_estado85:
;Configuraciones.c,258 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado318
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado319
L__combate_estado318:
	BSF         PORTA+0, 7 
L__combate_estado319:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado320
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado321
L__combate_estado320:
	BSF         PORTA+0, 6 
L__combate_estado321:
;Configuraciones.c,259 :: 		DER_GIRO();
	CALL        _DER_GIRO+0, 0
;Configuraciones.c,260 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,262 :: 		case CMB_HIT_FULL:
L_combate_estado86:
;Configuraciones.c,263 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado322
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado323
L__combate_estado322:
	BSF         PORTA+0, 7 
L__combate_estado323:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado324
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado325
L__combate_estado324:
	BSF         PORTA+0, 6 
L__combate_estado325:
	BSF         PORTA+0, 4 
;Configuraciones.c,264 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,265 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,267 :: 		default:
L_combate_estado87:
;Configuraciones.c,268 :: 		LIBRE(); // Detén motores, ponlo en modo seguro
	CALL        _LIBRE+0, 0
;Configuraciones.c,269 :: 		estado_combate = CMB_ESPERA; // Vuelve a esperar nueva condición
	CLRF        _estado_combate+0 
;Configuraciones.c,270 :: 		estado_movimiento = MOV_IDLE; // Resetea movimiento si lo usas
	CLRF        _estado_movimiento+0 
;Configuraciones.c,271 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,272 :: 		}
L_combate_estado44:
	MOVF        _estado_combate+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado46
	MOVF        _estado_combate+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado79
	MOVF        _estado_combate+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado80
	MOVF        _estado_combate+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado81
	MOVF        _estado_combate+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado82
	MOVF        _estado_combate+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado83
	MOVF        _estado_combate+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado84
	MOVF        _estado_combate+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado85
	MOVF        _estado_combate+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado86
	GOTO        L_combate_estado87
L_combate_estado45:
;Configuraciones.c,273 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,275 :: 		void Start(){
;Configuraciones.c,276 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,277 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,278 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,279 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,280 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,281 :: 		return;
;Configuraciones.c,282 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,283 :: 		void Stop(){
;Configuraciones.c,284 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,285 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,286 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,287 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,288 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,289 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,296 :: 		void REC(){
;Configuraciones.c,298 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,300 :: 		PWM1_Set_Duty(200); // IN1 = PWM
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,301 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,304 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,305 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,306 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,307 :: 		void DER(){
;Configuraciones.c,308 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,309 :: 		PWM1_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,310 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,312 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,313 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,315 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_DER_Z:

;Configuraciones.c,316 :: 		void DER_Z(){
;Configuraciones.c,317 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,318 :: 		PWM1_Set_Duty(230);
	MOVLW       230
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,319 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,321 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,322 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,325 :: 		}
L_end_DER_Z:
	RETURN      0
; end of _DER_Z

_IZQ:

;Configuraciones.c,328 :: 		void IZQ(){
;Configuraciones.c,329 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,330 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,331 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,333 :: 		PWM3_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,334 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,335 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_IZQ_L:

;Configuraciones.c,337 :: 		void IZQ_L(){
;Configuraciones.c,338 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,339 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,340 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,342 :: 		PWM3_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,343 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,345 :: 		}
L_end_IZQ_L:
	RETURN      0
; end of _IZQ_L

_DER_L:

;Configuraciones.c,346 :: 		void DER_L(){
;Configuraciones.c,347 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,348 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,349 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,351 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,352 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,356 :: 		}
L_end_DER_L:
	RETURN      0
; end of _DER_L

_REV:

;Configuraciones.c,358 :: 		void REV(){
;Configuraciones.c,359 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,360 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,361 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,362 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,363 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,365 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,367 :: 		void LIBRE(){
;Configuraciones.c,369 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,370 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,371 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,372 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,373 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,377 :: 		void GIRO180(){
;Configuraciones.c,378 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,379 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,380 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,381 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,382 :: 		PWM4_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,384 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,386 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,387 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,388 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36088:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36088
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36088
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36088
	NOP
	NOP
;Configuraciones.c,389 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,391 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,393 :: 		void BRAKE(){
;Configuraciones.c,395 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,396 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,397 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,398 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,399 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,402 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,403 :: 		void HARD(){
;Configuraciones.c,404 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,405 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,406 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,407 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,410 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,411 :: 		void PUSH(){
;Configuraciones.c,412 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,414 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,415 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,418 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,419 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,421 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,422 :: 		void HIT(){
;Configuraciones.c,424 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,425 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT89:
	DECFSZ      R13, 1, 1
	BRA         L_HIT89
	DECFSZ      R12, 1, 1
	BRA         L_HIT89
	NOP
	NOP
;Configuraciones.c,426 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,427 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT90:
	DECFSZ      R13, 1, 1
	BRA         L_HIT90
	DECFSZ      R12, 1, 1
	BRA         L_HIT90
	DECFSZ      R11, 1, 1
	BRA         L_HIT90
	NOP
	NOP
;Configuraciones.c,428 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_HIT_NO_BLOQUEANTE:

;Configuraciones.c,429 :: 		void HIT_NO_BLOQUEANTE(){
;Configuraciones.c,430 :: 		unsigned long now = millis(); // Usa tu función de tiempo
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+0 
	MOVF        R1, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+1 
	MOVF        R2, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+2 
	MOVF        R3, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+3 
;Configuraciones.c,432 :: 		switch (estado_movimiento) {
	GOTO        L_HIT_NO_BLOQUEANTE91
;Configuraciones.c,433 :: 		case MOV_IDLE:
L_HIT_NO_BLOQUEANTE93:
;Configuraciones.c,434 :: 		PUSH(); // Avanza rápido
	CALL        _PUSH+0, 0
;Configuraciones.c,435 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,436 :: 		estado_movimiento = MOV_HIT_REC;
	MOVLW       1
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,437 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE92
;Configuraciones.c,439 :: 		case MOV_HIT_REC:
L_HIT_NO_BLOQUEANTE94:
;Configuraciones.c,441 :: 		if (now - tiempo_movimiento >= 20) {
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
	GOTO        L__HIT_NO_BLOQUEANTE343
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE343
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE343
	MOVLW       20
	SUBWF       R1, 0 
L__HIT_NO_BLOQUEANTE343:
	BTFSS       STATUS+0, 0 
	GOTO        L_HIT_NO_BLOQUEANTE95
;Configuraciones.c,442 :: 		PUSH(); // Empuje fuerte
	CALL        _PUSH+0, 0
;Configuraciones.c,443 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,444 :: 		estado_movimiento = MOV_HIT_PUSH;
	MOVLW       2
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,445 :: 		}
L_HIT_NO_BLOQUEANTE95:
;Configuraciones.c,446 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE92
;Configuraciones.c,448 :: 		case MOV_HIT_PUSH:
L_HIT_NO_BLOQUEANTE96:
;Configuraciones.c,450 :: 		if (S2 == 0) {
	BTFSC       PORTC+0, 6 
	GOTO        L_HIT_NO_BLOQUEANTE97
;Configuraciones.c,452 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,453 :: 		tiempo_movimiento = now; // Actualiza tiempo si quieres tiempo máximo de empuje
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,454 :: 		} else {
	GOTO        L_HIT_NO_BLOQUEANTE98
L_HIT_NO_BLOQUEANTE97:
;Configuraciones.c,456 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,457 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,458 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,459 :: 		}
L_HIT_NO_BLOQUEANTE98:
;Configuraciones.c,466 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE92
;Configuraciones.c,467 :: 		}
L_HIT_NO_BLOQUEANTE91:
	MOVF        _estado_movimiento+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE93
	MOVF        _estado_movimiento+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE94
	MOVF        _estado_movimiento+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE96
L_HIT_NO_BLOQUEANTE92:
;Configuraciones.c,468 :: 		}
L_end_HIT_NO_BLOQUEANTE:
	RETURN      0
; end of _HIT_NO_BLOQUEANTE

_IZQ_M:

;Configuraciones.c,469 :: 		void IZQ_M(){
;Configuraciones.c,470 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_M_now_L0+3 
;Configuraciones.c,471 :: 		switch (sub_cmb_izq) {
	GOTO        L_IZQ_M99
;Configuraciones.c,473 :: 		case SUB_IZQ_INICIO:
L_IZQ_M101:
;Configuraciones.c,474 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,475 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,476 :: 		sub_cmb_izq = SUB_IZQ_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,477 :: 		break;
	GOTO        L_IZQ_M100
;Configuraciones.c,479 :: 		case SUB_IZQ_GIRO:
L_IZQ_M102:
;Configuraciones.c,480 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M345
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M345
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M345
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M345:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M103
;Configuraciones.c,481 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,482 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,483 :: 		sub_cmb_izq = SUB_IZQ_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,484 :: 		} else {
	GOTO        L_IZQ_M104
L_IZQ_M103:
;Configuraciones.c,485 :: 		IZQ(); // si necesitas mantener comando
	CALL        _IZQ+0, 0
;Configuraciones.c,486 :: 		}
L_IZQ_M104:
;Configuraciones.c,487 :: 		break;
	GOTO        L_IZQ_M100
;Configuraciones.c,489 :: 		case SUB_IZQ_HARD:
L_IZQ_M105:
;Configuraciones.c,490 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M346
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M346
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M346
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M346:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M106
;Configuraciones.c,491 :: 		sub_cmb_izq = SUB_IZQ_INICIO;
	CLRF        _sub_cmb_izq+0 
;Configuraciones.c,492 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,493 :: 		} else {
	GOTO        L_IZQ_M107
L_IZQ_M106:
;Configuraciones.c,494 :: 		HARD(); // si necesitas mantener comando
	CALL        _HARD+0, 0
;Configuraciones.c,495 :: 		}
L_IZQ_M107:
;Configuraciones.c,496 :: 		break;
	GOTO        L_IZQ_M100
;Configuraciones.c,497 :: 		}
L_IZQ_M99:
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M101
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M102
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M105
L_IZQ_M100:
;Configuraciones.c,498 :: 		}
L_end_IZQ_M:
	RETURN      0
; end of _IZQ_M

_DER_M:

;Configuraciones.c,499 :: 		void DER_M() {
;Configuraciones.c,500 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_M_now_L0+3 
;Configuraciones.c,502 :: 		switch (sub_cmb_der) {
	GOTO        L_DER_M108
;Configuraciones.c,503 :: 		case SUB_DER_INICIO:
L_DER_M110:
;Configuraciones.c,504 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,505 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,506 :: 		sub_cmb_der = SUB_DER_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,507 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,509 :: 		case SUB_DER_GIRO:
L_DER_M111:
;Configuraciones.c,511 :: 		if (S6 ==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M112
;Configuraciones.c,512 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,513 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,514 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,515 :: 		}
L_DER_M112:
;Configuraciones.c,516 :: 		if (now - t_cmb_der >= 100) {
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
	GOTO        L__DER_M348
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M348
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M348
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M348:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M113
;Configuraciones.c,517 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,518 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,519 :: 		sub_cmb_der = SUB_DER_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,520 :: 		} else {
	GOTO        L_DER_M114
L_DER_M113:
;Configuraciones.c,521 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,522 :: 		}
L_DER_M114:
;Configuraciones.c,523 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,525 :: 		case SUB_DER_HARD:
L_DER_M115:
;Configuraciones.c,527 :: 		if (S6==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M116
;Configuraciones.c,528 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,529 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,530 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,531 :: 		}
L_DER_M116:
;Configuraciones.c,532 :: 		if (now - t_cmb_der >= 100) {
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
	GOTO        L__DER_M349
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M349
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M349
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M349:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M117
;Configuraciones.c,533 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,534 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,535 :: 		} else {
	GOTO        L_DER_M118
L_DER_M117:
;Configuraciones.c,536 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,537 :: 		}
L_DER_M118:
;Configuraciones.c,538 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,539 :: 		}
L_DER_M108:
	MOVF        _sub_cmb_der+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M110
	MOVF        _sub_cmb_der+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M111
	MOVF        _sub_cmb_der+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M115
L_DER_M109:
;Configuraciones.c,540 :: 		}
L_end_DER_M:
	RETURN      0
; end of _DER_M

_REC_M:

;Configuraciones.c,541 :: 		void REC_M() {
;Configuraciones.c,542 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       REC_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       REC_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       REC_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       REC_M_now_L0+3 
;Configuraciones.c,543 :: 		switch (sub_cmb_rec) {
	GOTO        L_REC_M119
;Configuraciones.c,544 :: 		case SUB_REC_INICIO:
L_REC_M121:
;Configuraciones.c,545 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,546 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,547 :: 		sub_cmb_rec = SUB_REC_REC;
	MOVLW       1
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,548 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,550 :: 		case SUB_REC_REC:
L_REC_M122:
;Configuraciones.c,551 :: 		if (now - t_cmb_rec >= 50) { // Espera 250 ms
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
	GOTO        L__REC_M351
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M351
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M351
	MOVLW       50
	SUBWF       R1, 0 
L__REC_M351:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M123
;Configuraciones.c,552 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,553 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,554 :: 		sub_cmb_rec = SUB_REC_LIBRE;
	MOVLW       2
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,555 :: 		}
L_REC_M123:
;Configuraciones.c,556 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,558 :: 		case SUB_REC_LIBRE:
L_REC_M124:
;Configuraciones.c,559 :: 		if (now - t_cmb_rec >= 100) { // Espera 200 ms
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
	GOTO        L__REC_M352
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M352
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M352
	MOVLW       100
	SUBWF       R1, 0 
L__REC_M352:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M125
;Configuraciones.c,560 :: 		sub_cmb_rec = SUB_REC_FIN;
	MOVLW       3
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,561 :: 		}
L_REC_M125:
;Configuraciones.c,562 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,564 :: 		case SUB_REC_FIN:
L_REC_M126:
;Configuraciones.c,565 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,566 :: 		sub_cmb_rec = SUB_REC_INICIO; // Reinicia para próxima vez
	CLRF        _sub_cmb_rec+0 
;Configuraciones.c,567 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,568 :: 		}
L_REC_M119:
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M121
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M122
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M124
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M126
L_REC_M120:
;Configuraciones.c,569 :: 		}
L_end_REC_M:
	RETURN      0
; end of _REC_M

_IZQ_GIRO:

;Configuraciones.c,570 :: 		void IZQ_GIRO(){
;Configuraciones.c,571 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_GIRO_now_L0+3 
;Configuraciones.c,572 :: 		switch (sub_cmb_izq_giro) {
	GOTO        L_IZQ_GIRO127
;Configuraciones.c,573 :: 		case SUB_IZQ_GIRO:
L_IZQ_GIRO129:
;Configuraciones.c,575 :: 		IZQ(); // función de giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,576 :: 		t_cmb_izq_giro = now;
	MOVF        IZQ_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_izq_giro+0 
	MOVF        IZQ_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_izq_giro+1 
	MOVF        IZQ_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_izq_giro+2 
	MOVF        IZQ_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_izq_giro+3 
;Configuraciones.c,577 :: 		sub_cmb_izq_giro = SUB_IZQ_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,578 :: 		break;
	GOTO        L_IZQ_GIRO128
;Configuraciones.c,580 :: 		case SUB_IZQ_BUSCAR_CENTRO:
L_IZQ_GIRO130:
;Configuraciones.c,582 :: 		if (SL1 == 0 && S2 == 1 && S6 == 0) {
	BTFSC       PORTC+0, 0 
	GOTO        L_IZQ_GIRO133
	BTFSS       PORTC+0, 6 
	GOTO        L_IZQ_GIRO133
	BTFSC       PORTB+0, 4 
	GOTO        L_IZQ_GIRO133
L__IZQ_GIRO180:
;Configuraciones.c,583 :: 		sub_cmb_izq_giro = SUB_IZQ_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,584 :: 		}
L_IZQ_GIRO133:
;Configuraciones.c,585 :: 		break;
	GOTO        L_IZQ_GIRO128
;Configuraciones.c,587 :: 		case SUB_IZQ_ATAQUE:
L_IZQ_GIRO134:
;Configuraciones.c,589 :: 		HIT_NO_BLOQUEANTE(); // función de ataque
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,590 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,591 :: 		sub_cmb_izq_giro = SUB_IZQ_GIRO; // Reinicia para próxima vez
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,592 :: 		break;
	GOTO        L_IZQ_GIRO128
;Configuraciones.c,593 :: 		}
L_IZQ_GIRO127:
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO129
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO130
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO134
L_IZQ_GIRO128:
;Configuraciones.c,594 :: 		}
L_end_IZQ_GIRO:
	RETURN      0
; end of _IZQ_GIRO

_DER_GIRO:

;Configuraciones.c,595 :: 		void DER_GIRO(){
;Configuraciones.c,596 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_GIRO_now_L0+3 
;Configuraciones.c,597 :: 		switch(sub_cmb_der_giro){
	GOTO        L_DER_GIRO135
;Configuraciones.c,598 :: 		case SUB_DER_GIRO_INICIO:
L_DER_GIRO137:
;Configuraciones.c,599 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,600 :: 		t_cmb_der_giro = now;
	MOVF        DER_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_der_giro+0 
	MOVF        DER_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_der_giro+1 
	MOVF        DER_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_der_giro+2 
	MOVF        DER_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_der_giro+3 
;Configuraciones.c,601 :: 		sub_cmb_der_giro = SUB_DER_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,602 :: 		break;
	GOTO        L_DER_GIRO136
;Configuraciones.c,604 :: 		case SUB_DER_BUSCAR_CENTRO:
L_DER_GIRO138:
;Configuraciones.c,605 :: 		if(SL1 ==0 && S2 ==1 && S6==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_DER_GIRO141
	BTFSS       PORTC+0, 6 
	GOTO        L_DER_GIRO141
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_GIRO141
L__DER_GIRO181:
;Configuraciones.c,606 :: 		sub_cmb_der_giro = SUB_DER_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,607 :: 		}
L_DER_GIRO141:
;Configuraciones.c,608 :: 		break;
	GOTO        L_DER_GIRO136
;Configuraciones.c,610 :: 		case SUB_DER_ATAQUE:
L_DER_GIRO142:
;Configuraciones.c,611 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,612 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,613 :: 		sub_cmb_der_giro = SUB_DER_GIRO_INICIO;
	CLRF        _sub_cmb_der_giro+0 
;Configuraciones.c,614 :: 		break;
	GOTO        L_DER_GIRO136
;Configuraciones.c,615 :: 		}
L_DER_GIRO135:
	MOVF        _sub_cmb_der_giro+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_GIRO137
	MOVF        _sub_cmb_der_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_GIRO138
	MOVF        _sub_cmb_der_giro+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_GIRO142
L_DER_GIRO136:
;Configuraciones.c,617 :: 		}
L_end_DER_GIRO:
	RETURN      0
; end of _DER_GIRO

_BUSCAR:

;Configuraciones.c,618 :: 		void BUSCAR(){
;Configuraciones.c,619 :: 		switch (sub_cmb_buscar) {
	GOTO        L_BUSCAR143
;Configuraciones.c,620 :: 		case SUB_BUSCAR_IZQ:
L_BUSCAR145:
;Configuraciones.c,621 :: 		IZQ(); // Ejecuta giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,622 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR146
;Configuraciones.c,623 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,624 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
	GOTO        L_BUSCAR147
L_BUSCAR146:
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
	GOTO        L__BUSCAR356
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR356
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR356
	MOVF        R4, 0 
	SUBLW       200
L__BUSCAR356:
	BTFSC       STATUS+0, 0 
	GOTO        L_BUSCAR148
;Configuraciones.c,625 :: 		sub_cmb_buscar = SUB_BUSCAR_DER;
	MOVLW       1
	MOVWF       _sub_cmb_buscar+0 
;Configuraciones.c,626 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,627 :: 		}
L_BUSCAR148:
L_BUSCAR147:
;Configuraciones.c,628 :: 		break;
	GOTO        L_BUSCAR144
;Configuraciones.c,629 :: 		case SUB_BUSCAR_DER:
L_BUSCAR149:
;Configuraciones.c,630 :: 		DER(); // Ejecuta giro derecha
	CALL        _DER+0, 0
;Configuraciones.c,631 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR150
;Configuraciones.c,632 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,633 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
	GOTO        L_BUSCAR151
L_BUSCAR150:
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
	GOTO        L__BUSCAR357
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR357
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR357
	MOVF        R4, 0 
	SUBLW       200
L__BUSCAR357:
	BTFSC       STATUS+0, 0 
	GOTO        L_BUSCAR152
;Configuraciones.c,634 :: 		estado_combate = CMB_ESPERA; // O vuelve a búsqueda, como prefieras
	CLRF        _estado_combate+0 
;Configuraciones.c,635 :: 		}
L_BUSCAR152:
L_BUSCAR151:
;Configuraciones.c,636 :: 		break;
	GOTO        L_BUSCAR144
;Configuraciones.c,637 :: 		}
L_BUSCAR143:
	MOVF        _sub_cmb_buscar+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_BUSCAR145
	MOVF        _sub_cmb_buscar+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_BUSCAR149
L_BUSCAR144:
;Configuraciones.c,638 :: 		}
L_end_BUSCAR:
	RETURN      0
; end of _BUSCAR

_LOGICA_LINEA:

;Configuraciones.c,639 :: 		void LOGICA_LINEA(){
;Configuraciones.c,640 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA155
	BTFSS       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA155
L__LOGICA_LINEA183:
;Configuraciones.c,641 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,642 :: 		}
	GOTO        L_LOGICA_LINEA156
L_LOGICA_LINEA155:
;Configuraciones.c,643 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA159
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA159
L__LOGICA_LINEA182:
;Configuraciones.c,644 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,645 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA160:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA160
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA160
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA160
	NOP
;Configuraciones.c,646 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,647 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA161:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA161
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA161
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA161
	NOP
;Configuraciones.c,648 :: 		}
	GOTO        L_LOGICA_LINEA162
L_LOGICA_LINEA159:
;Configuraciones.c,649 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA163
;Configuraciones.c,650 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,651 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA164:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA164
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA164
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA164
	NOP
;Configuraciones.c,652 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,653 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA165:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA165
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA165
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA165
	NOP
;Configuraciones.c,654 :: 		}
	GOTO        L_LOGICA_LINEA166
L_LOGICA_LINEA163:
;Configuraciones.c,655 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA167
;Configuraciones.c,656 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,657 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA168:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA168
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA168
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA168
	NOP
;Configuraciones.c,658 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,659 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA169:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA169
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA169
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA169
	NOP
;Configuraciones.c,660 :: 		}
L_LOGICA_LINEA167:
L_LOGICA_LINEA166:
L_LOGICA_LINEA162:
L_LOGICA_LINEA156:
;Configuraciones.c,661 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
