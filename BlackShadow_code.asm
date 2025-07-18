
_main:

;BlackShadow_code.c,57 :: 		void main() {
;BlackShadow_code.c,58 :: 		OSCCON = 0b01100110;
	MOVLW       102
	MOVWF       OSCCON+0 
;BlackShadow_code.c,61 :: 		PORTA = 0;
	CLRF        PORTA+0 
;BlackShadow_code.c,62 :: 		PORTB = 0;
	CLRF        PORTB+0 
;BlackShadow_code.c,63 :: 		PORTC = 0;
	CLRF        PORTC+0 
;BlackShadow_code.c,66 :: 		TRISA= 0b00001111;   //El bit 1 del PortaA0 es el ultimo.     //0X0F
	MOVLW       15
	MOVWF       TRISA+0 
;BlackShadow_code.c,67 :: 		TRISB= 0b11011110;    //El bit que tenemos hasta la izquierda es el numero 7.DAT Y CLK se dejan como entrada aunque pueden ser salida, el micro los ocupa para programar
	MOVLW       222
	MOVWF       TRISB+0 
;BlackShadow_code.c,68 :: 		TRISC= 0b11111001;
	MOVLW       249
	MOVWF       TRISC+0 
;BlackShadow_code.c,70 :: 		ANSELA= 0b00000000;
	CLRF        ANSELA+0 
;BlackShadow_code.c,71 :: 		ANSELB= 0b00000000;
	CLRF        ANSELB+0 
;BlackShadow_code.c,72 :: 		ANSELC= 0b00000000;
	CLRF        ANSELC+0 
;BlackShadow_code.c,76 :: 		INTCON3.INT1IE =1;                               //habilitamos interrupción INT1 (RB1)
	BSF         INTCON3+0, 3 
;BlackShadow_code.c,77 :: 		INTCON3.INT2IE =1;                                //habilitamos interrupción INT2 (RB2)
	BSF         INTCON3+0, 4 
;BlackShadow_code.c,79 :: 		INTCON2.INTEDG1 =0;                               //INT1: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 5 
;BlackShadow_code.c,80 :: 		INTCON2.INTEDG2 =0;                                //INT2: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 4 
;BlackShadow_code.c,82 :: 		INTCON.GIE =1;                                    //Interrupciones globales
	BSF         INTCON+0, 7 
;BlackShadow_code.c,83 :: 		INTCON.PEIE =1;                                   //Interrupciones perifericas
	BSF         INTCON+0, 6 
;BlackShadow_code.c,92 :: 		PWM1_Init(20000);   //Se debe poner a 20 000 para el motor y 1000 para simular
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;BlackShadow_code.c,93 :: 		PWM2_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;BlackShadow_code.c,94 :: 		PWM3_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;BlackShadow_code.c,95 :: 		PWM4_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;BlackShadow_code.c,98 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,99 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,100 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,101 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,103 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,104 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,105 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,106 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,111 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main68
	BCF         PORTA+0, 5 
	GOTO        L__main69
L__main68:
	BSF         PORTA+0, 5 
L__main69:
	BTFSC       PORTA+0, 5 
	GOTO        L__main70
	BCF         PORTA+0, 4 
	GOTO        L__main71
L__main70:
	BSF         PORTA+0, 4 
L__main71:
;BlackShadow_code.c,112 :: 		delay_ms(300);
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
;BlackShadow_code.c,113 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main72
	BCF         PORTA+0, 5 
	GOTO        L__main73
L__main72:
	BSF         PORTA+0, 5 
L__main73:
	BTFSC       PORTA+0, 5 
	GOTO        L__main74
	BCF         PORTA+0, 4 
	GOTO        L__main75
L__main74:
	BSF         PORTA+0, 4 
L__main75:
;BlackShadow_code.c,114 :: 		delay_ms(300);
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
;BlackShadow_code.c,115 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main76
	BCF         PORTA+0, 7 
	GOTO        L__main77
L__main76:
	BSF         PORTA+0, 7 
L__main77:
	BTFSC       PORTA+0, 7 
	GOTO        L__main78
	BCF         PORTA+0, 4 
	GOTO        L__main79
L__main78:
	BSF         PORTA+0, 4 
L__main79:
;BlackShadow_code.c,116 :: 		delay_ms(300);
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
;BlackShadow_code.c,117 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main80
	BCF         PORTA+0, 7 
	GOTO        L__main81
L__main80:
	BSF         PORTA+0, 7 
L__main81:
	BTFSC       PORTA+0, 7 
	GOTO        L__main82
	BCF         PORTA+0, 6 
	GOTO        L__main83
L__main82:
	BSF         PORTA+0, 6 
L__main83:
;BlackShadow_code.c,118 :: 		delay_ms(300);
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
;BlackShadow_code.c,119 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main84
	BCF         PORTA+0, 7 
	GOTO        L__main85
L__main84:
	BSF         PORTA+0, 7 
L__main85:
	BTFSC       PORTA+0, 7 
	GOTO        L__main86
	BCF         PORTA+0, 5 
	GOTO        L__main87
L__main86:
	BSF         PORTA+0, 5 
L__main87:
	BTFSC       PORTA+0, 5 
	GOTO        L__main88
	BCF         PORTA+0, 4 
	GOTO        L__main89
L__main88:
	BSF         PORTA+0, 4 
L__main89:
;BlackShadow_code.c,121 :: 		while(1){
L_main4:
;BlackShadow_code.c,123 :: 		if (S2 ==1 && S6 ==0 && SL1 ==0){
	BTFSS       PORTC+0, 6 
	GOTO        L_main8
	BTFSC       PORTB+0, 4 
	GOTO        L_main8
	BTFSC       PORTC+0, 0 
	GOTO        L_main8
L__main64:
;BlackShadow_code.c,124 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,125 :: 		}
	GOTO        L_main9
L_main8:
;BlackShadow_code.c,126 :: 		else if (S2 ==0 && S6 ==1 && SL1 ==0){
	BTFSC       PORTC+0, 6 
	GOTO        L_main12
	BTFSS       PORTB+0, 4 
	GOTO        L_main12
	BTFSC       PORTC+0, 0 
	GOTO        L_main12
L__main63:
;BlackShadow_code.c,127 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,128 :: 		}
	GOTO        L_main13
L_main12:
;BlackShadow_code.c,129 :: 		else if (S2 ==0 && S6 ==0 && SL1 ==1){
	BTFSC       PORTC+0, 6 
	GOTO        L_main16
	BTFSC       PORTB+0, 4 
	GOTO        L_main16
	BTFSS       PORTC+0, 0 
	GOTO        L_main16
L__main62:
;BlackShadow_code.c,130 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,132 :: 		}
L_main16:
L_main13:
L_main9:
;BlackShadow_code.c,137 :: 		}
	GOTO        L_main4
;BlackShadow_code.c,138 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,142 :: 		void SELEC(){
;BlackShadow_code.c,144 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC91:
	BZ          L__SELEC92
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC91
L__SELEC92:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,146 :: 		switch(seleccion){
	GOTO        L_SELEC17
;BlackShadow_code.c,147 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC19:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC93
	BCF         PORTA+0, 5 
	GOTO        L__SELEC94
L__SELEC93:
	BSF         PORTA+0, 5 
L__SELEC94:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC95
	BCF         PORTA+0, 7 
	GOTO        L__SELEC96
L__SELEC95:
	BSF         PORTA+0, 7 
L__SELEC96:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC97
	BCF         PORTA+0, 6 
	GOTO        L__SELEC98
L__SELEC97:
	BSF         PORTA+0, 6 
L__SELEC98:
;BlackShadow_code.c,150 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,152 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC20:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC99
	BCF         PORTA+0, 5 
	GOTO        L__SELEC100
L__SELEC99:
	BSF         PORTA+0, 5 
L__SELEC100:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC101
	BCF         PORTA+0, 4 
	GOTO        L__SELEC102
L__SELEC101:
	BSF         PORTA+0, 4 
L__SELEC102:
;BlackShadow_code.c,154 :: 		while(1){
L_SELEC21:
;BlackShadow_code.c,155 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC25
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC25
L__SELEC66:
;BlackShadow_code.c,156 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,157 :: 		}
	GOTO        L_SELEC26
L_SELEC25:
;BlackShadow_code.c,159 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC29
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC29
L__SELEC65:
;BlackShadow_code.c,160 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,161 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC30:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC30
	DECFSZ      R12, 1, 1
	BRA         L_SELEC30
	DECFSZ      R11, 1, 1
	BRA         L_SELEC30
	NOP
;BlackShadow_code.c,162 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,163 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC31:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC31
	DECFSZ      R12, 1, 1
	BRA         L_SELEC31
	DECFSZ      R11, 1, 1
	BRA         L_SELEC31
	NOP
;BlackShadow_code.c,164 :: 		}
	GOTO        L_SELEC32
L_SELEC29:
;BlackShadow_code.c,165 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC33
;BlackShadow_code.c,166 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,167 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC34:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC34
	DECFSZ      R12, 1, 1
	BRA         L_SELEC34
	DECFSZ      R11, 1, 1
	BRA         L_SELEC34
	NOP
;BlackShadow_code.c,168 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;BlackShadow_code.c,169 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC35:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC35
	DECFSZ      R12, 1, 1
	BRA         L_SELEC35
	DECFSZ      R11, 1, 1
	BRA         L_SELEC35
	NOP
;BlackShadow_code.c,170 :: 		}
	GOTO        L_SELEC36
L_SELEC33:
;BlackShadow_code.c,171 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC37
;BlackShadow_code.c,172 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,173 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC38:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC38
	DECFSZ      R12, 1, 1
	BRA         L_SELEC38
	DECFSZ      R11, 1, 1
	BRA         L_SELEC38
	NOP
;BlackShadow_code.c,174 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,175 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC39:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC39
	DECFSZ      R12, 1, 1
	BRA         L_SELEC39
	DECFSZ      R11, 1, 1
	BRA         L_SELEC39
	NOP
;BlackShadow_code.c,176 :: 		}
L_SELEC37:
L_SELEC36:
L_SELEC32:
L_SELEC26:
;BlackShadow_code.c,177 :: 		}
	GOTO        L_SELEC21
;BlackShadow_code.c,180 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC40:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC103
	BCF         PORTA+0, 5 
	GOTO        L__SELEC104
L__SELEC103:
	BSF         PORTA+0, 5 
L__SELEC104:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC105
	BCF         PORTA+0, 4 
	GOTO        L__SELEC106
L__SELEC105:
	BSF         PORTA+0, 4 
L__SELEC106:
;BlackShadow_code.c,182 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,184 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,186 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC41:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC107
	BCF         PORTA+0, 6 
	GOTO        L__SELEC108
L__SELEC107:
	BSF         PORTA+0, 6 
L__SELEC108:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC109
	BCF         PORTA+0, 5 
	GOTO        L__SELEC110
L__SELEC109:
	BSF         PORTA+0, 5 
L__SELEC110:
;BlackShadow_code.c,187 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,188 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC42:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC42
	DECFSZ      R12, 1, 1
	BRA         L_SELEC42
	DECFSZ      R11, 1, 1
	BRA         L_SELEC42
	NOP
	NOP
;BlackShadow_code.c,189 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,190 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC43:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC43
	DECFSZ      R12, 1, 1
	BRA         L_SELEC43
	DECFSZ      R11, 1, 1
	BRA         L_SELEC43
;BlackShadow_code.c,192 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,194 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC44:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC111
	BCF         PORTA+0, 7 
	GOTO        L__SELEC112
L__SELEC111:
	BSF         PORTA+0, 7 
L__SELEC112:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC113
	BCF         PORTA+0, 4 
	GOTO        L__SELEC114
L__SELEC113:
	BSF         PORTA+0, 4 
L__SELEC114:
;BlackShadow_code.c,195 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,196 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC45:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC45
	DECFSZ      R12, 1, 1
	BRA         L_SELEC45
	DECFSZ      R11, 1, 1
	BRA         L_SELEC45
	NOP
	NOP
;BlackShadow_code.c,197 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,198 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC46:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC46
	DECFSZ      R12, 1, 1
	BRA         L_SELEC46
	DECFSZ      R11, 1, 1
	BRA         L_SELEC46
;BlackShadow_code.c,199 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,201 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC47:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC115
	BCF         PORTA+0, 5 
	GOTO        L__SELEC116
L__SELEC115:
	BSF         PORTA+0, 5 
L__SELEC116:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC117
	BCF         PORTA+0, 4 
	GOTO        L__SELEC118
L__SELEC117:
	BSF         PORTA+0, 4 
L__SELEC118:
;BlackShadow_code.c,202 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,203 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,205 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC48:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC119
	BCF         PORTA+0, 7 
	GOTO        L__SELEC120
L__SELEC119:
	BSF         PORTA+0, 7 
L__SELEC120:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC121
	BCF         PORTA+0, 4 
	GOTO        L__SELEC122
L__SELEC121:
	BSF         PORTA+0, 4 
L__SELEC122:
;BlackShadow_code.c,206 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,208 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,210 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC49:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC123
	BCF         PORTA+0, 7 
	GOTO        L__SELEC124
L__SELEC123:
	BSF         PORTA+0, 7 
L__SELEC124:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC125
	BCF         PORTA+0, 5 
	GOTO        L__SELEC126
L__SELEC125:
	BSF         PORTA+0, 5 
L__SELEC126:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,212 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,214 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC50:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC127
	BCF         PORTA+0, 5 
	GOTO        L__SELEC128
L__SELEC127:
	BSF         PORTA+0, 5 
L__SELEC128:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC129
	BCF         PORTA+0, 7 
	GOTO        L__SELEC130
L__SELEC129:
	BSF         PORTA+0, 7 
L__SELEC130:
;BlackShadow_code.c,216 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,218 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC51:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC131
	BCF         PORTA+0, 6 
	GOTO        L__SELEC132
L__SELEC131:
	BSF         PORTA+0, 6 
L__SELEC132:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC133
	BCF         PORTA+0, 7 
	GOTO        L__SELEC134
L__SELEC133:
	BSF         PORTA+0, 7 
L__SELEC134:
;BlackShadow_code.c,221 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,223 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC52:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC135
	BCF         PORTA+0, 4 
	GOTO        L__SELEC136
L__SELEC135:
	BSF         PORTA+0, 4 
L__SELEC136:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC137
	BCF         PORTA+0, 5 
	GOTO        L__SELEC138
L__SELEC137:
	BSF         PORTA+0, 5 
L__SELEC138:
;BlackShadow_code.c,224 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,226 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC53:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC139
	BCF         PORTA+0, 7 
	GOTO        L__SELEC140
L__SELEC139:
	BSF         PORTA+0, 7 
L__SELEC140:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC141
	BCF         PORTA+0, 6 
	GOTO        L__SELEC142
L__SELEC141:
	BSF         PORTA+0, 6 
L__SELEC142:
	BSF         PORTA+0, 5 
;BlackShadow_code.c,227 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,229 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC54:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC143
	BCF         PORTA+0, 4 
	GOTO        L__SELEC144
L__SELEC143:
	BSF         PORTA+0, 4 
L__SELEC144:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC145
	BCF         PORTA+0, 7 
	GOTO        L__SELEC146
L__SELEC145:
	BSF         PORTA+0, 7 
L__SELEC146:
;BlackShadow_code.c,230 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,232 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC55:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC147
	BCF         PORTA+0, 5 
	GOTO        L__SELEC148
L__SELEC147:
	BSF         PORTA+0, 5 
L__SELEC148:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC149
	BCF         PORTA+0, 4 
	GOTO        L__SELEC150
L__SELEC149:
	BSF         PORTA+0, 4 
L__SELEC150:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,233 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,235 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC56:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC151
	BCF         PORTA+0, 5 
	GOTO        L__SELEC152
L__SELEC151:
	BSF         PORTA+0, 5 
L__SELEC152:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC153
	BCF         PORTA+0, 4 
	GOTO        L__SELEC154
L__SELEC153:
	BSF         PORTA+0, 4 
L__SELEC154:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,236 :: 		break;
	GOTO        L_SELEC18
;BlackShadow_code.c,238 :: 		default: L0=L1=L2=L3=0;
L_SELEC57:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC155
	BCF         PORTA+0, 5 
	GOTO        L__SELEC156
L__SELEC155:
	BSF         PORTA+0, 5 
L__SELEC156:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC157
	BCF         PORTA+0, 7 
	GOTO        L__SELEC158
L__SELEC157:
	BSF         PORTA+0, 7 
L__SELEC158:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC159
	BCF         PORTA+0, 6 
	GOTO        L__SELEC160
L__SELEC159:
	BSF         PORTA+0, 6 
L__SELEC160:
;BlackShadow_code.c,239 :: 		}
	GOTO        L_SELEC18
L_SELEC17:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC161
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC161:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC19
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC162
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC162:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC20
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC163
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC163:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC164
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC164:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC41
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC165
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC165:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC44
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC166
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC166:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC47
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC167
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC167:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC48
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC168
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC168:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC49
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC169
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC169:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC50
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC170
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC170:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC51
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC171
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC171:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC52
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC172
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC172:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC53
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC173
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC173:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC54
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC174
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC174:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC55
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC175
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC175:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC56
	GOTO        L_SELEC57
L_SELEC18:
;BlackShadow_code.c,242 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,244 :: 		void Start(){
;BlackShadow_code.c,245 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,246 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,247 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,248 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,249 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,250 :: 		return;
;BlackShadow_code.c,251 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,252 :: 		void Stop(){
;BlackShadow_code.c,253 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,254 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,255 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,256 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,257 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,258 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,265 :: 		void REC(){
;BlackShadow_code.c,267 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,269 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,270 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,273 :: 		PWM3_Set_Duty(120);    // IN1 = 0
	MOVLW       120
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,274 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,275 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,276 :: 		void DER(){
;BlackShadow_code.c,277 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,278 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,279 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,281 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,282 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,284 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,285 :: 		void IZQ(){
;BlackShadow_code.c,286 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,287 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,288 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,290 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,291 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,292 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,294 :: 		void REV(){
;BlackShadow_code.c,295 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,296 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,297 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,298 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
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
;BlackShadow_code.c,314 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,316 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,317 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,319 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,320 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,321 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18058:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18058
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18058
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18058
;BlackShadow_code.c,322 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,325 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,327 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;BlackShadow_code.c,328 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;BlackShadow_code.c,329 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36059:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36059
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36059
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36059
	NOP
	NOP
;BlackShadow_code.c,330 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,332 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,334 :: 		void BRAKE(){
;BlackShadow_code.c,336 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,337 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,338 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,339 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,340 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,343 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;BlackShadow_code.c,344 :: 		void HARD(){
;BlackShadow_code.c,345 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,346 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,347 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,348 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,350 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_INTERRUPT:

;BlackShadow_code.c,353 :: 		void INTERRUPT(){
;BlackShadow_code.c,356 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT60
;BlackShadow_code.c,357 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,358 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,360 :: 		}
L_INTERRUPT60:
;BlackShadow_code.c,362 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT61
;BlackShadow_code.c,363 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,364 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,365 :: 		}
L_INTERRUPT61:
;BlackShadow_code.c,366 :: 		}
L_end_INTERRUPT:
L__INTERRUPT188:
	RETFIE      1
; end of _INTERRUPT
