
_INTERRUPT_ISR:

;Configuraciones.c,34 :: 		void INTERRUPT_ISR(void) {
;Configuraciones.c,36 :: 		if (INTCON.TMR0IF) {
	BTFSS       INTCON+0, 2 
	GOTO        L_INTERRUPT_ISR0
;Configuraciones.c,37 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Configuraciones.c,38 :: 		TMR0L = 131;
	MOVLW       131
	MOVWF       TMR0L+0 
;Configuraciones.c,39 :: 		ms_ticks++;
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
;Configuraciones.c,40 :: 		}
L_INTERRUPT_ISR0:
;Configuraciones.c,42 :: 		INTERRUPT();
	CALL        _INTERRUPT+0, 0
;Configuraciones.c,43 :: 		}
L_end_INTERRUPT_ISR:
	RETURN      0
; end of _INTERRUPT_ISR

_INTERRUPT:

;Configuraciones.c,45 :: 		void INTERRUPT(){
;Configuraciones.c,48 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT1
;Configuraciones.c,49 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,50 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,51 :: 		linea_detectada = 1;        //Activamos bandera global
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,52 :: 		}
L_INTERRUPT1:
;Configuraciones.c,54 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT2
;Configuraciones.c,55 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,56 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,57 :: 		linea_detectada = 1;
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,58 :: 		}
L_INTERRUPT2:
;Configuraciones.c,59 :: 		}
L_end_INTERRUPT:
L__INTERRUPT169:
	RETFIE      1
; end of _INTERRUPT

_SELEC:

;Configuraciones.c,62 :: 		void SELEC(){
;Configuraciones.c,64 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC171:
	BZ          L__SELEC172
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC171
L__SELEC172:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;Configuraciones.c,66 :: 		switch(seleccion){
	GOTO        L_SELEC3
;Configuraciones.c,67 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC5:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC173
	BCF         PORTA+0, 5 
	GOTO        L__SELEC174
L__SELEC173:
	BSF         PORTA+0, 5 
L__SELEC174:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC175
	BCF         PORTA+0, 7 
	GOTO        L__SELEC176
L__SELEC175:
	BSF         PORTA+0, 7 
L__SELEC176:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC177
	BCF         PORTA+0, 6 
	GOTO        L__SELEC178
L__SELEC177:
	BSF         PORTA+0, 6 
L__SELEC178:
;Configuraciones.c,70 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,72 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC6:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC179
	BCF         PORTA+0, 5 
	GOTO        L__SELEC180
L__SELEC179:
	BSF         PORTA+0, 5 
L__SELEC180:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC181
	BCF         PORTA+0, 4 
	GOTO        L__SELEC182
L__SELEC181:
	BSF         PORTA+0, 4 
L__SELEC182:
;Configuraciones.c,73 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC9
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC9
L__SELEC155:
;Configuraciones.c,74 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,75 :: 		}
	GOTO        L_SELEC10
L_SELEC9:
;Configuraciones.c,76 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC13
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC13
L__SELEC154:
;Configuraciones.c,77 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,78 :: 		delay_ms(100);
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
;Configuraciones.c,79 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,80 :: 		delay_ms(100);
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
;Configuraciones.c,81 :: 		}
	GOTO        L_SELEC16
L_SELEC13:
;Configuraciones.c,82 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC17
;Configuraciones.c,83 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,84 :: 		delay_ms(100);
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
;Configuraciones.c,85 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,86 :: 		delay_ms(100);
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
;Configuraciones.c,87 :: 		}
	GOTO        L_SELEC20
L_SELEC17:
;Configuraciones.c,88 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC21
;Configuraciones.c,89 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,90 :: 		delay_ms(100);
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
;Configuraciones.c,91 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,92 :: 		delay_ms(100);
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
;Configuraciones.c,93 :: 		}
L_SELEC21:
L_SELEC20:
L_SELEC16:
L_SELEC10:
;Configuraciones.c,95 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,97 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC24:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC183
	BCF         PORTA+0, 5 
	GOTO        L__SELEC184
L__SELEC183:
	BSF         PORTA+0, 5 
L__SELEC184:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC185
	BCF         PORTA+0, 4 
	GOTO        L__SELEC186
L__SELEC185:
	BSF         PORTA+0, 4 
L__SELEC186:
;Configuraciones.c,98 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,100 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,102 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC25:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC187
	BCF         PORTA+0, 6 
	GOTO        L__SELEC188
L__SELEC187:
	BSF         PORTA+0, 6 
L__SELEC188:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC189
	BCF         PORTA+0, 5 
	GOTO        L__SELEC190
L__SELEC189:
	BSF         PORTA+0, 5 
L__SELEC190:
;Configuraciones.c,103 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,104 :: 		delay_ms(2000);
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
;Configuraciones.c,105 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,106 :: 		delay_ms(500);
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
;Configuraciones.c,111 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,113 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC28:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC191
	BCF         PORTA+0, 7 
	GOTO        L__SELEC192
L__SELEC191:
	BSF         PORTA+0, 7 
L__SELEC192:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC193
	BCF         PORTA+0, 4 
	GOTO        L__SELEC194
L__SELEC193:
	BSF         PORTA+0, 4 
L__SELEC194:
;Configuraciones.c,114 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,115 :: 		delay_ms(250);
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
;Configuraciones.c,116 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,117 :: 		delay_ms(4000);
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
;Configuraciones.c,118 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,120 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC31:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC195
	BCF         PORTA+0, 5 
	GOTO        L__SELEC196
L__SELEC195:
	BSF         PORTA+0, 5 
L__SELEC196:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC197
	BCF         PORTA+0, 4 
	GOTO        L__SELEC198
L__SELEC197:
	BSF         PORTA+0, 4 
L__SELEC198:
;Configuraciones.c,121 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,122 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,124 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC32:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC199
	BCF         PORTA+0, 7 
	GOTO        L__SELEC200
L__SELEC199:
	BSF         PORTA+0, 7 
L__SELEC200:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC201
	BCF         PORTA+0, 4 
	GOTO        L__SELEC202
L__SELEC201:
	BSF         PORTA+0, 4 
L__SELEC202:
;Configuraciones.c,125 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,127 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,129 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC33:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC203
	BCF         PORTA+0, 7 
	GOTO        L__SELEC204
L__SELEC203:
	BSF         PORTA+0, 7 
L__SELEC204:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC205
	BCF         PORTA+0, 5 
	GOTO        L__SELEC206
L__SELEC205:
	BSF         PORTA+0, 5 
L__SELEC206:
	BSF         PORTA+0, 4 
;Configuraciones.c,131 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,133 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC34:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC207
	BCF         PORTA+0, 5 
	GOTO        L__SELEC208
L__SELEC207:
	BSF         PORTA+0, 5 
L__SELEC208:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC209
	BCF         PORTA+0, 7 
	GOTO        L__SELEC210
L__SELEC209:
	BSF         PORTA+0, 7 
L__SELEC210:
;Configuraciones.c,135 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,137 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC35:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC211
	BCF         PORTA+0, 6 
	GOTO        L__SELEC212
L__SELEC211:
	BSF         PORTA+0, 6 
L__SELEC212:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC213
	BCF         PORTA+0, 7 
	GOTO        L__SELEC214
L__SELEC213:
	BSF         PORTA+0, 7 
L__SELEC214:
;Configuraciones.c,140 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,142 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC36:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC215
	BCF         PORTA+0, 4 
	GOTO        L__SELEC216
L__SELEC215:
	BSF         PORTA+0, 4 
L__SELEC216:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC217
	BCF         PORTA+0, 5 
	GOTO        L__SELEC218
L__SELEC217:
	BSF         PORTA+0, 5 
L__SELEC218:
;Configuraciones.c,143 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,145 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC37:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC219
	BCF         PORTA+0, 7 
	GOTO        L__SELEC220
L__SELEC219:
	BSF         PORTA+0, 7 
L__SELEC220:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC221
	BCF         PORTA+0, 6 
	GOTO        L__SELEC222
L__SELEC221:
	BSF         PORTA+0, 6 
L__SELEC222:
	BSF         PORTA+0, 5 
;Configuraciones.c,146 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,148 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC38:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC223
	BCF         PORTA+0, 4 
	GOTO        L__SELEC224
L__SELEC223:
	BSF         PORTA+0, 4 
L__SELEC224:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC225
	BCF         PORTA+0, 7 
	GOTO        L__SELEC226
L__SELEC225:
	BSF         PORTA+0, 7 
L__SELEC226:
;Configuraciones.c,149 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,151 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC39:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC227
	BCF         PORTA+0, 5 
	GOTO        L__SELEC228
L__SELEC227:
	BSF         PORTA+0, 5 
L__SELEC228:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC229
	BCF         PORTA+0, 4 
	GOTO        L__SELEC230
L__SELEC229:
	BSF         PORTA+0, 4 
L__SELEC230:
	BSF         PORTA+0, 7 
;Configuraciones.c,152 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,154 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC40:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC231
	BCF         PORTA+0, 5 
	GOTO        L__SELEC232
L__SELEC231:
	BSF         PORTA+0, 5 
L__SELEC232:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC233
	BCF         PORTA+0, 4 
	GOTO        L__SELEC234
L__SELEC233:
	BSF         PORTA+0, 4 
L__SELEC234:
	BSF         PORTA+0, 6 
;Configuraciones.c,155 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,157 :: 		default: L0=L1=L2=L3=0;
L_SELEC41:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC235
	BCF         PORTA+0, 5 
	GOTO        L__SELEC236
L__SELEC235:
	BSF         PORTA+0, 5 
L__SELEC236:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC237
	BCF         PORTA+0, 7 
	GOTO        L__SELEC238
L__SELEC237:
	BSF         PORTA+0, 7 
L__SELEC238:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC239
	BCF         PORTA+0, 6 
	GOTO        L__SELEC240
L__SELEC239:
	BSF         PORTA+0, 6 
L__SELEC240:
;Configuraciones.c,158 :: 		}
	GOTO        L_SELEC4
L_SELEC3:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC241
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC241:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC5
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC242
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC242:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC6
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC243
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC243:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC24
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC244
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC244:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC245
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC245:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC246
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC246:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC247
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC247:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC248
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC248:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC249
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC249:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC250
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC250:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC251
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC251:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC252
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC252:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC253
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC253:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC254
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC254:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC255
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC255:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	GOTO        L_SELEC41
L_SELEC4:
;Configuraciones.c,161 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,165 :: 		void combate_estado() {
;Configuraciones.c,166 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado42
;Configuraciones.c,167 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,168 :: 		LOGICA_LINEA();
	CALL        _LOGICA_LINEA+0, 0
;Configuraciones.c,169 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,170 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,171 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,172 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,173 :: 		}
L_combate_estado42:
;Configuraciones.c,174 :: 		switch (estado_combate) {
	GOTO        L_combate_estado43
;Configuraciones.c,175 :: 		case CMB_ESPERA:
L_combate_estado45:
;Configuraciones.c,176 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado48
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado48
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado48
L__combate_estado163:
;Configuraciones.c,177 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,178 :: 		}
	GOTO        L_combate_estado49
L_combate_estado48:
;Configuraciones.c,179 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado52
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado52
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado52
L__combate_estado162:
;Configuraciones.c,180 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,181 :: 		}
	GOTO        L_combate_estado53
L_combate_estado52:
;Configuraciones.c,182 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado56
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado56
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado56
L__combate_estado161:
;Configuraciones.c,183 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,184 :: 		}
	GOTO        L_combate_estado57
L_combate_estado56:
;Configuraciones.c,185 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado60
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado60
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado60
L__combate_estado160:
;Configuraciones.c,186 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,187 :: 		}
	GOTO        L_combate_estado61
L_combate_estado60:
;Configuraciones.c,188 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado64
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado64
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado64
L__combate_estado159:
;Configuraciones.c,189 :: 		estado_combate = CMB_DER;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,190 :: 		}
	GOTO        L_combate_estado65
L_combate_estado64:
;Configuraciones.c,191 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado68
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado68
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado68
L__combate_estado158:
;Configuraciones.c,192 :: 		estado_combate = CMB_LIBRE;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,193 :: 		}
	GOTO        L_combate_estado69
L_combate_estado68:
;Configuraciones.c,194 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado72
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado72
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado72
L__combate_estado157:
;Configuraciones.c,195 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,196 :: 		}
	GOTO        L_combate_estado73
L_combate_estado72:
;Configuraciones.c,197 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado76
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado76
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado76
L__combate_estado156:
;Configuraciones.c,198 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,199 :: 		}
	GOTO        L_combate_estado77
L_combate_estado76:
;Configuraciones.c,201 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,202 :: 		}
L_combate_estado77:
L_combate_estado73:
L_combate_estado69:
L_combate_estado65:
L_combate_estado61:
L_combate_estado57:
L_combate_estado53:
L_combate_estado49:
;Configuraciones.c,203 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,205 :: 		case CMB_REC:
L_combate_estado78:
;Configuraciones.c,206 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado257
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado258
L__combate_estado257:
	BSF         PORTA+0, 5 
L__combate_estado258:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado259
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado260
L__combate_estado259:
	BSF         PORTA+0, 7 
L__combate_estado260:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado261
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado262
L__combate_estado261:
	BSF         PORTA+0, 6 
L__combate_estado262:
;Configuraciones.c,207 :: 		REC_M();
	CALL        _REC_M+0, 0
;Configuraciones.c,208 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,210 :: 		case CMB_IZQ:
L_combate_estado79:
;Configuraciones.c,211 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado263
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado264
L__combate_estado263:
	BSF         PORTA+0, 5 
L__combate_estado264:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado265
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado266
L__combate_estado265:
	BSF         PORTA+0, 7 
L__combate_estado266:
;Configuraciones.c,212 :: 		IZQ_M();
	CALL        _IZQ_M+0, 0
;Configuraciones.c,213 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,215 :: 		case CMB_HIT:
L_combate_estado80:
;Configuraciones.c,216 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado267
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado268
L__combate_estado267:
	BSF         PORTA+0, 5 
L__combate_estado268:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado269
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado270
L__combate_estado269:
	BSF         PORTA+0, 6 
L__combate_estado270:
;Configuraciones.c,217 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,218 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,220 :: 		case CMB_IZQ_GOLPE:
L_combate_estado81:
;Configuraciones.c,221 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado271
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado272
L__combate_estado271:
	BSF         PORTA+0, 6 
L__combate_estado272:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado273
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado274
L__combate_estado273:
	BSF         PORTA+0, 5 
L__combate_estado274:
;Configuraciones.c,222 :: 		IZQ_GIRO();
	CALL        _IZQ_GIRO+0, 0
;Configuraciones.c,223 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,225 :: 		case CMB_DER:
L_combate_estado82:
;Configuraciones.c,226 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado275
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado276
L__combate_estado275:
	BSF         PORTA+0, 7 
L__combate_estado276:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado277
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado278
L__combate_estado277:
	BSF         PORTA+0, 6 
L__combate_estado278:
;Configuraciones.c,227 :: 		DER_M();
	CALL        _DER_M+0, 0
;Configuraciones.c,228 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,230 :: 		case CMB_LIBRE:
L_combate_estado83:
;Configuraciones.c,231 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado279
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado280
L__combate_estado279:
	BSF         PORTA+0, 6 
L__combate_estado280:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado281
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado282
L__combate_estado281:
	BSF         PORTA+0, 7 
L__combate_estado282:
;Configuraciones.c,232 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,233 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,234 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,236 :: 		case CMB_DER_HIT:
L_combate_estado84:
;Configuraciones.c,237 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado283
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado284
L__combate_estado283:
	BSF         PORTA+0, 7 
L__combate_estado284:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado285
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado286
L__combate_estado285:
	BSF         PORTA+0, 6 
L__combate_estado286:
;Configuraciones.c,238 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,239 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado85:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado85
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado85
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado85
;Configuraciones.c,240 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,241 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_combate_estado86:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado86
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado86
	NOP
	NOP
;Configuraciones.c,242 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,243 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,245 :: 		case CMB_HIT_FULL:
L_combate_estado87:
;Configuraciones.c,246 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado287
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado288
L__combate_estado287:
	BSF         PORTA+0, 7 
L__combate_estado288:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado289
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado290
L__combate_estado289:
	BSF         PORTA+0, 6 
L__combate_estado290:
	BSF         PORTA+0, 4 
;Configuraciones.c,247 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,248 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,249 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,251 :: 		default:
L_combate_estado88:
;Configuraciones.c,252 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,253 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,254 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,255 :: 		}
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
	GOTO        L_combate_estado87
	GOTO        L_combate_estado88
L_combate_estado44:
;Configuraciones.c,256 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,258 :: 		void Start(){
;Configuraciones.c,259 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,260 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,261 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,262 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,263 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,264 :: 		return;
;Configuraciones.c,265 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,266 :: 		void Stop(){
;Configuraciones.c,267 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,268 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,269 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,270 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,271 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,272 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,279 :: 		void REC(){
;Configuraciones.c,281 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,283 :: 		PWM1_Set_Duty(200); // IN1 = PWM
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,284 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,287 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,288 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,289 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,290 :: 		void DER(){
;Configuraciones.c,291 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,292 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,293 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,295 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,296 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,298 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_DER_Z:

;Configuraciones.c,299 :: 		void DER_Z(){
;Configuraciones.c,300 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,301 :: 		PWM1_Set_Duty(230);
	MOVLW       230
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,302 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,304 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,305 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,308 :: 		}
L_end_DER_Z:
	RETURN      0
; end of _DER_Z

_IZQ:

;Configuraciones.c,311 :: 		void IZQ(){
;Configuraciones.c,312 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,313 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,314 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,316 :: 		PWM3_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,317 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,318 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;Configuraciones.c,320 :: 		void REV(){
;Configuraciones.c,321 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,322 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,323 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,324 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,325 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,327 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,329 :: 		void LIBRE(){
;Configuraciones.c,331 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,332 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,333 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,334 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,335 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,339 :: 		void GIRO180(){
;Configuraciones.c,340 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,342 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,343 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,345 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,346 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,347 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18089:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18089
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18089
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18089
;Configuraciones.c,348 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,351 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,353 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,354 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,355 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36090:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36090
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36090
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36090
	NOP
	NOP
;Configuraciones.c,356 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,358 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,360 :: 		void BRAKE(){
;Configuraciones.c,362 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,363 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,364 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,365 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,366 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,369 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,370 :: 		void HARD(){
;Configuraciones.c,371 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,372 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,373 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,374 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,377 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,378 :: 		void PUSH(){
;Configuraciones.c,379 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,381 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,382 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,385 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,386 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,388 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,389 :: 		void HIT(){
;Configuraciones.c,391 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,392 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT91:
	DECFSZ      R13, 1, 1
	BRA         L_HIT91
	DECFSZ      R12, 1, 1
	BRA         L_HIT91
	NOP
	NOP
;Configuraciones.c,393 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,394 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT92:
	DECFSZ      R13, 1, 1
	BRA         L_HIT92
	DECFSZ      R12, 1, 1
	BRA         L_HIT92
	DECFSZ      R11, 1, 1
	BRA         L_HIT92
	NOP
	NOP
;Configuraciones.c,395 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_HIT_NO_BLOQUEANTE:

;Configuraciones.c,396 :: 		void HIT_NO_BLOQUEANTE(){
;Configuraciones.c,397 :: 		unsigned long now = millis(); // Usa tu función de tiempo
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+0 
	MOVF        R1, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+1 
	MOVF        R2, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+2 
	MOVF        R3, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+3 
;Configuraciones.c,399 :: 		switch (estado_movimiento) {
	GOTO        L_HIT_NO_BLOQUEANTE93
;Configuraciones.c,400 :: 		case MOV_IDLE:
L_HIT_NO_BLOQUEANTE95:
;Configuraciones.c,401 :: 		PUSH(); // Avanza rápido
	CALL        _PUSH+0, 0
;Configuraciones.c,402 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,403 :: 		estado_movimiento = MOV_HIT_REC;
	MOVLW       1
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,404 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE94
;Configuraciones.c,406 :: 		case MOV_HIT_REC:
L_HIT_NO_BLOQUEANTE96:
;Configuraciones.c,408 :: 		if (now - tiempo_movimiento >= 20) {
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
	GOTO        L__HIT_NO_BLOQUEANTE306
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE306
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE306
	MOVLW       20
	SUBWF       R1, 0 
L__HIT_NO_BLOQUEANTE306:
	BTFSS       STATUS+0, 0 
	GOTO        L_HIT_NO_BLOQUEANTE97
;Configuraciones.c,409 :: 		PUSH(); // Empuje fuerte
	CALL        _PUSH+0, 0
;Configuraciones.c,410 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,411 :: 		estado_movimiento = MOV_HIT_PUSH;
	MOVLW       2
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,412 :: 		}
L_HIT_NO_BLOQUEANTE97:
;Configuraciones.c,413 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE94
;Configuraciones.c,415 :: 		case MOV_HIT_PUSH:
L_HIT_NO_BLOQUEANTE98:
;Configuraciones.c,417 :: 		if (S2 == 0) {
	BTFSC       PORTC+0, 6 
	GOTO        L_HIT_NO_BLOQUEANTE99
;Configuraciones.c,419 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,420 :: 		tiempo_movimiento = now; // Actualiza tiempo si quieres tiempo máximo de empuje
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,421 :: 		} else {
	GOTO        L_HIT_NO_BLOQUEANTE100
L_HIT_NO_BLOQUEANTE99:
;Configuraciones.c,423 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,424 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,425 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,426 :: 		}
L_HIT_NO_BLOQUEANTE100:
;Configuraciones.c,433 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE94
;Configuraciones.c,434 :: 		}
L_HIT_NO_BLOQUEANTE93:
	MOVF        _estado_movimiento+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE95
	MOVF        _estado_movimiento+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE96
	MOVF        _estado_movimiento+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE98
L_HIT_NO_BLOQUEANTE94:
;Configuraciones.c,435 :: 		}
L_end_HIT_NO_BLOQUEANTE:
	RETURN      0
; end of _HIT_NO_BLOQUEANTE

_IZQ_M:

;Configuraciones.c,436 :: 		void IZQ_M(){
;Configuraciones.c,437 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_M_now_L0+3 
;Configuraciones.c,438 :: 		switch (sub_cmb_izq) {
	GOTO        L_IZQ_M101
;Configuraciones.c,440 :: 		case SUB_IZQ_INICIO:
L_IZQ_M103:
;Configuraciones.c,441 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,442 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,443 :: 		sub_cmb_izq = SUB_IZQ_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,444 :: 		break;
	GOTO        L_IZQ_M102
;Configuraciones.c,446 :: 		case SUB_IZQ_GIRO:
L_IZQ_M104:
;Configuraciones.c,447 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M308
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M308
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M308
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M308:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M105
;Configuraciones.c,448 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,449 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,450 :: 		sub_cmb_izq = SUB_IZQ_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,451 :: 		} else {
	GOTO        L_IZQ_M106
L_IZQ_M105:
;Configuraciones.c,452 :: 		IZQ(); // si necesitas mantener comando
	CALL        _IZQ+0, 0
;Configuraciones.c,453 :: 		}
L_IZQ_M106:
;Configuraciones.c,454 :: 		break;
	GOTO        L_IZQ_M102
;Configuraciones.c,456 :: 		case SUB_IZQ_HARD:
L_IZQ_M107:
;Configuraciones.c,457 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M309
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M309
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M309
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M309:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M108
;Configuraciones.c,458 :: 		sub_cmb_izq = SUB_IZQ_INICIO;
	CLRF        _sub_cmb_izq+0 
;Configuraciones.c,459 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,460 :: 		} else {
	GOTO        L_IZQ_M109
L_IZQ_M108:
;Configuraciones.c,461 :: 		HARD(); // si necesitas mantener comando
	CALL        _HARD+0, 0
;Configuraciones.c,462 :: 		}
L_IZQ_M109:
;Configuraciones.c,463 :: 		break;
	GOTO        L_IZQ_M102
;Configuraciones.c,464 :: 		}
L_IZQ_M101:
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M103
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M104
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M107
L_IZQ_M102:
;Configuraciones.c,465 :: 		}
L_end_IZQ_M:
	RETURN      0
; end of _IZQ_M

_DER_M:

;Configuraciones.c,466 :: 		void DER_M() {
;Configuraciones.c,467 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       DER_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       DER_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       DER_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       DER_M_now_L0+3 
;Configuraciones.c,469 :: 		switch (sub_cmb_der) {
	GOTO        L_DER_M110
;Configuraciones.c,470 :: 		case SUB_DER_INICIO:
L_DER_M112:
;Configuraciones.c,471 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,472 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,473 :: 		sub_cmb_der = SUB_DER_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,474 :: 		break;
	GOTO        L_DER_M111
;Configuraciones.c,476 :: 		case SUB_DER_GIRO:
L_DER_M113:
;Configuraciones.c,478 :: 		if (S6 ==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M114
;Configuraciones.c,479 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,480 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,481 :: 		break;
	GOTO        L_DER_M111
;Configuraciones.c,482 :: 		}
L_DER_M114:
;Configuraciones.c,483 :: 		if (now - t_cmb_der >= 100) {
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
	GOTO        L__DER_M311
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M311
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M311
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M311:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M115
;Configuraciones.c,484 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,485 :: 		t_cmb_der = now;
	MOVF        DER_M_now_L0+0, 0 
	MOVWF       _t_cmb_der+0 
	MOVF        DER_M_now_L0+1, 0 
	MOVWF       _t_cmb_der+1 
	MOVF        DER_M_now_L0+2, 0 
	MOVWF       _t_cmb_der+2 
	MOVF        DER_M_now_L0+3, 0 
	MOVWF       _t_cmb_der+3 
;Configuraciones.c,486 :: 		sub_cmb_der = SUB_DER_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_der+0 
;Configuraciones.c,487 :: 		} else {
	GOTO        L_DER_M116
L_DER_M115:
;Configuraciones.c,488 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,489 :: 		}
L_DER_M116:
;Configuraciones.c,490 :: 		break;
	GOTO        L_DER_M111
;Configuraciones.c,492 :: 		case SUB_DER_HARD:
L_DER_M117:
;Configuraciones.c,494 :: 		if (S6==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M118
;Configuraciones.c,495 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,496 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,497 :: 		break;
	GOTO        L_DER_M111
;Configuraciones.c,498 :: 		}
L_DER_M118:
;Configuraciones.c,499 :: 		if (now - t_cmb_der >= 100) {
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
	GOTO        L__DER_M312
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M312
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M312
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M312:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M119
;Configuraciones.c,500 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,501 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,502 :: 		} else {
	GOTO        L_DER_M120
L_DER_M119:
;Configuraciones.c,503 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,504 :: 		}
L_DER_M120:
;Configuraciones.c,505 :: 		break;
	GOTO        L_DER_M111
;Configuraciones.c,506 :: 		}
L_DER_M110:
	MOVF        _sub_cmb_der+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M112
	MOVF        _sub_cmb_der+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M113
	MOVF        _sub_cmb_der+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M117
L_DER_M111:
;Configuraciones.c,507 :: 		}
L_end_DER_M:
	RETURN      0
; end of _DER_M

_REC_M:

;Configuraciones.c,508 :: 		void REC_M() {
;Configuraciones.c,509 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       REC_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       REC_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       REC_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       REC_M_now_L0+3 
;Configuraciones.c,510 :: 		switch (sub_cmb_rec) {
	GOTO        L_REC_M121
;Configuraciones.c,511 :: 		case SUB_REC_INICIO:
L_REC_M123:
;Configuraciones.c,512 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,513 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,514 :: 		sub_cmb_rec = SUB_REC_REC;
	MOVLW       1
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,515 :: 		break;
	GOTO        L_REC_M122
;Configuraciones.c,517 :: 		case SUB_REC_REC:
L_REC_M124:
;Configuraciones.c,518 :: 		if (now - t_cmb_rec >= 50) { // Espera 250 ms
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
	GOTO        L__REC_M314
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M314
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M314
	MOVLW       50
	SUBWF       R1, 0 
L__REC_M314:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M125
;Configuraciones.c,519 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,520 :: 		t_cmb_rec = now;
	MOVF        REC_M_now_L0+0, 0 
	MOVWF       _t_cmb_rec+0 
	MOVF        REC_M_now_L0+1, 0 
	MOVWF       _t_cmb_rec+1 
	MOVF        REC_M_now_L0+2, 0 
	MOVWF       _t_cmb_rec+2 
	MOVF        REC_M_now_L0+3, 0 
	MOVWF       _t_cmb_rec+3 
;Configuraciones.c,521 :: 		sub_cmb_rec = SUB_REC_LIBRE;
	MOVLW       2
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,522 :: 		}
L_REC_M125:
;Configuraciones.c,523 :: 		break;
	GOTO        L_REC_M122
;Configuraciones.c,525 :: 		case SUB_REC_LIBRE:
L_REC_M126:
;Configuraciones.c,526 :: 		if (now - t_cmb_rec >= 100) { // Espera 200 ms
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
	GOTO        L__REC_M315
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M315
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M315
	MOVLW       100
	SUBWF       R1, 0 
L__REC_M315:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M127
;Configuraciones.c,527 :: 		sub_cmb_rec = SUB_REC_FIN;
	MOVLW       3
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,528 :: 		}
L_REC_M127:
;Configuraciones.c,529 :: 		break;
	GOTO        L_REC_M122
;Configuraciones.c,531 :: 		case SUB_REC_FIN:
L_REC_M128:
;Configuraciones.c,532 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,533 :: 		sub_cmb_rec = SUB_REC_INICIO; // Reinicia para próxima vez
	CLRF        _sub_cmb_rec+0 
;Configuraciones.c,534 :: 		break;
	GOTO        L_REC_M122
;Configuraciones.c,535 :: 		}
L_REC_M121:
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M123
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M124
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M126
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M128
L_REC_M122:
;Configuraciones.c,536 :: 		}
L_end_REC_M:
	RETURN      0
; end of _REC_M

_IZQ_GIRO:

;Configuraciones.c,537 :: 		void IZQ_GIRO(){
;Configuraciones.c,538 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_GIRO_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_GIRO_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_GIRO_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_GIRO_now_L0+3 
;Configuraciones.c,539 :: 		switch (sub_cmb_izq_giro) {
	GOTO        L_IZQ_GIRO129
;Configuraciones.c,540 :: 		case SUB_IZQ_GIRO:
L_IZQ_GIRO131:
;Configuraciones.c,542 :: 		IZQ(); // función de giro izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,543 :: 		t_cmb_izq_giro = now;
	MOVF        IZQ_GIRO_now_L0+0, 0 
	MOVWF       _t_cmb_izq_giro+0 
	MOVF        IZQ_GIRO_now_L0+1, 0 
	MOVWF       _t_cmb_izq_giro+1 
	MOVF        IZQ_GIRO_now_L0+2, 0 
	MOVWF       _t_cmb_izq_giro+2 
	MOVF        IZQ_GIRO_now_L0+3, 0 
	MOVWF       _t_cmb_izq_giro+3 
;Configuraciones.c,544 :: 		sub_cmb_izq_giro = SUB_IZQ_BUSCAR_CENTRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,545 :: 		break;
	GOTO        L_IZQ_GIRO130
;Configuraciones.c,547 :: 		case SUB_IZQ_BUSCAR_CENTRO:
L_IZQ_GIRO132:
;Configuraciones.c,549 :: 		if (SL1 == 0 && S2 == 1 && S6 == 0) {
	BTFSC       PORTC+0, 0 
	GOTO        L_IZQ_GIRO135
	BTFSS       PORTC+0, 6 
	GOTO        L_IZQ_GIRO135
	BTFSC       PORTB+0, 4 
	GOTO        L_IZQ_GIRO135
L__IZQ_GIRO164:
;Configuraciones.c,550 :: 		sub_cmb_izq_giro = SUB_IZQ_ATAQUE;
	MOVLW       2
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,551 :: 		}
L_IZQ_GIRO135:
;Configuraciones.c,552 :: 		break;
	GOTO        L_IZQ_GIRO130
;Configuraciones.c,554 :: 		case SUB_IZQ_ATAQUE:
L_IZQ_GIRO136:
;Configuraciones.c,556 :: 		HIT_NO_BLOQUEANTE(); // función de ataque
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,557 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,558 :: 		sub_cmb_izq_giro = SUB_IZQ_GIRO; // Reinicia para próxima vez
	MOVLW       1
	MOVWF       _sub_cmb_izq_giro+0 
;Configuraciones.c,559 :: 		break;
	GOTO        L_IZQ_GIRO130
;Configuraciones.c,560 :: 		}
L_IZQ_GIRO129:
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO131
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO132
	MOVF        _sub_cmb_izq_giro+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_GIRO136
L_IZQ_GIRO130:
;Configuraciones.c,561 :: 		}
L_end_IZQ_GIRO:
	RETURN      0
; end of _IZQ_GIRO

_LOGICA_LINEA:

;Configuraciones.c,562 :: 		void LOGICA_LINEA(){
;Configuraciones.c,563 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA139
	BTFSS       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA139
L__LOGICA_LINEA166:
;Configuraciones.c,564 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,565 :: 		}
	GOTO        L_LOGICA_LINEA140
L_LOGICA_LINEA139:
;Configuraciones.c,566 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA143
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA143
L__LOGICA_LINEA165:
;Configuraciones.c,567 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,568 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA144:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA144
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA144
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA144
	NOP
;Configuraciones.c,569 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,570 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA145:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA145
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA145
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA145
	NOP
;Configuraciones.c,571 :: 		}
	GOTO        L_LOGICA_LINEA146
L_LOGICA_LINEA143:
;Configuraciones.c,572 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA147
;Configuraciones.c,573 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,574 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA148:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA148
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA148
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA148
	NOP
;Configuraciones.c,575 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,576 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA149:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA149
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA149
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA149
	NOP
;Configuraciones.c,577 :: 		}
	GOTO        L_LOGICA_LINEA150
L_LOGICA_LINEA147:
;Configuraciones.c,578 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA151
;Configuraciones.c,579 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,580 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA152:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA152
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA152
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA152
	NOP
;Configuraciones.c,581 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,582 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA153:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA153
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA153
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA153
	NOP
;Configuraciones.c,583 :: 		}
L_LOGICA_LINEA151:
L_LOGICA_LINEA150:
L_LOGICA_LINEA146:
L_LOGICA_LINEA140:
;Configuraciones.c,584 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
