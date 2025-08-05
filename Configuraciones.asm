
_SELEC:

;Configuraciones.c,29 :: 		void SELEC(){
;Configuraciones.c,31 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC110:
	BZ          L__SELEC111
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC110
L__SELEC111:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;Configuraciones.c,33 :: 		switch(seleccion){
	GOTO        L_SELEC0
;Configuraciones.c,34 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC2:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC112
	BCF         PORTA+0, 5 
	GOTO        L__SELEC113
L__SELEC112:
	BSF         PORTA+0, 5 
L__SELEC113:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC114
	BCF         PORTA+0, 7 
	GOTO        L__SELEC115
L__SELEC114:
	BSF         PORTA+0, 7 
L__SELEC115:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC116
	BCF         PORTA+0, 6 
	GOTO        L__SELEC117
L__SELEC116:
	BSF         PORTA+0, 6 
L__SELEC117:
;Configuraciones.c,37 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,39 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC3:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC118
	BCF         PORTA+0, 5 
	GOTO        L__SELEC119
L__SELEC118:
	BSF         PORTA+0, 5 
L__SELEC119:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC120
	BCF         PORTA+0, 4 
	GOTO        L__SELEC121
L__SELEC120:
	BSF         PORTA+0, 4 
L__SELEC121:
;Configuraciones.c,40 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC6
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC6
L__SELEC100:
;Configuraciones.c,41 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,42 :: 		}
	GOTO        L_SELEC7
L_SELEC6:
;Configuraciones.c,43 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC10
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC10
L__SELEC99:
;Configuraciones.c,44 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,45 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC11:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC11
	DECFSZ      R12, 1, 1
	BRA         L_SELEC11
	DECFSZ      R11, 1, 1
	BRA         L_SELEC11
	NOP
;Configuraciones.c,46 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,47 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC12:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC12
	DECFSZ      R12, 1, 1
	BRA         L_SELEC12
	DECFSZ      R11, 1, 1
	BRA         L_SELEC12
	NOP
;Configuraciones.c,48 :: 		}
	GOTO        L_SELEC13
L_SELEC10:
;Configuraciones.c,49 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC14
;Configuraciones.c,50 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,51 :: 		delay_ms(100);
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
;Configuraciones.c,52 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;Configuraciones.c,53 :: 		delay_ms(100);
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
;Configuraciones.c,54 :: 		}
	GOTO        L_SELEC17
L_SELEC14:
;Configuraciones.c,55 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC18
;Configuraciones.c,56 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,57 :: 		delay_ms(100);
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
;Configuraciones.c,58 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,59 :: 		delay_ms(100);
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
;Configuraciones.c,60 :: 		}
L_SELEC18:
L_SELEC17:
L_SELEC13:
L_SELEC7:
;Configuraciones.c,62 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,64 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC21:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC122
	BCF         PORTA+0, 5 
	GOTO        L__SELEC123
L__SELEC122:
	BSF         PORTA+0, 5 
L__SELEC123:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC124
	BCF         PORTA+0, 4 
	GOTO        L__SELEC125
L__SELEC124:
	BSF         PORTA+0, 4 
L__SELEC125:
;Configuraciones.c,65 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,67 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,69 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC22:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC126
	BCF         PORTA+0, 6 
	GOTO        L__SELEC127
L__SELEC126:
	BSF         PORTA+0, 6 
L__SELEC127:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC128
	BCF         PORTA+0, 5 
	GOTO        L__SELEC129
L__SELEC128:
	BSF         PORTA+0, 5 
L__SELEC129:
;Configuraciones.c,70 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,71 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_SELEC23:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC23
	DECFSZ      R12, 1, 1
	BRA         L_SELEC23
	DECFSZ      R11, 1, 1
	BRA         L_SELEC23
;Configuraciones.c,72 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,73 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_SELEC24:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC24
	DECFSZ      R12, 1, 1
	BRA         L_SELEC24
	NOP
	NOP
;Configuraciones.c,78 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,80 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC25:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC130
	BCF         PORTA+0, 7 
	GOTO        L__SELEC131
L__SELEC130:
	BSF         PORTA+0, 7 
L__SELEC131:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC132
	BCF         PORTA+0, 4 
	GOTO        L__SELEC133
L__SELEC132:
	BSF         PORTA+0, 4 
L__SELEC133:
;Configuraciones.c,81 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,82 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC26:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC26
	DECFSZ      R12, 1, 1
	BRA         L_SELEC26
	DECFSZ      R11, 1, 1
	BRA         L_SELEC26
	NOP
	NOP
;Configuraciones.c,83 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,84 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC27:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC27
	DECFSZ      R12, 1, 1
	BRA         L_SELEC27
	DECFSZ      R11, 1, 1
	BRA         L_SELEC27
;Configuraciones.c,85 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,87 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC28:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC134
	BCF         PORTA+0, 5 
	GOTO        L__SELEC135
L__SELEC134:
	BSF         PORTA+0, 5 
L__SELEC135:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC136
	BCF         PORTA+0, 4 
	GOTO        L__SELEC137
L__SELEC136:
	BSF         PORTA+0, 4 
L__SELEC137:
;Configuraciones.c,88 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,89 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,91 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC29:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC138
	BCF         PORTA+0, 7 
	GOTO        L__SELEC139
L__SELEC138:
	BSF         PORTA+0, 7 
L__SELEC139:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC140
	BCF         PORTA+0, 4 
	GOTO        L__SELEC141
L__SELEC140:
	BSF         PORTA+0, 4 
L__SELEC141:
;Configuraciones.c,92 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,94 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,96 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC30:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC142
	BCF         PORTA+0, 7 
	GOTO        L__SELEC143
L__SELEC142:
	BSF         PORTA+0, 7 
L__SELEC143:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC144
	BCF         PORTA+0, 5 
	GOTO        L__SELEC145
L__SELEC144:
	BSF         PORTA+0, 5 
L__SELEC145:
	BSF         PORTA+0, 4 
;Configuraciones.c,98 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,100 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC31:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC146
	BCF         PORTA+0, 5 
	GOTO        L__SELEC147
L__SELEC146:
	BSF         PORTA+0, 5 
L__SELEC147:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC148
	BCF         PORTA+0, 7 
	GOTO        L__SELEC149
L__SELEC148:
	BSF         PORTA+0, 7 
L__SELEC149:
;Configuraciones.c,102 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,104 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC32:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC150
	BCF         PORTA+0, 6 
	GOTO        L__SELEC151
L__SELEC150:
	BSF         PORTA+0, 6 
L__SELEC151:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC152
	BCF         PORTA+0, 7 
	GOTO        L__SELEC153
L__SELEC152:
	BSF         PORTA+0, 7 
L__SELEC153:
;Configuraciones.c,107 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,109 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC33:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC154
	BCF         PORTA+0, 4 
	GOTO        L__SELEC155
L__SELEC154:
	BSF         PORTA+0, 4 
L__SELEC155:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC156
	BCF         PORTA+0, 5 
	GOTO        L__SELEC157
L__SELEC156:
	BSF         PORTA+0, 5 
L__SELEC157:
;Configuraciones.c,110 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,112 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC34:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC158
	BCF         PORTA+0, 7 
	GOTO        L__SELEC159
L__SELEC158:
	BSF         PORTA+0, 7 
L__SELEC159:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC160
	BCF         PORTA+0, 6 
	GOTO        L__SELEC161
L__SELEC160:
	BSF         PORTA+0, 6 
L__SELEC161:
	BSF         PORTA+0, 5 
;Configuraciones.c,113 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,115 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC35:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC162
	BCF         PORTA+0, 4 
	GOTO        L__SELEC163
L__SELEC162:
	BSF         PORTA+0, 4 
L__SELEC163:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC164
	BCF         PORTA+0, 7 
	GOTO        L__SELEC165
L__SELEC164:
	BSF         PORTA+0, 7 
L__SELEC165:
;Configuraciones.c,116 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,118 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC36:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC166
	BCF         PORTA+0, 5 
	GOTO        L__SELEC167
L__SELEC166:
	BSF         PORTA+0, 5 
L__SELEC167:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC168
	BCF         PORTA+0, 4 
	GOTO        L__SELEC169
L__SELEC168:
	BSF         PORTA+0, 4 
L__SELEC169:
	BSF         PORTA+0, 7 
;Configuraciones.c,119 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,121 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC37:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC170
	BCF         PORTA+0, 5 
	GOTO        L__SELEC171
L__SELEC170:
	BSF         PORTA+0, 5 
L__SELEC171:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC172
	BCF         PORTA+0, 4 
	GOTO        L__SELEC173
L__SELEC172:
	BSF         PORTA+0, 4 
L__SELEC173:
	BSF         PORTA+0, 6 
;Configuraciones.c,122 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,124 :: 		default: L0=L1=L2=L3=0;
L_SELEC38:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC174
	BCF         PORTA+0, 5 
	GOTO        L__SELEC175
L__SELEC174:
	BSF         PORTA+0, 5 
L__SELEC175:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC176
	BCF         PORTA+0, 7 
	GOTO        L__SELEC177
L__SELEC176:
	BSF         PORTA+0, 7 
L__SELEC177:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC178
	BCF         PORTA+0, 6 
	GOTO        L__SELEC179
L__SELEC178:
	BSF         PORTA+0, 6 
L__SELEC179:
;Configuraciones.c,125 :: 		}
	GOTO        L_SELEC1
L_SELEC0:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC180
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC180:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC2
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC181
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC181:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC3
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC182
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC182:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC21
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC183
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC183:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC22
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC184
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC184:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC185
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC185:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC186
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC186:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC29
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC187
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC187:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC30
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC188
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC188:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC189
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC189:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC190
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC190:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC191
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC191:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC192
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC192:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC193
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC193:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC194
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC194:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	GOTO        L_SELEC38
L_SELEC1:
;Configuraciones.c,128 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,132 :: 		void combate_estado() {
;Configuraciones.c,133 :: 		switch (estado_combate) {
	GOTO        L_combate_estado39
;Configuraciones.c,134 :: 		case CMB_ESPERA:
L_combate_estado41:
;Configuraciones.c,135 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado44
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado44
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado44
L__combate_estado108:
;Configuraciones.c,136 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,137 :: 		}
	GOTO        L_combate_estado45
L_combate_estado44:
;Configuraciones.c,138 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado48
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado48
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado48
L__combate_estado107:
;Configuraciones.c,139 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,140 :: 		}
	GOTO        L_combate_estado49
L_combate_estado48:
;Configuraciones.c,141 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado52
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado52
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado52
L__combate_estado106:
;Configuraciones.c,142 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,143 :: 		}
	GOTO        L_combate_estado53
L_combate_estado52:
;Configuraciones.c,144 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado56
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado56
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado56
L__combate_estado105:
;Configuraciones.c,145 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,146 :: 		}
	GOTO        L_combate_estado57
L_combate_estado56:
;Configuraciones.c,147 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado60
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado60
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado60
L__combate_estado104:
;Configuraciones.c,148 :: 		estado_combate = CMB_DER_HARD;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,149 :: 		}
	GOTO        L_combate_estado61
L_combate_estado60:
;Configuraciones.c,150 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado64
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado64
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado64
L__combate_estado103:
;Configuraciones.c,151 :: 		estado_combate = CMB_LIBRE;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,152 :: 		}
	GOTO        L_combate_estado65
L_combate_estado64:
;Configuraciones.c,153 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado68
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado68
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado68
L__combate_estado102:
;Configuraciones.c,154 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,155 :: 		}
	GOTO        L_combate_estado69
L_combate_estado68:
;Configuraciones.c,156 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado72
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado72
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado72
L__combate_estado101:
;Configuraciones.c,157 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,158 :: 		}
	GOTO        L_combate_estado73
L_combate_estado72:
;Configuraciones.c,160 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,161 :: 		}
L_combate_estado73:
L_combate_estado69:
L_combate_estado65:
L_combate_estado61:
L_combate_estado57:
L_combate_estado53:
L_combate_estado49:
L_combate_estado45:
;Configuraciones.c,162 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,164 :: 		case CMB_REC:
L_combate_estado74:
;Configuraciones.c,165 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado196
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado197
L__combate_estado196:
	BSF         PORTA+0, 5 
L__combate_estado197:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado198
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado199
L__combate_estado198:
	BSF         PORTA+0, 7 
L__combate_estado199:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado200
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado201
L__combate_estado200:
	BSF         PORTA+0, 6 
L__combate_estado201:
;Configuraciones.c,166 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,167 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_combate_estado75:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado75
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado75
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado75
	NOP
	NOP
;Configuraciones.c,168 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,169 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_combate_estado76:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado76
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado76
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado76
;Configuraciones.c,170 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,171 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,173 :: 		case CMB_IZQ:
L_combate_estado77:
;Configuraciones.c,174 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado202
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado203
L__combate_estado202:
	BSF         PORTA+0, 5 
L__combate_estado203:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado204
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado205
L__combate_estado204:
	BSF         PORTA+0, 7 
L__combate_estado205:
;Configuraciones.c,175 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,176 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado78:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado78
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado78
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado78
	NOP
;Configuraciones.c,177 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,178 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado79:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado79
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado79
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado79
	NOP
;Configuraciones.c,179 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,180 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,182 :: 		case CMB_HIT:
L_combate_estado80:
;Configuraciones.c,183 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado206
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado207
L__combate_estado206:
	BSF         PORTA+0, 5 
L__combate_estado207:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado208
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado209
L__combate_estado208:
	BSF         PORTA+0, 6 
L__combate_estado209:
;Configuraciones.c,184 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,185 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,186 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,188 :: 		case CMB_IZQ_GOLPE:
L_combate_estado81:
;Configuraciones.c,189 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado210
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado211
L__combate_estado210:
	BSF         PORTA+0, 6 
L__combate_estado211:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado212
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado213
L__combate_estado212:
	BSF         PORTA+0, 5 
L__combate_estado213:
;Configuraciones.c,190 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,191 :: 		delay_ms(20);
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
;Configuraciones.c,193 :: 		delay_ms(100);
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
;Configuraciones.c,194 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,195 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,197 :: 		case CMB_DER_HARD:
L_combate_estado84:
;Configuraciones.c,198 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado214
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado215
L__combate_estado214:
	BSF         PORTA+0, 7 
L__combate_estado215:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado216
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado217
L__combate_estado216:
	BSF         PORTA+0, 6 
L__combate_estado217:
;Configuraciones.c,199 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,200 :: 		delay_ms(400);
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
;Configuraciones.c,201 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,202 :: 		delay_ms(50);
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
;Configuraciones.c,203 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,204 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,206 :: 		case CMB_LIBRE:
L_combate_estado87:
;Configuraciones.c,207 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado218
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado219
L__combate_estado218:
	BSF         PORTA+0, 6 
L__combate_estado219:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado220
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado221
L__combate_estado220:
	BSF         PORTA+0, 7 
L__combate_estado221:
;Configuraciones.c,208 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,209 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,210 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,212 :: 		case CMB_DER_HIT:
L_combate_estado88:
;Configuraciones.c,213 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado222
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado223
L__combate_estado222:
	BSF         PORTA+0, 7 
L__combate_estado223:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado224
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado225
L__combate_estado224:
	BSF         PORTA+0, 6 
L__combate_estado225:
;Configuraciones.c,214 :: 		DER_Z();
	CALL        _DER_Z+0, 0
;Configuraciones.c,215 :: 		delay_ms(400);
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
;Configuraciones.c,216 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,217 :: 		delay_ms(50);
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
;Configuraciones.c,218 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,219 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,221 :: 		case CMB_HIT_FULL:
L_combate_estado91:
;Configuraciones.c,222 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado226
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado227
L__combate_estado226:
	BSF         PORTA+0, 7 
L__combate_estado227:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado228
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado229
L__combate_estado228:
	BSF         PORTA+0, 6 
L__combate_estado229:
	BSF         PORTA+0, 4 
;Configuraciones.c,223 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,224 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,225 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,227 :: 		default:
L_combate_estado92:
;Configuraciones.c,228 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,229 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,230 :: 		break;
	GOTO        L_combate_estado40
;Configuraciones.c,231 :: 		}
L_combate_estado39:
	MOVF        _estado_combate+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado41
	MOVF        _estado_combate+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado74
	MOVF        _estado_combate+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado77
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
	GOTO        L_combate_estado87
	MOVF        _estado_combate+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado88
	MOVF        _estado_combate+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado91
	GOTO        L_combate_estado92
L_combate_estado40:
;Configuraciones.c,232 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,234 :: 		void Start(){
;Configuraciones.c,235 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,236 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,237 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,238 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,239 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,240 :: 		return;
;Configuraciones.c,241 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,242 :: 		void Stop(){
;Configuraciones.c,243 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,244 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,245 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,246 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,247 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,248 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,255 :: 		void REC(){
;Configuraciones.c,257 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,259 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,260 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,263 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,264 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,265 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,266 :: 		void DER(){
;Configuraciones.c,267 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,268 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,269 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,271 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,272 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,274 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_DER_Z:

;Configuraciones.c,275 :: 		void DER_Z(){
;Configuraciones.c,276 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,277 :: 		PWM1_Set_Duty(230);
	MOVLW       230
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,278 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,280 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,281 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,284 :: 		}
L_end_DER_Z:
	RETURN      0
; end of _DER_Z

_IZQ:

;Configuraciones.c,287 :: 		void IZQ(){
;Configuraciones.c,288 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,289 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,290 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,292 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,293 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,294 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;Configuraciones.c,296 :: 		void REV(){
;Configuraciones.c,297 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,298 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,299 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,300 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,301 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,303 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,305 :: 		void LIBRE(){
;Configuraciones.c,307 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,308 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,309 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,310 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,311 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,315 :: 		void GIRO180(){
;Configuraciones.c,316 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,318 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,319 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,321 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,322 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,323 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18093:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18093
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18093
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18093
;Configuraciones.c,324 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,327 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,329 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,330 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,331 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36094:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36094
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36094
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36094
	NOP
	NOP
;Configuraciones.c,332 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,334 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,336 :: 		void BRAKE(){
;Configuraciones.c,338 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,339 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,340 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,341 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,342 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,345 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,346 :: 		void HARD(){
;Configuraciones.c,347 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,348 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,349 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,350 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,353 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,354 :: 		void PUSH(){
;Configuraciones.c,355 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,357 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,358 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,361 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,362 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,364 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,365 :: 		void HIT(){
;Configuraciones.c,367 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,368 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT95:
	DECFSZ      R13, 1, 1
	BRA         L_HIT95
	DECFSZ      R12, 1, 1
	BRA         L_HIT95
	NOP
	NOP
;Configuraciones.c,369 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,370 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT96:
	DECFSZ      R13, 1, 1
	BRA         L_HIT96
	DECFSZ      R12, 1, 1
	BRA         L_HIT96
	DECFSZ      R11, 1, 1
	BRA         L_HIT96
	NOP
	NOP
;Configuraciones.c,371 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_INTERRUPT:

;Configuraciones.c,373 :: 		void INTERRUPT(){
;Configuraciones.c,376 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT97
;Configuraciones.c,377 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,378 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,380 :: 		}
L_INTERRUPT97:
;Configuraciones.c,382 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT98
;Configuraciones.c,383 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,384 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,385 :: 		}
L_INTERRUPT98:
;Configuraciones.c,386 :: 		}
L_end_INTERRUPT:
L__INTERRUPT245:
	RETFIE      1
; end of _INTERRUPT
