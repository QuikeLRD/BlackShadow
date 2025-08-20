
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
;Configuraciones.c,81 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,82 :: 		}
	GOTO        L_SELEC10
L_SELEC9:
;Configuraciones.c,83 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC13
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC13
L__SELEC170:
;Configuraciones.c,84 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,85 :: 		delay_ms(100);
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
;Configuraciones.c,86 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,87 :: 		delay_ms(100);
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
;Configuraciones.c,88 :: 		}
	GOTO        L_SELEC16
L_SELEC13:
;Configuraciones.c,89 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC17
;Configuraciones.c,90 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,91 :: 		delay_ms(100);
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
;Configuraciones.c,92 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,93 :: 		delay_ms(100);
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
;Configuraciones.c,94 :: 		}
	GOTO        L_SELEC20
L_SELEC17:
;Configuraciones.c,95 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC21
;Configuraciones.c,96 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,97 :: 		delay_ms(100);
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
;Configuraciones.c,98 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,99 :: 		delay_ms(100);
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
;Configuraciones.c,100 :: 		}
L_SELEC21:
L_SELEC20:
L_SELEC16:
L_SELEC10:
;Configuraciones.c,102 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,104 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC24:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
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
;Configuraciones.c,105 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,107 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,109 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC25:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC204
	BCF         PORTA+0, 6 
	GOTO        L__SELEC205
L__SELEC204:
	BSF         PORTA+0, 6 
L__SELEC205:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC206
	BCF         PORTA+0, 5 
	GOTO        L__SELEC207
L__SELEC206:
	BSF         PORTA+0, 5 
L__SELEC207:
;Configuraciones.c,110 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,111 :: 		delay_ms(2000);
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
;Configuraciones.c,112 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,113 :: 		delay_ms(500);
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
;Configuraciones.c,118 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,120 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC28:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC208
	BCF         PORTA+0, 7 
	GOTO        L__SELEC209
L__SELEC208:
	BSF         PORTA+0, 7 
L__SELEC209:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC210
	BCF         PORTA+0, 4 
	GOTO        L__SELEC211
L__SELEC210:
	BSF         PORTA+0, 4 
L__SELEC211:
;Configuraciones.c,121 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,122 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
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
;Configuraciones.c,123 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,124 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC30:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC30
	DECFSZ      R12, 1, 1
	BRA         L_SELEC30
	DECFSZ      R11, 1, 1
	BRA         L_SELEC30
;Configuraciones.c,125 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,127 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC31:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC212
	BCF         PORTA+0, 5 
	GOTO        L__SELEC213
L__SELEC212:
	BSF         PORTA+0, 5 
L__SELEC213:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC214
	BCF         PORTA+0, 4 
	GOTO        L__SELEC215
L__SELEC214:
	BSF         PORTA+0, 4 
L__SELEC215:
;Configuraciones.c,128 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,129 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,131 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC32:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC216
	BCF         PORTA+0, 7 
	GOTO        L__SELEC217
L__SELEC216:
	BSF         PORTA+0, 7 
L__SELEC217:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC218
	BCF         PORTA+0, 4 
	GOTO        L__SELEC219
L__SELEC218:
	BSF         PORTA+0, 4 
L__SELEC219:
;Configuraciones.c,132 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,134 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,136 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC33:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC220
	BCF         PORTA+0, 7 
	GOTO        L__SELEC221
L__SELEC220:
	BSF         PORTA+0, 7 
L__SELEC221:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC222
	BCF         PORTA+0, 5 
	GOTO        L__SELEC223
L__SELEC222:
	BSF         PORTA+0, 5 
L__SELEC223:
	BSF         PORTA+0, 4 
;Configuraciones.c,138 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,140 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC34:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC224
	BCF         PORTA+0, 5 
	GOTO        L__SELEC225
L__SELEC224:
	BSF         PORTA+0, 5 
L__SELEC225:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC226
	BCF         PORTA+0, 7 
	GOTO        L__SELEC227
L__SELEC226:
	BSF         PORTA+0, 7 
L__SELEC227:
;Configuraciones.c,142 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,144 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC35:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC228
	BCF         PORTA+0, 6 
	GOTO        L__SELEC229
L__SELEC228:
	BSF         PORTA+0, 6 
L__SELEC229:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC230
	BCF         PORTA+0, 7 
	GOTO        L__SELEC231
L__SELEC230:
	BSF         PORTA+0, 7 
L__SELEC231:
;Configuraciones.c,147 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,149 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC36:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC232
	BCF         PORTA+0, 4 
	GOTO        L__SELEC233
L__SELEC232:
	BSF         PORTA+0, 4 
L__SELEC233:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC234
	BCF         PORTA+0, 5 
	GOTO        L__SELEC235
L__SELEC234:
	BSF         PORTA+0, 5 
L__SELEC235:
;Configuraciones.c,150 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,152 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC37:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC236
	BCF         PORTA+0, 7 
	GOTO        L__SELEC237
L__SELEC236:
	BSF         PORTA+0, 7 
L__SELEC237:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC238
	BCF         PORTA+0, 6 
	GOTO        L__SELEC239
L__SELEC238:
	BSF         PORTA+0, 6 
L__SELEC239:
	BSF         PORTA+0, 5 
;Configuraciones.c,153 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,155 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC38:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC240
	BCF         PORTA+0, 4 
	GOTO        L__SELEC241
L__SELEC240:
	BSF         PORTA+0, 4 
L__SELEC241:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC242
	BCF         PORTA+0, 7 
	GOTO        L__SELEC243
L__SELEC242:
	BSF         PORTA+0, 7 
L__SELEC243:
;Configuraciones.c,156 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,158 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC39:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC244
	BCF         PORTA+0, 5 
	GOTO        L__SELEC245
L__SELEC244:
	BSF         PORTA+0, 5 
L__SELEC245:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC246
	BCF         PORTA+0, 4 
	GOTO        L__SELEC247
L__SELEC246:
	BSF         PORTA+0, 4 
L__SELEC247:
	BSF         PORTA+0, 7 
;Configuraciones.c,159 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,161 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC40:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC248
	BCF         PORTA+0, 5 
	GOTO        L__SELEC249
L__SELEC248:
	BSF         PORTA+0, 5 
L__SELEC249:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC250
	BCF         PORTA+0, 4 
	GOTO        L__SELEC251
L__SELEC250:
	BSF         PORTA+0, 4 
L__SELEC251:
	BSF         PORTA+0, 6 
;Configuraciones.c,162 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,164 :: 		default: L0=L1=L2=L3=0;
L_SELEC41:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC252
	BCF         PORTA+0, 5 
	GOTO        L__SELEC253
L__SELEC252:
	BSF         PORTA+0, 5 
L__SELEC253:
	BTFSC       PORTA+0, 5 
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
;Configuraciones.c,165 :: 		}
	GOTO        L_SELEC4
L_SELEC3:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC258
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC258:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC5
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC259
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC259:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC6
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC260
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC260:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC24
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC261
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC261:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC262
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC262:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC263
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC263:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC264
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC264:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC265
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC265:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC266
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC266:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC267
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC267:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC268
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC268:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC269
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC269:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC270
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC270:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC271
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC271:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC272
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC272:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	GOTO        L_SELEC41
L_SELEC4:
;Configuraciones.c,168 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,172 :: 		void combate_estado() {
;Configuraciones.c,173 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado42
;Configuraciones.c,174 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,175 :: 		LOGICA_LINEA();
	CALL        _LOGICA_LINEA+0, 0
;Configuraciones.c,176 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,177 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,178 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,179 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,180 :: 		}
L_combate_estado42:
;Configuraciones.c,181 :: 		switch (estado_combate) {
	GOTO        L_combate_estado43
;Configuraciones.c,182 :: 		case CMB_ESPERA:
L_combate_estado45:
;Configuraciones.c,183 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado48
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado48
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado48
L__combate_estado179:
;Configuraciones.c,184 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,185 :: 		}
	GOTO        L_combate_estado49
L_combate_estado48:
;Configuraciones.c,186 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado52
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado52
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado52
L__combate_estado178:
;Configuraciones.c,187 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,188 :: 		}
	GOTO        L_combate_estado53
L_combate_estado52:
;Configuraciones.c,189 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado56
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado56
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado56
L__combate_estado177:
;Configuraciones.c,190 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,191 :: 		}
	GOTO        L_combate_estado57
L_combate_estado56:
;Configuraciones.c,192 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado60
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado60
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado60
L__combate_estado176:
;Configuraciones.c,193 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,194 :: 		}
	GOTO        L_combate_estado61
L_combate_estado60:
;Configuraciones.c,195 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado64
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado64
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado64
L__combate_estado175:
;Configuraciones.c,196 :: 		estado_combate = CMB_DER;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,197 :: 		}
	GOTO        L_combate_estado65
L_combate_estado64:
;Configuraciones.c,198 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado68
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado68
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado68
L__combate_estado174:
;Configuraciones.c,199 :: 		estado_combate = CMB_BUSCAR;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,200 :: 		sub_cmb_buscar = SUB_BUSCAR_IZQ;
	CLRF        _sub_cmb_buscar+0 
;Configuraciones.c,201 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,202 :: 		}
	GOTO        L_combate_estado69
L_combate_estado68:
;Configuraciones.c,203 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado72
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado72
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado72
L__combate_estado173:
;Configuraciones.c,204 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,205 :: 		}
	GOTO        L_combate_estado73
L_combate_estado72:
;Configuraciones.c,206 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado76
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado76
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado76
L__combate_estado172:
;Configuraciones.c,207 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,208 :: 		}
	GOTO        L_combate_estado77
L_combate_estado76:
;Configuraciones.c,210 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,211 :: 		}
L_combate_estado77:
L_combate_estado73:
L_combate_estado69:
L_combate_estado65:
L_combate_estado61:
L_combate_estado57:
L_combate_estado53:
L_combate_estado49:
;Configuraciones.c,212 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,214 :: 		case CMB_REC:
L_combate_estado78:
;Configuraciones.c,215 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado274
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado275
L__combate_estado274:
	BSF         PORTA+0, 5 
L__combate_estado275:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado276
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado277
L__combate_estado276:
	BSF         PORTA+0, 7 
L__combate_estado277:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado278
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado279
L__combate_estado278:
	BSF         PORTA+0, 6 
L__combate_estado279:
;Configuraciones.c,216 :: 		REC_M();
	CALL        _REC_M+0, 0
;Configuraciones.c,217 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,219 :: 		case CMB_IZQ:
L_combate_estado79:
;Configuraciones.c,220 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado280
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado281
L__combate_estado280:
	BSF         PORTA+0, 5 
L__combate_estado281:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado282
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado283
L__combate_estado282:
	BSF         PORTA+0, 7 
L__combate_estado283:
;Configuraciones.c,221 :: 		IZQ_M();
	CALL        _IZQ_M+0, 0
;Configuraciones.c,222 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,224 :: 		case CMB_HIT:
L_combate_estado80:
;Configuraciones.c,225 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado284
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado285
L__combate_estado284:
	BSF         PORTA+0, 5 
L__combate_estado285:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado286
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado287
L__combate_estado286:
	BSF         PORTA+0, 6 
L__combate_estado287:
;Configuraciones.c,226 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,227 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,229 :: 		case CMB_IZQ_GOLPE:
L_combate_estado81:
;Configuraciones.c,230 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado288
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado289
L__combate_estado288:
	BSF         PORTA+0, 6 
L__combate_estado289:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado290
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado291
L__combate_estado290:
	BSF         PORTA+0, 5 
L__combate_estado291:
;Configuraciones.c,231 :: 		IZQ_GIRO();
	CALL        _IZQ_GIRO+0, 0
;Configuraciones.c,232 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,234 :: 		case CMB_DER:
L_combate_estado82:
;Configuraciones.c,235 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado292
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado293
L__combate_estado292:
	BSF         PORTA+0, 7 
L__combate_estado293:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado294
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado295
L__combate_estado294:
	BSF         PORTA+0, 6 
L__combate_estado295:
;Configuraciones.c,236 :: 		DER_M();
	CALL        _DER_M+0, 0
;Configuraciones.c,237 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,239 :: 		case CMB_BUSCAR:
L_combate_estado83:
;Configuraciones.c,240 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado296
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado297
L__combate_estado296:
	BSF         PORTA+0, 6 
L__combate_estado297:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado298
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado299
L__combate_estado298:
	BSF         PORTA+0, 7 
L__combate_estado299:
;Configuraciones.c,241 :: 		BUSCAR();
	CALL        _BUSCAR+0, 0
;Configuraciones.c,242 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,244 :: 		case CMB_DER_HIT:
L_combate_estado84:
;Configuraciones.c,245 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado300
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado301
L__combate_estado300:
	BSF         PORTA+0, 7 
L__combate_estado301:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado302
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado303
L__combate_estado302:
	BSF         PORTA+0, 6 
L__combate_estado303:
;Configuraciones.c,246 :: 		DER_GIRO();
	CALL        _DER_GIRO+0, 0
;Configuraciones.c,247 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,249 :: 		case CMB_HIT_FULL:
L_combate_estado85:
;Configuraciones.c,250 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado304
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado305
L__combate_estado304:
	BSF         PORTA+0, 7 
L__combate_estado305:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado306
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado307
L__combate_estado306:
	BSF         PORTA+0, 6 
L__combate_estado307:
	BSF         PORTA+0, 4 
;Configuraciones.c,251 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,252 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,253 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,255 :: 		default:
L_combate_estado86:
;Configuraciones.c,256 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,257 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,258 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,259 :: 		}
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
;Configuraciones.c,260 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,262 :: 		void Start(){
;Configuraciones.c,263 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,264 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,265 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,266 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,267 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,268 :: 		return;
;Configuraciones.c,269 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,270 :: 		void Stop(){
;Configuraciones.c,271 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,272 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,273 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,274 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,275 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,276 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,283 :: 		void REC(){
;Configuraciones.c,285 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,287 :: 		PWM1_Set_Duty(200); // IN1 = PWM
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,288 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,291 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,292 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,293 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,294 :: 		void DER(){
;Configuraciones.c,295 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,296 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,297 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,299 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,300 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,302 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_DER_Z:

;Configuraciones.c,303 :: 		void DER_Z(){
;Configuraciones.c,304 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,305 :: 		PWM1_Set_Duty(230);
	MOVLW       230
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,306 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,308 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,309 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,312 :: 		}
L_end_DER_Z:
	RETURN      0
; end of _DER_Z

_IZQ:

;Configuraciones.c,315 :: 		void IZQ(){
;Configuraciones.c,316 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,317 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,318 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,320 :: 		PWM3_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,321 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,322 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;Configuraciones.c,324 :: 		void REV(){
;Configuraciones.c,325 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,326 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,327 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,328 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,329 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,331 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,333 :: 		void LIBRE(){
;Configuraciones.c,335 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,336 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,337 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,338 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,339 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,343 :: 		void GIRO180(){
;Configuraciones.c,344 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,346 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,347 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,349 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,350 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,351 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18087:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18087
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18087
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18087
;Configuraciones.c,352 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,355 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,357 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,358 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,359 :: 		delay_ms(250);
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
;Configuraciones.c,360 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,362 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,364 :: 		void BRAKE(){
;Configuraciones.c,366 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,367 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,368 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,369 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,370 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,373 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,374 :: 		void HARD(){
;Configuraciones.c,375 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,376 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,377 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,378 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,381 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,382 :: 		void PUSH(){
;Configuraciones.c,383 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,385 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,386 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,389 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,390 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,392 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,393 :: 		void HIT(){
;Configuraciones.c,395 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,396 :: 		delay_ms(20);
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
;Configuraciones.c,397 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,398 :: 		delay_ms(250);
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
;Configuraciones.c,399 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_HIT_NO_BLOQUEANTE:

;Configuraciones.c,400 :: 		void HIT_NO_BLOQUEANTE(){
;Configuraciones.c,401 :: 		unsigned long now = millis(); // Usa tu función de tiempo
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+0 
	MOVF        R1, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+1 
	MOVF        R2, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+2 
	MOVF        R3, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+3 
;Configuraciones.c,403 :: 		switch (estado_movimiento) {
	GOTO        L_HIT_NO_BLOQUEANTE91
;Configuraciones.c,404 :: 		case MOV_IDLE:
L_HIT_NO_BLOQUEANTE93:
;Configuraciones.c,405 :: 		PUSH(); // Avanza rápido
	CALL        _PUSH+0, 0
;Configuraciones.c,406 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,407 :: 		estado_movimiento = MOV_HIT_REC;
	MOVLW       1
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,408 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE92
;Configuraciones.c,410 :: 		case MOV_HIT_REC:
L_HIT_NO_BLOQUEANTE94:
;Configuraciones.c,412 :: 		if (now - tiempo_movimiento >= 20) {
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
	GOTO        L__HIT_NO_BLOQUEANTE323
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE323
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE323
	MOVLW       20
	SUBWF       R1, 0 
L__HIT_NO_BLOQUEANTE323:
	BTFSS       STATUS+0, 0 
	GOTO        L_HIT_NO_BLOQUEANTE95
;Configuraciones.c,413 :: 		PUSH(); // Empuje fuerte
	CALL        _PUSH+0, 0
;Configuraciones.c,414 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,415 :: 		estado_movimiento = MOV_HIT_PUSH;
	MOVLW       2
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,416 :: 		}
L_HIT_NO_BLOQUEANTE95:
;Configuraciones.c,417 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE92
;Configuraciones.c,419 :: 		case MOV_HIT_PUSH:
L_HIT_NO_BLOQUEANTE96:
;Configuraciones.c,421 :: 		if (S2 == 0) {
	BTFSC       PORTC+0, 6 
	GOTO        L_HIT_NO_BLOQUEANTE97
;Configuraciones.c,423 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,424 :: 		tiempo_movimiento = now; // Actualiza tiempo si quieres tiempo máximo de empuje
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,425 :: 		} else {
	GOTO        L_HIT_NO_BLOQUEANTE98
L_HIT_NO_BLOQUEANTE97:
;Configuraciones.c,427 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,428 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,429 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,430 :: 		}
L_HIT_NO_BLOQUEANTE98:
;Configuraciones.c,437 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE92
;Configuraciones.c,438 :: 		}
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
;Configuraciones.c,439 :: 		}
L_end_HIT_NO_BLOQUEANTE:
	RETURN      0
; end of _HIT_NO_BLOQUEANTE

_IZQ_M:

;Configuraciones.c,440 :: 		void IZQ_M(){
;Configuraciones.c,441 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_M_now_L0+3 
;Configuraciones.c,442 :: 		switch (sub_cmb_izq) {
	GOTO        L_IZQ_M99
;Configuraciones.c,444 :: 		case SUB_IZQ_INICIO:
L_IZQ_M101:
;Configuraciones.c,445 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,446 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,447 :: 		sub_cmb_izq = SUB_IZQ_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,448 :: 		break;
	GOTO        L_IZQ_M100
;Configuraciones.c,450 :: 		case SUB_IZQ_GIRO:
L_IZQ_M102:
;Configuraciones.c,451 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M325
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M325
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M325
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M325:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M103
;Configuraciones.c,452 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,453 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,454 :: 		sub_cmb_izq = SUB_IZQ_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,455 :: 		} else {
	GOTO        L_IZQ_M104
L_IZQ_M103:
;Configuraciones.c,456 :: 		IZQ(); // si necesitas mantener comando
	CALL        _IZQ+0, 0
;Configuraciones.c,457 :: 		}
L_IZQ_M104:
;Configuraciones.c,458 :: 		break;
	GOTO        L_IZQ_M100
;Configuraciones.c,460 :: 		case SUB_IZQ_HARD:
L_IZQ_M105:
;Configuraciones.c,461 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M326
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M326
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M326
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M326:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M106
;Configuraciones.c,462 :: 		sub_cmb_izq = SUB_IZQ_INICIO;
	CLRF        _sub_cmb_izq+0 
;Configuraciones.c,463 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,464 :: 		} else {
	GOTO        L_IZQ_M107
L_IZQ_M106:
;Configuraciones.c,465 :: 		HARD(); // si necesitas mantener comando
	CALL        _HARD+0, 0
;Configuraciones.c,466 :: 		}
L_IZQ_M107:
;Configuraciones.c,467 :: 		break;
	GOTO        L_IZQ_M100
;Configuraciones.c,468 :: 		}
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
;Configuraciones.c,469 :: 		}
L_end_IZQ_M:
	RETURN      0
; end of _IZQ_M

_DER_M:

;Configuraciones.c,470 :: 		void DER_M() {
;Configuraciones.c,471 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_M_now_L0+3 
;Configuraciones.c,473 :: 		switch (sub_cmb_der) {
	GOTO        L_DER_M108
;Configuraciones.c,474 :: 		case SUB_DER_INICIO:
L_DER_M110:
;Configuraciones.c,475 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,476 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,477 :: 		sub_cmb_der = SUB_DER_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,478 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,480 :: 		case SUB_DER_GIRO:
L_DER_M111:
;Configuraciones.c,482 :: 		if (S6 ==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M112
;Configuraciones.c,483 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,484 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,485 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,486 :: 		}
L_DER_M112:
;Configuraciones.c,487 :: 		if (now - t_cmb_der >= 100) {
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
	GOTO        L__DER_M328
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M328
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M328
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M328:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M113
;Configuraciones.c,488 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,489 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,490 :: 		sub_cmb_der = SUB_DER_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,491 :: 		} else {
	GOTO        L_DER_M114
L_DER_M113:
;Configuraciones.c,492 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,493 :: 		}
L_DER_M114:
;Configuraciones.c,494 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,496 :: 		case SUB_DER_HARD:
L_DER_M115:
;Configuraciones.c,498 :: 		if (S6==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M116
;Configuraciones.c,499 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,500 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,501 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,502 :: 		}
L_DER_M116:
;Configuraciones.c,503 :: 		if (now - t_cmb_der >= 100) {
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
	GOTO        L__DER_M329
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M329
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M329
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M329:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M117
;Configuraciones.c,504 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,505 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,506 :: 		} else {
	GOTO        L_DER_M118
L_DER_M117:
;Configuraciones.c,507 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,508 :: 		}
L_DER_M118:
;Configuraciones.c,509 :: 		break;
	GOTO        L_DER_M109
;Configuraciones.c,510 :: 		}
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
;Configuraciones.c,511 :: 		}
L_end_DER_M:
	RETURN      0
; end of _DER_M

_REC_M:

;Configuraciones.c,512 :: 		void REC_M() {
;Configuraciones.c,513 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       REC_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       REC_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       REC_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       REC_M_now_L0+3 
;Configuraciones.c,514 :: 		switch (sub_cmb_rec) {
	GOTO        L_REC_M119
;Configuraciones.c,515 :: 		case SUB_REC_INICIO:
L_REC_M121:
;Configuraciones.c,516 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,517 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,518 :: 		sub_cmb_rec = SUB_REC_REC;
	MOVLW       1
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,519 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,521 :: 		case SUB_REC_REC:
L_REC_M122:
;Configuraciones.c,522 :: 		if (now - t_cmb_rec >= 50) { // Espera 250 ms
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
	GOTO        L__REC_M331
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M331
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M331
	MOVLW       50
	SUBWF       R1, 0 
L__REC_M331:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M123
;Configuraciones.c,523 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,524 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,525 :: 		sub_cmb_rec = SUB_REC_LIBRE;
	MOVLW       2
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,526 :: 		}
L_REC_M123:
;Configuraciones.c,527 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,529 :: 		case SUB_REC_LIBRE:
L_REC_M124:
;Configuraciones.c,530 :: 		if (now - t_cmb_rec >= 100) { // Espera 200 ms
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
	GOTO        L__REC_M332
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M332
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M332
	MOVLW       100
	SUBWF       R1, 0 
L__REC_M332:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M125
;Configuraciones.c,531 :: 		sub_cmb_rec = SUB_REC_FIN;
	MOVLW       3
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,532 :: 		}
L_REC_M125:
;Configuraciones.c,533 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,535 :: 		case SUB_REC_FIN:
L_REC_M126:
;Configuraciones.c,536 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,537 :: 		sub_cmb_rec = SUB_REC_INICIO; // Reinicia para próxima vez
	CLRF        _sub_cmb_rec+0 
;Configuraciones.c,538 :: 		break;
	GOTO        L_REC_M120
;Configuraciones.c,539 :: 		}
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
;Configuraciones.c,540 :: 		}
L_end_REC_M:
	RETURN      0
; end of _REC_M

_IZQ_GIRO:

;Configuraciones.c,541 :: 		void IZQ_GIRO(){
;Configuraciones.c,542 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_GIRO_now_L0+3 
;Configuraciones.c,543 :: 		switch (sub_cmb_izq_giro) {
	GOTO        L_IZQ_GIRO127
;Configuraciones.c,544 :: 		case SUB_IZQ_GIRO:
L_IZQ_GIRO129:
;Configuraciones.c,546 :: 		IZQ(); // función de giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,547 :: 		t_cmb_izq_giro = now;
	MOVF        IZQ_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_izq_giro+0 
	MOVF        IZQ_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_izq_giro+1 
	MOVF        IZQ_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_izq_giro+2 
	MOVF        IZQ_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_izq_giro+3 
;Configuraciones.c,548 :: 		sub_cmb_izq_giro = SUB_IZQ_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,549 :: 		break;
	GOTO        L_IZQ_GIRO128
;Configuraciones.c,551 :: 		case SUB_IZQ_BUSCAR_CENTRO:
L_IZQ_GIRO130:
;Configuraciones.c,553 :: 		if (SL1 == 0 && S2 == 1 && S6 == 0) {
	BTFSC       PORTC+0, 0 
	GOTO        L_IZQ_GIRO133
	BTFSS       PORTC+0, 6 
	GOTO        L_IZQ_GIRO133
	BTFSC       PORTB+0, 4 
	GOTO        L_IZQ_GIRO133
L__IZQ_GIRO180:
;Configuraciones.c,554 :: 		sub_cmb_izq_giro = SUB_IZQ_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,555 :: 		}
L_IZQ_GIRO133:
;Configuraciones.c,556 :: 		break;
	GOTO        L_IZQ_GIRO128
;Configuraciones.c,558 :: 		case SUB_IZQ_ATAQUE:
L_IZQ_GIRO134:
;Configuraciones.c,560 :: 		HIT_NO_BLOQUEANTE(); // función de ataque
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,561 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,562 :: 		sub_cmb_izq_giro = SUB_IZQ_GIRO; // Reinicia para próxima vez
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,563 :: 		break;
	GOTO        L_IZQ_GIRO128
;Configuraciones.c,564 :: 		}
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
;Configuraciones.c,565 :: 		}
L_end_IZQ_GIRO:
	RETURN      0
; end of _IZQ_GIRO

_DER_GIRO:

;Configuraciones.c,566 :: 		void DER_GIRO(){
;Configuraciones.c,567 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_GIRO_now_L0+3 
;Configuraciones.c,568 :: 		switch(sub_cmb_der_giro){
	GOTO        L_DER_GIRO135
;Configuraciones.c,569 :: 		case SUB_DER_GIRO_INICIO:
L_DER_GIRO137:
;Configuraciones.c,570 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,571 :: 		t_cmb_der_giro = now;
	MOVF        DER_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_der_giro+0 
	MOVF        DER_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_der_giro+1 
	MOVF        DER_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_der_giro+2 
	MOVF        DER_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_der_giro+3 
;Configuraciones.c,572 :: 		sub_cmb_der_giro = SUB_DER_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,573 :: 		break;
	GOTO        L_DER_GIRO136
;Configuraciones.c,575 :: 		case SUB_DER_BUSCAR_CENTRO:
L_DER_GIRO138:
;Configuraciones.c,576 :: 		if(SL1 ==0 && S2 ==1 && S6==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_DER_GIRO141
	BTFSS       PORTC+0, 6 
	GOTO        L_DER_GIRO141
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_GIRO141
L__DER_GIRO181:
;Configuraciones.c,577 :: 		sub_cmb_der_giro = SUB_DER_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_der_giro+0 
;Configuraciones.c,578 :: 		}
L_DER_GIRO141:
;Configuraciones.c,579 :: 		break;
	GOTO        L_DER_GIRO136
;Configuraciones.c,581 :: 		case SUB_DER_ATAQUE:
L_DER_GIRO142:
;Configuraciones.c,582 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,583 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,584 :: 		sub_cmb_der_giro = SUB_DER_GIRO_INICIO;
	CLRF        _sub_cmb_der_giro+0 
;Configuraciones.c,585 :: 		break;
	GOTO        L_DER_GIRO136
;Configuraciones.c,586 :: 		}
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
;Configuraciones.c,588 :: 		}
L_end_DER_GIRO:
	RETURN      0
; end of _DER_GIRO

_BUSCAR:

;Configuraciones.c,589 :: 		void BUSCAR(){
;Configuraciones.c,590 :: 		switch (sub_cmb_buscar) {
	GOTO        L_BUSCAR143
;Configuraciones.c,591 :: 		case SUB_BUSCAR_IZQ:
L_BUSCAR145:
;Configuraciones.c,592 :: 		IZQ(); // Ejecuta giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,593 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR146
;Configuraciones.c,594 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,595 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
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
	GOTO        L__BUSCAR336
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR336
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR336
	MOVF        R4, 0 
	SUBLW       200
L__BUSCAR336:
	BTFSC       STATUS+0, 0 
	GOTO        L_BUSCAR148
;Configuraciones.c,596 :: 		sub_cmb_buscar = SUB_BUSCAR_DER;
	MOVLW       1
	MOVWF       _sub_cmb_buscar+0 
;Configuraciones.c,597 :: 		t_cmb_buscar = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       _t_cmb_buscar+0 
	MOVF        R1, 0 
	MOVWF       _t_cmb_buscar+1 
	MOVF        R2, 0 
	MOVWF       _t_cmb_buscar+2 
	MOVF        R3, 0 
	MOVWF       _t_cmb_buscar+3 
;Configuraciones.c,598 :: 		}
L_BUSCAR148:
L_BUSCAR147:
;Configuraciones.c,599 :: 		break;
	GOTO        L_BUSCAR144
;Configuraciones.c,600 :: 		case SUB_BUSCAR_DER:
L_BUSCAR149:
;Configuraciones.c,601 :: 		DER(); // Ejecuta giro derecha
	CALL        _DER+0, 0
;Configuraciones.c,602 :: 		if (S2 == 1) { // Rival al frente detectado
	BTFSS       PORTC+0, 6 
	GOTO        L_BUSCAR150
;Configuraciones.c,603 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,604 :: 		} else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
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
	GOTO        L__BUSCAR337
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR337
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__BUSCAR337
	MOVF        R4, 0 
	SUBLW       200
L__BUSCAR337:
	BTFSC       STATUS+0, 0 
	GOTO        L_BUSCAR152
;Configuraciones.c,605 :: 		estado_combate = CMB_ESPERA; // O vuelve a búsqueda, como prefieras
	CLRF        _estado_combate+0 
;Configuraciones.c,606 :: 		}
L_BUSCAR152:
L_BUSCAR151:
;Configuraciones.c,607 :: 		break;
	GOTO        L_BUSCAR144
;Configuraciones.c,608 :: 		}
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
;Configuraciones.c,609 :: 		}
L_end_BUSCAR:
	RETURN      0
; end of _BUSCAR

_LOGICA_LINEA:

;Configuraciones.c,610 :: 		void LOGICA_LINEA(){
;Configuraciones.c,611 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA155
	BTFSS       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA155
L__LOGICA_LINEA183:
;Configuraciones.c,612 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,613 :: 		}
	GOTO        L_LOGICA_LINEA156
L_LOGICA_LINEA155:
;Configuraciones.c,614 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA159
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA159
L__LOGICA_LINEA182:
;Configuraciones.c,615 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,616 :: 		delay_ms(100);
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
;Configuraciones.c,617 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,618 :: 		delay_ms(100);
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
;Configuraciones.c,619 :: 		}
	GOTO        L_LOGICA_LINEA162
L_LOGICA_LINEA159:
;Configuraciones.c,620 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA163
;Configuraciones.c,621 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,622 :: 		delay_ms(100);
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
;Configuraciones.c,623 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,624 :: 		delay_ms(100);
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
;Configuraciones.c,625 :: 		}
	GOTO        L_LOGICA_LINEA166
L_LOGICA_LINEA163:
;Configuraciones.c,626 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA167
;Configuraciones.c,627 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,628 :: 		delay_ms(100);
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
;Configuraciones.c,629 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,630 :: 		delay_ms(100);
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
;Configuraciones.c,631 :: 		}
L_LOGICA_LINEA167:
L_LOGICA_LINEA166:
L_LOGICA_LINEA162:
L_LOGICA_LINEA156:
;Configuraciones.c,632 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
