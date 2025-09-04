
_INTERRUPT_ISR:

;Configuraciones.c,46 :: 		void INTERRUPT_ISR(void) {
;Configuraciones.c,48 :: 		if (INTCON.TMR0IF) {
	BTFSS       INTCON+0, 2 
	GOTO        L_INTERRUPT_ISR0
;Configuraciones.c,49 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Configuraciones.c,50 :: 		TMR0L = 131;
	MOVLW       131
	MOVWF       TMR0L+0 
;Configuraciones.c,51 :: 		ms_ticks++;
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
;Configuraciones.c,52 :: 		}
L_INTERRUPT_ISR0:
;Configuraciones.c,54 :: 		INTERRUPT();
	CALL        _INTERRUPT+0, 0
;Configuraciones.c,55 :: 		}
L_end_INTERRUPT_ISR:
	RETURN      0
; end of _INTERRUPT_ISR

_INTERRUPT:

;Configuraciones.c,57 :: 		void INTERRUPT(){
;Configuraciones.c,60 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT1
;Configuraciones.c,61 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,62 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,63 :: 		linea_detectada = 1;        //Activamos bandera global
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,64 :: 		}
L_INTERRUPT1:
;Configuraciones.c,66 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT2
;Configuraciones.c,67 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,68 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,69 :: 		linea_detectada = 1;
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,70 :: 		}
L_INTERRUPT2:
;Configuraciones.c,71 :: 		}
L_end_INTERRUPT:
L__INTERRUPT193:
	RETFIE      1
; end of _INTERRUPT

_SELEC:

;Configuraciones.c,74 :: 		void SELEC(){
;Configuraciones.c,76 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC195:
	BZ          L__SELEC196
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC195
L__SELEC196:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;Configuraciones.c,78 :: 		switch(seleccion){
	GOTO        L_SELEC3
;Configuraciones.c,79 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC5:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC197
	BCF         PORTA+0, 5 
	GOTO        L__SELEC198
L__SELEC197:
	BSF         PORTA+0, 5 
L__SELEC198:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC199
	BCF         PORTA+0, 7 
	GOTO        L__SELEC200
L__SELEC199:
	BSF         PORTA+0, 7 
L__SELEC200:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC201
	BCF         PORTA+0, 6 
	GOTO        L__SELEC202
L__SELEC201:
	BSF         PORTA+0, 6 
L__SELEC202:
;Configuraciones.c,82 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,84 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC6:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC203
	BCF         PORTA+0, 5 
	GOTO        L__SELEC204
L__SELEC203:
	BSF         PORTA+0, 5 
L__SELEC204:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC205
	BCF         PORTA+0, 4 
	GOTO        L__SELEC206
L__SELEC205:
	BSF         PORTA+0, 4 
L__SELEC206:
;Configuraciones.c,85 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC9
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC9
L__SELEC179:
;Configuraciones.c,86 :: 		L0=L3=L2=L1=1;
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC207
	BCF         PORTA+0, 5 
	GOTO        L__SELEC208
L__SELEC207:
	BSF         PORTA+0, 5 
L__SELEC208:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC209
	BCF         PORTA+0, 4 
	GOTO        L__SELEC210
L__SELEC209:
	BSF         PORTA+0, 4 
L__SELEC210:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC211
	BCF         PORTA+0, 6 
	GOTO        L__SELEC212
L__SELEC211:
	BSF         PORTA+0, 6 
L__SELEC212:
;Configuraciones.c,88 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,89 :: 		}
	GOTO        L_SELEC10
L_SELEC9:
;Configuraciones.c,90 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC13
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC13
L__SELEC178:
;Configuraciones.c,91 :: 		L0=L3=1; L2=L1=0;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC213
	BCF         PORTA+0, 6 
	GOTO        L__SELEC214
L__SELEC213:
	BSF         PORTA+0, 6 
L__SELEC214:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC215
	BCF         PORTA+0, 5 
	GOTO        L__SELEC216
L__SELEC215:
	BSF         PORTA+0, 5 
L__SELEC216:
;Configuraciones.c,92 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,93 :: 		delay_ms(100);
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
;Configuraciones.c,94 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,95 :: 		delay_ms(300);
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
;Configuraciones.c,96 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,97 :: 		delay_ms(100);
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
;Configuraciones.c,100 :: 		}
	GOTO        L_SELEC17
L_SELEC13:
;Configuraciones.c,101 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC18
;Configuraciones.c,102 :: 		L2=0; L0=L3=L1=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC217
	BCF         PORTA+0, 4 
	GOTO        L__SELEC218
L__SELEC217:
	BSF         PORTA+0, 4 
L__SELEC218:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC219
	BCF         PORTA+0, 6 
	GOTO        L__SELEC220
L__SELEC219:
	BSF         PORTA+0, 6 
L__SELEC220:
;Configuraciones.c,103 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,104 :: 		delay_ms(100);
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
;Configuraciones.c,105 :: 		IZQ_L();
	CALL        _IZQ_L+0, 0
;Configuraciones.c,106 :: 		delay_ms(100);
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
;Configuraciones.c,110 :: 		}    //Caso a revisar
	GOTO        L_SELEC21
L_SELEC18:
;Configuraciones.c,111 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC22
;Configuraciones.c,112 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC221
	BCF         PORTA+0, 5 
	GOTO        L__SELEC222
L__SELEC221:
	BSF         PORTA+0, 5 
L__SELEC222:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC223
	BCF         PORTA+0, 4 
	GOTO        L__SELEC224
L__SELEC223:
	BSF         PORTA+0, 4 
L__SELEC224:
;Configuraciones.c,114 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,115 :: 		delay_ms(50);
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
;Configuraciones.c,116 :: 		DER_L();
	CALL        _DER_L+0, 0
;Configuraciones.c,117 :: 		delay_ms(20);
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
;Configuraciones.c,118 :: 		}
L_SELEC22:
L_SELEC21:
L_SELEC17:
L_SELEC10:
;Configuraciones.c,120 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,122 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC25:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC225
	BCF         PORTA+0, 5 
	GOTO        L__SELEC226
L__SELEC225:
	BSF         PORTA+0, 5 
L__SELEC226:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC227
	BCF         PORTA+0, 4 
	GOTO        L__SELEC228
L__SELEC227:
	BSF         PORTA+0, 4 
L__SELEC228:
;Configuraciones.c,123 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,125 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,127 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC26:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC229
	BCF         PORTA+0, 6 
	GOTO        L__SELEC230
L__SELEC229:
	BSF         PORTA+0, 6 
L__SELEC230:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC231
	BCF         PORTA+0, 5 
	GOTO        L__SELEC232
L__SELEC231:
	BSF         PORTA+0, 5 
L__SELEC232:
;Configuraciones.c,128 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,129 :: 		delay_ms(2000);
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
;Configuraciones.c,130 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,131 :: 		delay_ms(500);
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
;Configuraciones.c,136 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,138 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC29:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC233
	BCF         PORTA+0, 7 
	GOTO        L__SELEC234
L__SELEC233:
	BSF         PORTA+0, 7 
L__SELEC234:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC235
	BCF         PORTA+0, 4 
	GOTO        L__SELEC236
L__SELEC235:
	BSF         PORTA+0, 4 
L__SELEC236:
;Configuraciones.c,139 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,140 :: 		delay_ms(300);
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
;Configuraciones.c,141 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,142 :: 		delay_ms(750);
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
;Configuraciones.c,143 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,145 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC32:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC237
	BCF         PORTA+0, 5 
	GOTO        L__SELEC238
L__SELEC237:
	BSF         PORTA+0, 5 
L__SELEC238:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC239
	BCF         PORTA+0, 4 
	GOTO        L__SELEC240
L__SELEC239:
	BSF         PORTA+0, 4 
L__SELEC240:
;Configuraciones.c,146 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,147 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,149 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC33:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC241
	BCF         PORTA+0, 7 
	GOTO        L__SELEC242
L__SELEC241:
	BSF         PORTA+0, 7 
L__SELEC242:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC243
	BCF         PORTA+0, 4 
	GOTO        L__SELEC244
L__SELEC243:
	BSF         PORTA+0, 4 
L__SELEC244:
;Configuraciones.c,150 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,152 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,154 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC34:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC245
	BCF         PORTA+0, 7 
	GOTO        L__SELEC246
L__SELEC245:
	BSF         PORTA+0, 7 
L__SELEC246:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC247
	BCF         PORTA+0, 5 
	GOTO        L__SELEC248
L__SELEC247:
	BSF         PORTA+0, 5 
L__SELEC248:
	BSF         PORTA+0, 4 
;Configuraciones.c,156 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,158 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC35:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC249
	BCF         PORTA+0, 5 
	GOTO        L__SELEC250
L__SELEC249:
	BSF         PORTA+0, 5 
L__SELEC250:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC251
	BCF         PORTA+0, 7 
	GOTO        L__SELEC252
L__SELEC251:
	BSF         PORTA+0, 7 
L__SELEC252:
;Configuraciones.c,160 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,162 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC36:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC253
	BCF         PORTA+0, 6 
	GOTO        L__SELEC254
L__SELEC253:
	BSF         PORTA+0, 6 
L__SELEC254:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC255
	BCF         PORTA+0, 7 
	GOTO        L__SELEC256
L__SELEC255:
	BSF         PORTA+0, 7 
L__SELEC256:
;Configuraciones.c,165 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,167 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC37:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC257
	BCF         PORTA+0, 4 
	GOTO        L__SELEC258
L__SELEC257:
	BSF         PORTA+0, 4 
L__SELEC258:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC259
	BCF         PORTA+0, 5 
	GOTO        L__SELEC260
L__SELEC259:
	BSF         PORTA+0, 5 
L__SELEC260:
;Configuraciones.c,168 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,170 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC38:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC261
	BCF         PORTA+0, 7 
	GOTO        L__SELEC262
L__SELEC261:
	BSF         PORTA+0, 7 
L__SELEC262:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC263
	BCF         PORTA+0, 6 
	GOTO        L__SELEC264
L__SELEC263:
	BSF         PORTA+0, 6 
L__SELEC264:
	BSF         PORTA+0, 5 
;Configuraciones.c,171 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,173 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC39:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC265
	BCF         PORTA+0, 4 
	GOTO        L__SELEC266
L__SELEC265:
	BSF         PORTA+0, 4 
L__SELEC266:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC267
	BCF         PORTA+0, 7 
	GOTO        L__SELEC268
L__SELEC267:
	BSF         PORTA+0, 7 
L__SELEC268:
;Configuraciones.c,174 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,176 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC40:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC269
	BCF         PORTA+0, 5 
	GOTO        L__SELEC270
L__SELEC269:
	BSF         PORTA+0, 5 
L__SELEC270:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC271
	BCF         PORTA+0, 4 
	GOTO        L__SELEC272
L__SELEC271:
	BSF         PORTA+0, 4 
L__SELEC272:
	BSF         PORTA+0, 7 
;Configuraciones.c,177 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,179 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC41:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC273
	BCF         PORTA+0, 5 
	GOTO        L__SELEC274
L__SELEC273:
	BSF         PORTA+0, 5 
L__SELEC274:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC275
	BCF         PORTA+0, 4 
	GOTO        L__SELEC276
L__SELEC275:
	BSF         PORTA+0, 4 
L__SELEC276:
	BSF         PORTA+0, 6 
;Configuraciones.c,180 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,182 :: 		default: L0=L1=L2=L3=0;
L_SELEC42:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC277
	BCF         PORTA+0, 5 
	GOTO        L__SELEC278
L__SELEC277:
	BSF         PORTA+0, 5 
L__SELEC278:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC279
	BCF         PORTA+0, 7 
	GOTO        L__SELEC280
L__SELEC279:
	BSF         PORTA+0, 7 
L__SELEC280:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC281
	BCF         PORTA+0, 6 
	GOTO        L__SELEC282
L__SELEC281:
	BSF         PORTA+0, 6 
L__SELEC282:
;Configuraciones.c,183 :: 		}
	GOTO        L_SELEC4
L_SELEC3:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC283
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC283:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC5
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC284
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC284:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC6
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC285
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC285:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC286
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC286:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC26
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC287
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC287:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC29
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC288
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC288:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC289
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC289:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC290
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC290:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC291
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC291:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC292
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC292:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC293
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC293:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC294
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC294:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC295
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC295:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC296
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC296:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC297
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC297:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC41
	GOTO        L_SELEC42
L_SELEC4:
;Configuraciones.c,186 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,190 :: 		void combate_estado() {
;Configuraciones.c,191 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado43
;Configuraciones.c,192 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,193 :: 		RUT_LINEA();
	CALL        _RUT_LINEA+0, 0
;Configuraciones.c,194 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,195 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,196 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,197 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,198 :: 		}
L_combate_estado43:
;Configuraciones.c,199 :: 		switch (estado_combate) {
	GOTO        L_combate_estado44
;Configuraciones.c,200 :: 		case CMB_ESPERA:
L_combate_estado46:
;Configuraciones.c,201 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado49
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado49
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado49
L__combate_estado187:
;Configuraciones.c,202 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,203 :: 		}
	GOTO        L_combate_estado50
L_combate_estado49:
;Configuraciones.c,204 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado53
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado53
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado53
L__combate_estado186:
;Configuraciones.c,205 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,206 :: 		}
	GOTO        L_combate_estado54
L_combate_estado53:
;Configuraciones.c,207 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado57
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado57
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado57
L__combate_estado185:
;Configuraciones.c,208 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,209 :: 		}
	GOTO        L_combate_estado58
L_combate_estado57:
;Configuraciones.c,210 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado61
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado61
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado61
L__combate_estado184:
;Configuraciones.c,211 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,212 :: 		}
	GOTO        L_combate_estado62
L_combate_estado61:
;Configuraciones.c,213 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado65
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado65
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado65
L__combate_estado183:
;Configuraciones.c,214 :: 		estado_combate = CMB_DER;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,215 :: 		}
	GOTO        L_combate_estado66
L_combate_estado65:
;Configuraciones.c,216 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado69
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado69
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado69
L__combate_estado182:
;Configuraciones.c,217 :: 		estado_combate = CMB_BUSCAR;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,218 :: 		sub_cmb_buscar = SUB_BUSCAR_IZQ;
	CLRF        _sub_cmb_buscar+0 
;Configuraciones.c,219 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,220 :: 		}
	GOTO        L_combate_estado70
L_combate_estado69:
;Configuraciones.c,221 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado73
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado73
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado73
L__combate_estado181:
;Configuraciones.c,222 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,223 :: 		}
	GOTO        L_combate_estado74
L_combate_estado73:
;Configuraciones.c,224 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado77
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado77
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado77
L__combate_estado180:
;Configuraciones.c,225 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,226 :: 		}
	GOTO        L_combate_estado78
L_combate_estado77:
;Configuraciones.c,228 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,229 :: 		}
L_combate_estado78:
L_combate_estado74:
L_combate_estado70:
L_combate_estado66:
L_combate_estado62:
L_combate_estado58:
L_combate_estado54:
L_combate_estado50:
;Configuraciones.c,230 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,232 :: 		case CMB_REC:
L_combate_estado79:
;Configuraciones.c,233 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado299
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado300
L__combate_estado299:
	BSF         PORTA+0, 5 
L__combate_estado300:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado301
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado302
L__combate_estado301:
	BSF         PORTA+0, 7 
L__combate_estado302:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado303
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado304
L__combate_estado303:
	BSF         PORTA+0, 6 
L__combate_estado304:
;Configuraciones.c,234 :: 		REC_M();
	CALL        _REC_M+0, 0
;Configuraciones.c,235 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,237 :: 		case CMB_IZQ:
L_combate_estado80:
;Configuraciones.c,238 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado305
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado306
L__combate_estado305:
	BSF         PORTA+0, 5 
L__combate_estado306:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado307
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado308
L__combate_estado307:
	BSF         PORTA+0, 7 
L__combate_estado308:
;Configuraciones.c,239 :: 		IZQ_M();
	CALL        _IZQ_M+0, 0
;Configuraciones.c,240 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,242 :: 		case CMB_HIT:
L_combate_estado81:
;Configuraciones.c,243 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado309
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado310
L__combate_estado309:
	BSF         PORTA+0, 5 
L__combate_estado310:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado311
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado312
L__combate_estado311:
	BSF         PORTA+0, 6 
L__combate_estado312:
;Configuraciones.c,244 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,245 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,247 :: 		case CMB_IZQ_GOLPE:
L_combate_estado82:
;Configuraciones.c,248 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado313
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado314
L__combate_estado313:
	BSF         PORTA+0, 6 
L__combate_estado314:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado315
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado316
L__combate_estado315:
	BSF         PORTA+0, 5 
L__combate_estado316:
;Configuraciones.c,249 :: 		IZQ_GIRO();
	CALL        _IZQ_GIRO+0, 0
;Configuraciones.c,250 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,252 :: 		case CMB_DER:
L_combate_estado83:
;Configuraciones.c,253 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado317
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado318
L__combate_estado317:
	BSF         PORTA+0, 7 
L__combate_estado318:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado319
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado320
L__combate_estado319:
	BSF         PORTA+0, 6 
L__combate_estado320:
;Configuraciones.c,254 :: 		DER_M();
	CALL        _DER_M+0, 0
;Configuraciones.c,255 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,257 :: 		case CMB_BUSCAR:
L_combate_estado84:
;Configuraciones.c,258 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado321
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado322
L__combate_estado321:
	BSF         PORTA+0, 6 
L__combate_estado322:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado323
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado324
L__combate_estado323:
	BSF         PORTA+0, 7 
L__combate_estado324:
;Configuraciones.c,259 :: 		BUSCAR();
	CALL        _BUSCAR+0, 0
;Configuraciones.c,260 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,262 :: 		case CMB_DER_HIT:
L_combate_estado85:
;Configuraciones.c,263 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado325
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado326
L__combate_estado325:
	BSF         PORTA+0, 7 
L__combate_estado326:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado327
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado328
L__combate_estado327:
	BSF         PORTA+0, 6 
L__combate_estado328:
;Configuraciones.c,264 :: 		DER_GIRO();
	CALL        _DER_GIRO+0, 0
;Configuraciones.c,265 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,267 :: 		case CMB_HIT_FULL:
L_combate_estado86:
;Configuraciones.c,268 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado329
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado330
L__combate_estado329:
	BSF         PORTA+0, 7 
L__combate_estado330:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado331
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado332
L__combate_estado331:
	BSF         PORTA+0, 6 
L__combate_estado332:
	BSF         PORTA+0, 4 
;Configuraciones.c,269 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,270 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,272 :: 		default:
L_combate_estado87:
;Configuraciones.c,273 :: 		LIBRE(); // Detén motores, ponlo en modo seguro
	CALL        _LIBRE+0, 0
;Configuraciones.c,274 :: 		estado_combate = CMB_ESPERA; // Vuelve a esperar nueva condición
	CLRF        _estado_combate+0 
;Configuraciones.c,275 :: 		estado_movimiento = MOV_IDLE; // Resetea movimiento si lo usas
	CLRF        _estado_movimiento+0 
;Configuraciones.c,276 :: 		break;
	GOTO        L_combate_estado45
;Configuraciones.c,277 :: 		}
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
;Configuraciones.c,278 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,280 :: 		void Start(){
;Configuraciones.c,281 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,282 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,283 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,284 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,285 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,286 :: 		return;
;Configuraciones.c,287 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,288 :: 		void Stop(){
;Configuraciones.c,289 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,290 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,291 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,292 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,293 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,294 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,301 :: 		void REC(){
;Configuraciones.c,303 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,305 :: 		PWM1_Set_Duty(200); // IN1 = PWM
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,306 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,309 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,310 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,311 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,312 :: 		void DER(){
;Configuraciones.c,313 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,314 :: 		PWM1_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,315 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,317 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,318 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,320 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_DER_Z:

;Configuraciones.c,321 :: 		void DER_Z(){
;Configuraciones.c,322 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,323 :: 		PWM1_Set_Duty(230);
	MOVLW       230
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,324 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,326 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,327 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,330 :: 		}
L_end_DER_Z:
	RETURN      0
; end of _DER_Z

_IZQ:

;Configuraciones.c,333 :: 		void IZQ(){
;Configuraciones.c,334 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,335 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,336 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,338 :: 		PWM3_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,339 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,340 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_IZQ_L:

;Configuraciones.c,342 :: 		void IZQ_L(){
;Configuraciones.c,343 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,344 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,345 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,347 :: 		PWM3_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,348 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,350 :: 		}
L_end_IZQ_L:
	RETURN      0
; end of _IZQ_L

_DER_L:

;Configuraciones.c,351 :: 		void DER_L(){
;Configuraciones.c,352 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,353 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,354 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,356 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,357 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,361 :: 		}
L_end_DER_L:
	RETURN      0
; end of _DER_L

_REV:

;Configuraciones.c,363 :: 		void REV(){
;Configuraciones.c,364 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,365 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,366 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,367 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,368 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,370 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,372 :: 		void LIBRE(){
;Configuraciones.c,374 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,375 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,376 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,377 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,378 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,382 :: 		void GIRO180(){
;Configuraciones.c,383 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,384 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,385 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,386 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,387 :: 		PWM4_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,389 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,391 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,392 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,393 :: 		delay_ms(250);
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
;Configuraciones.c,394 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,396 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,398 :: 		void BRAKE(){
;Configuraciones.c,400 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,401 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,402 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,403 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,404 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,407 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,408 :: 		void HARD(){
;Configuraciones.c,409 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,410 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,411 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,412 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,415 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,416 :: 		void PUSH(){
;Configuraciones.c,417 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,419 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,420 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,423 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,424 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,426 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,427 :: 		void HIT(){
;Configuraciones.c,429 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,430 :: 		delay_ms(20);
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
;Configuraciones.c,431 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,432 :: 		delay_ms(250);
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
;Configuraciones.c,433 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_HIT_NO_BLOQUEANTE:

;Configuraciones.c,434 :: 		void HIT_NO_BLOQUEANTE(){
;Configuraciones.c,435 :: 		unsigned long now = millis(); // Usa tu función de tiempo
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+0 
	MOVF        R1, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+1 
	MOVF        R2, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+2 
	MOVF        R3, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+3 
;Configuraciones.c,437 :: 		switch (estado_movimiento) {
	GOTO        L_HIT_NO_BLOQUEANTE91
;Configuraciones.c,438 :: 		case MOV_IDLE:
L_HIT_NO_BLOQUEANTE93:
;Configuraciones.c,439 :: 		PUSH(); // Avanza rápido
	CALL        _PUSH+0, 0
;Configuraciones.c,440 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,441 :: 		estado_movimiento = MOV_HIT_REC;
	MOVLW       1
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,442 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE92
;Configuraciones.c,444 :: 		case MOV_HIT_REC:
L_HIT_NO_BLOQUEANTE94:
;Configuraciones.c,446 :: 		if (now - tiempo_movimiento >= 20) {
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
	GOTO        L__HIT_NO_BLOQUEANTE350
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE350
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE350
	MOVLW       20
	SUBWF       R1, 0 
L__HIT_NO_BLOQUEANTE350:
	BTFSS       STATUS+0, 0 
	GOTO        L_HIT_NO_BLOQUEANTE95
;Configuraciones.c,447 :: 		PUSH(); // Empuje fuerte
	CALL        _PUSH+0, 0
;Configuraciones.c,448 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,449 :: 		estado_movimiento = MOV_HIT_PUSH;
	MOVLW       2
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,450 :: 		}
L_HIT_NO_BLOQUEANTE95:
;Configuraciones.c,451 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE92
;Configuraciones.c,453 :: 		case MOV_HIT_PUSH:
L_HIT_NO_BLOQUEANTE96:
;Configuraciones.c,455 :: 		if (S2 == 0) {
	BTFSC       PORTC+0, 6 
	GOTO        L_HIT_NO_BLOQUEANTE97
;Configuraciones.c,457 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,458 :: 		tiempo_movimiento = now; // Actualiza tiempo si quieres tiempo máximo de empuje
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,459 :: 		} else {
	GOTO        L_HIT_NO_BLOQUEANTE98
L_HIT_NO_BLOQUEANTE97:
;Configuraciones.c,461 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,462 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,463 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,464 :: 		}
L_HIT_NO_BLOQUEANTE98:
;Configuraciones.c,471 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE92
;Configuraciones.c,472 :: 		}
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
;Configuraciones.c,473 :: 		}
L_end_HIT_NO_BLOQUEANTE:
	RETURN      0
; end of _HIT_NO_BLOQUEANTE

_IZQ_M:

;Configuraciones.c,474 :: 		void IZQ_M(){
;Configuraciones.c,475 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_M_now_L0+3 
;Configuraciones.c,476 :: 		switch (sub_cmb_izq) {
	GOTO        L_IZQ_M99
;Configuraciones.c,478 :: 		case SUB_IZQ_INICIO:
L_IZQ_M101:
;Configuraciones.c,479 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,480 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,481 :: 		sub_cmb_izq = SUB_IZQ_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,482 :: 		break;
	GOTO        L_IZQ_M100
;Configuraciones.c,484 :: 		case SUB_IZQ_GIRO:
L_IZQ_M102:
;Configuraciones.c,485 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M352
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M352
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M352
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M352:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M103
;Configuraciones.c,486 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,487 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,488 :: 		sub_cmb_izq = SUB_IZQ_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,489 :: 		} else {
	GOTO        L_IZQ_M104
L_IZQ_M103:
;Configuraciones.c,490 :: 		IZQ(); // si necesitas mantener comando
	CALL        _IZQ+0, 0
;Configuraciones.c,491 :: 		}
L_IZQ_M104:
;Configuraciones.c,492 :: 		break;
	GOTO        L_IZQ_M100
;Configuraciones.c,494 :: 		case SUB_IZQ_HARD:
L_IZQ_M105:
;Configuraciones.c,495 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M353
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M353
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M353
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M353:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M106
;Configuraciones.c,496 :: 		sub_cmb_izq = SUB_IZQ_INICIO;
	CLRF        _sub_cmb_izq+0 
;Configuraciones.c,497 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,498 :: 		} else {
	GOTO        L_IZQ_M107
L_IZQ_M106:
;Configuraciones.c,499 :: 		HARD(); // si necesitas mantener comando
	CALL        _HARD+0, 0
;Configuraciones.c,500 :: 		}
L_IZQ_M107:
;Configuraciones.c,501 :: 		break;
	GOTO        L_IZQ_M100
;Configuraciones.c,502 :: 		}
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
;Configuraciones.c,503 :: 		}
L_end_IZQ_M:
	RETURN      0
; end of _IZQ_M

_DER_M:

;Configuraciones.c,504 :: 		void DER_M() {
;Configuraciones.c,505 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_M_now_L0+3 
;Configuraciones.c,507 :: 		switch (sub_cmb_der) {
	GOTO        L_DER_M108
;Configuraciones.c,508 :: 		case SUB_DER_INICIO:
L_DER_M110:
;Configuraciones.c,509 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,510 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,511 :: 		sub_cmb_der = SUB_DER_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,512 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,514 :: 		case SUB_DER_GIRO:
L_DER_M111:
;Configuraciones.c,516 :: 		if (S6 ==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M112
;Configuraciones.c,517 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,518 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,519 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,520 :: 		}
L_DER_M112:
;Configuraciones.c,521 :: 		if (now - t_cmb_der >= 100) {
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
	GOTO        L__DER_M355
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M355
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M355
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M355:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M113
;Configuraciones.c,522 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,523 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,524 :: 		sub_cmb_der = SUB_DER_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,525 :: 		} else {
	GOTO        L_DER_M114
L_DER_M113:
;Configuraciones.c,526 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,527 :: 		}
L_DER_M114:
;Configuraciones.c,528 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,530 :: 		case SUB_DER_HARD:
L_DER_M115:
;Configuraciones.c,532 :: 		if (S6==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M116
;Configuraciones.c,533 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,534 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,535 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,536 :: 		}
L_DER_M116:
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
	GOTO        L__DER_M356
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M356
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M356
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M356:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M117
;Configuraciones.c,538 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,539 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,540 :: 		} else {
	GOTO        L_DER_M118
L_DER_M117:
;Configuraciones.c,541 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,542 :: 		}
L_DER_M118:
;Configuraciones.c,543 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,544 :: 		}
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
;Configuraciones.c,545 :: 		}
L_end_DER_M:
	RETURN      0
; end of _DER_M

_REC_M:

;Configuraciones.c,546 :: 		void REC_M() {
;Configuraciones.c,547 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       REC_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       REC_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       REC_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       REC_M_now_L0+3 
;Configuraciones.c,548 :: 		switch (sub_cmb_rec) {
	GOTO        L_REC_M119
;Configuraciones.c,549 :: 		case SUB_REC_INICIO:
L_REC_M121:
;Configuraciones.c,550 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,551 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,552 :: 		sub_cmb_rec = SUB_REC_REC;
	MOVLW       1
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,553 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,555 :: 		case SUB_REC_REC:
L_REC_M122:
;Configuraciones.c,556 :: 		if (now - t_cmb_rec >= 50) { // Espera 250 ms
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
	GOTO        L__REC_M358
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M358
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M358
	MOVLW       50
	SUBWF       R1, 0 
L__REC_M358:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M123
;Configuraciones.c,557 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,558 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,559 :: 		sub_cmb_rec = SUB_REC_LIBRE;
	MOVLW       2
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,560 :: 		}
L_REC_M123:
;Configuraciones.c,561 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,563 :: 		case SUB_REC_LIBRE:
L_REC_M124:
;Configuraciones.c,564 :: 		if (now - t_cmb_rec >= 100) { // Espera 200 ms
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
	GOTO        L__REC_M359
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M359
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M359
	MOVLW       100
	SUBWF       R1, 0 
L__REC_M359:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M125
;Configuraciones.c,565 :: 		sub_cmb_rec = SUB_REC_FIN;
	MOVLW       3
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,566 :: 		}
L_REC_M125:
;Configuraciones.c,567 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,569 :: 		case SUB_REC_FIN:
L_REC_M126:
;Configuraciones.c,570 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,571 :: 		sub_cmb_rec = SUB_REC_INICIO; // Reinicia para próxima vez
	CLRF        _sub_cmb_rec+0 
;Configuraciones.c,572 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,573 :: 		}
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
;Configuraciones.c,574 :: 		}
L_end_REC_M:
	RETURN      0
; end of _REC_M

_IZQ_GIRO:

;Configuraciones.c,575 :: 		void IZQ_GIRO(){
;Configuraciones.c,576 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_GIRO_now_L0+3 
;Configuraciones.c,577 :: 		switch (sub_cmb_izq_giro) {
	GOTO        L_IZQ_GIRO127
;Configuraciones.c,578 :: 		case SUB_IZQ_GIRO:
L_IZQ_GIRO129:
;Configuraciones.c,580 :: 		IZQ(); // función de giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,581 :: 		t_cmb_izq_giro = now;
	MOVF        IZQ_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_izq_giro+0 
	MOVF        IZQ_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_izq_giro+1 
	MOVF        IZQ_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_izq_giro+2 
	MOVF        IZQ_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_izq_giro+3 
;Configuraciones.c,582 :: 		sub_cmb_izq_giro = SUB_IZQ_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,583 :: 		break;
	GOTO        L_IZQ_GIRO128
;Configuraciones.c,585 :: 		case SUB_IZQ_BUSCAR_CENTRO:
L_IZQ_GIRO130:
;Configuraciones.c,587 :: 		if (SL1 == 0 && S2 == 1 && S6 == 0) {
	BTFSC       PORTC+0, 0 
	GOTO        L_IZQ_GIRO133
	BTFSS       PORTC+0, 6 
	GOTO        L_IZQ_GIRO133
	BTFSC       PORTB+0, 4 
	GOTO        L_IZQ_GIRO133
L__IZQ_GIRO188:
;Configuraciones.c,588 :: 		sub_cmb_izq_giro = SUB_IZQ_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,589 :: 		}
L_IZQ_GIRO133:
;Configuraciones.c,590 :: 		break;
	GOTO        L_IZQ_GIRO128
;Configuraciones.c,592 :: 		case SUB_IZQ_ATAQUE:
L_IZQ_GIRO134:
;Configuraciones.c,594 :: 		HIT_NO_BLOQUEANTE(); // función de ataque
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,595 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,596 :: 		sub_cmb_izq_giro = SUB_IZQ_GIRO; // Reinicia para próxima vez
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,597 :: 		break;
	GOTO        L_IZQ_GIRO128
;Configuraciones.c,598 :: 		}
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
;Configuraciones.c,599 :: 		}
L_end_IZQ_GIRO:
	RETURN      0
; end of _IZQ_GIRO

_DER_GIRO:

;Configuraciones.c,600 :: 		void DER_GIRO(){
;Configuraciones.c,601 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_GIRO_now_L0+3 
;Configuraciones.c,602 :: 		switch(sub_cmb_der_giro){
	GOTO        L_DER_GIRO135
;Configuraciones.c,603 :: 		case SUB_DER_GIRO_INICIO:
L_DER_GIRO137:
;Configuraciones.c,604 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,605 :: 		t_cmb_der_giro = now;
	MOVF        DER_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_der_giro+0 
	MOVF        DER_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_der_giro+1 
	MOVF        DER_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_der_giro+2 
	MOVF        DER_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_der_giro+3 
;Configuraciones.c,606 :: 		sub_cmb_der_giro = SUB_DER_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,607 :: 		break;
	GOTO        L_DER_GIRO136
;Configuraciones.c,609 :: 		case SUB_DER_BUSCAR_CENTRO:
L_DER_GIRO138:
;Configuraciones.c,610 :: 		if(SL1 ==0 && S2 ==1 && S6==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_DER_GIRO141
	BTFSS       PORTC+0, 6 
	GOTO        L_DER_GIRO141
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_GIRO141
L__DER_GIRO189:
;Configuraciones.c,611 :: 		sub_cmb_der_giro = SUB_DER_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,612 :: 		}
L_DER_GIRO141:
;Configuraciones.c,613 :: 		break;
	GOTO        L_DER_GIRO136
;Configuraciones.c,615 :: 		case SUB_DER_ATAQUE:
L_DER_GIRO142:
;Configuraciones.c,616 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,617 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,618 :: 		sub_cmb_der_giro = SUB_DER_GIRO_INICIO;
	CLRF        _sub_cmb_der_giro+0 
;Configuraciones.c,619 :: 		break;
	GOTO        L_DER_GIRO136
;Configuraciones.c,620 :: 		}
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
;Configuraciones.c,622 :: 		}
L_end_DER_GIRO:
	RETURN      0
; end of _DER_GIRO

_BUSCAR:

;Configuraciones.c,623 :: 		void BUSCAR(){
;Configuraciones.c,624 :: 		switch (sub_cmb_buscar) {
	GOTO        L_BUSCAR143
;Configuraciones.c,625 :: 		case SUB_BUSCAR_IZQ:
L_BUSCAR145:
;Configuraciones.c,626 :: 		IZQ(); // Ejecuta giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,627 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR146
;Configuraciones.c,628 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,629 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
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
	GOTO        L__BUSCAR363
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR363
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR363
	MOVF        R4, 0 
	SUBLW       200
L__BUSCAR363:
	BTFSC       STATUS+0, 0 
	GOTO        L_BUSCAR148
;Configuraciones.c,630 :: 		sub_cmb_buscar = SUB_BUSCAR_DER;
	MOVLW       1
	MOVWF       _sub_cmb_buscar+0 
;Configuraciones.c,631 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,632 :: 		}
L_BUSCAR148:
L_BUSCAR147:
;Configuraciones.c,633 :: 		break;
	GOTO        L_BUSCAR144
;Configuraciones.c,634 :: 		case SUB_BUSCAR_DER:
L_BUSCAR149:
;Configuraciones.c,635 :: 		DER(); // Ejecuta giro derecha
	CALL        _DER+0, 0
;Configuraciones.c,636 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR150
;Configuraciones.c,637 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,638 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
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
	GOTO        L__BUSCAR364
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR364
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR364
	MOVF        R4, 0 
	SUBLW       200
L__BUSCAR364:
	BTFSC       STATUS+0, 0 
	GOTO        L_BUSCAR152
;Configuraciones.c,639 :: 		estado_combate = CMB_ESPERA; // O vuelve a búsqueda, como prefieras
	CLRF        _estado_combate+0 
;Configuraciones.c,640 :: 		}
L_BUSCAR152:
L_BUSCAR151:
;Configuraciones.c,641 :: 		break;
	GOTO        L_BUSCAR144
;Configuraciones.c,642 :: 		}
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
;Configuraciones.c,643 :: 		}
L_end_BUSCAR:
	RETURN      0
; end of _BUSCAR

_RUT_LINEA:

;Configuraciones.c,644 :: 		void RUT_LINEA(){
;Configuraciones.c,645 :: 		if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_RUT_LINEA155
	BTFSC       PORTB+0, 1 
	GOTO        L_RUT_LINEA155
L__RUT_LINEA190:
;Configuraciones.c,646 :: 		L0 = L3 = 1; L2 = L1 = 0;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__RUT_LINEA366
	BCF         PORTA+0, 6 
	GOTO        L__RUT_LINEA367
L__RUT_LINEA366:
	BSF         PORTA+0, 6 
L__RUT_LINEA367:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__RUT_LINEA368
	BCF         PORTA+0, 5 
	GOTO        L__RUT_LINEA369
L__RUT_LINEA368:
	BSF         PORTA+0, 5 
L__RUT_LINEA369:
;Configuraciones.c,647 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,648 :: 		t_cmb_linea = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,649 :: 		sub_cmb_linea = LINEA_HARD_180;
	MOVLW       1
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,650 :: 		}
	GOTO        L_RUT_LINEA156
L_RUT_LINEA155:
;Configuraciones.c,651 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_RUT_LINEA157
;Configuraciones.c,652 :: 		L2 = 0; L0 = L3 = L1 = 1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__RUT_LINEA370
	BCF         PORTA+0, 4 
	GOTO        L__RUT_LINEA371
L__RUT_LINEA370:
	BSF         PORTA+0, 4 
L__RUT_LINEA371:
	BTFSC       PORTA+0, 4 
	GOTO        L__RUT_LINEA372
	BCF         PORTA+0, 6 
	GOTO        L__RUT_LINEA373
L__RUT_LINEA372:
	BSF         PORTA+0, 6 
L__RUT_LINEA373:
;Configuraciones.c,653 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,654 :: 		t_cmb_linea = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,655 :: 		sub_cmb_linea = LINEA_HARD_IZQ;
	MOVLW       4
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,656 :: 		}
	GOTO        L_RUT_LINEA158
L_RUT_LINEA157:
;Configuraciones.c,657 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_RUT_LINEA159
;Configuraciones.c,658 :: 		L0 = 0; L3 = L2 = L1 = 1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__RUT_LINEA374
	BCF         PORTA+0, 5 
	GOTO        L__RUT_LINEA375
L__RUT_LINEA374:
	BSF         PORTA+0, 5 
L__RUT_LINEA375:
	BTFSC       PORTA+0, 5 
	GOTO        L__RUT_LINEA376
	BCF         PORTA+0, 4 
	GOTO        L__RUT_LINEA377
L__RUT_LINEA376:
	BSF         PORTA+0, 4 
L__RUT_LINEA377:
;Configuraciones.c,659 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,660 :: 		t_cmb_linea = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,661 :: 		sub_cmb_linea = LINEA_HARD_DER;
	MOVLW       6
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,662 :: 		}
L_RUT_LINEA159:
L_RUT_LINEA158:
L_RUT_LINEA156:
;Configuraciones.c,663 :: 		}
L_end_RUT_LINEA:
	RETURN      0
; end of _RUT_LINEA

_LOGICA_LINEA:

;Configuraciones.c,665 :: 		void LOGICA_LINEA() {
;Configuraciones.c,666 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       LOGICA_LINEA_now_L0+0 
	MOVF        R1, 0 
	MOVWF       LOGICA_LINEA_now_L0+1 
	MOVF        R2, 0 
	MOVWF       LOGICA_LINEA_now_L0+2 
	MOVF        R3, 0 
	MOVWF       LOGICA_LINEA_now_L0+3 
;Configuraciones.c,668 :: 		switch (sub_cmb_linea) {
	GOTO        L_LOGICA_LINEA160
;Configuraciones.c,669 :: 		case LINEA_HARD_180:
L_LOGICA_LINEA162:
;Configuraciones.c,670 :: 		if (now - t_cmb_linea >= 100) {
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
	GOTO        L__LOGICA_LINEA379
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA379
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA379
	MOVLW       100
	SUBWF       R1, 0 
L__LOGICA_LINEA379:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA163
;Configuraciones.c,671 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,672 :: 		t_cmb_linea = now;
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,673 :: 		sub_cmb_linea = LINEA_GIRO180;
	MOVLW       2
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,674 :: 		}
L_LOGICA_LINEA163:
;Configuraciones.c,675 :: 		break;
	GOTO        L_LOGICA_LINEA161
;Configuraciones.c,677 :: 		case LINEA_GIRO180:
L_LOGICA_LINEA164:
;Configuraciones.c,678 :: 		if (now - t_cmb_linea >= 300) {
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
	GOTO        L__LOGICA_LINEA380
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA380
	MOVLW       1
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA380
	MOVLW       44
	SUBWF       R1, 0 
L__LOGICA_LINEA380:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA165
;Configuraciones.c,679 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,680 :: 		t_cmb_linea = now;
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,681 :: 		sub_cmb_linea = LINEA_HARD_FINAL_180;
	MOVLW       3
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,682 :: 		}
L_LOGICA_LINEA165:
;Configuraciones.c,683 :: 		break;
	GOTO        L_LOGICA_LINEA161
;Configuraciones.c,685 :: 		case LINEA_HARD_FINAL_180:
L_LOGICA_LINEA166:
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
	GOTO        L__LOGICA_LINEA381
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA381
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA381
	MOVLW       100
	SUBWF       R1, 0 
L__LOGICA_LINEA381:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA167
;Configuraciones.c,687 :: 		sub_cmb_linea = LINEA_WAIT; // Estado listo/inactivo
	MOVLW       8
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,688 :: 		}
L_LOGICA_LINEA167:
;Configuraciones.c,689 :: 		break;
	GOTO        L_LOGICA_LINEA161
;Configuraciones.c,691 :: 		case LINEA_HARD_IZQ:
L_LOGICA_LINEA168:
;Configuraciones.c,692 :: 		if (now - t_cmb_linea >= 100) {
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
	GOTO        L__LOGICA_LINEA382
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA382
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA382
	MOVLW       100
	SUBWF       R1, 0 
L__LOGICA_LINEA382:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA169
;Configuraciones.c,693 :: 		IZQ_L();
	CALL        _IZQ_L+0, 0
;Configuraciones.c,694 :: 		t_cmb_linea = now;
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,695 :: 		sub_cmb_linea = LINEA_IZQ_L;
	MOVLW       5
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,696 :: 		}
L_LOGICA_LINEA169:
;Configuraciones.c,697 :: 		break;
	GOTO        L_LOGICA_LINEA161
;Configuraciones.c,699 :: 		case LINEA_IZQ_L:
L_LOGICA_LINEA170:
;Configuraciones.c,700 :: 		if (now - t_cmb_linea >= 100) {
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
	GOTO        L__LOGICA_LINEA383
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA383
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA383
	MOVLW       100
	SUBWF       R1, 0 
L__LOGICA_LINEA383:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA171
;Configuraciones.c,701 :: 		sub_cmb_linea = LINEA_WAIT; // Estado listo/inactivo
	MOVLW       8
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,702 :: 		}
L_LOGICA_LINEA171:
;Configuraciones.c,703 :: 		break;
	GOTO        L_LOGICA_LINEA161
;Configuraciones.c,705 :: 		case LINEA_HARD_DER:
L_LOGICA_LINEA172:
;Configuraciones.c,706 :: 		if (now - t_cmb_linea >= 50) {
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
	GOTO        L__LOGICA_LINEA384
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA384
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA384
	MOVLW       50
	SUBWF       R1, 0 
L__LOGICA_LINEA384:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA173
;Configuraciones.c,707 :: 		DER_L();
	CALL        _DER_L+0, 0
;Configuraciones.c,708 :: 		t_cmb_linea = now;
	MOVF        LOGICA_LINEA_now_L0+0, 0 
	MOVWF       _t_cmb_linea+0 
	MOVF        LOGICA_LINEA_now_L0+1, 0 
	MOVWF       _t_cmb_linea+1 
	MOVF        LOGICA_LINEA_now_L0+2, 0 
	MOVWF       _t_cmb_linea+2 
	MOVF        LOGICA_LINEA_now_L0+3, 0 
	MOVWF       _t_cmb_linea+3 
;Configuraciones.c,709 :: 		sub_cmb_linea = LINEA_DER_L;
	MOVLW       7
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,710 :: 		}
L_LOGICA_LINEA173:
;Configuraciones.c,711 :: 		break;
	GOTO        L_LOGICA_LINEA161
;Configuraciones.c,713 :: 		case LINEA_DER_L:
L_LOGICA_LINEA174:
;Configuraciones.c,714 :: 		if (now - t_cmb_linea >= 20) {
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
	GOTO        L__LOGICA_LINEA385
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA385
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LOGICA_LINEA385
	MOVLW       20
	SUBWF       R1, 0 
L__LOGICA_LINEA385:
	BTFSS       STATUS+0, 0 
	GOTO        L_LOGICA_LINEA175
;Configuraciones.c,715 :: 		sub_cmb_linea = LINEA_WAIT; // Estado listo/inactivo
	MOVLW       8
	MOVWF       _sub_cmb_linea+0 
;Configuraciones.c,716 :: 		}
L_LOGICA_LINEA175:
;Configuraciones.c,717 :: 		break;
	GOTO        L_LOGICA_LINEA161
;Configuraciones.c,719 :: 		case LINEA_WAIT:
L_LOGICA_LINEA176:
;Configuraciones.c,720 :: 		default:
L_LOGICA_LINEA177:
;Configuraciones.c,722 :: 		break;
	GOTO        L_LOGICA_LINEA161
;Configuraciones.c,723 :: 		}
L_LOGICA_LINEA160:
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA162
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA164
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA166
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA168
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA170
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA172
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA174
	MOVF        _sub_cmb_linea+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_LOGICA_LINEA176
	GOTO        L_LOGICA_LINEA177
L_LOGICA_LINEA161:
;Configuraciones.c,724 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
