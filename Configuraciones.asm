
_INTERRUPT_ISR:

;Configuraciones.c,20 :: 		void INTERRUPT_ISR(void) {
;Configuraciones.c,22 :: 		if (INTCON.TMR0IF) {
	BTFSS       INTCON+0, 2 
	GOTO        L_INTERRUPT_ISR0
;Configuraciones.c,23 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Configuraciones.c,24 :: 		TMR0L = 131;
	MOVLW       131
	MOVWF       TMR0L+0 
;Configuraciones.c,25 :: 		ms_ticks++;
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
;Configuraciones.c,26 :: 		}
L_INTERRUPT_ISR0:
;Configuraciones.c,28 :: 		INTERRUPT();
	CALL        _INTERRUPT+0, 0
;Configuraciones.c,29 :: 		}
L_end_INTERRUPT_ISR:
	RETURN      0
; end of _INTERRUPT_ISR

_INTERRUPT:

;Configuraciones.c,31 :: 		void INTERRUPT(){
;Configuraciones.c,34 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT1
;Configuraciones.c,35 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,36 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,37 :: 		linea_detectada = 1;        //Activamos bandera global
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,38 :: 		}
L_INTERRUPT1:
;Configuraciones.c,40 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT2
;Configuraciones.c,41 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,42 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,43 :: 		linea_detectada = 1;
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,44 :: 		}
L_INTERRUPT2:
;Configuraciones.c,45 :: 		}
L_end_INTERRUPT:
L__INTERRUPT140:
	RETFIE      1
; end of _INTERRUPT

_SELEC:

;Configuraciones.c,48 :: 		void SELEC(){
;Configuraciones.c,50 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC142:
	BZ          L__SELEC143
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC142
L__SELEC143:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;Configuraciones.c,52 :: 		switch(seleccion){
	GOTO        L_SELEC3
;Configuraciones.c,53 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC5:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC144
	BCF         PORTA+0, 5 
	GOTO        L__SELEC145
L__SELEC144:
	BSF         PORTA+0, 5 
L__SELEC145:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC146
	BCF         PORTA+0, 7 
	GOTO        L__SELEC147
L__SELEC146:
	BSF         PORTA+0, 7 
L__SELEC147:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC148
	BCF         PORTA+0, 6 
	GOTO        L__SELEC149
L__SELEC148:
	BSF         PORTA+0, 6 
L__SELEC149:
;Configuraciones.c,56 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,58 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC6:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC150
	BCF         PORTA+0, 5 
	GOTO        L__SELEC151
L__SELEC150:
	BSF         PORTA+0, 5 
L__SELEC151:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC152
	BCF         PORTA+0, 4 
	GOTO        L__SELEC153
L__SELEC152:
	BSF         PORTA+0, 4 
L__SELEC153:
;Configuraciones.c,59 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC9
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC9
L__SELEC127:
;Configuraciones.c,60 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,61 :: 		}
	GOTO        L_SELEC10
L_SELEC9:
;Configuraciones.c,62 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC13
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC13
L__SELEC126:
;Configuraciones.c,63 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,64 :: 		delay_ms(100);
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
;Configuraciones.c,65 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,66 :: 		delay_ms(100);
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
;Configuraciones.c,67 :: 		}
	GOTO        L_SELEC16
L_SELEC13:
;Configuraciones.c,68 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC17
;Configuraciones.c,69 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,70 :: 		delay_ms(100);
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
;Configuraciones.c,71 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,72 :: 		delay_ms(100);
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
;Configuraciones.c,73 :: 		}
	GOTO        L_SELEC20
L_SELEC17:
;Configuraciones.c,74 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC21
;Configuraciones.c,75 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,76 :: 		delay_ms(100);
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
;Configuraciones.c,77 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,78 :: 		delay_ms(100);
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
;Configuraciones.c,79 :: 		}
L_SELEC21:
L_SELEC20:
L_SELEC16:
L_SELEC10:
;Configuraciones.c,81 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,83 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC24:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC154
	BCF         PORTA+0, 5 
	GOTO        L__SELEC155
L__SELEC154:
	BSF         PORTA+0, 5 
L__SELEC155:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC156
	BCF         PORTA+0, 4 
	GOTO        L__SELEC157
L__SELEC156:
	BSF         PORTA+0, 4 
L__SELEC157:
;Configuraciones.c,84 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,86 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,88 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC25:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC158
	BCF         PORTA+0, 6 
	GOTO        L__SELEC159
L__SELEC158:
	BSF         PORTA+0, 6 
L__SELEC159:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC160
	BCF         PORTA+0, 5 
	GOTO        L__SELEC161
L__SELEC160:
	BSF         PORTA+0, 5 
L__SELEC161:
;Configuraciones.c,89 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,90 :: 		delay_ms(400);
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
;Configuraciones.c,91 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,92 :: 		delay_ms(50);
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
;Configuraciones.c,97 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,99 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC28:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC162
	BCF         PORTA+0, 7 
	GOTO        L__SELEC163
L__SELEC162:
	BSF         PORTA+0, 7 
L__SELEC163:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC164
	BCF         PORTA+0, 4 
	GOTO        L__SELEC165
L__SELEC164:
	BSF         PORTA+0, 4 
L__SELEC165:
;Configuraciones.c,100 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,101 :: 		delay_ms(250);
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
;Configuraciones.c,102 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,103 :: 		delay_ms(4000);
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
;Configuraciones.c,104 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,106 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC31:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC166
	BCF         PORTA+0, 5 
	GOTO        L__SELEC167
L__SELEC166:
	BSF         PORTA+0, 5 
L__SELEC167:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC168
	BCF         PORTA+0, 4 
	GOTO        L__SELEC169
L__SELEC168:
	BSF         PORTA+0, 4 
L__SELEC169:
;Configuraciones.c,107 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,108 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,110 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC32:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC170
	BCF         PORTA+0, 7 
	GOTO        L__SELEC171
L__SELEC170:
	BSF         PORTA+0, 7 
L__SELEC171:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC172
	BCF         PORTA+0, 4 
	GOTO        L__SELEC173
L__SELEC172:
	BSF         PORTA+0, 4 
L__SELEC173:
;Configuraciones.c,111 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,113 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,115 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC33:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC174
	BCF         PORTA+0, 7 
	GOTO        L__SELEC175
L__SELEC174:
	BSF         PORTA+0, 7 
L__SELEC175:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC176
	BCF         PORTA+0, 5 
	GOTO        L__SELEC177
L__SELEC176:
	BSF         PORTA+0, 5 
L__SELEC177:
	BSF         PORTA+0, 4 
;Configuraciones.c,117 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,119 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC34:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC178
	BCF         PORTA+0, 5 
	GOTO        L__SELEC179
L__SELEC178:
	BSF         PORTA+0, 5 
L__SELEC179:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC180
	BCF         PORTA+0, 7 
	GOTO        L__SELEC181
L__SELEC180:
	BSF         PORTA+0, 7 
L__SELEC181:
;Configuraciones.c,121 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,123 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC35:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC182
	BCF         PORTA+0, 6 
	GOTO        L__SELEC183
L__SELEC182:
	BSF         PORTA+0, 6 
L__SELEC183:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC184
	BCF         PORTA+0, 7 
	GOTO        L__SELEC185
L__SELEC184:
	BSF         PORTA+0, 7 
L__SELEC185:
;Configuraciones.c,126 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,128 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC36:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC186
	BCF         PORTA+0, 4 
	GOTO        L__SELEC187
L__SELEC186:
	BSF         PORTA+0, 4 
L__SELEC187:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC188
	BCF         PORTA+0, 5 
	GOTO        L__SELEC189
L__SELEC188:
	BSF         PORTA+0, 5 
L__SELEC189:
;Configuraciones.c,129 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,131 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC37:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC190
	BCF         PORTA+0, 7 
	GOTO        L__SELEC191
L__SELEC190:
	BSF         PORTA+0, 7 
L__SELEC191:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC192
	BCF         PORTA+0, 6 
	GOTO        L__SELEC193
L__SELEC192:
	BSF         PORTA+0, 6 
L__SELEC193:
	BSF         PORTA+0, 5 
;Configuraciones.c,132 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,134 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC38:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC194
	BCF         PORTA+0, 4 
	GOTO        L__SELEC195
L__SELEC194:
	BSF         PORTA+0, 4 
L__SELEC195:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC196
	BCF         PORTA+0, 7 
	GOTO        L__SELEC197
L__SELEC196:
	BSF         PORTA+0, 7 
L__SELEC197:
;Configuraciones.c,135 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,137 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC39:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC198
	BCF         PORTA+0, 5 
	GOTO        L__SELEC199
L__SELEC198:
	BSF         PORTA+0, 5 
L__SELEC199:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC200
	BCF         PORTA+0, 4 
	GOTO        L__SELEC201
L__SELEC200:
	BSF         PORTA+0, 4 
L__SELEC201:
	BSF         PORTA+0, 7 
;Configuraciones.c,138 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,140 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC40:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC202
	BCF         PORTA+0, 5 
	GOTO        L__SELEC203
L__SELEC202:
	BSF         PORTA+0, 5 
L__SELEC203:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC204
	BCF         PORTA+0, 4 
	GOTO        L__SELEC205
L__SELEC204:
	BSF         PORTA+0, 4 
L__SELEC205:
	BSF         PORTA+0, 6 
;Configuraciones.c,141 :: 		break;
	GOTO        L_SELEC4
;Configuraciones.c,143 :: 		default: L0=L1=L2=L3=0;
L_SELEC41:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC206
	BCF         PORTA+0, 5 
	GOTO        L__SELEC207
L__SELEC206:
	BSF         PORTA+0, 5 
L__SELEC207:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC208
	BCF         PORTA+0, 7 
	GOTO        L__SELEC209
L__SELEC208:
	BSF         PORTA+0, 7 
L__SELEC209:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC210
	BCF         PORTA+0, 6 
	GOTO        L__SELEC211
L__SELEC210:
	BSF         PORTA+0, 6 
L__SELEC211:
;Configuraciones.c,144 :: 		}
	GOTO        L_SELEC4
L_SELEC3:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC212
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC212:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC5
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC213
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC213:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC6
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC214
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC214:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC24
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC215
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC215:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC216
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC216:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC217
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC217:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC218
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC218:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC219
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC219:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC220
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC220:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC221
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC221:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC222
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC222:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC223
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC223:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC224
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC224:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC225
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC225:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC226
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC226:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	GOTO        L_SELEC41
L_SELEC4:
;Configuraciones.c,147 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,151 :: 		void combate_estado() {
;Configuraciones.c,152 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado42
;Configuraciones.c,153 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,154 :: 		LOGICA_LINEA();
	CALL        _LOGICA_LINEA+0, 0
;Configuraciones.c,155 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,156 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,157 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,158 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,159 :: 		}
L_combate_estado42:
;Configuraciones.c,160 :: 		switch (estado_combate) {
	GOTO        L_combate_estado43
;Configuraciones.c,161 :: 		case CMB_ESPERA:
L_combate_estado45:
;Configuraciones.c,162 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado48
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado48
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado48
L__combate_estado135:
;Configuraciones.c,163 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,164 :: 		}
	GOTO        L_combate_estado49
L_combate_estado48:
;Configuraciones.c,165 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado52
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado52
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado52
L__combate_estado134:
;Configuraciones.c,166 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,167 :: 		}
	GOTO        L_combate_estado53
L_combate_estado52:
;Configuraciones.c,168 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado56
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado56
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado56
L__combate_estado133:
;Configuraciones.c,169 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,170 :: 		}
	GOTO        L_combate_estado57
L_combate_estado56:
;Configuraciones.c,171 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado60
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado60
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado60
L__combate_estado132:
;Configuraciones.c,172 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,173 :: 		}
	GOTO        L_combate_estado61
L_combate_estado60:
;Configuraciones.c,174 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado64
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado64
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado64
L__combate_estado131:
;Configuraciones.c,175 :: 		estado_combate = CMB_DER_HARD;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,176 :: 		}
	GOTO        L_combate_estado65
L_combate_estado64:
;Configuraciones.c,177 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado68
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado68
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado68
L__combate_estado130:
;Configuraciones.c,178 :: 		estado_combate = CMB_LIBRE;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,179 :: 		}
	GOTO        L_combate_estado69
L_combate_estado68:
;Configuraciones.c,180 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado72
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado72
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado72
L__combate_estado129:
;Configuraciones.c,181 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,182 :: 		}
	GOTO        L_combate_estado73
L_combate_estado72:
;Configuraciones.c,183 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado76
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado76
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado76
L__combate_estado128:
;Configuraciones.c,184 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,185 :: 		}
	GOTO        L_combate_estado77
L_combate_estado76:
;Configuraciones.c,187 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,188 :: 		}
L_combate_estado77:
L_combate_estado73:
L_combate_estado69:
L_combate_estado65:
L_combate_estado61:
L_combate_estado57:
L_combate_estado53:
L_combate_estado49:
;Configuraciones.c,189 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,191 :: 		case CMB_REC:
L_combate_estado78:
;Configuraciones.c,192 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado228
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado229
L__combate_estado228:
	BSF         PORTA+0, 5 
L__combate_estado229:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado230
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado231
L__combate_estado230:
	BSF         PORTA+0, 7 
L__combate_estado231:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado232
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado233
L__combate_estado232:
	BSF         PORTA+0, 6 
L__combate_estado233:
;Configuraciones.c,193 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,194 :: 		delay_ms(250);
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
;Configuraciones.c,195 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,196 :: 		delay_ms(200);
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
;Configuraciones.c,197 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,198 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,200 :: 		case CMB_IZQ:
L_combate_estado81:
;Configuraciones.c,201 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado234
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado235
L__combate_estado234:
	BSF         PORTA+0, 5 
L__combate_estado235:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado236
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado237
L__combate_estado236:
	BSF         PORTA+0, 7 
L__combate_estado237:
;Configuraciones.c,202 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,203 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado82:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado82
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado82
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado82
	NOP
;Configuraciones.c,204 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,205 :: 		delay_ms(100);
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
;Configuraciones.c,206 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,207 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,209 :: 		case CMB_HIT:
L_combate_estado84:
;Configuraciones.c,210 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado238
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado239
L__combate_estado238:
	BSF         PORTA+0, 5 
L__combate_estado239:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado240
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado241
L__combate_estado240:
	BSF         PORTA+0, 6 
L__combate_estado241:
;Configuraciones.c,211 :: 		HIT_NO_BLOQUEANTE();
	CALL        _HIT_NO_BLOQUEANTE+0, 0
;Configuraciones.c,212 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,213 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,215 :: 		case CMB_IZQ_GOLPE:
L_combate_estado85:
;Configuraciones.c,216 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado242
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado243
L__combate_estado242:
	BSF         PORTA+0, 6 
L__combate_estado243:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado244
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado245
L__combate_estado244:
	BSF         PORTA+0, 5 
L__combate_estado245:
;Configuraciones.c,217 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,218 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado86:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado86
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado86
	NOP
	NOP
;Configuraciones.c,220 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado87:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado87
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado87
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado87
	NOP
;Configuraciones.c,221 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,222 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,224 :: 		case CMB_DER_HARD:
L_combate_estado88:
;Configuraciones.c,225 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado246
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado247
L__combate_estado246:
	BSF         PORTA+0, 7 
L__combate_estado247:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado248
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado249
L__combate_estado248:
	BSF         PORTA+0, 6 
L__combate_estado249:
;Configuraciones.c,226 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,227 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado89:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado89
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado89
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado89
;Configuraciones.c,228 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,229 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_combate_estado90:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado90
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado90
	NOP
	NOP
;Configuraciones.c,230 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,231 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,233 :: 		case CMB_LIBRE:
L_combate_estado91:
;Configuraciones.c,234 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado250
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado251
L__combate_estado250:
	BSF         PORTA+0, 6 
L__combate_estado251:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado252
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado253
L__combate_estado252:
	BSF         PORTA+0, 7 
L__combate_estado253:
;Configuraciones.c,235 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,236 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,237 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,239 :: 		case CMB_DER_HIT:
L_combate_estado92:
;Configuraciones.c,240 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado254
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado255
L__combate_estado254:
	BSF         PORTA+0, 7 
L__combate_estado255:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado256
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado257
L__combate_estado256:
	BSF         PORTA+0, 6 
L__combate_estado257:
;Configuraciones.c,241 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,242 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado93:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado93
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado93
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado93
;Configuraciones.c,243 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,244 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_combate_estado94:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado94
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado94
	NOP
	NOP
;Configuraciones.c,245 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,246 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,248 :: 		case CMB_HIT_FULL:
L_combate_estado95:
;Configuraciones.c,249 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado258
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado259
L__combate_estado258:
	BSF         PORTA+0, 7 
L__combate_estado259:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado260
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado261
L__combate_estado260:
	BSF         PORTA+0, 6 
L__combate_estado261:
	BSF         PORTA+0, 4 
;Configuraciones.c,250 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,251 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,252 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,254 :: 		default:
L_combate_estado96:
;Configuraciones.c,255 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,256 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,257 :: 		break;
	GOTO        L_combate_estado44
;Configuraciones.c,258 :: 		}
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
	GOTO        L_combate_estado84
	MOVF        _estado_combate+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado85
	MOVF        _estado_combate+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado88
	MOVF        _estado_combate+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado91
	MOVF        _estado_combate+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado92
	MOVF        _estado_combate+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado95
	GOTO        L_combate_estado96
L_combate_estado44:
;Configuraciones.c,259 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,261 :: 		void Start(){
;Configuraciones.c,262 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,263 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,264 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,265 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,266 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,267 :: 		return;
;Configuraciones.c,268 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,269 :: 		void Stop(){
;Configuraciones.c,270 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,271 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,272 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,273 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,274 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,275 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,282 :: 		void REC(){
;Configuraciones.c,284 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,286 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,287 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,290 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,291 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,292 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,293 :: 		void DER(){
;Configuraciones.c,294 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,295 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,296 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,298 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,299 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,301 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_DER_Z:

;Configuraciones.c,302 :: 		void DER_Z(){
;Configuraciones.c,303 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,304 :: 		PWM1_Set_Duty(230);
	MOVLW       230
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,305 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,307 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,308 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,311 :: 		}
L_end_DER_Z:
	RETURN      0
; end of _DER_Z

_IZQ:

;Configuraciones.c,314 :: 		void IZQ(){
;Configuraciones.c,315 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,316 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,317 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,319 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,320 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,321 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;Configuraciones.c,323 :: 		void REV(){
;Configuraciones.c,324 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,325 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,326 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,327 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,328 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,330 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,332 :: 		void LIBRE(){
;Configuraciones.c,334 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,335 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,336 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,337 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,338 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,342 :: 		void GIRO180(){
;Configuraciones.c,343 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,345 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,346 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,348 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,349 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,350 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18097:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18097
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18097
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18097
;Configuraciones.c,351 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,354 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,356 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,357 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,358 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36098:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36098
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36098
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36098
	NOP
	NOP
;Configuraciones.c,359 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,361 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,363 :: 		void BRAKE(){
;Configuraciones.c,365 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,366 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,367 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,368 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,369 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,372 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,373 :: 		void HARD(){
;Configuraciones.c,374 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,375 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,376 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,377 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,380 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,381 :: 		void PUSH(){
;Configuraciones.c,382 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,384 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,385 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,388 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,389 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,391 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,392 :: 		void HIT(){
;Configuraciones.c,394 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,395 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT99:
	DECFSZ      R13, 1, 1
	BRA         L_HIT99
	DECFSZ      R12, 1, 1
	BRA         L_HIT99
	NOP
	NOP
;Configuraciones.c,396 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,397 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT100:
	DECFSZ      R13, 1, 1
	BRA         L_HIT100
	DECFSZ      R12, 1, 1
	BRA         L_HIT100
	DECFSZ      R11, 1, 1
	BRA         L_HIT100
	NOP
	NOP
;Configuraciones.c,398 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_HIT_NO_BLOQUEANTE:

;Configuraciones.c,399 :: 		void HIT_NO_BLOQUEANTE(){
;Configuraciones.c,400 :: 		unsigned long now = millis(); // Usa tu función de tiempo
	CALL        _millis+0, 0
	MOVF        R0, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+0 
	MOVF        R1, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+1 
	MOVF        R2, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+2 
	MOVF        R3, 0 
	MOVWF       HIT_NO_BLOQUEANTE_now_L0+3 
;Configuraciones.c,402 :: 		switch (estado_movimiento) {
	GOTO        L_HIT_NO_BLOQUEANTE101
;Configuraciones.c,403 :: 		case MOV_IDLE:
L_HIT_NO_BLOQUEANTE103:
;Configuraciones.c,404 :: 		PUSH(); // Avanza rápido
	CALL        _PUSH+0, 0
;Configuraciones.c,405 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,406 :: 		estado_movimiento = MOV_HIT_REC;
	MOVLW       1
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,407 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE102
;Configuraciones.c,409 :: 		case MOV_HIT_REC:
L_HIT_NO_BLOQUEANTE104:
;Configuraciones.c,411 :: 		if (now - tiempo_movimiento >= 20) {
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
	GOTO        L__HIT_NO_BLOQUEANTE277
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE277
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__HIT_NO_BLOQUEANTE277
	MOVLW       20
	SUBWF       R1, 0 
L__HIT_NO_BLOQUEANTE277:
	BTFSS       STATUS+0, 0 
	GOTO        L_HIT_NO_BLOQUEANTE105
;Configuraciones.c,412 :: 		PUSH(); // Empuje fuerte
	CALL        _PUSH+0, 0
;Configuraciones.c,413 :: 		tiempo_movimiento = now;
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,414 :: 		estado_movimiento = MOV_HIT_PUSH;
	MOVLW       2
	MOVWF       _estado_movimiento+0 
;Configuraciones.c,415 :: 		}
L_HIT_NO_BLOQUEANTE105:
;Configuraciones.c,416 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE102
;Configuraciones.c,418 :: 		case MOV_HIT_PUSH:
L_HIT_NO_BLOQUEANTE106:
;Configuraciones.c,420 :: 		if (S2 == 0) {
	BTFSC       PORTC+0, 6 
	GOTO        L_HIT_NO_BLOQUEANTE107
;Configuraciones.c,422 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,423 :: 		tiempo_movimiento = now; // Actualiza tiempo si quieres tiempo máximo de empuje
	MOVF        HIT_NO_BLOQUEANTE_now_L0+0, 0 
	MOVWF       _tiempo_movimiento+0 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+1, 0 
	MOVWF       _tiempo_movimiento+1 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+2, 0 
	MOVWF       _tiempo_movimiento+2 
	MOVF        HIT_NO_BLOQUEANTE_now_L0+3, 0 
	MOVWF       _tiempo_movimiento+3 
;Configuraciones.c,424 :: 		} else {
	GOTO        L_HIT_NO_BLOQUEANTE108
L_HIT_NO_BLOQUEANTE107:
;Configuraciones.c,426 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,427 :: 		estado_movimiento = MOV_IDLE;
	CLRF        _estado_movimiento+0 
;Configuraciones.c,428 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,429 :: 		}
L_HIT_NO_BLOQUEANTE108:
;Configuraciones.c,436 :: 		break;
	GOTO        L_HIT_NO_BLOQUEANTE102
;Configuraciones.c,437 :: 		}
L_HIT_NO_BLOQUEANTE101:
	MOVF        _estado_movimiento+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE103
	MOVF        _estado_movimiento+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE104
	MOVF        _estado_movimiento+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_HIT_NO_BLOQUEANTE106
L_HIT_NO_BLOQUEANTE102:
;Configuraciones.c,438 :: 		}
L_end_HIT_NO_BLOQUEANTE:
	RETURN      0
; end of _HIT_NO_BLOQUEANTE

_LOGICA_LINEA:

;Configuraciones.c,444 :: 		void LOGICA_LINEA(){
;Configuraciones.c,445 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA111
	BTFSS       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA111
L__LOGICA_LINEA137:
;Configuraciones.c,446 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,447 :: 		}
	GOTO        L_LOGICA_LINEA112
L_LOGICA_LINEA111:
;Configuraciones.c,448 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA115
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA115
L__LOGICA_LINEA136:
;Configuraciones.c,449 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,450 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA116:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA116
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA116
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA116
	NOP
;Configuraciones.c,451 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,452 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA117:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA117
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA117
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA117
	NOP
;Configuraciones.c,453 :: 		}
	GOTO        L_LOGICA_LINEA118
L_LOGICA_LINEA115:
;Configuraciones.c,454 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA119
;Configuraciones.c,455 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,456 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA120:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA120
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA120
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA120
	NOP
;Configuraciones.c,457 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,458 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA121:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA121
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA121
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA121
	NOP
;Configuraciones.c,459 :: 		}
	GOTO        L_LOGICA_LINEA122
L_LOGICA_LINEA119:
;Configuraciones.c,460 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA123
;Configuraciones.c,461 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,462 :: 		delay_ms(100);
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
;Configuraciones.c,463 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,464 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA125:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA125
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA125
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA125
	NOP
;Configuraciones.c,465 :: 		}
L_LOGICA_LINEA123:
L_LOGICA_LINEA122:
L_LOGICA_LINEA118:
L_LOGICA_LINEA112:
;Configuraciones.c,466 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
