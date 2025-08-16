
_INTERRUPT_ISR:

;Configuraciones.c,29 :: 		void INTERRUPT_ISR(void) {
;Configuraciones.c,31 :: 		if (INTCON.TMR0IF) {
	BTFSS       INTCON+0, 2 
	GOTO        L_INTERRUPT_ISR0
;Configuraciones.c,32 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Configuraciones.c,33 :: 		TMR0L = 131;
	MOVLW       131
	MOVWF       TMR0L+0 
;Configuraciones.c,34 :: 		ms_ticks++;
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
;Configuraciones.c,35 :: 		}
L_INTERRUPT_ISR0:
;Configuraciones.c,37 :: 		INTERRUPT();
	CALL        _INTERRUPT+0, 0
;Configuraciones.c,38 :: 		}
L_end_INTERRUPT_ISR:
	RETURN      0
; end of _INTERRUPT_ISR

_INTERRUPT:

;Configuraciones.c,40 :: 		void INTERRUPT(){
;Configuraciones.c,43 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT1
;Configuraciones.c,44 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,45 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,46 :: 		linea_detectada = 1;        //Activamos bandera global
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,47 :: 		}
L_INTERRUPT1:
;Configuraciones.c,49 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT2
;Configuraciones.c,50 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,51 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,52 :: 		linea_detectada = 1;
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,53 :: 		}
L_INTERRUPT2:
;Configuraciones.c,54 :: 		}
L_end_INTERRUPT:
L__INTERRUPT162:
	RETFIE      1
; end of _INTERRUPT

_SELEC:

;Configuraciones.c,57 :: 		void SELEC(){
;Configuraciones.c,59 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC164:
	BZ          L__SELEC165
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC164
L__SELEC165:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;Configuraciones.c,61 :: 		switch(seleccion){
	GOTO        L_SELEC3
;Configuraciones.c,62 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC5:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC166
	BCF         PORTA+0, 5 
	GOTO        L__SELEC167
L__SELEC166:
	BSF         PORTA+0, 5 
L__SELEC167:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC168
	BCF         PORTA+0, 7 
	GOTO        L__SELEC169
L__SELEC168:
	BSF         PORTA+0, 7 
L__SELEC169:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC170
	BCF         PORTA+0, 6 
	GOTO        L__SELEC171
L__SELEC170:
	BSF         PORTA+0, 6 
L__SELEC171:
;Configuraciones.c,65 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,67 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC6:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC172
	BCF         PORTA+0, 5 
	GOTO        L__SELEC173
L__SELEC172:
	BSF         PORTA+0, 5 
L__SELEC173:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC174
	BCF         PORTA+0, 4 
	GOTO        L__SELEC175
L__SELEC174:
	BSF         PORTA+0, 4 
L__SELEC175:
;Configuraciones.c,68 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC9
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC9
L__SELEC149:
;Configuraciones.c,69 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,70 :: 		}
	GOTO        L_SELEC10
L_SELEC9:
;Configuraciones.c,71 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC13
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC13
L__SELEC148:
;Configuraciones.c,72 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,73 :: 		delay_ms(100);
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
;Configuraciones.c,74 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,75 :: 		delay_ms(100);
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
;Configuraciones.c,76 :: 		}
	GOTO        L_SELEC16
L_SELEC13:
;Configuraciones.c,77 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC17
;Configuraciones.c,78 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,79 :: 		delay_ms(100);
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
;Configuraciones.c,80 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,81 :: 		delay_ms(100);
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
;Configuraciones.c,82 :: 		}
	GOTO        L_SELEC20
L_SELEC17:
;Configuraciones.c,83 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC21
;Configuraciones.c,84 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,85 :: 		delay_ms(100);
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
;Configuraciones.c,86 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,87 :: 		delay_ms(100);
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
;Configuraciones.c,88 :: 		}
L_SELEC21:
L_SELEC20:
L_SELEC16:
L_SELEC10:
;Configuraciones.c,90 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,92 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC24:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC176
	BCF         PORTA+0, 5 
	GOTO        L__SELEC177
L__SELEC176:
	BSF         PORTA+0, 5 
L__SELEC177:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC178
	BCF         PORTA+0, 4 
	GOTO        L__SELEC179
L__SELEC178:
	BSF         PORTA+0, 4 
L__SELEC179:
;Configuraciones.c,93 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,95 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,97 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC25:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC180
	BCF         PORTA+0, 6 
	GOTO        L__SELEC181
L__SELEC180:
	BSF         PORTA+0, 6 
L__SELEC181:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC182
	BCF         PORTA+0, 5 
	GOTO        L__SELEC183
L__SELEC182:
	BSF         PORTA+0, 5 
L__SELEC183:
;Configuraciones.c,98 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,99 :: 		delay_ms(2000);
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
;Configuraciones.c,100 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,101 :: 		delay_ms(500);
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
;Configuraciones.c,106 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,108 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC28:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC184
	BCF         PORTA+0, 7 
	GOTO        L__SELEC185
L__SELEC184:
	BSF         PORTA+0, 7 
L__SELEC185:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC186
	BCF         PORTA+0, 4 
	GOTO        L__SELEC187
L__SELEC186:
	BSF         PORTA+0, 4 
L__SELEC187:
;Configuraciones.c,109 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,110 :: 		delay_ms(250);
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
;Configuraciones.c,111 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,112 :: 		delay_ms(4000);
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
;Configuraciones.c,113 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,115 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC31:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC188
	BCF         PORTA+0, 5 
	GOTO        L__SELEC189
L__SELEC188:
	BSF         PORTA+0, 5 
L__SELEC189:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC190
	BCF         PORTA+0, 4 
	GOTO        L__SELEC191
L__SELEC190:
	BSF         PORTA+0, 4 
L__SELEC191:
;Configuraciones.c,116 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,117 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,119 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC32:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC192
	BCF         PORTA+0, 7 
	GOTO        L__SELEC193
L__SELEC192:
	BSF         PORTA+0, 7 
L__SELEC193:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC194
	BCF         PORTA+0, 4 
	GOTO        L__SELEC195
L__SELEC194:
	BSF         PORTA+0, 4 
L__SELEC195:
;Configuraciones.c,120 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,122 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,124 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC33:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC196
	BCF         PORTA+0, 7 
	GOTO        L__SELEC197
L__SELEC196:
	BSF         PORTA+0, 7 
L__SELEC197:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC198
	BCF         PORTA+0, 5 
	GOTO        L__SELEC199
L__SELEC198:
	BSF         PORTA+0, 5 
L__SELEC199:
	BSF         PORTA+0, 4 
;Configuraciones.c,126 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,128 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC34:
	BCF         PORTA+0, 4 
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
	BCF         PORTA+0, 7 
	GOTO        L__SELEC203
L__SELEC202:
	BSF         PORTA+0, 7 
L__SELEC203:
;Configuraciones.c,130 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,132 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC35:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC204
	BCF         PORTA+0, 6 
	GOTO        L__SELEC205
L__SELEC204:
	BSF         PORTA+0, 6 
L__SELEC205:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC206
	BCF         PORTA+0, 7 
	GOTO        L__SELEC207
L__SELEC206:
	BSF         PORTA+0, 7 
L__SELEC207:
;Configuraciones.c,135 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,137 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC36:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC208
	BCF         PORTA+0, 4 
	GOTO        L__SELEC209
L__SELEC208:
	BSF         PORTA+0, 4 
L__SELEC209:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC210
	BCF         PORTA+0, 5 
	GOTO        L__SELEC211
L__SELEC210:
	BSF         PORTA+0, 5 
L__SELEC211:
;Configuraciones.c,138 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,140 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC37:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC212
	BCF         PORTA+0, 7 
	GOTO        L__SELEC213
L__SELEC212:
	BSF         PORTA+0, 7 
L__SELEC213:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC214
	BCF         PORTA+0, 6 
	GOTO        L__SELEC215
L__SELEC214:
	BSF         PORTA+0, 6 
L__SELEC215:
	BSF         PORTA+0, 5 
;Configuraciones.c,141 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,143 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC38:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC216
	BCF         PORTA+0, 4 
	GOTO        L__SELEC217
L__SELEC216:
	BSF         PORTA+0, 4 
L__SELEC217:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC218
	BCF         PORTA+0, 7 
	GOTO        L__SELEC219
L__SELEC218:
	BSF         PORTA+0, 7 
L__SELEC219:
;Configuraciones.c,144 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,146 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC39:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC220
	BCF         PORTA+0, 5 
	GOTO        L__SELEC221
L__SELEC220:
	BSF         PORTA+0, 5 
L__SELEC221:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC222
	BCF         PORTA+0, 4 
	GOTO        L__SELEC223
L__SELEC222:
	BSF         PORTA+0, 4 
L__SELEC223:
	BSF         PORTA+0, 7 
;Configuraciones.c,147 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,149 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC40:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC224
	BCF         PORTA+0, 5 
	GOTO        L__SELEC225
L__SELEC224:
	BSF         PORTA+0, 5 
L__SELEC225:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC226
	BCF         PORTA+0, 4 
	GOTO        L__SELEC227
L__SELEC226:
	BSF         PORTA+0, 4 
L__SELEC227:
	BSF         PORTA+0, 6 
;Configuraciones.c,150 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,152 :: 		default: L0=L1=L2=L3=0;
L_SELEC41:
	BCF         PORTA+0, 4 
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
;Configuraciones.c,153 :: 		}
	GOTO        L_SELEC4
L_SELEC3:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC234
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC234:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC5
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC235
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC235:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC6
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC236
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC236:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC24
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC237
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC237:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC238
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC238:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC239
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC239:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC240
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC240:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC241
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC241:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC242
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC242:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC243
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC243:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC244
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC244:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC245
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC245:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC246
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC246:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC247
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC247:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC248
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC248:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	GOTO        L_SELEC41
L_SELEC4:
;Configuraciones.c,156 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,160 :: 		void combate_estado() {
;Configuraciones.c,161 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado42
;Configuraciones.c,162 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,163 :: 		LOGICA_LINEA();
	CALL        _LOGICA_LINEA+0, 0
;Configuraciones.c,164 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,165 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,166 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,167 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,168 :: 		}
L_combate_estado42:
;Configuraciones.c,169 :: 		switch (estado_combate) {
	GOTO        L_combate_estado43
;Configuraciones.c,170 :: 		case CMB_ESPERA:
L_combate_estado45:
;Configuraciones.c,171 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado48
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado48
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado48
L__combate_estado157:
;Configuraciones.c,172 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,173 :: 		}
	GOTO        L_combate_estado49
L_combate_estado48:
;Configuraciones.c,174 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado52
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado52
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado52
L__combate_estado156:
;Configuraciones.c,175 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,176 :: 		}
	GOTO        L_combate_estado53
L_combate_estado52:
;Configuraciones.c,177 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado56
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado56
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado56
L__combate_estado155:
;Configuraciones.c,178 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,179 :: 		}
	GOTO        L_combate_estado57
L_combate_estado56:
;Configuraciones.c,180 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado60
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado60
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado60
L__combate_estado154:
;Configuraciones.c,181 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,182 :: 		}
	GOTO        L_combate_estado61
L_combate_estado60:
;Configuraciones.c,183 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado64
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado64
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado64
L__combate_estado153:
;Configuraciones.c,184 :: 		estado_combate = CMB_DER;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,185 :: 		}
	GOTO        L_combate_estado65
L_combate_estado64:
;Configuraciones.c,186 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado68
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado68
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado68
L__combate_estado152:
;Configuraciones.c,187 :: 		estado_combate = CMB_LIBRE;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,188 :: 		}
	GOTO        L_combate_estado69
L_combate_estado68:
;Configuraciones.c,189 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado72
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado72
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado72
L__combate_estado151:
;Configuraciones.c,190 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,191 :: 		}
	GOTO        L_combate_estado73
L_combate_estado72:
;Configuraciones.c,192 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado76
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado76
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado76
L__combate_estado150:
;Configuraciones.c,193 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,194 :: 		}
	GOTO        L_combate_estado77
L_combate_estado76:
;Configuraciones.c,196 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,197 :: 		}
L_combate_estado77:
L_combate_estado73:
L_combate_estado69:
L_combate_estado65:
L_combate_estado61:
L_combate_estado57:
L_combate_estado53:
L_combate_estado49:
;Configuraciones.c,198 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,200 :: 		case CMB_REC:
L_combate_estado78:
;Configuraciones.c,201 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado250
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado251
L__combate_estado250:
	BSF         PORTA+0, 5 
L__combate_estado251:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado252
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado253
L__combate_estado252:
	BSF         PORTA+0, 7 
L__combate_estado253:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado254
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado255
L__combate_estado254:
	BSF         PORTA+0, 6 
L__combate_estado255:
;Configuraciones.c,202 :: 		REC_M();
	CALL        _REC_M+0, 0
;Configuraciones.c,203 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,205 :: 		case CMB_IZQ:
L_combate_estado79:
;Configuraciones.c,206 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado256
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado257
L__combate_estado256:
	BSF         PORTA+0, 5 
L__combate_estado257:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado258
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado259
L__combate_estado258:
	BSF         PORTA+0, 7 
L__combate_estado259:
;Configuraciones.c,207 :: 		IZQ_M();
	CALL        _IZQ_M+0, 0
;Configuraciones.c,208 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,210 :: 		case CMB_HIT:
L_combate_estado80:
;Configuraciones.c,211 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado260
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado261
L__combate_estado260:
	BSF         PORTA+0, 5 
L__combate_estado261:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado262
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado263
L__combate_estado262:
	BSF         PORTA+0, 6 
L__combate_estado263:
;Configuraciones.c,212 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,213 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,214 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,216 :: 		case CMB_IZQ_GOLPE:
L_combate_estado81:
;Configuraciones.c,217 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado264
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado265
L__combate_estado264:
	BSF         PORTA+0, 6 
L__combate_estado265:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado266
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado267
L__combate_estado266:
	BSF         PORTA+0, 5 
L__combate_estado267:
;Configuraciones.c,218 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,219 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado82:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado82
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado82
	NOP
	NOP
;Configuraciones.c,221 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado83:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado83
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado83
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado83
	NOP
;Configuraciones.c,222 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,223 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,225 :: 		case CMB_DER:
L_combate_estado84:
;Configuraciones.c,226 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado268
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado269
L__combate_estado268:
	BSF         PORTA+0, 7 
L__combate_estado269:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado270
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado271
L__combate_estado270:
	BSF         PORTA+0, 6 
L__combate_estado271:
;Configuraciones.c,227 :: 		DER_M();
	CALL        _DER_M+0, 0
;Configuraciones.c,228 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,230 :: 		case CMB_LIBRE:
L_combate_estado85:
;Configuraciones.c,231 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado272
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado273
L__combate_estado272:
	BSF         PORTA+0, 6 
L__combate_estado273:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado274
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado275
L__combate_estado274:
	BSF         PORTA+0, 7 
L__combate_estado275:
;Configuraciones.c,232 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,233 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,234 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,236 :: 		case CMB_DER_HIT:
L_combate_estado86:
;Configuraciones.c,237 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado276
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado277
L__combate_estado276:
	BSF         PORTA+0, 7 
L__combate_estado277:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado278
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado279
L__combate_estado278:
	BSF         PORTA+0, 6 
L__combate_estado279:
;Configuraciones.c,238 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,239 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado87:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado87
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado87
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado87
;Configuraciones.c,240 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,241 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_combate_estado88:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado88
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado88
	NOP
	NOP
;Configuraciones.c,242 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,243 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,245 :: 		case CMB_HIT_FULL:
L_combate_estado89:
;Configuraciones.c,246 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado280
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado281
L__combate_estado280:
	BSF         PORTA+0, 7 
L__combate_estado281:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado282
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado283
L__combate_estado282:
	BSF         PORTA+0, 6 
L__combate_estado283:
	BSF         PORTA+0, 4 
;Configuraciones.c,247 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,248 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,249 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,251 :: 		default:
L_combate_estado90:
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
	GOTO        L_combate_estado84
	MOVF        _estado_combate+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado85
	MOVF        _estado_combate+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado86
	MOVF        _estado_combate+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado89
	GOTO        L_combate_estado90
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
L_GIRO18091:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18091
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18091
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18091
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
L_GIRO36092:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36092
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36092
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36092
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
L_HIT93:
	DECFSZ      R13, 1, 1
	BRA         L_HIT93
	DECFSZ      R12, 1, 1
	BRA         L_HIT93
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
L_HIT94:
	DECFSZ      R13, 1, 1
	BRA         L_HIT94
	DECFSZ      R12, 1, 1
	BRA         L_HIT94
	DECFSZ      R11, 1, 1
	BRA         L_HIT94
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
	GOTO        L_HIT_NO_BLOQUEANTE95
;Configuraciones.c,400 :: 		case MOV_IDLE:
L_HIT_NO_BLOQUEANTE97:
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
	GOTO        L_HIT_NO_BLOQUEANTE96
;Configuraciones.c,406 :: 		case MOV_HIT_REC:
L_HIT_NO_BLOQUEANTE98:
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
	GOTO        L__HIT_NO_BLOQUEANTE299
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE299
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE299
	MOVLW       20
	SUBWF       R1, 0 
L__HIT_NO_BLOQUEANTE299:
	BTFSS       STATUS+0, 0 
	GOTO        L_HIT_NO_BLOQUEANTE99
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
L_HIT_NO_BLOQUEANTE99:
;Configuraciones.c,413 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE96
;Configuraciones.c,415 :: 		case MOV_HIT_PUSH:
L_HIT_NO_BLOQUEANTE100:
;Configuraciones.c,417 :: 		if (S2 == 0) {
	BTFSC       PORTC+0, 6 
	GOTO        L_HIT_NO_BLOQUEANTE101
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
	GOTO        L_HIT_NO_BLOQUEANTE102
L_HIT_NO_BLOQUEANTE101:
;Configuraciones.c,423 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,424 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,425 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,426 :: 		}
L_HIT_NO_BLOQUEANTE102:
;Configuraciones.c,433 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE96
;Configuraciones.c,434 :: 		}
L_HIT_NO_BLOQUEANTE95:
	MOVF        _estado_movimiento+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE97
	MOVF        _estado_movimiento+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE98
	MOVF        _estado_movimiento+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE100
L_HIT_NO_BLOQUEANTE96:
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
	GOTO        L_IZQ_M103
;Configuraciones.c,440 :: 		case SUB_IZQ_INICIO:
L_IZQ_M105:
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
	GOTO        L_IZQ_M104
;Configuraciones.c,446 :: 		case SUB_IZQ_GIRO:
L_IZQ_M106:
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
	GOTO        L__IZQ_M301
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M301
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M301
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M301:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M107
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
	GOTO        L_IZQ_M108
L_IZQ_M107:
;Configuraciones.c,452 :: 		IZQ(); // si necesitas mantener comando
	CALL        _IZQ+0, 0
;Configuraciones.c,453 :: 		}
L_IZQ_M108:
;Configuraciones.c,454 :: 		break;
	GOTO        L_IZQ_M104
;Configuraciones.c,456 :: 		case SUB_IZQ_HARD:
L_IZQ_M109:
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
	GOTO        L__IZQ_M302
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M302
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M302
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M302:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M110
;Configuraciones.c,458 :: 		sub_cmb_izq = SUB_IZQ_INICIO;
	CLRF        _sub_cmb_izq+0 
;Configuraciones.c,459 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,460 :: 		} else {
	GOTO        L_IZQ_M111
L_IZQ_M110:
;Configuraciones.c,461 :: 		HARD(); // si necesitas mantener comando
	CALL        _HARD+0, 0
;Configuraciones.c,462 :: 		}
L_IZQ_M111:
;Configuraciones.c,463 :: 		break;
	GOTO        L_IZQ_M104
;Configuraciones.c,464 :: 		}
L_IZQ_M103:
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M105
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M106
	MOVF        _sub_cmb_izq+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_IZQ_M109
L_IZQ_M104:
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
	GOTO        L_DER_M112
;Configuraciones.c,470 :: 		case SUB_DER_INICIO:
L_DER_M114:
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
	GOTO        L_DER_M113
;Configuraciones.c,476 :: 		case SUB_DER_GIRO:
L_DER_M115:
;Configuraciones.c,478 :: 		if (S6 ==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M116
;Configuraciones.c,479 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,480 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,481 :: 		break;
	GOTO        L_DER_M113
;Configuraciones.c,482 :: 		}
L_DER_M116:
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
	GOTO        L__DER_M304
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M304
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M304
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M304:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M117
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
	GOTO        L_DER_M118
L_DER_M117:
;Configuraciones.c,488 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,489 :: 		}
L_DER_M118:
;Configuraciones.c,490 :: 		break;
	GOTO        L_DER_M113
;Configuraciones.c,492 :: 		case SUB_DER_HARD:
L_DER_M119:
;Configuraciones.c,494 :: 		if (S6==0) {
	BTFSC       PORTB+0, 4 
	GOTO        L_DER_M120
;Configuraciones.c,495 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,496 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,497 :: 		break;
	GOTO        L_DER_M113
;Configuraciones.c,498 :: 		}
L_DER_M120:
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
	GOTO        L__DER_M305
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M305
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DER_M305
	MOVLW       100
	SUBWF       R1, 0 
L__DER_M305:
	BTFSS       STATUS+0, 0 
	GOTO        L_DER_M121
;Configuraciones.c,500 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,501 :: 		sub_cmb_der = SUB_DER_INICIO;
	CLRF        _sub_cmb_der+0 
;Configuraciones.c,502 :: 		} else {
	GOTO        L_DER_M122
L_DER_M121:
;Configuraciones.c,503 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,504 :: 		}
L_DER_M122:
;Configuraciones.c,505 :: 		break;
	GOTO        L_DER_M113
;Configuraciones.c,506 :: 		}
L_DER_M112:
	MOVF        _sub_cmb_der+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M114
	MOVF        _sub_cmb_der+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M115
	MOVF        _sub_cmb_der+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DER_M119
L_DER_M113:
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
	GOTO        L_REC_M123
;Configuraciones.c,511 :: 		case SUB_REC_INICIO:
L_REC_M125:
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
	GOTO        L_REC_M124
;Configuraciones.c,517 :: 		case SUB_REC_REC:
L_REC_M126:
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
	GOTO        L__REC_M307
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M307
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M307
	MOVLW       50
	SUBWF       R1, 0 
L__REC_M307:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M127
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
L_REC_M127:
;Configuraciones.c,523 :: 		break;
	GOTO        L_REC_M124
;Configuraciones.c,525 :: 		case SUB_REC_LIBRE:
L_REC_M128:
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
	GOTO        L__REC_M308
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M308
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__REC_M308
	MOVLW       100
	SUBWF       R1, 0 
L__REC_M308:
	BTFSS       STATUS+0, 0 
	GOTO        L_REC_M129
;Configuraciones.c,527 :: 		sub_cmb_rec = SUB_REC_FIN;
	MOVLW       3
	MOVWF       _sub_cmb_rec+0 
;Configuraciones.c,528 :: 		}
L_REC_M129:
;Configuraciones.c,529 :: 		break;
	GOTO        L_REC_M124
;Configuraciones.c,531 :: 		case SUB_REC_FIN:
L_REC_M130:
;Configuraciones.c,532 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,533 :: 		sub_cmb_rec = SUB_REC_INICIO; // Reinicia para próxima vez
	CLRF        _sub_cmb_rec+0 
;Configuraciones.c,534 :: 		break;
	GOTO        L_REC_M124
;Configuraciones.c,535 :: 		}
L_REC_M123:
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M125
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M126
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M128
	MOVF        _sub_cmb_rec+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_REC_M130
L_REC_M124:
;Configuraciones.c,536 :: 		}
L_end_REC_M:
	RETURN      0
; end of _REC_M

_LOGICA_LINEA:

;Configuraciones.c,537 :: 		void LOGICA_LINEA(){
;Configuraciones.c,538 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA133
	BTFSS       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA133
L__LOGICA_LINEA159:
;Configuraciones.c,539 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,540 :: 		}
	GOTO        L_LOGICA_LINEA134
L_LOGICA_LINEA133:
;Configuraciones.c,541 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA137
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA137
L__LOGICA_LINEA158:
;Configuraciones.c,542 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,543 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA138:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA138
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA138
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA138
	NOP
;Configuraciones.c,544 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,545 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA139:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA139
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA139
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA139
	NOP
;Configuraciones.c,546 :: 		}
	GOTO        L_LOGICA_LINEA140
L_LOGICA_LINEA137:
;Configuraciones.c,547 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA141
;Configuraciones.c,548 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,549 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA142:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA142
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA142
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA142
	NOP
;Configuraciones.c,550 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,551 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA143:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA143
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA143
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA143
	NOP
;Configuraciones.c,552 :: 		}
	GOTO        L_LOGICA_LINEA144
L_LOGICA_LINEA141:
;Configuraciones.c,553 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA145
;Configuraciones.c,554 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,555 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA146:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA146
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA146
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA146
	NOP
;Configuraciones.c,556 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,557 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA147:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA147
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA147
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA147
	NOP
;Configuraciones.c,558 :: 		}
L_LOGICA_LINEA145:
L_LOGICA_LINEA144:
L_LOGICA_LINEA140:
L_LOGICA_LINEA134:
;Configuraciones.c,559 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
