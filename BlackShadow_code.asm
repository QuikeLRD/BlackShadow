
_main:

;BlackShadow_code.c,56 :: 		void main() {
;BlackShadow_code.c,57 :: 		OSCCON = 0b01100110;
	MOVLW       102
	MOVWF       OSCCON+0 
;BlackShadow_code.c,60 :: 		PORTA = 0;
	CLRF        PORTA+0 
;BlackShadow_code.c,61 :: 		PORTB = 0;
	CLRF        PORTB+0 
;BlackShadow_code.c,62 :: 		PORTC = 0;
	CLRF        PORTC+0 
;BlackShadow_code.c,65 :: 		TRISA= 0b00001111;   //El bit 1 del PortaA0 es el ultimo.     //0X0F
	MOVLW       15
	MOVWF       TRISA+0 
;BlackShadow_code.c,66 :: 		TRISB= 0b11011110;    //El bit que tenemos hasta la izquierda es el numero 7.DAT Y CLK se dejan como entrada aunque pueden ser salida, el micro los ocupa para programar
	MOVLW       222
	MOVWF       TRISB+0 
;BlackShadow_code.c,67 :: 		TRISC= 0b11111001;
	MOVLW       249
	MOVWF       TRISC+0 
;BlackShadow_code.c,69 :: 		ANSELA= 0b00000000;
	CLRF        ANSELA+0 
;BlackShadow_code.c,70 :: 		ANSELB= 0b00000000;
	CLRF        ANSELB+0 
;BlackShadow_code.c,71 :: 		ANSELC= 0b00000000;
	CLRF        ANSELC+0 
;BlackShadow_code.c,78 :: 		PWM1_Init(20000);   //Se debe poner a 20 000 para el motor y 1000 para simular
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;BlackShadow_code.c,79 :: 		PWM2_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;BlackShadow_code.c,80 :: 		PWM3_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;BlackShadow_code.c,81 :: 		PWM4_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;BlackShadow_code.c,84 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,85 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,86 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,87 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,89 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,90 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,91 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,92 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,97 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main75
	BCF         PORTA+0, 5 
	GOTO        L__main76
L__main75:
	BSF         PORTA+0, 5 
L__main76:
	BTFSC       PORTA+0, 5 
	GOTO        L__main77
	BCF         PORTA+0, 4 
	GOTO        L__main78
L__main77:
	BSF         PORTA+0, 4 
L__main78:
;BlackShadow_code.c,98 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;BlackShadow_code.c,99 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main79
	BCF         PORTA+0, 5 
	GOTO        L__main80
L__main79:
	BSF         PORTA+0, 5 
L__main80:
	BTFSC       PORTA+0, 5 
	GOTO        L__main81
	BCF         PORTA+0, 4 
	GOTO        L__main82
L__main81:
	BSF         PORTA+0, 4 
L__main82:
;BlackShadow_code.c,100 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
	NOP
;BlackShadow_code.c,101 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main83
	BCF         PORTA+0, 7 
	GOTO        L__main84
L__main83:
	BSF         PORTA+0, 7 
L__main84:
	BTFSC       PORTA+0, 7 
	GOTO        L__main85
	BCF         PORTA+0, 4 
	GOTO        L__main86
L__main85:
	BSF         PORTA+0, 4 
L__main86:
;BlackShadow_code.c,102 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;BlackShadow_code.c,103 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main87
	BCF         PORTA+0, 7 
	GOTO        L__main88
L__main87:
	BSF         PORTA+0, 7 
L__main88:
	BTFSC       PORTA+0, 7 
	GOTO        L__main89
	BCF         PORTA+0, 6 
	GOTO        L__main90
L__main89:
	BSF         PORTA+0, 6 
L__main90:
;BlackShadow_code.c,104 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;BlackShadow_code.c,105 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main91
	BCF         PORTA+0, 7 
	GOTO        L__main92
L__main91:
	BSF         PORTA+0, 7 
L__main92:
	BTFSC       PORTA+0, 7 
	GOTO        L__main93
	BCF         PORTA+0, 5 
	GOTO        L__main94
L__main93:
	BSF         PORTA+0, 5 
L__main94:
	BTFSC       PORTA+0, 5 
	GOTO        L__main95
	BCF         PORTA+0, 4 
	GOTO        L__main96
L__main95:
	BSF         PORTA+0, 4 
L__main96:
;BlackShadow_code.c,108 :: 		while(1){
L_main4:
;BlackShadow_code.c,110 :: 		SELEC();
	CALL        _SELEC+0, 0
;BlackShadow_code.c,114 :: 		}
	GOTO        L_main4
;BlackShadow_code.c,115 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,120 :: 		void SELEC(){
;BlackShadow_code.c,122 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC98:
	BZ          L__SELEC99
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC98
L__SELEC99:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,124 :: 		switch(seleccion){
	GOTO        L_SELEC6
;BlackShadow_code.c,125 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC8:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC100
	BCF         PORTA+0, 5 
	GOTO        L__SELEC101
L__SELEC100:
	BSF         PORTA+0, 5 
L__SELEC101:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC102
	BCF         PORTA+0, 7 
	GOTO        L__SELEC103
L__SELEC102:
	BSF         PORTA+0, 7 
L__SELEC103:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC104
	BCF         PORTA+0, 6 
	GOTO        L__SELEC105
L__SELEC104:
	BSF         PORTA+0, 6 
L__SELEC105:
;BlackShadow_code.c,128 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,130 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC9:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC106
	BCF         PORTA+0, 5 
	GOTO        L__SELEC107
L__SELEC106:
	BSF         PORTA+0, 5 
L__SELEC107:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC108
	BCF         PORTA+0, 4 
	GOTO        L__SELEC109
L__SELEC108:
	BSF         PORTA+0, 4 
L__SELEC109:
;BlackShadow_code.c,132 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,133 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC10:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC10
	DECFSZ      R12, 1, 1
	BRA         L_SELEC10
	DECFSZ      R11, 1, 1
	BRA         L_SELEC10
	NOP
	NOP
;BlackShadow_code.c,134 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,135 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC11:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC11
	DECFSZ      R12, 1, 1
	BRA         L_SELEC11
	DECFSZ      R11, 1, 1
	BRA         L_SELEC11
;BlackShadow_code.c,139 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,141 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC12:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC110
	BCF         PORTA+0, 5 
	GOTO        L__SELEC111
L__SELEC110:
	BSF         PORTA+0, 5 
L__SELEC111:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC112
	BCF         PORTA+0, 4 
	GOTO        L__SELEC113
L__SELEC112:
	BSF         PORTA+0, 4 
L__SELEC113:
;BlackShadow_code.c,142 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,143 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC13:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC13
	DECFSZ      R12, 1, 1
	BRA         L_SELEC13
	DECFSZ      R11, 1, 1
	BRA         L_SELEC13
	NOP
	NOP
;BlackShadow_code.c,144 :: 		BRAKE();
	CALL        _BRAKE+0, 0
;BlackShadow_code.c,145 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC14:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC14
	DECFSZ      R12, 1, 1
	BRA         L_SELEC14
	DECFSZ      R11, 1, 1
	BRA         L_SELEC14
;BlackShadow_code.c,147 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,149 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC15:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC114
	BCF         PORTA+0, 6 
	GOTO        L__SELEC115
L__SELEC114:
	BSF         PORTA+0, 6 
L__SELEC115:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC116
	BCF         PORTA+0, 5 
	GOTO        L__SELEC117
L__SELEC116:
	BSF         PORTA+0, 5 
L__SELEC117:
;BlackShadow_code.c,150 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,151 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC16:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC16
	DECFSZ      R12, 1, 1
	BRA         L_SELEC16
	DECFSZ      R11, 1, 1
	BRA         L_SELEC16
	NOP
	NOP
;BlackShadow_code.c,152 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,153 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC17:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC17
	DECFSZ      R12, 1, 1
	BRA         L_SELEC17
	DECFSZ      R11, 1, 1
	BRA         L_SELEC17
;BlackShadow_code.c,155 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,157 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC18:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC118
	BCF         PORTA+0, 7 
	GOTO        L__SELEC119
L__SELEC118:
	BSF         PORTA+0, 7 
L__SELEC119:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC120
	BCF         PORTA+0, 4 
	GOTO        L__SELEC121
L__SELEC120:
	BSF         PORTA+0, 4 
L__SELEC121:
;BlackShadow_code.c,158 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,159 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC19:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC19
	DECFSZ      R12, 1, 1
	BRA         L_SELEC19
	DECFSZ      R11, 1, 1
	BRA         L_SELEC19
	NOP
	NOP
;BlackShadow_code.c,160 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,161 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC20:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC20
	DECFSZ      R12, 1, 1
	BRA         L_SELEC20
	DECFSZ      R11, 1, 1
	BRA         L_SELEC20
;BlackShadow_code.c,162 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,164 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC21:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC122
	BCF         PORTA+0, 5 
	GOTO        L__SELEC123
L__SELEC122:
	BSF         PORTA+0, 5 
L__SELEC123:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC124
	BCF         PORTA+0, 4 
	GOTO        L__SELEC125
L__SELEC124:
	BSF         PORTA+0, 4 
L__SELEC125:
;BlackShadow_code.c,165 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,166 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,168 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC22:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC126
	BCF         PORTA+0, 7 
	GOTO        L__SELEC127
L__SELEC126:
	BSF         PORTA+0, 7 
L__SELEC127:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC128
	BCF         PORTA+0, 4 
	GOTO        L__SELEC129
L__SELEC128:
	BSF         PORTA+0, 4 
L__SELEC129:
;BlackShadow_code.c,169 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,171 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,173 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC23:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC130
	BCF         PORTA+0, 7 
	GOTO        L__SELEC131
L__SELEC130:
	BSF         PORTA+0, 7 
L__SELEC131:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC132
	BCF         PORTA+0, 5 
	GOTO        L__SELEC133
L__SELEC132:
	BSF         PORTA+0, 5 
L__SELEC133:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,175 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,177 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC24:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
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
;BlackShadow_code.c,179 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,181 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC25:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC138
	BCF         PORTA+0, 6 
	GOTO        L__SELEC139
L__SELEC138:
	BSF         PORTA+0, 6 
L__SELEC139:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC140
	BCF         PORTA+0, 7 
	GOTO        L__SELEC141
L__SELEC140:
	BSF         PORTA+0, 7 
L__SELEC141:
;BlackShadow_code.c,184 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,186 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC26:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC142
	BCF         PORTA+0, 4 
	GOTO        L__SELEC143
L__SELEC142:
	BSF         PORTA+0, 4 
L__SELEC143:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC144
	BCF         PORTA+0, 5 
	GOTO        L__SELEC145
L__SELEC144:
	BSF         PORTA+0, 5 
L__SELEC145:
;BlackShadow_code.c,187 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,189 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC27:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
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
	BSF         PORTA+0, 5 
;BlackShadow_code.c,190 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,192 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC28:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC150
	BCF         PORTA+0, 4 
	GOTO        L__SELEC151
L__SELEC150:
	BSF         PORTA+0, 4 
L__SELEC151:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC152
	BCF         PORTA+0, 7 
	GOTO        L__SELEC153
L__SELEC152:
	BSF         PORTA+0, 7 
L__SELEC153:
;BlackShadow_code.c,193 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,195 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC29:
	BCF         PORTA+0, 6 
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
	BSF         PORTA+0, 7 
;BlackShadow_code.c,196 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,198 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC30:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC158
	BCF         PORTA+0, 5 
	GOTO        L__SELEC159
L__SELEC158:
	BSF         PORTA+0, 5 
L__SELEC159:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC160
	BCF         PORTA+0, 4 
	GOTO        L__SELEC161
L__SELEC160:
	BSF         PORTA+0, 4 
L__SELEC161:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,199 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,201 :: 		default: L0=L1=L2=L3=0;
L_SELEC31:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC162
	BCF         PORTA+0, 5 
	GOTO        L__SELEC163
L__SELEC162:
	BSF         PORTA+0, 5 
L__SELEC163:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC164
	BCF         PORTA+0, 7 
	GOTO        L__SELEC165
L__SELEC164:
	BSF         PORTA+0, 7 
L__SELEC165:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC166
	BCF         PORTA+0, 6 
	GOTO        L__SELEC167
L__SELEC166:
	BSF         PORTA+0, 6 
L__SELEC167:
;BlackShadow_code.c,202 :: 		}
	GOTO        L_SELEC7
L_SELEC6:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC168
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC168:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC8
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC169
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC169:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC9
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC170
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC170:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC12
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC171
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC171:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC15
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC172
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC172:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC18
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC173
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC173:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC21
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC174
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC174:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC22
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC175
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC175:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC23
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC176
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC176:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC24
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC177
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC177:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC178
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC178:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC26
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC179
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC179:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC27
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC180
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC180:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC181
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC181:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC29
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC182
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC182:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC30
	GOTO        L_SELEC31
L_SELEC7:
;BlackShadow_code.c,205 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,207 :: 		void Start(){
;BlackShadow_code.c,208 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,209 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,210 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,211 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,212 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,213 :: 		return;
;BlackShadow_code.c,214 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,215 :: 		void Stop(){
;BlackShadow_code.c,216 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,217 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,218 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,219 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,220 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,221 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,228 :: 		void REC(){
;BlackShadow_code.c,230 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,232 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,233 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,236 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,237 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,238 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,239 :: 		void DER(){
;BlackShadow_code.c,240 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,241 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,242 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,244 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,245 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,247 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,248 :: 		void IZQ(){
;BlackShadow_code.c,249 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,250 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,251 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,253 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,254 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,255 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,257 :: 		void REV(){
;BlackShadow_code.c,258 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,259 :: 		LATC.F2 = 0;
	BCF         LATC+0, 2 
;BlackShadow_code.c,260 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,262 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,263 :: 		LATB.F5 =0;
	BCF         LATB+0, 5 
;BlackShadow_code.c,264 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,266 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,268 :: 		void LIBRE(){
;BlackShadow_code.c,270 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,271 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,272 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,273 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,274 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,278 :: 		void GIRO180(){
;BlackShadow_code.c,279 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,280 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,282 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,283 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,284 :: 		Delay_ms(40);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_GIRO18032:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18032
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18032
	NOP
;BlackShadow_code.c,287 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,289 :: 		void GIRO360(){
;BlackShadow_code.c,290 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,291 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_GIRO36033:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36033
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36033
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36033
	NOP
	NOP
;BlackShadow_code.c,292 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,293 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_GIRO36034:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36034
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36034
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36034
;BlackShadow_code.c,294 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,296 :: 		void BRAKE(){
;BlackShadow_code.c,298 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,299 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,300 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,301 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,302 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,305 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_Basura:

;BlackShadow_code.c,307 :: 		void Basura(){
;BlackShadow_code.c,311 :: 		if(SL1==0 && SL2==1)       //SL1=Sensor izquierdo, SL2= Sensor de linea derecho
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura37
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura37
L__Basura73:
;BlackShadow_code.c,312 :: 		DER();                 //Si veo por la izquierda hago una reversa por la derecha.
	CALL        _DER+0, 0
	GOTO        L_Basura38
L_Basura37:
;BlackShadow_code.c,313 :: 		else if(SL1==1 && SL2==0)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura41
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura41
L__Basura72:
;BlackShadow_code.c,314 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura42
L_Basura41:
;BlackShadow_code.c,315 :: 		else if(SL1==0 && SL2==0)
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura45
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura45
L__Basura71:
;BlackShadow_code.c,316 :: 		GIRO180();
	CALL        _GIRO180+0, 0
	GOTO        L_Basura46
L_Basura45:
;BlackShadow_code.c,317 :: 		else if(SL1==1 && SL2==1)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura49
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura49
L__Basura70:
;BlackShadow_code.c,318 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura50
L_Basura49:
;BlackShadow_code.c,325 :: 		else if(S1==1 && S2==0)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura53
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura53
L__Basura69:
;BlackShadow_code.c,326 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura54
L_Basura53:
;BlackShadow_code.c,327 :: 		else if(S1==0 && S2==1)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura57
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura57
L__Basura68:
;BlackShadow_code.c,328 :: 		DER();
	CALL        _DER+0, 0
	GOTO        L_Basura58
L_Basura57:
;BlackShadow_code.c,329 :: 		else if(S1==1 && S2==1)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura61
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura61
L__Basura67:
;BlackShadow_code.c,330 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura62
L_Basura61:
;BlackShadow_code.c,331 :: 		else if(S1==0 && S2==0)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura65
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura65
L__Basura66:
;BlackShadow_code.c,332 :: 		GIRO180();
	CALL        _GIRO180+0, 0
L_Basura65:
L_Basura62:
L_Basura58:
L_Basura54:
L_Basura50:
L_Basura46:
L_Basura42:
L_Basura38:
;BlackShadow_code.c,333 :: 		}
L_end_Basura:
	RETURN      0
; end of _Basura
