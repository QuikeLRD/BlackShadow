
_main:

;BlackShadow_code.c,61 :: 		void main() {
;BlackShadow_code.c,62 :: 		OSCCON = 0b01100110;
	MOVLW       102
	MOVWF       OSCCON+0 
;BlackShadow_code.c,65 :: 		PORTA = 0;
	CLRF        PORTA+0 
;BlackShadow_code.c,66 :: 		PORTB = 0;
	CLRF        PORTB+0 
;BlackShadow_code.c,67 :: 		PORTC = 0;
	CLRF        PORTC+0 
;BlackShadow_code.c,70 :: 		TRISA= 0b00001111;   //El bit 1 del PortaA0 es el ultimo.     //0X0F
	MOVLW       15
	MOVWF       TRISA+0 
;BlackShadow_code.c,71 :: 		TRISB= 0b11011110;    //El bit que tenemos hasta la izquierda es el numero 7.DAT Y CLK se dejan como entrada aunque pueden ser salida, el micro los ocupa para programar
	MOVLW       222
	MOVWF       TRISB+0 
;BlackShadow_code.c,72 :: 		TRISC= 0b11111001;
	MOVLW       249
	MOVWF       TRISC+0 
;BlackShadow_code.c,74 :: 		ANSELA= 0b00000000;
	CLRF        ANSELA+0 
;BlackShadow_code.c,75 :: 		ANSELB= 0b00000000;
	CLRF        ANSELB+0 
;BlackShadow_code.c,76 :: 		ANSELC= 0b00000000;
	CLRF        ANSELC+0 
;BlackShadow_code.c,80 :: 		INTCON3.INT1IE =1;                               //habilitamos interrupción INT1 (RB1)
	BSF         INTCON3+0, 3 
;BlackShadow_code.c,81 :: 		INTCON3.INT2IE =1;                                //habilitamos interrupción INT2 (RB2)
	BSF         INTCON3+0, 4 
;BlackShadow_code.c,83 :: 		INTCON2.INTEDG1 =0;                               //INT1: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 5 
;BlackShadow_code.c,84 :: 		INTCON2.INTEDG2 =0;                                //INT2: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 4 
;BlackShadow_code.c,86 :: 		INTCON.GIE =1;                                    //Interrupciones globales
	BSF         INTCON+0, 7 
;BlackShadow_code.c,87 :: 		INTCON.PEIE =1;                                   //Interrupciones perifericas
	BSF         INTCON+0, 6 
;BlackShadow_code.c,96 :: 		PWM1_Init(20000);   //Se debe poner a 20 000 para el motor y 1000 para simular
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;BlackShadow_code.c,97 :: 		PWM2_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;BlackShadow_code.c,98 :: 		PWM3_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;BlackShadow_code.c,99 :: 		PWM4_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;BlackShadow_code.c,102 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,103 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,104 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,105 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,107 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,108 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,109 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,110 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,115 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main81
	BCF         PORTA+0, 5 
	GOTO        L__main82
L__main81:
	BSF         PORTA+0, 5 
L__main82:
	BTFSC       PORTA+0, 5 
	GOTO        L__main83
	BCF         PORTA+0, 4 
	GOTO        L__main84
L__main83:
	BSF         PORTA+0, 4 
L__main84:
;BlackShadow_code.c,116 :: 		delay_ms(300);
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
;BlackShadow_code.c,117 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main85
	BCF         PORTA+0, 5 
	GOTO        L__main86
L__main85:
	BSF         PORTA+0, 5 
L__main86:
	BTFSC       PORTA+0, 5 
	GOTO        L__main87
	BCF         PORTA+0, 4 
	GOTO        L__main88
L__main87:
	BSF         PORTA+0, 4 
L__main88:
;BlackShadow_code.c,118 :: 		delay_ms(300);
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
;BlackShadow_code.c,119 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main89
	BCF         PORTA+0, 7 
	GOTO        L__main90
L__main89:
	BSF         PORTA+0, 7 
L__main90:
	BTFSC       PORTA+0, 7 
	GOTO        L__main91
	BCF         PORTA+0, 4 
	GOTO        L__main92
L__main91:
	BSF         PORTA+0, 4 
L__main92:
;BlackShadow_code.c,120 :: 		delay_ms(300);
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
;BlackShadow_code.c,121 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main93
	BCF         PORTA+0, 7 
	GOTO        L__main94
L__main93:
	BSF         PORTA+0, 7 
L__main94:
	BTFSC       PORTA+0, 7 
	GOTO        L__main95
	BCF         PORTA+0, 6 
	GOTO        L__main96
L__main95:
	BSF         PORTA+0, 6 
L__main96:
;BlackShadow_code.c,122 :: 		delay_ms(300);
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
;BlackShadow_code.c,123 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main97
	BCF         PORTA+0, 7 
	GOTO        L__main98
L__main97:
	BSF         PORTA+0, 7 
L__main98:
	BTFSC       PORTA+0, 7 
	GOTO        L__main99
	BCF         PORTA+0, 5 
	GOTO        L__main100
L__main99:
	BSF         PORTA+0, 5 
L__main100:
	BTFSC       PORTA+0, 5 
	GOTO        L__main101
	BCF         PORTA+0, 4 
	GOTO        L__main102
L__main101:
	BSF         PORTA+0, 4 
L__main102:
;BlackShadow_code.c,126 :: 		while(1){
L_main4:
;BlackShadow_code.c,129 :: 		if (linea_izq_detectada) {
	MOVF        _linea_izq_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;BlackShadow_code.c,130 :: 		linea_izq_detectada = 0; // Limpia la bandera
	CLRF        _linea_izq_detectada+0 
;BlackShadow_code.c,131 :: 		BRAKE();
	CALL        _BRAKE+0, 0
;BlackShadow_code.c,132 :: 		IZQ();                   // Gira a la izquierda
	CALL        _IZQ+0, 0
;BlackShadow_code.c,133 :: 		}
	GOTO        L_main7
L_main6:
;BlackShadow_code.c,135 :: 		else if (linea_der_detectada) {
	MOVF        _linea_der_detectada+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;BlackShadow_code.c,136 :: 		linea_der_detectada = 0; // Limpia la bandera
	CLRF        _linea_der_detectada+0 
;BlackShadow_code.c,137 :: 		BRAKE();
	CALL        _BRAKE+0, 0
;BlackShadow_code.c,138 :: 		DER();                   // Gira a la derecha
	CALL        _DER+0, 0
;BlackShadow_code.c,139 :: 		}
	GOTO        L_main9
L_main8:
;BlackShadow_code.c,141 :: 		REC(); // Avanza mientras no detecta línea
	CALL        _REC+0, 0
;BlackShadow_code.c,142 :: 		}
L_main9:
L_main7:
;BlackShadow_code.c,149 :: 		}
	GOTO        L_main4
;BlackShadow_code.c,150 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,155 :: 		void SELEC(){
;BlackShadow_code.c,157 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC104:
	BZ          L__SELEC105
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC104
L__SELEC105:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,159 :: 		switch(seleccion){
	GOTO        L_SELEC10
;BlackShadow_code.c,160 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC12:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC106
	BCF         PORTA+0, 5 
	GOTO        L__SELEC107
L__SELEC106:
	BSF         PORTA+0, 5 
L__SELEC107:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC108
	BCF         PORTA+0, 7 
	GOTO        L__SELEC109
L__SELEC108:
	BSF         PORTA+0, 7 
L__SELEC109:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC110
	BCF         PORTA+0, 6 
	GOTO        L__SELEC111
L__SELEC110:
	BSF         PORTA+0, 6 
L__SELEC111:
;BlackShadow_code.c,163 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,165 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC13:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC112
	BCF         PORTA+0, 5 
	GOTO        L__SELEC113
L__SELEC112:
	BSF         PORTA+0, 5 
L__SELEC113:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC114
	BCF         PORTA+0, 4 
	GOTO        L__SELEC115
L__SELEC114:
	BSF         PORTA+0, 4 
L__SELEC115:
;BlackShadow_code.c,167 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,168 :: 		delay_ms(300);
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
;BlackShadow_code.c,169 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,170 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC15:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC15
	DECFSZ      R12, 1, 1
	BRA         L_SELEC15
	DECFSZ      R11, 1, 1
	BRA         L_SELEC15
;BlackShadow_code.c,174 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,176 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC16:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC116
	BCF         PORTA+0, 5 
	GOTO        L__SELEC117
L__SELEC116:
	BSF         PORTA+0, 5 
L__SELEC117:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC118
	BCF         PORTA+0, 4 
	GOTO        L__SELEC119
L__SELEC118:
	BSF         PORTA+0, 4 
L__SELEC119:
;BlackShadow_code.c,177 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,178 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC17:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC17
	DECFSZ      R12, 1, 1
	BRA         L_SELEC17
	DECFSZ      R11, 1, 1
	BRA         L_SELEC17
	NOP
	NOP
;BlackShadow_code.c,179 :: 		BRAKE();
	CALL        _BRAKE+0, 0
;BlackShadow_code.c,180 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC18:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC18
	DECFSZ      R12, 1, 1
	BRA         L_SELEC18
	DECFSZ      R11, 1, 1
	BRA         L_SELEC18
;BlackShadow_code.c,182 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,184 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC19:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC120
	BCF         PORTA+0, 6 
	GOTO        L__SELEC121
L__SELEC120:
	BSF         PORTA+0, 6 
L__SELEC121:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC122
	BCF         PORTA+0, 5 
	GOTO        L__SELEC123
L__SELEC122:
	BSF         PORTA+0, 5 
L__SELEC123:
;BlackShadow_code.c,185 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,186 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC20:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC20
	DECFSZ      R12, 1, 1
	BRA         L_SELEC20
	DECFSZ      R11, 1, 1
	BRA         L_SELEC20
	NOP
	NOP
;BlackShadow_code.c,187 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,188 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC21:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC21
	DECFSZ      R12, 1, 1
	BRA         L_SELEC21
	DECFSZ      R11, 1, 1
	BRA         L_SELEC21
;BlackShadow_code.c,190 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,192 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC22:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC124
	BCF         PORTA+0, 7 
	GOTO        L__SELEC125
L__SELEC124:
	BSF         PORTA+0, 7 
L__SELEC125:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC126
	BCF         PORTA+0, 4 
	GOTO        L__SELEC127
L__SELEC126:
	BSF         PORTA+0, 4 
L__SELEC127:
;BlackShadow_code.c,193 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,194 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC23:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC23
	DECFSZ      R12, 1, 1
	BRA         L_SELEC23
	DECFSZ      R11, 1, 1
	BRA         L_SELEC23
	NOP
	NOP
;BlackShadow_code.c,195 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,196 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC24:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC24
	DECFSZ      R12, 1, 1
	BRA         L_SELEC24
	DECFSZ      R11, 1, 1
	BRA         L_SELEC24
;BlackShadow_code.c,197 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,199 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC25:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC128
	BCF         PORTA+0, 5 
	GOTO        L__SELEC129
L__SELEC128:
	BSF         PORTA+0, 5 
L__SELEC129:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC130
	BCF         PORTA+0, 4 
	GOTO        L__SELEC131
L__SELEC130:
	BSF         PORTA+0, 4 
L__SELEC131:
;BlackShadow_code.c,200 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,201 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,203 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC26:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC132
	BCF         PORTA+0, 7 
	GOTO        L__SELEC133
L__SELEC132:
	BSF         PORTA+0, 7 
L__SELEC133:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC134
	BCF         PORTA+0, 4 
	GOTO        L__SELEC135
L__SELEC134:
	BSF         PORTA+0, 4 
L__SELEC135:
;BlackShadow_code.c,204 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,206 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,208 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC27:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC136
	BCF         PORTA+0, 7 
	GOTO        L__SELEC137
L__SELEC136:
	BSF         PORTA+0, 7 
L__SELEC137:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC138
	BCF         PORTA+0, 5 
	GOTO        L__SELEC139
L__SELEC138:
	BSF         PORTA+0, 5 
L__SELEC139:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,210 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,212 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC28:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC140
	BCF         PORTA+0, 5 
	GOTO        L__SELEC141
L__SELEC140:
	BSF         PORTA+0, 5 
L__SELEC141:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC142
	BCF         PORTA+0, 7 
	GOTO        L__SELEC143
L__SELEC142:
	BSF         PORTA+0, 7 
L__SELEC143:
;BlackShadow_code.c,214 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,216 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC29:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC144
	BCF         PORTA+0, 6 
	GOTO        L__SELEC145
L__SELEC144:
	BSF         PORTA+0, 6 
L__SELEC145:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC146
	BCF         PORTA+0, 7 
	GOTO        L__SELEC147
L__SELEC146:
	BSF         PORTA+0, 7 
L__SELEC147:
;BlackShadow_code.c,219 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,221 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC30:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC148
	BCF         PORTA+0, 4 
	GOTO        L__SELEC149
L__SELEC148:
	BSF         PORTA+0, 4 
L__SELEC149:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC150
	BCF         PORTA+0, 5 
	GOTO        L__SELEC151
L__SELEC150:
	BSF         PORTA+0, 5 
L__SELEC151:
;BlackShadow_code.c,222 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,224 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC31:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC152
	BCF         PORTA+0, 7 
	GOTO        L__SELEC153
L__SELEC152:
	BSF         PORTA+0, 7 
L__SELEC153:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC154
	BCF         PORTA+0, 6 
	GOTO        L__SELEC155
L__SELEC154:
	BSF         PORTA+0, 6 
L__SELEC155:
	BSF         PORTA+0, 5 
;BlackShadow_code.c,225 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,227 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC32:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC156
	BCF         PORTA+0, 4 
	GOTO        L__SELEC157
L__SELEC156:
	BSF         PORTA+0, 4 
L__SELEC157:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC158
	BCF         PORTA+0, 7 
	GOTO        L__SELEC159
L__SELEC158:
	BSF         PORTA+0, 7 
L__SELEC159:
;BlackShadow_code.c,228 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,230 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC33:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC160
	BCF         PORTA+0, 5 
	GOTO        L__SELEC161
L__SELEC160:
	BSF         PORTA+0, 5 
L__SELEC161:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC162
	BCF         PORTA+0, 4 
	GOTO        L__SELEC163
L__SELEC162:
	BSF         PORTA+0, 4 
L__SELEC163:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,231 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,233 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC34:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC164
	BCF         PORTA+0, 5 
	GOTO        L__SELEC165
L__SELEC164:
	BSF         PORTA+0, 5 
L__SELEC165:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC166
	BCF         PORTA+0, 4 
	GOTO        L__SELEC167
L__SELEC166:
	BSF         PORTA+0, 4 
L__SELEC167:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,234 :: 		break;
	GOTO        L_SELEC11
;BlackShadow_code.c,236 :: 		default: L0=L1=L2=L3=0;
L_SELEC35:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
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
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC172
	BCF         PORTA+0, 6 
	GOTO        L__SELEC173
L__SELEC172:
	BSF         PORTA+0, 6 
L__SELEC173:
;BlackShadow_code.c,237 :: 		}
	GOTO        L_SELEC11
L_SELEC10:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC174
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC174:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC12
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC175
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC175:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC13
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC176
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC176:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC16
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC177
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC177:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC19
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC178
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC178:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC22
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC179
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC179:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC180
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC180:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC26
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC181
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC181:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC27
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC182
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC182:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC183
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC183:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC29
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC184
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC184:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC30
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC185
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC185:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC186
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC186:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC187
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC187:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC188
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC188:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	GOTO        L_SELEC35
L_SELEC11:
;BlackShadow_code.c,240 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,242 :: 		void Start(){
;BlackShadow_code.c,243 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,244 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,245 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,246 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,247 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,248 :: 		return;
;BlackShadow_code.c,249 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,250 :: 		void Stop(){
;BlackShadow_code.c,251 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,252 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,253 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,254 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,255 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,256 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,263 :: 		void REC(){
;BlackShadow_code.c,265 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,267 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,268 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,271 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,272 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,273 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,274 :: 		void DER(){
;BlackShadow_code.c,275 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,276 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,277 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,279 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,280 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,282 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,283 :: 		void IZQ(){
;BlackShadow_code.c,284 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,285 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,286 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,288 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,289 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,290 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,292 :: 		void REV(){
;BlackShadow_code.c,293 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,294 :: 		LATC.F2 = 0;
	BCF         LATC+0, 2 
;BlackShadow_code.c,295 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,297 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,298 :: 		LATB.F5 =0;
	BCF         LATB+0, 5 
;BlackShadow_code.c,299 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,301 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,303 :: 		void LIBRE(){
;BlackShadow_code.c,305 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,306 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,307 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,308 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,309 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,313 :: 		void GIRO180(){
;BlackShadow_code.c,314 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,315 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,317 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,318 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,319 :: 		Delay_ms(40);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_GIRO18036:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18036
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18036
	NOP
;BlackShadow_code.c,322 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,324 :: 		void GIRO360(){
;BlackShadow_code.c,325 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,326 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_GIRO36037:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36037
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36037
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36037
	NOP
	NOP
;BlackShadow_code.c,327 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,328 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_GIRO36038:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36038
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36038
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36038
;BlackShadow_code.c,329 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,331 :: 		void BRAKE(){
;BlackShadow_code.c,333 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,334 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,335 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,336 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,337 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,340 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_Basura:

;BlackShadow_code.c,342 :: 		void Basura(){
;BlackShadow_code.c,346 :: 		if(SL1==0 && SL2==1)       //SL1=Sensor izquierdo, SL2= Sensor de linea derecho
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura41
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura41
L__Basura79:
;BlackShadow_code.c,347 :: 		DER();                 //Si veo por la izquierda hago una reversa por la derecha.
	CALL        _DER+0, 0
	GOTO        L_Basura42
L_Basura41:
;BlackShadow_code.c,348 :: 		else if(SL1==1 && SL2==0)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura45
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura45
L__Basura78:
;BlackShadow_code.c,349 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura46
L_Basura45:
;BlackShadow_code.c,350 :: 		else if(SL1==0 && SL2==0)
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura49
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura49
L__Basura77:
;BlackShadow_code.c,351 :: 		GIRO180();
	CALL        _GIRO180+0, 0
	GOTO        L_Basura50
L_Basura49:
;BlackShadow_code.c,352 :: 		else if(SL1==1 && SL2==1)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura53
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura53
L__Basura76:
;BlackShadow_code.c,353 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura54
L_Basura53:
;BlackShadow_code.c,360 :: 		else if(S1==1 && S2==0)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura57
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura57
L__Basura75:
;BlackShadow_code.c,361 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura58
L_Basura57:
;BlackShadow_code.c,362 :: 		else if(S1==0 && S2==1)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura61
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura61
L__Basura74:
;BlackShadow_code.c,363 :: 		DER();
	CALL        _DER+0, 0
	GOTO        L_Basura62
L_Basura61:
;BlackShadow_code.c,364 :: 		else if(S1==1 && S2==1)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura65
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura65
L__Basura73:
;BlackShadow_code.c,365 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura66
L_Basura65:
;BlackShadow_code.c,366 :: 		else if(S1==0 && S2==0)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura69
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura69
L__Basura72:
;BlackShadow_code.c,367 :: 		GIRO180();
	CALL        _GIRO180+0, 0
L_Basura69:
L_Basura66:
L_Basura62:
L_Basura58:
L_Basura54:
L_Basura50:
L_Basura46:
L_Basura42:
;BlackShadow_code.c,368 :: 		}
L_end_Basura:
	RETURN      0
; end of _Basura

_INTERRUPT:

;BlackShadow_code.c,370 :: 		void INTERRUPT(){
;BlackShadow_code.c,373 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT70
;BlackShadow_code.c,374 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,375 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,376 :: 		}
L_INTERRUPT70:
;BlackShadow_code.c,378 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT71
;BlackShadow_code.c,379 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,380 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,381 :: 		}
L_INTERRUPT71:
;BlackShadow_code.c,382 :: 		}
L_end_INTERRUPT:
L__INTERRUPT201:
	RETFIE      1
; end of _INTERRUPT
