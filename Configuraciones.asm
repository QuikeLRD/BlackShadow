
_INTERRUPT_ISR:

;Configuraciones.c,22 :: 		void INTERRUPT_ISR(void) {
;Configuraciones.c,24 :: 		if (INTCON.TMR0IF) {
	BTFSS       INTCON+0, 2 
	GOTO        L_INTERRUPT_ISR0
;Configuraciones.c,25 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Configuraciones.c,26 :: 		TMR0L = 131;
	MOVLW       131
	MOVWF       TMR0L+0 
;Configuraciones.c,27 :: 		ms_ticks++;
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
;Configuraciones.c,28 :: 		}
L_INTERRUPT_ISR0:
;Configuraciones.c,30 :: 		INTERRUPT();
	CALL        _INTERRUPT+0, 0
;Configuraciones.c,31 :: 		}
L_end_INTERRUPT_ISR:
	RETURN      0
; end of _INTERRUPT_ISR

_INTERRUPT:

;Configuraciones.c,33 :: 		void INTERRUPT(){
;Configuraciones.c,36 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT1
;Configuraciones.c,37 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,38 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,39 :: 		linea_detectada = 1;        //Activamos bandera global
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,40 :: 		}
L_INTERRUPT1:
;Configuraciones.c,42 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT2
;Configuraciones.c,43 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,44 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,45 :: 		linea_detectada = 1;
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,46 :: 		}
L_INTERRUPT2:
;Configuraciones.c,47 :: 		}
L_end_INTERRUPT:
L__INTERRUPT147:
	RETFIE      1
; end of _INTERRUPT

_SELEC:

;Configuraciones.c,50 :: 		void SELEC(){
;Configuraciones.c,52 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC149:
	BZ          L__SELEC150
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC149
L__SELEC150:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;Configuraciones.c,54 :: 		switch(seleccion){
	GOTO        L_SELEC3
;Configuraciones.c,55 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC5:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC151
	BCF         PORTA+0, 5 
	GOTO        L__SELEC152
L__SELEC151:
	BSF         PORTA+0, 5 
L__SELEC152:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC153
	BCF         PORTA+0, 7 
	GOTO        L__SELEC154
L__SELEC153:
	BSF         PORTA+0, 7 
L__SELEC154:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC155
	BCF         PORTA+0, 6 
	GOTO        L__SELEC156
L__SELEC155:
	BSF         PORTA+0, 6 
L__SELEC156:
;Configuraciones.c,58 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,60 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC6:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC157
	BCF         PORTA+0, 5 
	GOTO        L__SELEC158
L__SELEC157:
	BSF         PORTA+0, 5 
L__SELEC158:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC159
	BCF         PORTA+0, 4 
	GOTO        L__SELEC160
L__SELEC159:
	BSF         PORTA+0, 4 
L__SELEC160:
;Configuraciones.c,61 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC9
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC9
L__SELEC134:
;Configuraciones.c,62 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,63 :: 		}
	GOTO        L_SELEC10
L_SELEC9:
;Configuraciones.c,64 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC13
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC13
L__SELEC133:
;Configuraciones.c,65 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,66 :: 		delay_ms(100);
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
;Configuraciones.c,67 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,68 :: 		delay_ms(100);
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
;Configuraciones.c,69 :: 		}
	GOTO        L_SELEC16
L_SELEC13:
;Configuraciones.c,70 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC17
;Configuraciones.c,71 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,72 :: 		delay_ms(100);
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
;Configuraciones.c,73 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,74 :: 		delay_ms(100);
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
;Configuraciones.c,75 :: 		}
	GOTO        L_SELEC20
L_SELEC17:
;Configuraciones.c,76 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC21
;Configuraciones.c,77 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,78 :: 		delay_ms(100);
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
;Configuraciones.c,79 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,80 :: 		delay_ms(100);
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
;Configuraciones.c,81 :: 		}
L_SELEC21:
L_SELEC20:
L_SELEC16:
L_SELEC10:
;Configuraciones.c,83 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,85 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC24:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC161
	BCF         PORTA+0, 5 
	GOTO        L__SELEC162
L__SELEC161:
	BSF         PORTA+0, 5 
L__SELEC162:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC163
	BCF         PORTA+0, 4 
	GOTO        L__SELEC164
L__SELEC163:
	BSF         PORTA+0, 4 
L__SELEC164:
;Configuraciones.c,86 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,88 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,90 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC25:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC165
	BCF         PORTA+0, 6 
	GOTO        L__SELEC166
L__SELEC165:
	BSF         PORTA+0, 6 
L__SELEC166:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC167
	BCF         PORTA+0, 5 
	GOTO        L__SELEC168
L__SELEC167:
	BSF         PORTA+0, 5 
L__SELEC168:
;Configuraciones.c,91 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,92 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_SELEC26:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC26
	DECFSZ      R12, 1, 1
	BRA         L_SELEC26
	DECFSZ      R11, 1, 1
	BRA         L_SELEC26
;Configuraciones.c,93 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,94 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_SELEC27:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC27
	DECFSZ      R12, 1, 1
	BRA         L_SELEC27
	NOP
	NOP
;Configuraciones.c,99 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,101 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC28:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC169
	BCF         PORTA+0, 7 
	GOTO        L__SELEC170
L__SELEC169:
	BSF         PORTA+0, 7 
L__SELEC170:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC171
	BCF         PORTA+0, 4 
	GOTO        L__SELEC172
L__SELEC171:
	BSF         PORTA+0, 4 
L__SELEC172:
;Configuraciones.c,102 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,103 :: 		delay_ms(250);
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
;Configuraciones.c,104 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,105 :: 		delay_ms(4000);
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
;Configuraciones.c,106 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,108 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC31:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC173
	BCF         PORTA+0, 5 
	GOTO        L__SELEC174
L__SELEC173:
	BSF         PORTA+0, 5 
L__SELEC174:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC175
	BCF         PORTA+0, 4 
	GOTO        L__SELEC176
L__SELEC175:
	BSF         PORTA+0, 4 
L__SELEC176:
;Configuraciones.c,109 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,110 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,112 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC32:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC177
	BCF         PORTA+0, 7 
	GOTO        L__SELEC178
L__SELEC177:
	BSF         PORTA+0, 7 
L__SELEC178:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC179
	BCF         PORTA+0, 4 
	GOTO        L__SELEC180
L__SELEC179:
	BSF         PORTA+0, 4 
L__SELEC180:
;Configuraciones.c,113 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,115 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,117 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC33:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC181
	BCF         PORTA+0, 7 
	GOTO        L__SELEC182
L__SELEC181:
	BSF         PORTA+0, 7 
L__SELEC182:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC183
	BCF         PORTA+0, 5 
	GOTO        L__SELEC184
L__SELEC183:
	BSF         PORTA+0, 5 
L__SELEC184:
	BSF         PORTA+0, 4 
;Configuraciones.c,119 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,121 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC34:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC185
	BCF         PORTA+0, 5 
	GOTO        L__SELEC186
L__SELEC185:
	BSF         PORTA+0, 5 
L__SELEC186:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC187
	BCF         PORTA+0, 7 
	GOTO        L__SELEC188
L__SELEC187:
	BSF         PORTA+0, 7 
L__SELEC188:
;Configuraciones.c,123 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,125 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC35:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC189
	BCF         PORTA+0, 6 
	GOTO        L__SELEC190
L__SELEC189:
	BSF         PORTA+0, 6 
L__SELEC190:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC191
	BCF         PORTA+0, 7 
	GOTO        L__SELEC192
L__SELEC191:
	BSF         PORTA+0, 7 
L__SELEC192:
;Configuraciones.c,128 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,130 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC36:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC193
	BCF         PORTA+0, 4 
	GOTO        L__SELEC194
L__SELEC193:
	BSF         PORTA+0, 4 
L__SELEC194:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC195
	BCF         PORTA+0, 5 
	GOTO        L__SELEC196
L__SELEC195:
	BSF         PORTA+0, 5 
L__SELEC196:
;Configuraciones.c,131 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,133 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC37:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC197
	BCF         PORTA+0, 7 
	GOTO        L__SELEC198
L__SELEC197:
	BSF         PORTA+0, 7 
L__SELEC198:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC199
	BCF         PORTA+0, 6 
	GOTO        L__SELEC200
L__SELEC199:
	BSF         PORTA+0, 6 
L__SELEC200:
	BSF         PORTA+0, 5 
;Configuraciones.c,134 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,136 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC38:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC201
	BCF         PORTA+0, 4 
	GOTO        L__SELEC202
L__SELEC201:
	BSF         PORTA+0, 4 
L__SELEC202:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC203
	BCF         PORTA+0, 7 
	GOTO        L__SELEC204
L__SELEC203:
	BSF         PORTA+0, 7 
L__SELEC204:
;Configuraciones.c,137 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,139 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC39:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC205
	BCF         PORTA+0, 5 
	GOTO        L__SELEC206
L__SELEC205:
	BSF         PORTA+0, 5 
L__SELEC206:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC207
	BCF         PORTA+0, 4 
	GOTO        L__SELEC208
L__SELEC207:
	BSF         PORTA+0, 4 
L__SELEC208:
	BSF         PORTA+0, 7 
;Configuraciones.c,140 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,142 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC40:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC209
	BCF         PORTA+0, 5 
	GOTO        L__SELEC210
L__SELEC209:
	BSF         PORTA+0, 5 
L__SELEC210:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC211
	BCF         PORTA+0, 4 
	GOTO        L__SELEC212
L__SELEC211:
	BSF         PORTA+0, 4 
L__SELEC212:
	BSF         PORTA+0, 6 
;Configuraciones.c,143 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,145 :: 		default: L0=L1=L2=L3=0;
L_SELEC41:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC213
	BCF         PORTA+0, 5 
	GOTO        L__SELEC214
L__SELEC213:
	BSF         PORTA+0, 5 
L__SELEC214:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC215
	BCF         PORTA+0, 7 
	GOTO        L__SELEC216
L__SELEC215:
	BSF         PORTA+0, 7 
L__SELEC216:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC217
	BCF         PORTA+0, 6 
	GOTO        L__SELEC218
L__SELEC217:
	BSF         PORTA+0, 6 
L__SELEC218:
;Configuraciones.c,146 :: 		}
	GOTO        L_SELEC4
L_SELEC3:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC219
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC219:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC5
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC220
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC220:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC6
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC221
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC221:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC24
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC222
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC222:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC223
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC223:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC224
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC224:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC225
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC225:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC226
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC226:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC227
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC227:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC228
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC228:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC229
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC229:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC230
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC230:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC231
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC231:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC232
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC232:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC233
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC233:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	GOTO        L_SELEC41
L_SELEC4:
;Configuraciones.c,149 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,153 :: 		void combate_estado() {
;Configuraciones.c,154 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado42
;Configuraciones.c,155 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,156 :: 		LOGICA_LINEA();
	CALL        _LOGICA_LINEA+0, 0
;Configuraciones.c,157 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,158 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,159 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,160 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,161 :: 		}
L_combate_estado42:
;Configuraciones.c,162 :: 		switch (estado_combate) {
	GOTO        L_combate_estado43
;Configuraciones.c,163 :: 		case CMB_ESPERA:
L_combate_estado45:
;Configuraciones.c,164 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado48
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado48
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado48
L__combate_estado142:
;Configuraciones.c,165 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,166 :: 		}
	GOTO        L_combate_estado49
L_combate_estado48:
;Configuraciones.c,167 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado52
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado52
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado52
L__combate_estado141:
;Configuraciones.c,168 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,169 :: 		}
	GOTO        L_combate_estado53
L_combate_estado52:
;Configuraciones.c,170 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado56
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado56
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado56
L__combate_estado140:
;Configuraciones.c,171 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,172 :: 		}
	GOTO        L_combate_estado57
L_combate_estado56:
;Configuraciones.c,173 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado60
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado60
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado60
L__combate_estado139:
;Configuraciones.c,174 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,175 :: 		}
	GOTO        L_combate_estado61
L_combate_estado60:
;Configuraciones.c,176 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado64
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado64
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado64
L__combate_estado138:
;Configuraciones.c,177 :: 		estado_combate = CMB_DER_HARD;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,178 :: 		}
	GOTO        L_combate_estado65
L_combate_estado64:
;Configuraciones.c,179 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado68
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado68
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado68
L__combate_estado137:
;Configuraciones.c,180 :: 		estado_combate = CMB_LIBRE;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,181 :: 		}
	GOTO        L_combate_estado69
L_combate_estado68:
;Configuraciones.c,182 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado72
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado72
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado72
L__combate_estado136:
;Configuraciones.c,183 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,184 :: 		}
	GOTO        L_combate_estado73
L_combate_estado72:
;Configuraciones.c,185 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado76
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado76
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado76
L__combate_estado135:
;Configuraciones.c,186 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,187 :: 		}
	GOTO        L_combate_estado77
L_combate_estado76:
;Configuraciones.c,189 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,190 :: 		}
L_combate_estado77:
L_combate_estado73:
L_combate_estado69:
L_combate_estado65:
L_combate_estado61:
L_combate_estado57:
L_combate_estado53:
L_combate_estado49:
;Configuraciones.c,191 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,193 :: 		case CMB_REC:
L_combate_estado78:
;Configuraciones.c,194 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado235
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado236
L__combate_estado235:
	BSF         PORTA+0, 5 
L__combate_estado236:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado237
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado238
L__combate_estado237:
	BSF         PORTA+0, 7 
L__combate_estado238:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado239
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado240
L__combate_estado239:
	BSF         PORTA+0, 6 
L__combate_estado240:
;Configuraciones.c,195 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,196 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_combate_estado79:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado79
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado79
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado79
	NOP
	NOP
;Configuraciones.c,197 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,198 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_combate_estado80:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado80
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado80
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado80
;Configuraciones.c,199 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,200 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,202 :: 		case CMB_IZQ:
L_combate_estado81:
;Configuraciones.c,203 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado241
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado242
L__combate_estado241:
	BSF         PORTA+0, 5 
L__combate_estado242:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado243
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado244
L__combate_estado243:
	BSF         PORTA+0, 7 
L__combate_estado244:
;Configuraciones.c,204 :: 		IZQ_M();
	CALL        _IZQ_M+0, 0
;Configuraciones.c,205 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,207 :: 		case CMB_HIT:
L_combate_estado82:
;Configuraciones.c,208 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado245
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado246
L__combate_estado245:
	BSF         PORTA+0, 5 
L__combate_estado246:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado247
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado248
L__combate_estado247:
	BSF         PORTA+0, 6 
L__combate_estado248:
;Configuraciones.c,209 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,210 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,211 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,213 :: 		case CMB_IZQ_GOLPE:
L_combate_estado83:
;Configuraciones.c,214 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado249
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado250
L__combate_estado249:
	BSF         PORTA+0, 6 
L__combate_estado250:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado251
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado252
L__combate_estado251:
	BSF         PORTA+0, 5 
L__combate_estado252:
;Configuraciones.c,215 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,216 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado84:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado84
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado84
	NOP
	NOP
;Configuraciones.c,218 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado85:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado85
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado85
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado85
	NOP
;Configuraciones.c,219 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,220 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,222 :: 		case CMB_DER_HARD:
L_combate_estado86:
;Configuraciones.c,223 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado253
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado254
L__combate_estado253:
	BSF         PORTA+0, 7 
L__combate_estado254:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado255
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado256
L__combate_estado255:
	BSF         PORTA+0, 6 
L__combate_estado256:
;Configuraciones.c,224 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,225 :: 		delay_ms(400);
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
;Configuraciones.c,226 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,227 :: 		delay_ms(50);
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
;Configuraciones.c,228 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,229 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,231 :: 		case CMB_LIBRE:
L_combate_estado89:
;Configuraciones.c,232 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado257
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado258
L__combate_estado257:
	BSF         PORTA+0, 6 
L__combate_estado258:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado259
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado260
L__combate_estado259:
	BSF         PORTA+0, 7 
L__combate_estado260:
;Configuraciones.c,233 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,234 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,235 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,237 :: 		case CMB_DER_HIT:
L_combate_estado90:
;Configuraciones.c,238 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado261
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado262
L__combate_estado261:
	BSF         PORTA+0, 7 
L__combate_estado262:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado263
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado264
L__combate_estado263:
	BSF         PORTA+0, 6 
L__combate_estado264:
;Configuraciones.c,239 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,240 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado91:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado91
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado91
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado91
;Configuraciones.c,241 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,242 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_combate_estado92:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado92
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado92
	NOP
	NOP
;Configuraciones.c,243 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,244 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,246 :: 		case CMB_HIT_FULL:
L_combate_estado93:
;Configuraciones.c,247 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado265
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado266
L__combate_estado265:
	BSF         PORTA+0, 7 
L__combate_estado266:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado267
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado268
L__combate_estado267:
	BSF         PORTA+0, 6 
L__combate_estado268:
	BSF         PORTA+0, 4 
;Configuraciones.c,248 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,249 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,250 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,252 :: 		default:
L_combate_estado94:
;Configuraciones.c,253 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,254 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,255 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,256 :: 		}
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
	GOTO        L_combate_estado81
	MOVF        _estado_combate+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado82
	MOVF        _estado_combate+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado83
	MOVF        _estado_combate+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado86
	MOVF        _estado_combate+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado89
	MOVF        _estado_combate+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado90
	MOVF        _estado_combate+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado93
	GOTO        L_combate_estado94
L_combate_estado44:
;Configuraciones.c,257 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,259 :: 		void Start(){
;Configuraciones.c,260 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,261 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,262 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,263 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,264 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,265 :: 		return;
;Configuraciones.c,266 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,267 :: 		void Stop(){
;Configuraciones.c,268 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,269 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,270 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,271 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,272 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,273 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,280 :: 		void REC(){
;Configuraciones.c,282 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,284 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,285 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,288 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,289 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,290 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,291 :: 		void DER(){
;Configuraciones.c,292 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,293 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,294 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,296 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,297 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,299 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_DER_Z:

;Configuraciones.c,300 :: 		void DER_Z(){
;Configuraciones.c,301 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,302 :: 		PWM1_Set_Duty(230);
	MOVLW       230
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,303 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,305 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,306 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,309 :: 		}
L_end_DER_Z:
	RETURN      0
; end of _DER_Z

_IZQ:

;Configuraciones.c,312 :: 		void IZQ(){
;Configuraciones.c,313 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,314 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,315 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,317 :: 		PWM3_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,318 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,319 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;Configuraciones.c,321 :: 		void REV(){
;Configuraciones.c,322 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,323 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,324 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,325 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,326 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,328 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,330 :: 		void LIBRE(){
;Configuraciones.c,332 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,333 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,334 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,335 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,336 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,340 :: 		void GIRO180(){
;Configuraciones.c,341 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,343 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,344 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,346 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,347 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,348 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18095:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18095
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18095
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18095
;Configuraciones.c,349 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,352 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,354 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,355 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,356 :: 		delay_ms(250);
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
;Configuraciones.c,357 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,359 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,361 :: 		void BRAKE(){
;Configuraciones.c,363 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,364 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,365 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,366 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,367 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,370 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,371 :: 		void HARD(){
;Configuraciones.c,372 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,373 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,374 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,375 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,378 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,379 :: 		void PUSH(){
;Configuraciones.c,380 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,382 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,383 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,386 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,387 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,389 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,390 :: 		void HIT(){
;Configuraciones.c,392 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,393 :: 		delay_ms(20);
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
;Configuraciones.c,394 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,395 :: 		delay_ms(250);
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
;Configuraciones.c,396 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_HIT_NO_BLOQUEANTE:

;Configuraciones.c,397 :: 		void HIT_NO_BLOQUEANTE(){
;Configuraciones.c,398 :: 		unsigned long now = millis(); // Usa tu función de tiempo
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+0 
	MOVF        R1, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+1 
	MOVF        R2, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+2 
	MOVF        R3, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+3 
;Configuraciones.c,400 :: 		switch (estado_movimiento) {
	GOTO        L_HIT_NO_BLOQUEANTE99
;Configuraciones.c,401 :: 		case MOV_IDLE:
L_HIT_NO_BLOQUEANTE101:
;Configuraciones.c,402 :: 		PUSH(); // Avanza rápido
	CALL        _PUSH+0, 0
;Configuraciones.c,403 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,404 :: 		estado_movimiento = MOV_HIT_REC;
	MOVLW       1
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,405 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE100
;Configuraciones.c,407 :: 		case MOV_HIT_REC:
L_HIT_NO_BLOQUEANTE102:
;Configuraciones.c,409 :: 		if (now - tiempo_movimiento >= 20) {
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
	GOTO        L__HIT_NO_BLOQUEANTE284
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE284
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE284
	MOVLW       20
	SUBWF       R1, 0 
L__HIT_NO_BLOQUEANTE284:
	BTFSS       STATUS+0, 0 
	GOTO        L_HIT_NO_BLOQUEANTE103
;Configuraciones.c,410 :: 		PUSH(); // Empuje fuerte
	CALL        _PUSH+0, 0
;Configuraciones.c,411 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,412 :: 		estado_movimiento = MOV_HIT_PUSH;
	MOVLW       2
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,413 :: 		}
L_HIT_NO_BLOQUEANTE103:
;Configuraciones.c,414 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE100
;Configuraciones.c,416 :: 		case MOV_HIT_PUSH:
L_HIT_NO_BLOQUEANTE104:
;Configuraciones.c,418 :: 		if (S2 == 0) {
	BTFSC       PORTC+0, 6 
	GOTO        L_HIT_NO_BLOQUEANTE105
;Configuraciones.c,420 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,421 :: 		tiempo_movimiento = now; // Actualiza tiempo si quieres tiempo máximo de empuje
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,422 :: 		} else {
	GOTO        L_HIT_NO_BLOQUEANTE106
L_HIT_NO_BLOQUEANTE105:
;Configuraciones.c,424 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,425 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,426 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,427 :: 		}
L_HIT_NO_BLOQUEANTE106:
;Configuraciones.c,434 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE100
;Configuraciones.c,435 :: 		}
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
;Configuraciones.c,436 :: 		}
L_end_HIT_NO_BLOQUEANTE:
	RETURN      0
; end of _HIT_NO_BLOQUEANTE

_IZQ_M:

;Configuraciones.c,437 :: 		void IZQ_M(){
;Configuraciones.c,438 :: 		unsigned long now = millis();
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       IZQ_M_now_L0+0 
	MOVF        R1, 0 
	MOVWF       IZQ_M_now_L0+1 
	MOVF        R2, 0 
	MOVWF       IZQ_M_now_L0+2 
	MOVF        R3, 0 
	MOVWF       IZQ_M_now_L0+3 
;Configuraciones.c,439 :: 		switch (sub_cmb_izq) {
	GOTO        L_IZQ_M107
;Configuraciones.c,441 :: 		case SUB_IZQ_INICIO:
L_IZQ_M109:
;Configuraciones.c,442 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,443 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,444 :: 		sub_cmb_izq = SUB_IZQ_GIRO;
	MOVLW       1
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,445 :: 		break;
	GOTO        L_IZQ_M108
;Configuraciones.c,447 :: 		case SUB_IZQ_GIRO:
L_IZQ_M110:
;Configuraciones.c,448 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M286
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M286
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M286
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M286:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M111
;Configuraciones.c,449 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,450 :: 		t_cmb_izq = now;
	MOVF        IZQ_M_now_L0+0, 0 
	MOVWF       _t_cmb_izq+0 
	MOVF        IZQ_M_now_L0+1, 0 
	MOVWF       _t_cmb_izq+1 
	MOVF        IZQ_M_now_L0+2, 0 
	MOVWF       _t_cmb_izq+2 
	MOVF        IZQ_M_now_L0+3, 0 
	MOVWF       _t_cmb_izq+3 
;Configuraciones.c,451 :: 		sub_cmb_izq = SUB_IZQ_HARD;
	MOVLW       2
	MOVWF       _sub_cmb_izq+0 
;Configuraciones.c,452 :: 		} else {
	GOTO        L_IZQ_M112
L_IZQ_M111:
;Configuraciones.c,453 :: 		IZQ(); // si necesitas mantener comando
	CALL        _IZQ+0, 0
;Configuraciones.c,454 :: 		}
L_IZQ_M112:
;Configuraciones.c,455 :: 		break;
	GOTO        L_IZQ_M108
;Configuraciones.c,457 :: 		case SUB_IZQ_HARD:
L_IZQ_M113:
;Configuraciones.c,458 :: 		if (now - t_cmb_izq >= 100) {
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
	GOTO        L__IZQ_M287
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M287
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IZQ_M287
	MOVLW       100
	SUBWF       R1, 0 
L__IZQ_M287:
	BTFSS       STATUS+0, 0 
	GOTO        L_IZQ_M114
;Configuraciones.c,459 :: 		sub_cmb_izq = SUB_IZQ_INICIO;
	CLRF        _sub_cmb_izq+0 
;Configuraciones.c,460 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,461 :: 		} else {
	GOTO        L_IZQ_M115
L_IZQ_M114:
;Configuraciones.c,462 :: 		HARD(); // si necesitas mantener comando
	CALL        _HARD+0, 0
;Configuraciones.c,463 :: 		}
L_IZQ_M115:
;Configuraciones.c,464 :: 		break;
	GOTO        L_IZQ_M108
;Configuraciones.c,465 :: 		}
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
;Configuraciones.c,466 :: 		}
L_end_IZQ_M:
	RETURN      0
; end of _IZQ_M

_LOGICA_LINEA:

;Configuraciones.c,467 :: 		void LOGICA_LINEA(){
;Configuraciones.c,468 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA118
	BTFSS       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA118
L__LOGICA_LINEA144:
;Configuraciones.c,469 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,470 :: 		}
	GOTO        L_LOGICA_LINEA119
L_LOGICA_LINEA118:
;Configuraciones.c,471 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA122
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA122
L__LOGICA_LINEA143:
;Configuraciones.c,472 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,473 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA123:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA123
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA123
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA123
	NOP
;Configuraciones.c,474 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,475 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA124:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA124
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA124
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA124
	NOP
;Configuraciones.c,476 :: 		}
	GOTO        L_LOGICA_LINEA125
L_LOGICA_LINEA122:
;Configuraciones.c,477 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA126
;Configuraciones.c,478 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,479 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA127:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA127
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA127
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA127
	NOP
;Configuraciones.c,480 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,481 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA128:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA128
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA128
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA128
	NOP
;Configuraciones.c,482 :: 		}
	GOTO        L_LOGICA_LINEA129
L_LOGICA_LINEA126:
;Configuraciones.c,483 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA130
;Configuraciones.c,484 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,485 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA131:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA131
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA131
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA131
	NOP
;Configuraciones.c,486 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,487 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA132:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA132
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA132
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA132
	NOP
;Configuraciones.c,488 :: 		}
L_LOGICA_LINEA130:
L_LOGICA_LINEA129:
L_LOGICA_LINEA125:
L_LOGICA_LINEA119:
;Configuraciones.c,489 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
