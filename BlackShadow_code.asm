
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
	GOTO        L__main83
	BCF         PORTA+0, 5 
	GOTO        L__main84
L__main83:
	BSF         PORTA+0, 5 
L__main84:
	BTFSC       PORTA+0, 5 
	GOTO        L__main85
	BCF         PORTA+0, 4 
	GOTO        L__main86
L__main85:
	BSF         PORTA+0, 4 
L__main86:
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
	GOTO        L__main87
	BCF         PORTA+0, 5 
	GOTO        L__main88
L__main87:
	BSF         PORTA+0, 5 
L__main88:
	BTFSC       PORTA+0, 5 
	GOTO        L__main89
	BCF         PORTA+0, 4 
	GOTO        L__main90
L__main89:
	BSF         PORTA+0, 4 
L__main90:
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
	GOTO        L__main91
	BCF         PORTA+0, 7 
	GOTO        L__main92
L__main91:
	BSF         PORTA+0, 7 
L__main92:
	BTFSC       PORTA+0, 7 
	GOTO        L__main93
	BCF         PORTA+0, 4 
	GOTO        L__main94
L__main93:
	BSF         PORTA+0, 4 
L__main94:
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
	GOTO        L__main95
	BCF         PORTA+0, 7 
	GOTO        L__main96
L__main95:
	BSF         PORTA+0, 7 
L__main96:
	BTFSC       PORTA+0, 7 
	GOTO        L__main97
	BCF         PORTA+0, 6 
	GOTO        L__main98
L__main97:
	BSF         PORTA+0, 6 
L__main98:
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
	GOTO        L__main99
	BCF         PORTA+0, 7 
	GOTO        L__main100
L__main99:
	BSF         PORTA+0, 7 
L__main100:
	BTFSC       PORTA+0, 7 
	GOTO        L__main101
	BCF         PORTA+0, 5 
	GOTO        L__main102
L__main101:
	BSF         PORTA+0, 5 
L__main102:
	BTFSC       PORTA+0, 5 
	GOTO        L__main103
	BCF         PORTA+0, 4 
	GOTO        L__main104
L__main103:
	BSF         PORTA+0, 4 
L__main104:
;BlackShadow_code.c,126 :: 		while(1){
L_main4:
;BlackShadow_code.c,129 :: 		if (linea_izq_detectada || linea_der_detectada) {
	MOVF        _linea_izq_detectada+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main73
	MOVF        _linea_der_detectada+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main73
	GOTO        L_main8
L__main73:
;BlackShadow_code.c,130 :: 		linea_izq_detectada = 0;
	CLRF        _linea_izq_detectada+0 
;BlackShadow_code.c,131 :: 		linea_der_detectada = 0;
	CLRF        _linea_der_detectada+0 
;BlackShadow_code.c,132 :: 		BRAKE();
	CALL        _BRAKE+0, 0
;BlackShadow_code.c,133 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;BlackShadow_code.c,134 :: 		} else {
	GOTO        L_main10
L_main8:
;BlackShadow_code.c,135 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,136 :: 		}
L_main10:
;BlackShadow_code.c,143 :: 		}
	GOTO        L_main4
;BlackShadow_code.c,144 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,148 :: 		void SELEC(){
;BlackShadow_code.c,150 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
;BlackShadow_code.c,152 :: 		switch(seleccion){
	GOTO        L_SELEC11
;BlackShadow_code.c,153 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC13:
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
;BlackShadow_code.c,156 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,158 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC14:
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
;BlackShadow_code.c,160 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,161 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC15:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC15
	DECFSZ      R12, 1, 1
	BRA         L_SELEC15
	DECFSZ      R11, 1, 1
	BRA         L_SELEC15
	NOP
	NOP
;BlackShadow_code.c,162 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,163 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC16:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC16
	DECFSZ      R12, 1, 1
	BRA         L_SELEC16
	DECFSZ      R11, 1, 1
	BRA         L_SELEC16
;BlackShadow_code.c,167 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,169 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC17:
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
;BlackShadow_code.c,170 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,171 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC18:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC18
	DECFSZ      R12, 1, 1
	BRA         L_SELEC18
	DECFSZ      R11, 1, 1
	BRA         L_SELEC18
	NOP
	NOP
;BlackShadow_code.c,172 :: 		BRAKE();
	CALL        _BRAKE+0, 0
;BlackShadow_code.c,173 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC19:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC19
	DECFSZ      R12, 1, 1
	BRA         L_SELEC19
	DECFSZ      R11, 1, 1
	BRA         L_SELEC19
;BlackShadow_code.c,175 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,177 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC20:
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
;BlackShadow_code.c,178 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,179 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC21:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC21
	DECFSZ      R12, 1, 1
	BRA         L_SELEC21
	DECFSZ      R11, 1, 1
	BRA         L_SELEC21
	NOP
	NOP
;BlackShadow_code.c,180 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,181 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC22:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC22
	DECFSZ      R12, 1, 1
	BRA         L_SELEC22
	DECFSZ      R11, 1, 1
	BRA         L_SELEC22
;BlackShadow_code.c,183 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,185 :: 		case 4: L2=0; L3=L1=L0=1;
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
;BlackShadow_code.c,186 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,187 :: 		delay_ms(250);
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
;BlackShadow_code.c,188 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,189 :: 		delay_ms(4000);
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
;BlackShadow_code.c,190 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,192 :: 		case 5: L2=L0=0; L3=L1=1;
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
;BlackShadow_code.c,193 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,194 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,196 :: 		case 6: L1=L2=0; L3=L0=1;
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
;BlackShadow_code.c,197 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,199 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,201 :: 		case 7: L2=L1=L0=0; L3=1;
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
;BlackShadow_code.c,203 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,205 :: 		case 8: L3=0; L1=L2=L0=1;
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
;BlackShadow_code.c,207 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,209 :: 		case 9: L0=L3=0; L1=L2=1;
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
;BlackShadow_code.c,212 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,214 :: 		case 10: L3=L1=0; L2=L0=1;
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
;BlackShadow_code.c,215 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,217 :: 		case 11: L0=L1=L3=0; L2=1;
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
;BlackShadow_code.c,218 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,220 :: 		case 12: L3=L2=0; L1=L0=1;
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
;BlackShadow_code.c,221 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,223 :: 		case 13: L3=L2=L0=0; L1=1;
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
;BlackShadow_code.c,224 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,226 :: 		case 14: L3=L2=L1=0; L0=1;
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
;BlackShadow_code.c,227 :: 		break;
	GOTO        L_SELEC12
;BlackShadow_code.c,229 :: 		default: L0=L1=L2=L3=0;
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
;BlackShadow_code.c,230 :: 		}
	GOTO        L_SELEC12
L_SELEC11:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC176
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC176:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC13
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC177
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC177:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC14
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC178
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC178:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC17
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC179
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC179:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC20
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
L_SELEC12:
;BlackShadow_code.c,233 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,235 :: 		void Start(){
;BlackShadow_code.c,236 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,237 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,238 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,239 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,240 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,241 :: 		return;
;BlackShadow_code.c,242 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,243 :: 		void Stop(){
;BlackShadow_code.c,244 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,245 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,246 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,247 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,248 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,249 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,256 :: 		void REC(){
;BlackShadow_code.c,258 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,260 :: 		PWM1_Set_Duty(190); // IN1 = PWM
	MOVLW       190
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,261 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,264 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,265 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,266 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,267 :: 		void DER(){
;BlackShadow_code.c,268 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,269 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,270 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,272 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,273 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,275 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,276 :: 		void IZQ(){
;BlackShadow_code.c,277 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,278 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,279 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,281 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,282 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,283 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,285 :: 		void REV(){
;BlackShadow_code.c,286 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,287 :: 		LATC.F2 = 0;
	BCF         LATC+0, 2 
;BlackShadow_code.c,288 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,290 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,291 :: 		LATB.F5 =0;
	BCF         LATB+0, 5 
;BlackShadow_code.c,292 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,294 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,296 :: 		void LIBRE(){
;BlackShadow_code.c,298 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,299 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,300 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,301 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,302 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,306 :: 		void GIRO180(){
;BlackShadow_code.c,307 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,308 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,310 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,311 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,312 :: 		Delay_ms(40);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_GIRO18037:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18037
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18037
	NOP
;BlackShadow_code.c,315 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,317 :: 		void GIRO360(){
;BlackShadow_code.c,318 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,319 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_GIRO36038:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36038
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36038
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36038
	NOP
	NOP
;BlackShadow_code.c,320 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,321 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_GIRO36039:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36039
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36039
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36039
;BlackShadow_code.c,322 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,324 :: 		void BRAKE(){
;BlackShadow_code.c,326 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,327 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,328 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,329 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,330 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,333 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_Basura:

;BlackShadow_code.c,335 :: 		void Basura(){
;BlackShadow_code.c,339 :: 		if(SL1==0 && SL2==1)       //SL1=Sensor izquierdo, SL2= Sensor de linea derecho
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura42
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura42
L__Basura81:
;BlackShadow_code.c,340 :: 		DER();                 //Si veo por la izquierda hago una reversa por la derecha.
	CALL        _DER+0, 0
	GOTO        L_Basura43
L_Basura42:
;BlackShadow_code.c,341 :: 		else if(SL1==1 && SL2==0)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura46
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura46
L__Basura80:
;BlackShadow_code.c,342 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura47
L_Basura46:
;BlackShadow_code.c,343 :: 		else if(SL1==0 && SL2==0)
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura50
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura50
L__Basura79:
;BlackShadow_code.c,344 :: 		GIRO180();
	CALL        _GIRO180+0, 0
	GOTO        L_Basura51
L_Basura50:
;BlackShadow_code.c,345 :: 		else if(SL1==1 && SL2==1)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura54
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura54
L__Basura78:
;BlackShadow_code.c,346 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura55
L_Basura54:
;BlackShadow_code.c,353 :: 		else if(S1==1 && S2==0)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura58
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura58
L__Basura77:
;BlackShadow_code.c,354 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura59
L_Basura58:
;BlackShadow_code.c,355 :: 		else if(S1==0 && S2==1)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura62
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura62
L__Basura76:
;BlackShadow_code.c,356 :: 		DER();
	CALL        _DER+0, 0
	GOTO        L_Basura63
L_Basura62:
;BlackShadow_code.c,357 :: 		else if(S1==1 && S2==1)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura66
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura66
L__Basura75:
;BlackShadow_code.c,358 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura67
L_Basura66:
;BlackShadow_code.c,359 :: 		else if(S1==0 && S2==0)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura70
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura70
L__Basura74:
;BlackShadow_code.c,360 :: 		GIRO180();
	CALL        _GIRO180+0, 0
L_Basura70:
L_Basura67:
L_Basura63:
L_Basura59:
L_Basura55:
L_Basura51:
L_Basura47:
L_Basura43:
;BlackShadow_code.c,361 :: 		}
L_end_Basura:
	RETURN      0
; end of _Basura

_INTERRUPT:

;BlackShadow_code.c,363 :: 		void INTERRUPT(){
;BlackShadow_code.c,366 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT71
;BlackShadow_code.c,367 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,368 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,369 :: 		}
L_INTERRUPT71:
;BlackShadow_code.c,371 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT72
;BlackShadow_code.c,372 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,373 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,374 :: 		}
L_INTERRUPT72:
;BlackShadow_code.c,375 :: 		}
L_end_INTERRUPT:
L__INTERRUPT203:
	RETFIE      1
; end of _INTERRUPT
