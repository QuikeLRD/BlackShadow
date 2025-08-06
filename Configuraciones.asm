
_INTERRUPT:

;Configuraciones.c,30 :: 		void INTERRUPT(){
;Configuraciones.c,33 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT0
;Configuraciones.c,34 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,35 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,36 :: 		linea_detectada = 1;        //Activamos bandera global
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,37 :: 		}
L_INTERRUPT0:
;Configuraciones.c,39 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT1
;Configuraciones.c,40 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,41 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,42 :: 		linea_detectada = 1;
	MOVLW       1
	MOVWF       _linea_detectada+0 
;Configuraciones.c,43 :: 		}
L_INTERRUPT1:
;Configuraciones.c,44 :: 		}
L_end_INTERRUPT:
L__INTERRUPT130:
	RETFIE      1
; end of _INTERRUPT

_SELEC:

;Configuraciones.c,47 :: 		void SELEC(){
;Configuraciones.c,49 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC132:
	BZ          L__SELEC133
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC132
L__SELEC133:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;Configuraciones.c,51 :: 		switch(seleccion){
	GOTO        L_SELEC2
;Configuraciones.c,52 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC4:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC134
	BCF         PORTA+0, 5 
	GOTO        L__SELEC135
L__SELEC134:
	BSF         PORTA+0, 5 
L__SELEC135:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC136
	BCF         PORTA+0, 7 
	GOTO        L__SELEC137
L__SELEC136:
	BSF         PORTA+0, 7 
L__SELEC137:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC138
	BCF         PORTA+0, 6 
	GOTO        L__SELEC139
L__SELEC138:
	BSF         PORTA+0, 6 
L__SELEC139:
;Configuraciones.c,55 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,57 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC5:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC140
	BCF         PORTA+0, 5 
	GOTO        L__SELEC141
L__SELEC140:
	BSF         PORTA+0, 5 
L__SELEC141:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC142
	BCF         PORTA+0, 4 
	GOTO        L__SELEC143
L__SELEC142:
	BSF         PORTA+0, 4 
L__SELEC143:
;Configuraciones.c,58 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC8
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC8
L__SELEC118:
;Configuraciones.c,59 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,60 :: 		}
	GOTO        L_SELEC9
L_SELEC8:
;Configuraciones.c,61 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC12
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC12
L__SELEC117:
;Configuraciones.c,62 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,63 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC13:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC13
	DECFSZ      R12, 1, 1
	BRA         L_SELEC13
	DECFSZ      R11, 1, 1
	BRA         L_SELEC13
	NOP
;Configuraciones.c,64 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,65 :: 		delay_ms(100);
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
;Configuraciones.c,66 :: 		}
	GOTO        L_SELEC15
L_SELEC12:
;Configuraciones.c,67 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC16
;Configuraciones.c,68 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,69 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC17:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC17
	DECFSZ      R12, 1, 1
	BRA         L_SELEC17
	DECFSZ      R11, 1, 1
	BRA         L_SELEC17
	NOP
;Configuraciones.c,70 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,71 :: 		delay_ms(100);
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
;Configuraciones.c,72 :: 		}
	GOTO        L_SELEC19
L_SELEC16:
;Configuraciones.c,73 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC20
;Configuraciones.c,74 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,75 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC21:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC21
	DECFSZ      R12, 1, 1
	BRA         L_SELEC21
	DECFSZ      R11, 1, 1
	BRA         L_SELEC21
	NOP
;Configuraciones.c,76 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,77 :: 		delay_ms(100);
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
;Configuraciones.c,78 :: 		}
L_SELEC20:
L_SELEC19:
L_SELEC15:
L_SELEC9:
;Configuraciones.c,80 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,82 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC23:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC144
	BCF         PORTA+0, 5 
	GOTO        L__SELEC145
L__SELEC144:
	BSF         PORTA+0, 5 
L__SELEC145:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC146
	BCF         PORTA+0, 4 
	GOTO        L__SELEC147
L__SELEC146:
	BSF         PORTA+0, 4 
L__SELEC147:
;Configuraciones.c,83 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,85 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,87 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC24:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC148
	BCF         PORTA+0, 6 
	GOTO        L__SELEC149
L__SELEC148:
	BSF         PORTA+0, 6 
L__SELEC149:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC150
	BCF         PORTA+0, 5 
	GOTO        L__SELEC151
L__SELEC150:
	BSF         PORTA+0, 5 
L__SELEC151:
;Configuraciones.c,88 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,89 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_SELEC25:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC25
	DECFSZ      R12, 1, 1
	BRA         L_SELEC25
	DECFSZ      R11, 1, 1
	BRA         L_SELEC25
;Configuraciones.c,90 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,91 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_SELEC26:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC26
	DECFSZ      R12, 1, 1
	BRA         L_SELEC26
	NOP
	NOP
;Configuraciones.c,96 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,98 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC27:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC152
	BCF         PORTA+0, 7 
	GOTO        L__SELEC153
L__SELEC152:
	BSF         PORTA+0, 7 
L__SELEC153:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC154
	BCF         PORTA+0, 4 
	GOTO        L__SELEC155
L__SELEC154:
	BSF         PORTA+0, 4 
L__SELEC155:
;Configuraciones.c,99 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,100 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
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
;Configuraciones.c,101 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,102 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC29:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC29
	DECFSZ      R12, 1, 1
	BRA         L_SELEC29
	DECFSZ      R11, 1, 1
	BRA         L_SELEC29
;Configuraciones.c,103 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,105 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC30:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC156
	BCF         PORTA+0, 5 
	GOTO        L__SELEC157
L__SELEC156:
	BSF         PORTA+0, 5 
L__SELEC157:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC158
	BCF         PORTA+0, 4 
	GOTO        L__SELEC159
L__SELEC158:
	BSF         PORTA+0, 4 
L__SELEC159:
;Configuraciones.c,106 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,107 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,109 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC31:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC160
	BCF         PORTA+0, 7 
	GOTO        L__SELEC161
L__SELEC160:
	BSF         PORTA+0, 7 
L__SELEC161:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC162
	BCF         PORTA+0, 4 
	GOTO        L__SELEC163
L__SELEC162:
	BSF         PORTA+0, 4 
L__SELEC163:
;Configuraciones.c,110 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,112 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,114 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC32:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC164
	BCF         PORTA+0, 7 
	GOTO        L__SELEC165
L__SELEC164:
	BSF         PORTA+0, 7 
L__SELEC165:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC166
	BCF         PORTA+0, 5 
	GOTO        L__SELEC167
L__SELEC166:
	BSF         PORTA+0, 5 
L__SELEC167:
	BSF         PORTA+0, 4 
;Configuraciones.c,116 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,118 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC33:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC168
	BCF         PORTA+0, 5 
	GOTO        L__SELEC169
L__SELEC168:
	BSF         PORTA+0, 5 
L__SELEC169:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC170
	BCF         PORTA+0, 7 
	GOTO        L__SELEC171
L__SELEC170:
	BSF         PORTA+0, 7 
L__SELEC171:
;Configuraciones.c,120 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,122 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC34:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC172
	BCF         PORTA+0, 6 
	GOTO        L__SELEC173
L__SELEC172:
	BSF         PORTA+0, 6 
L__SELEC173:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC174
	BCF         PORTA+0, 7 
	GOTO        L__SELEC175
L__SELEC174:
	BSF         PORTA+0, 7 
L__SELEC175:
;Configuraciones.c,125 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,127 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC35:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC176
	BCF         PORTA+0, 4 
	GOTO        L__SELEC177
L__SELEC176:
	BSF         PORTA+0, 4 
L__SELEC177:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC178
	BCF         PORTA+0, 5 
	GOTO        L__SELEC179
L__SELEC178:
	BSF         PORTA+0, 5 
L__SELEC179:
;Configuraciones.c,128 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,130 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC36:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC180
	BCF         PORTA+0, 7 
	GOTO        L__SELEC181
L__SELEC180:
	BSF         PORTA+0, 7 
L__SELEC181:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC182
	BCF         PORTA+0, 6 
	GOTO        L__SELEC183
L__SELEC182:
	BSF         PORTA+0, 6 
L__SELEC183:
	BSF         PORTA+0, 5 
;Configuraciones.c,131 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,133 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC37:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC184
	BCF         PORTA+0, 4 
	GOTO        L__SELEC185
L__SELEC184:
	BSF         PORTA+0, 4 
L__SELEC185:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC186
	BCF         PORTA+0, 7 
	GOTO        L__SELEC187
L__SELEC186:
	BSF         PORTA+0, 7 
L__SELEC187:
;Configuraciones.c,134 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,136 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC38:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC188
	BCF         PORTA+0, 5 
	GOTO        L__SELEC189
L__SELEC188:
	BSF         PORTA+0, 5 
L__SELEC189:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC190
	BCF         PORTA+0, 4 
	GOTO        L__SELEC191
L__SELEC190:
	BSF         PORTA+0, 4 
L__SELEC191:
	BSF         PORTA+0, 7 
;Configuraciones.c,137 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,139 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC39:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC192
	BCF         PORTA+0, 5 
	GOTO        L__SELEC193
L__SELEC192:
	BSF         PORTA+0, 5 
L__SELEC193:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC194
	BCF         PORTA+0, 4 
	GOTO        L__SELEC195
L__SELEC194:
	BSF         PORTA+0, 4 
L__SELEC195:
	BSF         PORTA+0, 6 
;Configuraciones.c,140 :: 		break;
	GOTO        L_SELEC3
;Configuraciones.c,142 :: 		default: L0=L1=L2=L3=0;
L_SELEC40:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC196
	BCF         PORTA+0, 5 
	GOTO        L__SELEC197
L__SELEC196:
	BSF         PORTA+0, 5 
L__SELEC197:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC198
	BCF         PORTA+0, 7 
	GOTO        L__SELEC199
L__SELEC198:
	BSF         PORTA+0, 7 
L__SELEC199:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC200
	BCF         PORTA+0, 6 
	GOTO        L__SELEC201
L__SELEC200:
	BSF         PORTA+0, 6 
L__SELEC201:
;Configuraciones.c,143 :: 		}
	GOTO        L_SELEC3
L_SELEC2:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC202
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC202:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC4
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC203
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC203:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC5
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC204
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC204:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC23
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC205
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC205:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC24
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC206
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC206:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC27
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC207
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC207:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC30
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC208
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC208:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC209
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC209:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC210
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC210:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC211
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC211:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC212
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC212:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC213
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC213:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC214
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC214:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC215
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC215:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC216
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC216:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	GOTO        L_SELEC40
L_SELEC3:
;Configuraciones.c,146 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,150 :: 		void combate_estado() {
;Configuraciones.c,151 :: 		if(linea_detectada){
	MOVF        _linea_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado41
;Configuraciones.c,152 :: 		LOGICA_LINEA();
	CALL        _LOGICA_LINEA+0, 0
;Configuraciones.c,153 :: 		linea_detectada = 0;
	CLRF        _linea_detectada+0 
;Configuraciones.c,154 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,155 :: 		return;
	GOTO        L_end_combate_estado
;Configuraciones.c,156 :: 		}
L_combate_estado41:
;Configuraciones.c,157 :: 		switch (estado_combate) {
	GOTO        L_combate_estado42
;Configuraciones.c,158 :: 		case CMB_ESPERA:
L_combate_estado44:
;Configuraciones.c,159 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado47
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado47
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado47
L__combate_estado126:
;Configuraciones.c,160 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,161 :: 		}
	GOTO        L_combate_estado48
L_combate_estado47:
;Configuraciones.c,162 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado51
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado51
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado51
L__combate_estado125:
;Configuraciones.c,163 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,164 :: 		}
	GOTO        L_combate_estado52
L_combate_estado51:
;Configuraciones.c,165 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado55
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado55
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado55
L__combate_estado124:
;Configuraciones.c,166 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,167 :: 		}
	GOTO        L_combate_estado56
L_combate_estado55:
;Configuraciones.c,168 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado59
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado59
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado59
L__combate_estado123:
;Configuraciones.c,169 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,170 :: 		}
	GOTO        L_combate_estado60
L_combate_estado59:
;Configuraciones.c,171 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado63
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado63
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado63
L__combate_estado122:
;Configuraciones.c,172 :: 		estado_combate = CMB_DER_HARD;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,173 :: 		}
	GOTO        L_combate_estado64
L_combate_estado63:
;Configuraciones.c,174 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado67
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado67
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado67
L__combate_estado121:
;Configuraciones.c,175 :: 		estado_combate = CMB_LIBRE;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,176 :: 		}
	GOTO        L_combate_estado68
L_combate_estado67:
;Configuraciones.c,177 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado71
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado71
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado71
L__combate_estado120:
;Configuraciones.c,178 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,179 :: 		}
	GOTO        L_combate_estado72
L_combate_estado71:
;Configuraciones.c,180 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado75
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado75
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado75
L__combate_estado119:
;Configuraciones.c,181 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,182 :: 		}
	GOTO        L_combate_estado76
L_combate_estado75:
;Configuraciones.c,184 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,185 :: 		}
L_combate_estado76:
L_combate_estado72:
L_combate_estado68:
L_combate_estado64:
L_combate_estado60:
L_combate_estado56:
L_combate_estado52:
L_combate_estado48:
;Configuraciones.c,186 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,188 :: 		case CMB_REC:
L_combate_estado77:
;Configuraciones.c,189 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado218
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado219
L__combate_estado218:
	BSF         PORTA+0, 5 
L__combate_estado219:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado220
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado221
L__combate_estado220:
	BSF         PORTA+0, 7 
L__combate_estado221:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado222
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado223
L__combate_estado222:
	BSF         PORTA+0, 6 
L__combate_estado223:
;Configuraciones.c,190 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,191 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_combate_estado78:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado78
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado78
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado78
	NOP
	NOP
;Configuraciones.c,192 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,193 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_combate_estado79:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado79
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado79
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado79
;Configuraciones.c,194 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,195 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,197 :: 		case CMB_IZQ:
L_combate_estado80:
;Configuraciones.c,198 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado224
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado225
L__combate_estado224:
	BSF         PORTA+0, 5 
L__combate_estado225:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado226
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado227
L__combate_estado226:
	BSF         PORTA+0, 7 
L__combate_estado227:
;Configuraciones.c,199 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,200 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado81:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado81
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado81
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado81
	NOP
;Configuraciones.c,201 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,202 :: 		delay_ms(100);
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
;Configuraciones.c,203 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,204 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,206 :: 		case CMB_HIT:
L_combate_estado83:
;Configuraciones.c,207 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
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
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado231
L__combate_estado230:
	BSF         PORTA+0, 6 
L__combate_estado231:
;Configuraciones.c,208 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,209 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,210 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,212 :: 		case CMB_IZQ_GOLPE:
L_combate_estado84:
;Configuraciones.c,213 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado232
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado233
L__combate_estado232:
	BSF         PORTA+0, 6 
L__combate_estado233:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado234
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado235
L__combate_estado234:
	BSF         PORTA+0, 5 
L__combate_estado235:
;Configuraciones.c,214 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,215 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado85:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado85
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado85
	NOP
	NOP
;Configuraciones.c,217 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado86:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado86
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado86
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado86
	NOP
;Configuraciones.c,218 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,219 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,221 :: 		case CMB_DER_HARD:
L_combate_estado87:
;Configuraciones.c,222 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado236
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado237
L__combate_estado236:
	BSF         PORTA+0, 7 
L__combate_estado237:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado238
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado239
L__combate_estado238:
	BSF         PORTA+0, 6 
L__combate_estado239:
;Configuraciones.c,223 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,224 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado88:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado88
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado88
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado88
;Configuraciones.c,225 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,226 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_combate_estado89:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado89
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado89
	NOP
	NOP
;Configuraciones.c,227 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,228 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,230 :: 		case CMB_LIBRE:
L_combate_estado90:
;Configuraciones.c,231 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado240
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado241
L__combate_estado240:
	BSF         PORTA+0, 6 
L__combate_estado241:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado242
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado243
L__combate_estado242:
	BSF         PORTA+0, 7 
L__combate_estado243:
;Configuraciones.c,232 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,233 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,234 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,236 :: 		case CMB_DER_HIT:
L_combate_estado91:
;Configuraciones.c,237 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado244
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado245
L__combate_estado244:
	BSF         PORTA+0, 7 
L__combate_estado245:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado246
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado247
L__combate_estado246:
	BSF         PORTA+0, 6 
L__combate_estado247:
;Configuraciones.c,238 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,239 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado92:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado92
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado92
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado92
;Configuraciones.c,240 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,241 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_combate_estado93:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado93
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado93
	NOP
	NOP
;Configuraciones.c,242 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,243 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,245 :: 		case CMB_HIT_FULL:
L_combate_estado94:
;Configuraciones.c,246 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado248
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado249
L__combate_estado248:
	BSF         PORTA+0, 7 
L__combate_estado249:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado250
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado251
L__combate_estado250:
	BSF         PORTA+0, 6 
L__combate_estado251:
	BSF         PORTA+0, 4 
;Configuraciones.c,247 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,248 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,249 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,251 :: 		default:
L_combate_estado95:
;Configuraciones.c,252 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,253 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,254 :: 		break;
	GOTO        L_combate_estado43
;Configuraciones.c,255 :: 		}
L_combate_estado42:
	MOVF        _estado_combate+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado44
	MOVF        _estado_combate+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado77
	MOVF        _estado_combate+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado80
	MOVF        _estado_combate+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado83
	MOVF        _estado_combate+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado84
	MOVF        _estado_combate+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado87
	MOVF        _estado_combate+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado90
	MOVF        _estado_combate+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado91
	MOVF        _estado_combate+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado94
	GOTO        L_combate_estado95
L_combate_estado43:
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
;Configuraciones.c,283 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
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
;Configuraciones.c,316 :: 		PWM3_Set_Duty(160);
	MOVLW       160
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
L_GIRO18096:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18096
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18096
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18096
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
L_GIRO36097:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36097
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36097
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36097
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
L_HIT98:
	DECFSZ      R13, 1, 1
	BRA         L_HIT98
	DECFSZ      R12, 1, 1
	BRA         L_HIT98
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
L_HIT99:
	DECFSZ      R13, 1, 1
	BRA         L_HIT99
	DECFSZ      R12, 1, 1
	BRA         L_HIT99
	DECFSZ      R11, 1, 1
	BRA         L_HIT99
	NOP
	NOP
;Configuraciones.c,395 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_LOGICA_LINEA:

;Configuraciones.c,396 :: 		void LOGICA_LINEA(){
;Configuraciones.c,397 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA102
	BTFSS       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA102
L__LOGICA_LINEA128:
;Configuraciones.c,398 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,399 :: 		}
	GOTO        L_LOGICA_LINEA103
L_LOGICA_LINEA102:
;Configuraciones.c,400 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA106
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA106
L__LOGICA_LINEA127:
;Configuraciones.c,401 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,402 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA107:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA107
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA107
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA107
	NOP
;Configuraciones.c,403 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,404 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA108:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA108
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA108
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA108
	NOP
;Configuraciones.c,405 :: 		}
	GOTO        L_LOGICA_LINEA109
L_LOGICA_LINEA106:
;Configuraciones.c,406 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_LOGICA_LINEA110
;Configuraciones.c,407 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,408 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA111:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA111
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA111
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA111
	NOP
;Configuraciones.c,409 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,410 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA112:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA112
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA112
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA112
	NOP
;Configuraciones.c,411 :: 		}
	GOTO        L_LOGICA_LINEA113
L_LOGICA_LINEA110:
;Configuraciones.c,412 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_LOGICA_LINEA114
;Configuraciones.c,413 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,414 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LOGICA_LINEA115:
	DECFSZ      R13, 1, 1
	BRA         L_LOGICA_LINEA115
	DECFSZ      R12, 1, 1
	BRA         L_LOGICA_LINEA115
	DECFSZ      R11, 1, 1
	BRA         L_LOGICA_LINEA115
	NOP
;Configuraciones.c,415 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,416 :: 		delay_ms(100);
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
;Configuraciones.c,417 :: 		}
L_LOGICA_LINEA114:
L_LOGICA_LINEA113:
L_LOGICA_LINEA109:
L_LOGICA_LINEA103:
;Configuraciones.c,421 :: 		}
L_end_LOGICA_LINEA:
	RETURN      0
; end of _LOGICA_LINEA
