
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
L__INTERRUPT185:
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
L__SELEC187:
	BZ          L__SELEC188
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC187
L__SELEC188:
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
	GOTO        L__SELEC189
	BCF         PORTA+0, 5 
	GOTO        L__SELEC190
L__SELEC189:
	BSF         PORTA+0, 5 
L__SELEC190:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC191
	BCF         PORTA+0, 7 
	GOTO        L__SELEC192
L__SELEC191:
	BSF         PORTA+0, 7 
L__SELEC192:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC193
	BCF         PORTA+0, 6 
	GOTO        L__SELEC194
L__SELEC193:
	BSF         PORTA+0, 6 
L__SELEC194:
;Configuraciones.c,77 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,79 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC6:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC195
	BCF         PORTA+0, 5 
	GOTO        L__SELEC196
L__SELEC195:
	BSF         PORTA+0, 5 
L__SELEC196:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC197
	BCF         PORTA+0, 4 
	GOTO        L__SELEC198
L__SELEC197:
	BSF         PORTA+0, 4 
L__SELEC198:
;Configuraciones.c,80 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC9
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC9
L__SELEC170:
;Configuraciones.c,81 :: 		L0=L3=L2=L1=1;
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC199
	BCF         PORTA+0, 5 
	GOTO        L__SELEC200
L__SELEC199:
	BSF         PORTA+0, 5 
L__SELEC200:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC201
	BCF         PORTA+0, 4 
	GOTO        L__SELEC202
L__SELEC201:
	BSF         PORTA+0, 4 
L__SELEC202:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC203
	BCF         PORTA+0, 6 
	GOTO        L__SELEC204
L__SELEC203:
	BSF         PORTA+0, 6 
L__SELEC204:
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
L__SELEC169:
;Configuraciones.c,86 :: 		L0=L3=1; L2=L1=0;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC205
	BCF         PORTA+0, 6 
	GOTO        L__SELEC206
L__SELEC205:
	BSF         PORTA+0, 6 
L__SELEC206:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC207
	BCF         PORTA+0, 5 
	GOTO        L__SELEC208
L__SELEC207:
	BSF         PORTA+0, 5 
L__SELEC208:
;Configuraciones.c,87 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,88 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC14:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC14
	DECFSZ      R12, 1, 1
	BRA         L_SELEC14
	DECFSZ      R11, 1, 1
	BRA         L_SELEC14
	NOP
	NOP
;Configuraciones.c,89 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,90 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC15:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC15
	DECFSZ      R12, 1, 1
	BRA         L_SELEC15
	DECFSZ      R11, 1, 1
	BRA         L_SELEC15
	NOP
;Configuraciones.c,93 :: 		}
	GOTO        L_SELEC16
L_SELEC13:
;Configuraciones.c,94 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC17
;Configuraciones.c,95 :: 		L2=0; L0=L3=L1=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
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
;Configuraciones.c,96 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,97 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC18:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC18
	DECFSZ      R12, 1, 1
	BRA         L_SELEC18
	DECFSZ      R11, 1, 1
	BRA         L_SELEC18
	NOP
;Configuraciones.c,98 :: 		IZQ_L();
	CALL        _IZQ_L+0, 0
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
;Configuraciones.c,103 :: 		}
	GOTO        L_SELEC20
L_SELEC17:
;Configuraciones.c,104 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC21
;Configuraciones.c,105 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC213
	BCF         PORTA+0, 5 
	GOTO        L__SELEC214
L__SELEC213:
	BSF         PORTA+0, 5 
L__SELEC214:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC215
	BCF         PORTA+0, 4 
	GOTO        L__SELEC216
L__SELEC215:
	BSF         PORTA+0, 4 
L__SELEC216:
;Configuraciones.c,106 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,107 :: 		delay_ms(100);
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
;Configuraciones.c,108 :: 		DER_L();
	CALL        _DER_L+0, 0
;Configuraciones.c,109 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC23:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC23
	DECFSZ      R12, 1, 1
	BRA         L_SELEC23
	DECFSZ      R11, 1, 1
	BRA         L_SELEC23
	NOP
;Configuraciones.c,111 :: 		}
L_SELEC21:
L_SELEC20:
L_SELEC16:
L_SELEC10:
;Configuraciones.c,113 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,115 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC24:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC217
	BCF         PORTA+0, 5 
	GOTO        L__SELEC218
L__SELEC217:
	BSF         PORTA+0, 5 
L__SELEC218:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC219
	BCF         PORTA+0, 4 
	GOTO        L__SELEC220
L__SELEC219:
	BSF         PORTA+0, 4 
L__SELEC220:
;Configuraciones.c,116 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,118 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,120 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC25:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC221
	BCF         PORTA+0, 6 
	GOTO        L__SELEC222
L__SELEC221:
	BSF         PORTA+0, 6 
L__SELEC222:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC223
	BCF         PORTA+0, 5 
	GOTO        L__SELEC224
L__SELEC223:
	BSF         PORTA+0, 5 
L__SELEC224:
;Configuraciones.c,121 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,122 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_SELEC26:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC26
	DECFSZ      R12, 1, 1
	BRA         L_SELEC26
	DECFSZ      R11, 1, 1
	BRA         L_SELEC26
	NOP
;Configuraciones.c,123 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,124 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_SELEC27:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC27
	DECFSZ      R12, 1, 1
	BRA         L_SELEC27
	DECFSZ      R11, 1, 1
	BRA         L_SELEC27
	NOP
	NOP
;Configuraciones.c,129 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,131 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC28:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC225
	BCF         PORTA+0, 7 
	GOTO        L__SELEC226
L__SELEC225:
	BSF         PORTA+0, 7 
L__SELEC226:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC227
	BCF         PORTA+0, 4 
	GOTO        L__SELEC228
L__SELEC227:
	BSF         PORTA+0, 4 
L__SELEC228:
;Configuraciones.c,132 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,133 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC29:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC29
	DECFSZ      R12, 1, 1
	BRA         L_SELEC29
	DECFSZ      R11, 1, 1
	BRA         L_SELEC29
	NOP
	NOP
;Configuraciones.c,134 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,135 :: 		delay_ms(750);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
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
;Configuraciones.c,136 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,138 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC31:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC229
	BCF         PORTA+0, 5 
	GOTO        L__SELEC230
L__SELEC229:
	BSF         PORTA+0, 5 
L__SELEC230:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC231
	BCF         PORTA+0, 4 
	GOTO        L__SELEC232
L__SELEC231:
	BSF         PORTA+0, 4 
L__SELEC232:
;Configuraciones.c,139 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,140 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,142 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC32:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC233
	BCF         PORTA+0, 7 
	GOTO        L__SELEC234
L__SELEC233:
	BSF         PORTA+0, 7 
L__SELEC234:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC235
	BCF         PORTA+0, 4 
	GOTO        L__SELEC236
L__SELEC235:
	BSF         PORTA+0, 4 
L__SELEC236:
;Configuraciones.c,143 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,145 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,147 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC33:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC237
	BCF         PORTA+0, 7 
	GOTO        L__SELEC238
L__SELEC237:
	BSF         PORTA+0, 7 
L__SELEC238:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC239
	BCF         PORTA+0, 5 
	GOTO        L__SELEC240
L__SELEC239:
	BSF         PORTA+0, 5 
L__SELEC240:
	BSF         PORTA+0, 4 
;Configuraciones.c,149 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,151 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC34:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC241
	BCF         PORTA+0, 5 
	GOTO        L__SELEC242
L__SELEC241:
	BSF         PORTA+0, 5 
L__SELEC242:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC243
	BCF         PORTA+0, 7 
	GOTO        L__SELEC244
L__SELEC243:
	BSF         PORTA+0, 7 
L__SELEC244:
;Configuraciones.c,153 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,155 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC35:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC245
	BCF         PORTA+0, 6 
	GOTO        L__SELEC246
L__SELEC245:
	BSF         PORTA+0, 6 
L__SELEC246:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC247
	BCF         PORTA+0, 7 
	GOTO        L__SELEC248
L__SELEC247:
	BSF         PORTA+0, 7 
L__SELEC248:
;Configuraciones.c,158 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,160 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC36:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC249
	BCF         PORTA+0, 4 
	GOTO        L__SELEC250
L__SELEC249:
	BSF         PORTA+0, 4 
L__SELEC250:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC251
	BCF         PORTA+0, 5 
	GOTO        L__SELEC252
L__SELEC251:
	BSF         PORTA+0, 5 
L__SELEC252:
;Configuraciones.c,161 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,163 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC37:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC253
	BCF         PORTA+0, 7 
	GOTO        L__SELEC254
L__SELEC253:
	BSF         PORTA+0, 7 
L__SELEC254:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC255
	BCF         PORTA+0, 6 
	GOTO        L__SELEC256
L__SELEC255:
	BSF         PORTA+0, 6 
L__SELEC256:
	BSF         PORTA+0, 5 
;Configuraciones.c,164 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,166 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC38:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC257
	BCF         PORTA+0, 4 
	GOTO        L__SELEC258
L__SELEC257:
	BSF         PORTA+0, 4 
L__SELEC258:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC259
	BCF         PORTA+0, 7 
	GOTO        L__SELEC260
L__SELEC259:
	BSF         PORTA+0, 7 
L__SELEC260:
;Configuraciones.c,167 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,169 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC39:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC261
	BCF         PORTA+0, 5 
	GOTO        L__SELEC262
L__SELEC261:
	BSF         PORTA+0, 5 
L__SELEC262:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC263
	BCF         PORTA+0, 4 
	GOTO        L__SELEC264
L__SELEC263:
	BSF         PORTA+0, 4 
L__SELEC264:
	BSF         PORTA+0, 7 
;Configuraciones.c,170 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,172 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC40:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC265
	BCF         PORTA+0, 5 
	GOTO        L__SELEC266
L__SELEC265:
	BSF         PORTA+0, 5 
L__SELEC266:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC267
	BCF         PORTA+0, 4 
	GOTO        L__SELEC268
L__SELEC267:
	BSF         PORTA+0, 4 
L__SELEC268:
	BSF         PORTA+0, 6 
;Configuraciones.c,173 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,175 :: 		default: L0=L1=L2=L3=0;
L_SELEC41:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC269
	BCF         PORTA+0, 5 
	GOTO        L__SELEC270
L__SELEC269:
	BSF         PORTA+0, 5 
L__SELEC270:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC271
	BCF         PORTA+0, 7 
	GOTO        L__SELEC272
L__SELEC271:
	BSF         PORTA+0, 7 
L__SELEC272:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC273
	BCF         PORTA+0, 6 
	GOTO        L__SELEC274
L__SELEC273:
	BSF         PORTA+0, 6 
L__SELEC274:
;Configuraciones.c,176 :: 		}
	GOTO        L_SELEC4
L_SELEC3:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC275
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC275:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC5
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC276
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC276:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC6
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC277
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC277:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC24
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC278
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC278:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC279
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC279:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC280
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC280:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC281
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC281:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC282
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC282:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC283
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC283:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC284
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC284:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC285
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC285:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC286
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC286:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC287
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC287:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC288
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC288:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC289
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC289:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	GOTO        L_SELEC41
L_SELEC4:
;Configuraciones.c,179 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,183 :: 		void combate_estado() {
;Configuraciones.c,184 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado42
;Configuraciones.c,185 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,186 :: 		LOGICA_LINEA();
	CALL        _LOGICA_LINEA+0, 0
;Configuraciones.c,187 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,188 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,189 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,190 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,191 :: 		}
L_combate_estado42:
;Configuraciones.c,192 :: 		switch (estado_combate) {
	GOTO        L_combate_estado43
;Configuraciones.c,193 :: 		case CMB_ESPERA:
L_combate_estado45:
;Configuraciones.c,194 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado48
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado48
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado48
L__combate_estado178:
;Configuraciones.c,195 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,196 :: 		}
	GOTO        L_combate_estado49
L_combate_estado48:
;Configuraciones.c,197 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado52
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado52
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado52
L__combate_estado177:
;Configuraciones.c,198 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,199 :: 		}
	GOTO        L_combate_estado53
L_combate_estado52:
;Configuraciones.c,200 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado56
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado56
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado56
L__combate_estado176:
;Configuraciones.c,201 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,202 :: 		}
	GOTO        L_combate_estado57
L_combate_estado56:
;Configuraciones.c,203 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado60
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado60
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado60
L__combate_estado175:
;Configuraciones.c,204 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,205 :: 		}
	GOTO        L_combate_estado61
L_combate_estado60:
;Configuraciones.c,206 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado64
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado64
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado64
L__combate_estado174:
;Configuraciones.c,207 :: 		estado_combate = CMB_DER;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,208 :: 		}
	GOTO        L_combate_estado65
L_combate_estado64:
;Configuraciones.c,209 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado68
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado68
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado68
L__combate_estado173:
;Configuraciones.c,210 :: 		estado_combate = CMB_BUSCAR;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,211 :: 		sub_cmb_buscar = SUB_BUSCAR_IZQ;
	CLRF        _sub_cmb_buscar+0 
;Configuraciones.c,212 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,213 :: 		}
	GOTO        L_combate_estado69
L_combate_estado68:
;Configuraciones.c,214 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado72
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado72
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado72
L__combate_estado172:
;Configuraciones.c,215 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,216 :: 		}
	GOTO        L_combate_estado73
L_combate_estado72:
;Configuraciones.c,217 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado76
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado76
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado76
L__combate_estado171:
;Configuraciones.c,218 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,219 :: 		}
	GOTO        L_combate_estado77
L_combate_estado76:
;Configuraciones.c,221 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,222 :: 		}
L_combate_estado77:
L_combate_estado73:
L_combate_estado69:
L_combate_estado65:
L_combate_estado61:
L_combate_estado57:
L_combate_estado53:
L_combate_estado49:
;Configuraciones.c,223 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,225 :: 		case CMB_REC:
L_combate_estado78:
;Configuraciones.c,226 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado291
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado292
L__combate_estado291:
	BSF         PORTA+0, 5 
L__combate_estado292:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado293
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado294
L__combate_estado293:
	BSF         PORTA+0, 7 
L__combate_estado294:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado295
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado296
L__combate_estado295:
	BSF         PORTA+0, 6 
L__combate_estado296:
;Configuraciones.c,227 :: 		REC_M();
	CALL        _REC_M+0, 0
;Configuraciones.c,228 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,230 :: 		case CMB_IZQ:
L_combate_estado79:
;Configuraciones.c,231 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado297
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado298
L__combate_estado297:
	BSF         PORTA+0, 5 
L__combate_estado298:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado299
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado300
L__combate_estado299:
	BSF         PORTA+0, 7 
L__combate_estado300:
;Configuraciones.c,232 :: 		IZQ_M();
	CALL        _IZQ_M+0, 0
;Configuraciones.c,233 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,235 :: 		case CMB_HIT:
L_combate_estado80:
;Configuraciones.c,236 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado301
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado302
L__combate_estado301:
	BSF         PORTA+0, 5 
L__combate_estado302:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado303
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado304
L__combate_estado303:
	BSF         PORTA+0, 6 
L__combate_estado304:
;Configuraciones.c,237 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,238 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,240 :: 		case CMB_IZQ_GOLPE:
L_combate_estado81:
;Configuraciones.c,241 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado305
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado306
L__combate_estado305:
	BSF         PORTA+0, 6 
L__combate_estado306:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado307
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado308
L__combate_estado307:
	BSF         PORTA+0, 5 
L__combate_estado308:
;Configuraciones.c,242 :: 		IZQ_GIRO();
	CALL        _IZQ_GIRO+0, 0
;Configuraciones.c,243 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,245 :: 		case CMB_DER:
L_combate_estado82:
;Configuraciones.c,246 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado309
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado310
L__combate_estado309:
	BSF         PORTA+0, 7 
L__combate_estado310:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado311
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado312
L__combate_estado311:
	BSF         PORTA+0, 6 
L__combate_estado312:
;Configuraciones.c,247 :: 		DER_M();
	CALL        _DER_M+0, 0
;Configuraciones.c,248 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,250 :: 		case CMB_BUSCAR:
L_combate_estado83:
;Configuraciones.c,251 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado313
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado314
L__combate_estado313:
	BSF         PORTA+0, 6 
L__combate_estado314:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado315
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado316
L__combate_estado315:
	BSF         PORTA+0, 7 
L__combate_estado316:
;Configuraciones.c,252 :: 		BUSCAR();
	CALL        _BUSCAR+0, 0
;Configuraciones.c,253 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,255 :: 		case CMB_DER_HIT:
L_combate_estado84:
;Configuraciones.c,256 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado317
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado318
L__combate_estado317:
	BSF         PORTA+0, 7 
L__combate_estado318:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado319
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado320
L__combate_estado319:
	BSF         PORTA+0, 6 
L__combate_estado320:
;Configuraciones.c,257 :: 		DER_GIRO();
	CALL        _DER_GIRO+0, 0
;Configuraciones.c,258 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,260 :: 		case CMB_HIT_FULL:
L_combate_estado85:
;Configuraciones.c,261 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado321
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado322
L__combate_estado321:
	BSF         PORTA+0, 7 
L__combate_estado322:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado323
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado324
L__combate_estado323:
	BSF         PORTA+0, 6 
L__combate_estado324:
	BSF         PORTA+0, 4 
;Configuraciones.c,262 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,263 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,265 :: 		default:
L_combate_estado86:
;Configuraciones.c,266 :: 		LIBRE(); // Detén motores, ponlo en modo seguro
	CALL        _LIBRE+0, 0
;Configuraciones.c,267 :: 		estado_combate = CMB_ESPERA; // Vuelve a esperar nueva condición
	CLRF        _estado_combate+0 
;Configuraciones.c,268 :: 		estado_movimiento = MOV_IDLE; // Resetea movimiento si lo usas
	CLRF        _estado_movimiento+0 
;Configuraciones.c,269 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,270 :: 		}
L_combate_estado43:
	MOVF        _estado_combate+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado45
	MOVF        _estado_combate+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado78
	MOVF        _estado_combate+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado79
	MOVF        _estado_combate+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado80
	MOVF        _estado_combate+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado81
	MOVF        _estado_combate+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado82
	MOVF        _estado_combate+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado83
	MOVF        _estado_combate+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado84
	MOVF        _estado_combate+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado85
	GOTO        L_combate_estado86
L_combate_estado44:
;Configuraciones.c,271 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,273 :: 		void Start(){
;Configuraciones.c,274 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,275 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,276 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,277 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,278 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,279 :: 		return;
;Configuraciones.c,280 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,281 :: 		void Stop(){
;Configuraciones.c,282 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,283 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,284 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,285 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,286 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,287 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,294 :: 		void REC(){
;Configuraciones.c,296 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,298 :: 		PWM1_Set_Duty(200); // IN1 = PWM
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,299 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,302 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,303 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,304 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,305 :: 		void DER(){
;Configuraciones.c,306 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,307 :: 		PWM1_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,308 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,310 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,311 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,313 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_DER_Z:

;Configuraciones.c,314 :: 		void DER_Z(){
;Configuraciones.c,315 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,316 :: 		PWM1_Set_Duty(230);
	MOVLW       230
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,317 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,319 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,320 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,323 :: 		}
L_end_DER_Z:
	RETURN      0
; end of _DER_Z

_IZQ:

;Configuraciones.c,326 :: 		void IZQ(){
;Configuraciones.c,327 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,328 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,329 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,331 :: 		PWM3_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,332 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,333 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_IZQ_L:

;Configuraciones.c,335 :: 		void IZQ_L(){
;Configuraciones.c,336 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,337 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,338 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,340 :: 		PWM3_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,341 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,343 :: 		}
L_end_IZQ_L:
	RETURN      0
; end of _IZQ_L

_DER_L:

;Configuraciones.c,344 :: 		void DER_L(){
;Configuraciones.c,345 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,346 :: 		PWM1_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,347 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,349 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,350 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,354 :: 		}
L_end_DER_L:
	RETURN      0
; end of _DER_L

_REV:

;Configuraciones.c,356 :: 		void REV(){
;Configuraciones.c,357 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,358 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,359 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,360 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,361 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,363 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,365 :: 		void LIBRE(){
;Configuraciones.c,367 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,368 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,369 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,370 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,371 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,375 :: 		void GIRO180(){
;Configuraciones.c,376 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,377 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,378 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,379 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,380 :: 		PWM4_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,382 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,384 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,385 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,386 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36087:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36087
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36087
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36087
	NOP
	NOP
;Configuraciones.c,387 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,389 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,391 :: 		void BRAKE(){
;Configuraciones.c,393 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,394 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,395 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,396 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,397 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,400 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,401 :: 		void HARD(){
;Configuraciones.c,402 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,403 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,404 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,405 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,408 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,409 :: 		void PUSH(){
;Configuraciones.c,410 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,412 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,413 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,416 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,417 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,419 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,420 :: 		void HIT(){
;Configuraciones.c,422 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,423 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT88:
	DECFSZ      R13, 1, 1
	BRA         L_HIT88
	DECFSZ      R12, 1, 1
	BRA         L_HIT88
	NOP
	NOP
;Configuraciones.c,424 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,425 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT89:
	DECFSZ      R13, 1, 1
	BRA         L_HIT89
	DECFSZ      R12, 1, 1
	BRA         L_HIT89
	DECFSZ      R11, 1, 1
	BRA         L_HIT89
	NOP
	NOP
;Configuraciones.c,426 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_HIT_NO_BLOQUEANTE:

;Configuraciones.c,427 :: 		void HIT_NO_BLOQUEANTE(){
;Configuraciones.c,428 :: 		unsigned long now = millis(); // Usa tu función de tiempo
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+0 
	MOVF        R1, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+1 
	MOVF        R2, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+2 
	MOVF        R3, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+3 
;Configuraciones.c,430 :: 		switch (estado_movimiento) {
	GOTO        L_HIT_NO_BLOQUEANTE90
;Configuraciones.c,431 :: 		case MOV_IDLE:
L_HIT_NO_BLOQUEANTE92:
;Configuraciones.c,432 :: 		PUSH(); // Avanza rápido
	CALL        _PUSH+0, 0
;Configuraciones.c,433 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,434 :: 		estado_movimiento = MOV_HIT_REC;
	MOVLW       1
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,435 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE91
;Configuraciones.c,437 :: 		case MOV_HIT_REC:
L_HIT_NO_BLOQUEANTE93:
;Configuraciones.c,439 :: 		if (now - tiempo_movimiento >= 20) {
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
	GOTO        L__HIT_NO_BLOQUEANTE342
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE342
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE342
	MOVLW       20
	SUBWF       R1, 0 
L__HIT_NO_BLOQUEANTE342:
	BTFSS       STATUS+0, 0 
	GOTO        L_HIT_NO_BLOQUEANTE94
;Configuraciones.c,440 :: 		PUSH(); // Empuje fuerte
	CALL        _PUSH+0, 0
;Configuraciones.c,441 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,442 :: 		estado_movimiento = MOV_HIT_PUSH;
	MOVLW       2
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,443 :: 		}
L_HIT_NO_BLOQUEANTE94:
;Configuraciones.c,444 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE91
;Configuraciones.c,446 :: 		case MOV_HIT_PUSH:
L_HIT_NO_BLOQUEANTE95:
;Configuraciones.c,448 :: 		if (S2 == 0) {
	BTFSC       PORTC+0, 6 
	GOTO        L_HIT_NO_BLOQUEANTE96
;Configuraciones.c,450 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,451 :: 		tiempo_movimiento = now; // Actualiza tiempo si quieres tiempo máximo de empuje
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,452 :: 		} else {
	GOTO        L_HIT_NO_BLOQUEANTE97
L_HIT_NO_BLOQUEANTE96:
;Configuraciones.c,454 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,455 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,456 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,457 :: 		}
L_HIT_NO_BLOQUEANTE97:
;Configuraciones.c,464 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE91
;Configuraciones.c,465 :: 		}
L_HIT_NO_BLOQUEANTE90:
	MOVF        _estado_movimiento+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE92
	MOVF        _estado_movimiento+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE93
	MOVF        _estado_movimiento+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE95
L_HIT_NO_BLOQUEANTE91:
;Configuraciones.c,466 :: 		}
L_end_HIT_NO_BLOQUEANTE:
	RETURN      0
; end of _HIT_NO_BLOQUEANTE

_IZQ_M:

;Configuraciones.c,467 :: 		void IZQ_M(){
;Configuraciones.c,468 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_M_now_L0+3 
;Configuraciones.c,469 :: 		switch (sub_cmb_izq) {
	GOTO        L_IZQ_M98
;Configuraciones.c,471 :: 		case SUB_IZQ_INICIO:
L_IZQ_M100:
;Configuraciones.c,472 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,473 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,474 :: 		sub_cmb_izq = SUB_IZQ_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,475 :: 		break;
	GOTO        L_IZQ_M99
;Configuraciones.c,477 :: 		case SUB_IZQ_GIRO:
L_IZQ_M101:
;Configuraciones.c,478 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M344
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M344
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M344
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M344:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M102
;Configuraciones.c,479 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,480 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,481 :: 		sub_cmb_izq = SUB_IZQ_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,482 :: 		} else {
	GOTO        L_IZQ_M103
L_IZQ_M102:
;Configuraciones.c,483 :: 		IZQ(); // si necesitas mantener comando
	CALL        _IZQ+0, 0
;Configuraciones.c,484 :: 		}
L_IZQ_M103:
;Configuraciones.c,485 :: 		break;
	GOTO        L_IZQ_M99
;Configuraciones.c,487 :: 		case SUB_IZQ_HARD:
L_IZQ_M104:
;Configuraciones.c,488 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L_IZQ_M105
;Configuraciones.c,489 :: 		sub_cmb_izq = SUB_IZQ_INICIO;
	CLRF        _sub_cmb_izq+0 
;Configuraciones.c,490 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,491 :: 		} else {
	GOTO        L_IZQ_M106
L_IZQ_M105:
;Configuraciones.c,492 :: 		HARD(); // si necesitas mantener comando
	CALL        _HARD+0, 0
;Configuraciones.c,493 :: 		}
L_IZQ_M106:
;Configuraciones.c,494 :: 		break;
	GOTO        L_IZQ_M99
;Configuraciones.c,495 :: 		}
L_IZQ_M98:
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M100
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M101
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M104
L_IZQ_M99:
;Configuraciones.c,496 :: 		}
L_end_IZQ_M:
	RETURN      0
; end of _IZQ_M

_DER_M:

;Configuraciones.c,497 :: 		void DER_M() {
;Configuraciones.c,498 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_M_now_L0+3 
;Configuraciones.c,500 :: 		switch (sub_cmb_der) {
	GOTO        L_DER_M107
;Configuraciones.c,501 :: 		case SUB_DER_INICIO:
L_DER_M109:
;Configuraciones.c,502 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,503 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,504 :: 		sub_cmb_der = SUB_DER_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,505 :: 		break;
	GOTO        L_DER_M108
;Configuraciones.c,507 :: 		case SUB_DER_GIRO:
L_DER_M110:
;Configuraciones.c,509 :: 		if (S6 ==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M111
;Configuraciones.c,510 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,511 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,512 :: 		break;
	GOTO        L_DER_M108
;Configuraciones.c,513 :: 		}
L_DER_M111:
;Configuraciones.c,514 :: 		if (now - t_cmb_der >= 100) {
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
	GOTO        L__DER_M347
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M347
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M347
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M347:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M112
;Configuraciones.c,515 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,516 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,517 :: 		sub_cmb_der = SUB_DER_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,518 :: 		} else {
	GOTO        L_DER_M113
L_DER_M112:
;Configuraciones.c,519 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,520 :: 		}
L_DER_M113:
;Configuraciones.c,521 :: 		break;
	GOTO        L_DER_M108
;Configuraciones.c,523 :: 		case SUB_DER_HARD:
L_DER_M114:
;Configuraciones.c,525 :: 		if (S6==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M115
;Configuraciones.c,526 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,527 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,528 :: 		break;
	GOTO        L_DER_M108
;Configuraciones.c,529 :: 		}
L_DER_M115:
;Configuraciones.c,530 :: 		if (now - t_cmb_der >= 100) {
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
	GOTO        L_DER_M116
;Configuraciones.c,531 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,532 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,533 :: 		} else {
	GOTO        L_DER_M117
L_DER_M116:
;Configuraciones.c,534 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,535 :: 		}
L_DER_M117:
;Configuraciones.c,536 :: 		break;
	GOTO        L_DER_M108
;Configuraciones.c,537 :: 		}
L_DER_M107:
	MOVF        _sub_cmb_der+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M109
	MOVF        _sub_cmb_der+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M110
	MOVF        _sub_cmb_der+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M114
L_DER_M108:
;Configuraciones.c,538 :: 		}
L_end_DER_M:
	RETURN      0
; end of _DER_M

_REC_M:

;Configuraciones.c,539 :: 		void REC_M() {
;Configuraciones.c,540 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       REC_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       REC_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       REC_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       REC_M_now_L0+3 
;Configuraciones.c,541 :: 		switch (sub_cmb_rec) {
	GOTO        L_REC_M118
;Configuraciones.c,542 :: 		case SUB_REC_INICIO:
L_REC_M120:
;Configuraciones.c,543 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,544 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,545 :: 		sub_cmb_rec = SUB_REC_REC;
	MOVLW       1
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,546 :: 		break;
	GOTO        L_REC_M119
;Configuraciones.c,548 :: 		case SUB_REC_REC:
L_REC_M121:
;Configuraciones.c,549 :: 		if (now - t_cmb_rec >= 50) { // Espera 250 ms
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
	GOTO        L__REC_M350
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M350
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M350
	MOVLW       50
	SUBWF       R1, 0 
L__REC_M350:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M122
;Configuraciones.c,550 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,551 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,552 :: 		sub_cmb_rec = SUB_REC_LIBRE;
	MOVLW       2
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,553 :: 		}
L_REC_M122:
;Configuraciones.c,554 :: 		break;
	GOTO        L_REC_M119
;Configuraciones.c,556 :: 		case SUB_REC_LIBRE:
L_REC_M123:
;Configuraciones.c,557 :: 		if (now - t_cmb_rec >= 100) { // Espera 200 ms
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
	MOVLW       100
	SUBWF       R1, 0 
L__REC_M351:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M124
;Configuraciones.c,558 :: 		sub_cmb_rec = SUB_REC_FIN;
	MOVLW       3
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,559 :: 		}
L_REC_M124:
;Configuraciones.c,560 :: 		break;
	GOTO        L_REC_M119
;Configuraciones.c,562 :: 		case SUB_REC_FIN:
L_REC_M125:
;Configuraciones.c,563 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,564 :: 		sub_cmb_rec = SUB_REC_INICIO; // Reinicia para próxima vez
	CLRF        _sub_cmb_rec+0 
;Configuraciones.c,565 :: 		break;
	GOTO        L_REC_M119
;Configuraciones.c,566 :: 		}
L_REC_M118:
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M120
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M121
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M123
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M125
L_REC_M119:
;Configuraciones.c,567 :: 		}
L_end_REC_M:
	RETURN      0
; end of _REC_M

_IZQ_GIRO:

;Configuraciones.c,568 :: 		void IZQ_GIRO(){
;Configuraciones.c,569 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_GIRO_now_L0+3 
;Configuraciones.c,570 :: 		switch (sub_cmb_izq_giro) {
	GOTO        L_IZQ_GIRO126
;Configuraciones.c,571 :: 		case SUB_IZQ_GIRO:
L_IZQ_GIRO128:
;Configuraciones.c,573 :: 		IZQ(); // función de giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,574 :: 		t_cmb_izq_giro = now;
	MOVF        IZQ_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_izq_giro+0 
	MOVF        IZQ_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_izq_giro+1 
	MOVF        IZQ_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_izq_giro+2 
	MOVF        IZQ_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_izq_giro+3 
;Configuraciones.c,575 :: 		sub_cmb_izq_giro = SUB_IZQ_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,576 :: 		break;
	GOTO        L_IZQ_GIRO127
;Configuraciones.c,578 :: 		case SUB_IZQ_BUSCAR_CENTRO:
L_IZQ_GIRO129:
;Configuraciones.c,580 :: 		if (SL1 == 0 && S2 == 1 && S6 == 0) {
	BTFSC       PORTC+0, 0 
	GOTO        L_IZQ_GIRO132
	BTFSS       PORTC+0, 6 
	GOTO        L_IZQ_GIRO132
	BTFSC       PORTB+0, 4 
	GOTO        L_IZQ_GIRO132
L__IZQ_GIRO179:
;Configuraciones.c,581 :: 		sub_cmb_izq_giro = SUB_IZQ_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,582 :: 		}
L_IZQ_GIRO132:
;Configuraciones.c,583 :: 		break;
	GOTO        L_IZQ_GIRO127
;Configuraciones.c,585 :: 		case SUB_IZQ_ATAQUE:
L_IZQ_GIRO133:
;Configuraciones.c,587 :: 		HIT_NO_BLOQUEANTE(); // función de ataque
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,588 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,589 :: 		sub_cmb_izq_giro = SUB_IZQ_GIRO; // Reinicia para próxima vez
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,590 :: 		break;
	GOTO        L_IZQ_GIRO127
;Configuraciones.c,591 :: 		}
L_IZQ_GIRO126:
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO128
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO129
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO133
L_IZQ_GIRO127:
;Configuraciones.c,592 :: 		}
L_end_IZQ_GIRO:
	RETURN      0
; end of _IZQ_GIRO

_DER_GIRO:

;Configuraciones.c,593 :: 		void DER_GIRO(){
;Configuraciones.c,594 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_GIRO_now_L0+3 
;Configuraciones.c,595 :: 		switch(sub_cmb_der_giro){
	GOTO        L_DER_GIRO134
;Configuraciones.c,596 :: 		case SUB_DER_GIRO_INICIO:
L_DER_GIRO136:
;Configuraciones.c,597 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,598 :: 		t_cmb_der_giro = now;
	MOVF        DER_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_der_giro+0 
	MOVF        DER_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_der_giro+1 
	MOVF        DER_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_der_giro+2 
	MOVF        DER_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_der_giro+3 
;Configuraciones.c,599 :: 		sub_cmb_der_giro = SUB_DER_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,600 :: 		break;
	GOTO        L_DER_GIRO135
;Configuraciones.c,602 :: 		case SUB_DER_BUSCAR_CENTRO:
L_DER_GIRO137:
;Configuraciones.c,603 :: 		if(SL1 ==0 && S2 ==1 && S6==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_DER_GIRO140
	BTFSS       PORTC+0, 6 
	GOTO        L_DER_GIRO140
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_GIRO140
L__DER_GIRO180:
;Configuraciones.c,604 :: 		sub_cmb_der_giro = SUB_DER_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,605 :: 		}
L_DER_GIRO140:
;Configuraciones.c,606 :: 		break;
	GOTO        L_DER_GIRO135
;Configuraciones.c,608 :: 		case SUB_DER_ATAQUE:
L_DER_GIRO141:
;Configuraciones.c,609 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,610 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,611 :: 		sub_cmb_der_giro = SUB_DER_GIRO_INICIO;
	CLRF        _sub_cmb_der_giro+0 
;Configuraciones.c,612 :: 		break;
	GOTO        L_DER_GIRO135
;Configuraciones.c,613 :: 		}
L_DER_GIRO134:
	MOVF        _sub_cmb_der_giro+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_GIRO136
	MOVF        _sub_cmb_der_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_GIRO137
	MOVF        _sub_cmb_der_giro+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_GIRO141
L_DER_GIRO135:
;Configuraciones.c,615 :: 		}
L_end_DER_GIRO:
	RETURN      0
; end of _DER_GIRO

_BUSCAR:

;Configuraciones.c,616 :: 		void BUSCAR(){
;Configuraciones.c,617 :: 		switch (sub_cmb_buscar) {
	GOTO        L_BUSCAR142
;Configuraciones.c,618 :: 		case SUB_BUSCAR_IZQ:
L_BUSCAR144:
;Configuraciones.c,619 :: 		IZQ(); // Ejecuta giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,620 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR145
;Configuraciones.c,621 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,622 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
	GOTO        L_BUSCAR146
L_BUSCAR145:
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
	GOTO        L__BUSCAR355
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR355
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR355
	MOVF        R4, 0 
	SUBLW       200
L__BUSCAR355:
	BTFSC       STATUS+0, 0 
	GOTO        L_BUSCAR147
;Configuraciones.c,623 :: 		sub_cmb_buscar = SUB_BUSCAR_DER;
	MOVLW       1
	MOVWF       _sub_cmb_buscar+0 
;Configuraciones.c,624 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,625 :: 		}
L_BUSCAR147:
L_BUSCAR146:
;Configuraciones.c,626 :: 		break;
	GOTO        L_BUSCAR143
;Configuraciones.c,627 :: 		case SUB_BUSCAR_DER:
L_BUSCAR148:
;Configuraciones.c,628 :: 		DER(); // Ejecuta giro derecha
	CALL        _DER+0, 0
;Configuraciones.c,629 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR149
;Configuraciones.c,630 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,631 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
	GOTO        L_BUSCAR150
L_BUSCAR149:
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
	GOTO        L_BUSCAR151
;Configuraciones.c,632 :: 		estado_combate = CMB_ESPERA; // O vuelve a búsqueda, como prefieras
	CLRF        _estado_combate+0 
;Configuraciones.c,633 :: 		}
L_BUSCAR151:
L_BUSCAR150:
;Configuraciones.c,634 :: 		break;
	GOTO        L_BUSCAR143
;Configuraciones.c,635 :: 		}
L_BUSCAR142:
	MOVF        _sub_cmb_buscar+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_BUSCAR144
	MOVF        _sub_cmb_buscar+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_BUSCAR148
L_BUSCAR143:
;Configuraciones.c,636 :: 		}
L_end_BUSCAR:
	RETURN      0
; end of _BUSCAR

_LOGICA_LINEA:

;Configuraciones.c,637 :: 		void LOGICA_LINEA(){
;Configuraciones.c,638 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA154
	BTFSS       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA154
L__LOGICA_LINEA182:
;Configuraciones.c,639 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,640 :: 		}
	GOTO        L_LOGICA_LINEA155
L_LOGICA_LINEA154:
;Configuraciones.c,641 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA158
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA158
L__LOGICA_LINEA181:
;Configuraciones.c,642 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,643 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA159:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA159
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA159
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA159
	NOP
;Configuraciones.c,644 :: 		GIRO180();
	CALL        _GIRO180+0, 0
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
;Configuraciones.c,646 :: 		}
	GOTO        L_LOGICA_LINEA161
L_LOGICA_LINEA158:
;Configuraciones.c,647 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA162
;Configuraciones.c,648 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,649 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA163:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA163
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA163
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA163
	NOP
;Configuraciones.c,650 :: 		GIRO360();
	CALL        _GIRO360+0, 0
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
;Configuraciones.c,652 :: 		}
	GOTO        L_LOGICA_LINEA165
L_LOGICA_LINEA162:
;Configuraciones.c,653 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA166
;Configuraciones.c,654 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,655 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA167:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA167
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA167
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA167
	NOP
;Configuraciones.c,656 :: 		DER();
	CALL        _DER+0, 0
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
;Configuraciones.c,658 :: 		}
L_LOGICA_LINEA166:
L_LOGICA_LINEA165:
L_LOGICA_LINEA161:
L_LOGICA_LINEA155:
;Configuraciones.c,659 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
