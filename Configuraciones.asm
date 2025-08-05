
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
L__SELEC106:
	BZ          L__SELEC107
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC106
L__SELEC107:
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
	GOTO        L__SELEC108
	BCF         PORTA+0, 5 
	GOTO        L__SELEC109
L__SELEC108:
	BSF         PORTA+0, 5 
L__SELEC109:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC110
	BCF         PORTA+0, 7 
	GOTO        L__SELEC111
L__SELEC110:
	BSF         PORTA+0, 7 
L__SELEC111:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC112
	BCF         PORTA+0, 6 
	GOTO        L__SELEC113
L__SELEC112:
	BSF         PORTA+0, 6 
L__SELEC113:
;Configuraciones.c,37 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,39 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC3:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC114
	BCF         PORTA+0, 5 
	GOTO        L__SELEC115
L__SELEC114:
	BSF         PORTA+0, 5 
L__SELEC115:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC116
	BCF         PORTA+0, 4 
	GOTO        L__SELEC117
L__SELEC116:
	BSF         PORTA+0, 4 
L__SELEC117:
;Configuraciones.c,40 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC6
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC6
L__SELEC96:
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
L__SELEC95:
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
;Configuraciones.c,65 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;Configuraciones.c,67 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,69 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC22:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC122
	BCF         PORTA+0, 6 
	GOTO        L__SELEC123
L__SELEC122:
	BSF         PORTA+0, 6 
L__SELEC123:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC124
	BCF         PORTA+0, 5 
	GOTO        L__SELEC125
L__SELEC124:
	BSF         PORTA+0, 5 
L__SELEC125:
;Configuraciones.c,70 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,74 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,76 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC23:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC126
	BCF         PORTA+0, 7 
	GOTO        L__SELEC127
L__SELEC126:
	BSF         PORTA+0, 7 
L__SELEC127:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC128
	BCF         PORTA+0, 4 
	GOTO        L__SELEC129
L__SELEC128:
	BSF         PORTA+0, 4 
L__SELEC129:
;Configuraciones.c,77 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,78 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC24:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC24
	DECFSZ      R12, 1, 1
	BRA         L_SELEC24
	DECFSZ      R11, 1, 1
	BRA         L_SELEC24
	NOP
	NOP
;Configuraciones.c,79 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,80 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC25:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC25
	DECFSZ      R12, 1, 1
	BRA         L_SELEC25
	DECFSZ      R11, 1, 1
	BRA         L_SELEC25
;Configuraciones.c,81 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,83 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC26:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC130
	BCF         PORTA+0, 5 
	GOTO        L__SELEC131
L__SELEC130:
	BSF         PORTA+0, 5 
L__SELEC131:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC132
	BCF         PORTA+0, 4 
	GOTO        L__SELEC133
L__SELEC132:
	BSF         PORTA+0, 4 
L__SELEC133:
;Configuraciones.c,84 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,85 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,87 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC27:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC134
	BCF         PORTA+0, 7 
	GOTO        L__SELEC135
L__SELEC134:
	BSF         PORTA+0, 7 
L__SELEC135:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC136
	BCF         PORTA+0, 4 
	GOTO        L__SELEC137
L__SELEC136:
	BSF         PORTA+0, 4 
L__SELEC137:
;Configuraciones.c,88 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;Configuraciones.c,90 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,92 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC28:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC138
	BCF         PORTA+0, 7 
	GOTO        L__SELEC139
L__SELEC138:
	BSF         PORTA+0, 7 
L__SELEC139:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC140
	BCF         PORTA+0, 5 
	GOTO        L__SELEC141
L__SELEC140:
	BSF         PORTA+0, 5 
L__SELEC141:
	BSF         PORTA+0, 4 
;Configuraciones.c,94 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,96 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC29:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC142
	BCF         PORTA+0, 5 
	GOTO        L__SELEC143
L__SELEC142:
	BSF         PORTA+0, 5 
L__SELEC143:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC144
	BCF         PORTA+0, 7 
	GOTO        L__SELEC145
L__SELEC144:
	BSF         PORTA+0, 7 
L__SELEC145:
;Configuraciones.c,98 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,100 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC30:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC146
	BCF         PORTA+0, 6 
	GOTO        L__SELEC147
L__SELEC146:
	BSF         PORTA+0, 6 
L__SELEC147:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC148
	BCF         PORTA+0, 7 
	GOTO        L__SELEC149
L__SELEC148:
	BSF         PORTA+0, 7 
L__SELEC149:
;Configuraciones.c,103 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,105 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC31:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC150
	BCF         PORTA+0, 4 
	GOTO        L__SELEC151
L__SELEC150:
	BSF         PORTA+0, 4 
L__SELEC151:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC152
	BCF         PORTA+0, 5 
	GOTO        L__SELEC153
L__SELEC152:
	BSF         PORTA+0, 5 
L__SELEC153:
;Configuraciones.c,106 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,108 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC32:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC154
	BCF         PORTA+0, 7 
	GOTO        L__SELEC155
L__SELEC154:
	BSF         PORTA+0, 7 
L__SELEC155:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC156
	BCF         PORTA+0, 6 
	GOTO        L__SELEC157
L__SELEC156:
	BSF         PORTA+0, 6 
L__SELEC157:
	BSF         PORTA+0, 5 
;Configuraciones.c,109 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,111 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC33:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC158
	BCF         PORTA+0, 4 
	GOTO        L__SELEC159
L__SELEC158:
	BSF         PORTA+0, 4 
L__SELEC159:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC160
	BCF         PORTA+0, 7 
	GOTO        L__SELEC161
L__SELEC160:
	BSF         PORTA+0, 7 
L__SELEC161:
;Configuraciones.c,112 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,114 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC34:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC162
	BCF         PORTA+0, 5 
	GOTO        L__SELEC163
L__SELEC162:
	BSF         PORTA+0, 5 
L__SELEC163:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC164
	BCF         PORTA+0, 4 
	GOTO        L__SELEC165
L__SELEC164:
	BSF         PORTA+0, 4 
L__SELEC165:
	BSF         PORTA+0, 7 
;Configuraciones.c,115 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,117 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC35:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
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
	BSF         PORTA+0, 6 
;Configuraciones.c,118 :: 		break;
	GOTO        L_SELEC1
;Configuraciones.c,120 :: 		default: L0=L1=L2=L3=0;
L_SELEC36:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC170
	BCF         PORTA+0, 5 
	GOTO        L__SELEC171
L__SELEC170:
	BSF         PORTA+0, 5 
L__SELEC171:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC172
	BCF         PORTA+0, 7 
	GOTO        L__SELEC173
L__SELEC172:
	BSF         PORTA+0, 7 
L__SELEC173:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC174
	BCF         PORTA+0, 6 
	GOTO        L__SELEC175
L__SELEC174:
	BSF         PORTA+0, 6 
L__SELEC175:
;Configuraciones.c,121 :: 		}
	GOTO        L_SELEC1
L_SELEC0:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC176
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC176:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC2
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC177
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC177:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC3
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC178
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC178:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC21
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC179
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC179:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC22
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC180
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC180:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC23
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC181
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC181:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC26
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC182
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC182:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC27
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC183
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC183:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC184
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC184:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC29
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC185
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC185:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC30
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC186
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC186:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC187
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC187:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC188
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC188:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC189
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC189:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC190
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC190:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	GOTO        L_SELEC36
L_SELEC1:
;Configuraciones.c,124 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;Configuraciones.c,128 :: 		void combate_estado() {
;Configuraciones.c,129 :: 		switch (estado_combate) {
	GOTO        L_combate_estado37
;Configuraciones.c,130 :: 		case CMB_ESPERA:
L_combate_estado39:
;Configuraciones.c,131 :: 		if(SL1 == 0 && S2 == 0 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado42
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado42
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado42
L__combate_estado104:
;Configuraciones.c,132 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;Configuraciones.c,133 :: 		}
	GOTO        L_combate_estado43
L_combate_estado42:
;Configuraciones.c,134 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado46
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado46
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado46
L__combate_estado103:
;Configuraciones.c,135 :: 		estado_combate = CMB_IZQ;
	MOVLW       2
	MOVWF       _estado_combate+0 
;Configuraciones.c,136 :: 		}
	GOTO        L_combate_estado47
L_combate_estado46:
;Configuraciones.c,137 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado50
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado50
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado50
L__combate_estado102:
;Configuraciones.c,138 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;Configuraciones.c,139 :: 		}
	GOTO        L_combate_estado51
L_combate_estado50:
;Configuraciones.c,140 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado54
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado54
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado54
L__combate_estado101:
;Configuraciones.c,141 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;Configuraciones.c,142 :: 		}
	GOTO        L_combate_estado55
L_combate_estado54:
;Configuraciones.c,143 :: 		else if (SL1 == 0 && S2 == 0 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado58
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado58
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado58
L__combate_estado100:
;Configuraciones.c,144 :: 		estado_combate = CMB_DER_HARD;
	MOVLW       5
	MOVWF       _estado_combate+0 
;Configuraciones.c,145 :: 		}
	GOTO        L_combate_estado59
L_combate_estado58:
;Configuraciones.c,146 :: 		else if (SL1 == 1 && S2 == 0 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado62
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado62
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado62
L__combate_estado99:
;Configuraciones.c,147 :: 		estado_combate = CMB_LIBRE;
	MOVLW       6
	MOVWF       _estado_combate+0 
;Configuraciones.c,148 :: 		}
	GOTO        L_combate_estado63
L_combate_estado62:
;Configuraciones.c,149 :: 		else if (SL1 == 0 && S2 == 1 && S6 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado66
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado66
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado66
L__combate_estado98:
;Configuraciones.c,150 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;Configuraciones.c,151 :: 		}
	GOTO        L_combate_estado67
L_combate_estado66:
;Configuraciones.c,152 :: 		else if (SL1 == 1 && S2 == 1 && S6 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado70
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado70
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado70
L__combate_estado97:
;Configuraciones.c,153 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;Configuraciones.c,154 :: 		}
	GOTO        L_combate_estado71
L_combate_estado70:
;Configuraciones.c,156 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,157 :: 		}
L_combate_estado71:
L_combate_estado67:
L_combate_estado63:
L_combate_estado59:
L_combate_estado55:
L_combate_estado51:
L_combate_estado47:
L_combate_estado43:
;Configuraciones.c,158 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,160 :: 		case CMB_REC:
L_combate_estado72:
;Configuraciones.c,161 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado192
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado193
L__combate_estado192:
	BSF         PORTA+0, 5 
L__combate_estado193:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado194
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado195
L__combate_estado194:
	BSF         PORTA+0, 7 
L__combate_estado195:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado196
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado197
L__combate_estado196:
	BSF         PORTA+0, 6 
L__combate_estado197:
;Configuraciones.c,162 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,163 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_combate_estado73:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado73
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado73
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado73
	NOP
	NOP
;Configuraciones.c,164 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,165 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_combate_estado74:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado74
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado74
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado74
;Configuraciones.c,166 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,167 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,169 :: 		case CMB_IZQ:
L_combate_estado75:
;Configuraciones.c,170 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado198
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado199
L__combate_estado198:
	BSF         PORTA+0, 5 
L__combate_estado199:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado200
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado201
L__combate_estado200:
	BSF         PORTA+0, 7 
L__combate_estado201:
;Configuraciones.c,171 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,172 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado76:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado76
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado76
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado76
	NOP
;Configuraciones.c,173 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,174 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_combate_estado77:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado77
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado77
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado77
	NOP
	NOP
;Configuraciones.c,175 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,176 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,178 :: 		case CMB_HIT:
L_combate_estado78:
;Configuraciones.c,179 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
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
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado205
L__combate_estado204:
	BSF         PORTA+0, 6 
L__combate_estado205:
;Configuraciones.c,180 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,181 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,182 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,184 :: 		case CMB_IZQ_GOLPE:
L_combate_estado79:
;Configuraciones.c,185 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado206
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado207
L__combate_estado206:
	BSF         PORTA+0, 6 
L__combate_estado207:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado208
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado209
L__combate_estado208:
	BSF         PORTA+0, 5 
L__combate_estado209:
;Configuraciones.c,186 :: 		IZQ();
	CALL        _IZQ+0, 0
;Configuraciones.c,187 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado80:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado80
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado80
	NOP
	NOP
;Configuraciones.c,188 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,189 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,190 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,192 :: 		case CMB_DER_HARD:
L_combate_estado81:
;Configuraciones.c,193 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado210
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado211
L__combate_estado210:
	BSF         PORTA+0, 7 
L__combate_estado211:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado212
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado213
L__combate_estado212:
	BSF         PORTA+0, 6 
L__combate_estado213:
;Configuraciones.c,194 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,195 :: 		delay_ms(100);
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
;Configuraciones.c,196 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,197 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_combate_estado83:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado83
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado83
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado83
	NOP
	NOP
;Configuraciones.c,198 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,199 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,201 :: 		case CMB_LIBRE:
L_combate_estado84:
;Configuraciones.c,202 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado214
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado215
L__combate_estado214:
	BSF         PORTA+0, 6 
L__combate_estado215:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado216
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado217
L__combate_estado216:
	BSF         PORTA+0, 7 
L__combate_estado217:
;Configuraciones.c,203 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,204 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,205 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,207 :: 		case CMB_DER_HIT:
L_combate_estado85:
;Configuraciones.c,208 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado218
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado219
L__combate_estado218:
	BSF         PORTA+0, 7 
L__combate_estado219:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado220
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado221
L__combate_estado220:
	BSF         PORTA+0, 6 
L__combate_estado221:
;Configuraciones.c,209 :: 		DER();
	CALL        _DER+0, 0
;Configuraciones.c,210 :: 		delay_ms(30);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_combate_estado86:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado86
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado86
;Configuraciones.c,211 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,212 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,213 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,215 :: 		case CMB_HIT_FULL:
L_combate_estado87:
;Configuraciones.c,216 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado222
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado223
L__combate_estado222:
	BSF         PORTA+0, 7 
L__combate_estado223:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado224
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado225
L__combate_estado224:
	BSF         PORTA+0, 6 
L__combate_estado225:
	BSF         PORTA+0, 4 
;Configuraciones.c,217 :: 		HIT();
	CALL        _HIT+0, 0
;Configuraciones.c,218 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,219 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,221 :: 		default:
L_combate_estado88:
;Configuraciones.c,222 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;Configuraciones.c,223 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;Configuraciones.c,224 :: 		break;
	GOTO        L_combate_estado38
;Configuraciones.c,225 :: 		}
L_combate_estado37:
	MOVF        _estado_combate+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado39
	MOVF        _estado_combate+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado72
	MOVF        _estado_combate+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado75
	MOVF        _estado_combate+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado78
	MOVF        _estado_combate+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado79
	MOVF        _estado_combate+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado81
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
	GOTO        L_combate_estado87
	GOTO        L_combate_estado88
L_combate_estado38:
;Configuraciones.c,226 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;Configuraciones.c,228 :: 		void Start(){
;Configuraciones.c,229 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Configuraciones.c,230 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;Configuraciones.c,231 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;Configuraciones.c,232 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;Configuraciones.c,233 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;Configuraciones.c,234 :: 		return;
;Configuraciones.c,235 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;Configuraciones.c,236 :: 		void Stop(){
;Configuraciones.c,237 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;Configuraciones.c,238 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;Configuraciones.c,239 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;Configuraciones.c,240 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;Configuraciones.c,241 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;Configuraciones.c,242 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;Configuraciones.c,249 :: 		void REC(){
;Configuraciones.c,251 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,253 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,254 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,257 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,258 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,259 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;Configuraciones.c,260 :: 		void DER(){
;Configuraciones.c,261 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,262 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,263 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,265 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,266 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,268 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;Configuraciones.c,269 :: 		void IZQ(){
;Configuraciones.c,270 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,271 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,272 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,274 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,275 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,276 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;Configuraciones.c,278 :: 		void REV(){
;Configuraciones.c,279 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,280 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,281 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,282 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,283 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,285 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;Configuraciones.c,287 :: 		void LIBRE(){
;Configuraciones.c,289 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,290 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,291 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,292 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,293 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;Configuraciones.c,297 :: 		void GIRO180(){
;Configuraciones.c,298 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,300 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,301 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,303 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,304 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,305 :: 		delay_ms(200);
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
;Configuraciones.c,306 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,309 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;Configuraciones.c,311 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;Configuraciones.c,312 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;Configuraciones.c,313 :: 		delay_ms(250);
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
;Configuraciones.c,314 :: 		HARD();
	CALL        _HARD+0, 0
;Configuraciones.c,316 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;Configuraciones.c,318 :: 		void BRAKE(){
;Configuraciones.c,320 :: 		Stop();
	CALL        _Stop+0, 0
;Configuraciones.c,321 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;Configuraciones.c,322 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;Configuraciones.c,323 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;Configuraciones.c,324 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;Configuraciones.c,327 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;Configuraciones.c,328 :: 		void HARD(){
;Configuraciones.c,329 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,330 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,331 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,332 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,335 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;Configuraciones.c,336 :: 		void PUSH(){
;Configuraciones.c,337 :: 		Start();
	CALL        _Start+0, 0
;Configuraciones.c,339 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Configuraciones.c,340 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Configuraciones.c,343 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;Configuraciones.c,344 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;Configuraciones.c,346 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;Configuraciones.c,347 :: 		void HIT(){
;Configuraciones.c,349 :: 		REC();
	CALL        _REC+0, 0
;Configuraciones.c,350 :: 		delay_ms(20);
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
;Configuraciones.c,351 :: 		PUSH();
	CALL        _PUSH+0, 0
;Configuraciones.c,352 :: 		delay_ms(250);
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
;Configuraciones.c,353 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_INTERRUPT:

;Configuraciones.c,355 :: 		void INTERRUPT(){
;Configuraciones.c,358 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT93
;Configuraciones.c,359 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;Configuraciones.c,360 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;Configuraciones.c,362 :: 		}
L_INTERRUPT93:
;Configuraciones.c,364 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT94
;Configuraciones.c,365 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;Configuraciones.c,366 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;Configuraciones.c,367 :: 		}
L_INTERRUPT94:
;Configuraciones.c,368 :: 		}
L_end_INTERRUPT:
L__INTERRUPT240:
	RETFIE      1
; end of _INTERRUPT
