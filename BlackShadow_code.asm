
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
	GOTO        L__main84
	BCF         PORTA+0, 5 
	GOTO        L__main85
L__main84:
	BSF         PORTA+0, 5 
L__main85:
	BTFSC       PORTA+0, 5 
	GOTO        L__main86
	BCF         PORTA+0, 4 
	GOTO        L__main87
L__main86:
	BSF         PORTA+0, 4 
L__main87:
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
	GOTO        L__main88
	BCF         PORTA+0, 5 
	GOTO        L__main89
L__main88:
	BSF         PORTA+0, 5 
L__main89:
	BTFSC       PORTA+0, 5 
	GOTO        L__main90
	BCF         PORTA+0, 4 
	GOTO        L__main91
L__main90:
	BSF         PORTA+0, 4 
L__main91:
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
	GOTO        L__main92
	BCF         PORTA+0, 7 
	GOTO        L__main93
L__main92:
	BSF         PORTA+0, 7 
L__main93:
	BTFSC       PORTA+0, 7 
	GOTO        L__main94
	BCF         PORTA+0, 4 
	GOTO        L__main95
L__main94:
	BSF         PORTA+0, 4 
L__main95:
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
	GOTO        L__main96
	BCF         PORTA+0, 7 
	GOTO        L__main97
L__main96:
	BSF         PORTA+0, 7 
L__main97:
	BTFSC       PORTA+0, 7 
	GOTO        L__main98
	BCF         PORTA+0, 6 
	GOTO        L__main99
L__main98:
	BSF         PORTA+0, 6 
L__main99:
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
	GOTO        L__main100
	BCF         PORTA+0, 7 
	GOTO        L__main101
L__main100:
	BSF         PORTA+0, 7 
L__main101:
	BTFSC       PORTA+0, 7 
	GOTO        L__main102
	BCF         PORTA+0, 5 
	GOTO        L__main103
L__main102:
	BSF         PORTA+0, 5 
L__main103:
	BTFSC       PORTA+0, 5 
	GOTO        L__main104
	BCF         PORTA+0, 4 
	GOTO        L__main105
L__main104:
	BSF         PORTA+0, 4 
L__main105:
;BlackShadow_code.c,125 :: 		while(1){
L_main4:
;BlackShadow_code.c,145 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_main8
	BTFSS       PORTB+0, 1 
	GOTO        L_main8
L__main74:
;BlackShadow_code.c,146 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,147 :: 		}
	GOTO        L_main9
L_main8:
;BlackShadow_code.c,149 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,150 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;BlackShadow_code.c,151 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;BlackShadow_code.c,152 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;BlackShadow_code.c,153 :: 		}
L_main9:
;BlackShadow_code.c,175 :: 		}
	GOTO        L_main4
;BlackShadow_code.c,176 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,180 :: 		void SELEC(){
;BlackShadow_code.c,182 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC107:
	BZ          L__SELEC108
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC107
L__SELEC108:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,184 :: 		switch(seleccion){
	GOTO        L_SELEC12
;BlackShadow_code.c,185 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC14:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC109
	BCF         PORTA+0, 5 
	GOTO        L__SELEC110
L__SELEC109:
	BSF         PORTA+0, 5 
L__SELEC110:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC111
	BCF         PORTA+0, 7 
	GOTO        L__SELEC112
L__SELEC111:
	BSF         PORTA+0, 7 
L__SELEC112:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC113
	BCF         PORTA+0, 6 
	GOTO        L__SELEC114
L__SELEC113:
	BSF         PORTA+0, 6 
L__SELEC114:
;BlackShadow_code.c,188 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,190 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC15:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC115
	BCF         PORTA+0, 5 
	GOTO        L__SELEC116
L__SELEC115:
	BSF         PORTA+0, 5 
L__SELEC116:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC117
	BCF         PORTA+0, 4 
	GOTO        L__SELEC118
L__SELEC117:
	BSF         PORTA+0, 4 
L__SELEC118:
;BlackShadow_code.c,192 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,193 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
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
;BlackShadow_code.c,194 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,195 :: 		delay_ms(4000);
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
;BlackShadow_code.c,199 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,201 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC18:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC119
	BCF         PORTA+0, 5 
	GOTO        L__SELEC120
L__SELEC119:
	BSF         PORTA+0, 5 
L__SELEC120:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC121
	BCF         PORTA+0, 4 
	GOTO        L__SELEC122
L__SELEC121:
	BSF         PORTA+0, 4 
L__SELEC122:
;BlackShadow_code.c,202 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,203 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
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
;BlackShadow_code.c,204 :: 		BRAKE();
	CALL        _BRAKE+0, 0
;BlackShadow_code.c,205 :: 		delay_ms(4000);
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
;BlackShadow_code.c,207 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,209 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC21:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC123
	BCF         PORTA+0, 6 
	GOTO        L__SELEC124
L__SELEC123:
	BSF         PORTA+0, 6 
L__SELEC124:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC125
	BCF         PORTA+0, 5 
	GOTO        L__SELEC126
L__SELEC125:
	BSF         PORTA+0, 5 
L__SELEC126:
;BlackShadow_code.c,210 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,211 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC22:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC22
	DECFSZ      R12, 1, 1
	BRA         L_SELEC22
	DECFSZ      R11, 1, 1
	BRA         L_SELEC22
	NOP
	NOP
;BlackShadow_code.c,212 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,213 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC23:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC23
	DECFSZ      R12, 1, 1
	BRA         L_SELEC23
	DECFSZ      R11, 1, 1
	BRA         L_SELEC23
;BlackShadow_code.c,215 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,217 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC24:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC127
	BCF         PORTA+0, 7 
	GOTO        L__SELEC128
L__SELEC127:
	BSF         PORTA+0, 7 
L__SELEC128:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC129
	BCF         PORTA+0, 4 
	GOTO        L__SELEC130
L__SELEC129:
	BSF         PORTA+0, 4 
L__SELEC130:
;BlackShadow_code.c,218 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,219 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC25:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC25
	DECFSZ      R12, 1, 1
	BRA         L_SELEC25
	DECFSZ      R11, 1, 1
	BRA         L_SELEC25
	NOP
	NOP
;BlackShadow_code.c,220 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,221 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC26:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC26
	DECFSZ      R12, 1, 1
	BRA         L_SELEC26
	DECFSZ      R11, 1, 1
	BRA         L_SELEC26
;BlackShadow_code.c,222 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,224 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC27:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC131
	BCF         PORTA+0, 5 
	GOTO        L__SELEC132
L__SELEC131:
	BSF         PORTA+0, 5 
L__SELEC132:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC133
	BCF         PORTA+0, 4 
	GOTO        L__SELEC134
L__SELEC133:
	BSF         PORTA+0, 4 
L__SELEC134:
;BlackShadow_code.c,225 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,226 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,228 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC28:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC135
	BCF         PORTA+0, 7 
	GOTO        L__SELEC136
L__SELEC135:
	BSF         PORTA+0, 7 
L__SELEC136:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC137
	BCF         PORTA+0, 4 
	GOTO        L__SELEC138
L__SELEC137:
	BSF         PORTA+0, 4 
L__SELEC138:
;BlackShadow_code.c,229 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,231 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,233 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC29:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC139
	BCF         PORTA+0, 7 
	GOTO        L__SELEC140
L__SELEC139:
	BSF         PORTA+0, 7 
L__SELEC140:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC141
	BCF         PORTA+0, 5 
	GOTO        L__SELEC142
L__SELEC141:
	BSF         PORTA+0, 5 
L__SELEC142:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,235 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,237 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC30:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC143
	BCF         PORTA+0, 5 
	GOTO        L__SELEC144
L__SELEC143:
	BSF         PORTA+0, 5 
L__SELEC144:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC145
	BCF         PORTA+0, 7 
	GOTO        L__SELEC146
L__SELEC145:
	BSF         PORTA+0, 7 
L__SELEC146:
;BlackShadow_code.c,239 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,241 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC31:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC147
	BCF         PORTA+0, 6 
	GOTO        L__SELEC148
L__SELEC147:
	BSF         PORTA+0, 6 
L__SELEC148:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC149
	BCF         PORTA+0, 7 
	GOTO        L__SELEC150
L__SELEC149:
	BSF         PORTA+0, 7 
L__SELEC150:
;BlackShadow_code.c,244 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,246 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC32:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC151
	BCF         PORTA+0, 4 
	GOTO        L__SELEC152
L__SELEC151:
	BSF         PORTA+0, 4 
L__SELEC152:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC153
	BCF         PORTA+0, 5 
	GOTO        L__SELEC154
L__SELEC153:
	BSF         PORTA+0, 5 
L__SELEC154:
;BlackShadow_code.c,247 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,249 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC33:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC155
	BCF         PORTA+0, 7 
	GOTO        L__SELEC156
L__SELEC155:
	BSF         PORTA+0, 7 
L__SELEC156:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC157
	BCF         PORTA+0, 6 
	GOTO        L__SELEC158
L__SELEC157:
	BSF         PORTA+0, 6 
L__SELEC158:
	BSF         PORTA+0, 5 
;BlackShadow_code.c,250 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,252 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC34:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC159
	BCF         PORTA+0, 4 
	GOTO        L__SELEC160
L__SELEC159:
	BSF         PORTA+0, 4 
L__SELEC160:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC161
	BCF         PORTA+0, 7 
	GOTO        L__SELEC162
L__SELEC161:
	BSF         PORTA+0, 7 
L__SELEC162:
;BlackShadow_code.c,253 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,255 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC35:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC163
	BCF         PORTA+0, 5 
	GOTO        L__SELEC164
L__SELEC163:
	BSF         PORTA+0, 5 
L__SELEC164:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC165
	BCF         PORTA+0, 4 
	GOTO        L__SELEC166
L__SELEC165:
	BSF         PORTA+0, 4 
L__SELEC166:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,256 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,258 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC36:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC167
	BCF         PORTA+0, 5 
	GOTO        L__SELEC168
L__SELEC167:
	BSF         PORTA+0, 5 
L__SELEC168:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC169
	BCF         PORTA+0, 4 
	GOTO        L__SELEC170
L__SELEC169:
	BSF         PORTA+0, 4 
L__SELEC170:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,259 :: 		break;
	GOTO        L_SELEC13
;BlackShadow_code.c,261 :: 		default: L0=L1=L2=L3=0;
L_SELEC37:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC171
	BCF         PORTA+0, 5 
	GOTO        L__SELEC172
L__SELEC171:
	BSF         PORTA+0, 5 
L__SELEC172:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC173
	BCF         PORTA+0, 7 
	GOTO        L__SELEC174
L__SELEC173:
	BSF         PORTA+0, 7 
L__SELEC174:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC175
	BCF         PORTA+0, 6 
	GOTO        L__SELEC176
L__SELEC175:
	BSF         PORTA+0, 6 
L__SELEC176:
;BlackShadow_code.c,262 :: 		}
	GOTO        L_SELEC13
L_SELEC12:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC177
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC177:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC14
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC178
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC178:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC15
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC179
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC179:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC18
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC180
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC180:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC21
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC181
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC181:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC24
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC182
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC182:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC27
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC183
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC183:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC28
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC184
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC184:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC29
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC185
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC185:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC30
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC186
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC186:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC31
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC187
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC187:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC188
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC188:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC189
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC189:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC34
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC190
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC190:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC191
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC191:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	GOTO        L_SELEC37
L_SELEC13:
;BlackShadow_code.c,265 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,267 :: 		void Start(){
;BlackShadow_code.c,268 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,269 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,270 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,271 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,272 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,273 :: 		return;
;BlackShadow_code.c,274 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,275 :: 		void Stop(){
;BlackShadow_code.c,276 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,277 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,278 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,279 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,280 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,281 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,288 :: 		void REC(){
;BlackShadow_code.c,290 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,292 :: 		PWM1_Set_Duty(190); // IN1 = PWM
	MOVLW       190
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,293 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,296 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,297 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,298 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,299 :: 		void DER(){
;BlackShadow_code.c,300 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,301 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,302 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,304 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,305 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,307 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,308 :: 		void IZQ(){
;BlackShadow_code.c,309 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,310 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,311 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,313 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,314 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,315 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,317 :: 		void REV(){
;BlackShadow_code.c,318 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,319 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,320 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,321 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,322 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,324 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,326 :: 		void LIBRE(){
;BlackShadow_code.c,328 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,329 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,330 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,331 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,332 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,336 :: 		void GIRO180(){
;BlackShadow_code.c,337 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,338 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,340 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,341 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,342 :: 		Delay_ms(40);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_GIRO18038:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18038
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18038
	NOP
;BlackShadow_code.c,345 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,347 :: 		void GIRO360(){
;BlackShadow_code.c,348 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,349 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_GIRO36039:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36039
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36039
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36039
	NOP
	NOP
;BlackShadow_code.c,350 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,351 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_GIRO36040:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36040
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36040
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36040
;BlackShadow_code.c,352 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,354 :: 		void BRAKE(){
;BlackShadow_code.c,356 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,357 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,358 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,359 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,360 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,363 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;BlackShadow_code.c,364 :: 		void HARD(){
;BlackShadow_code.c,365 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,366 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,367 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,368 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,370 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_Basura:

;BlackShadow_code.c,372 :: 		void Basura(){
;BlackShadow_code.c,376 :: 		if(SL1==0 && SL2==1)       //SL1=Sensor izquierdo, SL2= Sensor de linea derecho
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura43
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura43
L__Basura82:
;BlackShadow_code.c,377 :: 		DER();                 //Si veo por la izquierda hago una reversa por la derecha.
	CALL        _DER+0, 0
	GOTO        L_Basura44
L_Basura43:
;BlackShadow_code.c,378 :: 		else if(SL1==1 && SL2==0)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura47
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura47
L__Basura81:
;BlackShadow_code.c,379 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura48
L_Basura47:
;BlackShadow_code.c,380 :: 		else if(SL1==0 && SL2==0)
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura51
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura51
L__Basura80:
;BlackShadow_code.c,381 :: 		GIRO180();
	CALL        _GIRO180+0, 0
	GOTO        L_Basura52
L_Basura51:
;BlackShadow_code.c,382 :: 		else if(SL1==1 && SL2==1)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura55
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura55
L__Basura79:
;BlackShadow_code.c,383 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura56
L_Basura55:
;BlackShadow_code.c,390 :: 		else if(S1==1 && S2==0)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura59
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura59
L__Basura78:
;BlackShadow_code.c,391 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura60
L_Basura59:
;BlackShadow_code.c,392 :: 		else if(S1==0 && S2==1)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura63
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura63
L__Basura77:
;BlackShadow_code.c,393 :: 		DER();
	CALL        _DER+0, 0
	GOTO        L_Basura64
L_Basura63:
;BlackShadow_code.c,394 :: 		else if(S1==1 && S2==1)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura67
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura67
L__Basura76:
;BlackShadow_code.c,395 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura68
L_Basura67:
;BlackShadow_code.c,396 :: 		else if(S1==0 && S2==0)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura71
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura71
L__Basura75:
;BlackShadow_code.c,397 :: 		GIRO180();
	CALL        _GIRO180+0, 0
L_Basura71:
L_Basura68:
L_Basura64:
L_Basura60:
L_Basura56:
L_Basura52:
L_Basura48:
L_Basura44:
;BlackShadow_code.c,398 :: 		}
L_end_Basura:
	RETURN      0
; end of _Basura

_INTERRUPT:

;BlackShadow_code.c,400 :: 		void INTERRUPT(){
;BlackShadow_code.c,403 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT72
;BlackShadow_code.c,404 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,405 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,407 :: 		}
L_INTERRUPT72:
;BlackShadow_code.c,409 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT73
;BlackShadow_code.c,410 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,411 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,412 :: 		}
L_INTERRUPT73:
;BlackShadow_code.c,413 :: 		}
L_end_INTERRUPT:
L__INTERRUPT205:
	RETFIE      1
; end of _INTERRUPT
