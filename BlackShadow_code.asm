
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
	GOTO        L__main96
	BCF         PORTA+0, 5 
	GOTO        L__main97
L__main96:
	BSF         PORTA+0, 5 
L__main97:
	BTFSC       PORTA+0, 5 
	GOTO        L__main98
	BCF         PORTA+0, 4 
	GOTO        L__main99
L__main98:
	BSF         PORTA+0, 4 
L__main99:
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
	GOTO        L__main100
	BCF         PORTA+0, 5 
	GOTO        L__main101
L__main100:
	BSF         PORTA+0, 5 
L__main101:
	BTFSC       PORTA+0, 5 
	GOTO        L__main102
	BCF         PORTA+0, 4 
	GOTO        L__main103
L__main102:
	BSF         PORTA+0, 4 
L__main103:
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
	GOTO        L__main104
	BCF         PORTA+0, 7 
	GOTO        L__main105
L__main104:
	BSF         PORTA+0, 7 
L__main105:
	BTFSC       PORTA+0, 7 
	GOTO        L__main106
	BCF         PORTA+0, 4 
	GOTO        L__main107
L__main106:
	BSF         PORTA+0, 4 
L__main107:
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
	GOTO        L__main108
	BCF         PORTA+0, 7 
	GOTO        L__main109
L__main108:
	BSF         PORTA+0, 7 
L__main109:
	BTFSC       PORTA+0, 7 
	GOTO        L__main110
	BCF         PORTA+0, 6 
	GOTO        L__main111
L__main110:
	BSF         PORTA+0, 6 
L__main111:
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
	GOTO        L__main112
	BCF         PORTA+0, 7 
	GOTO        L__main113
L__main112:
	BSF         PORTA+0, 7 
L__main113:
	BTFSC       PORTA+0, 7 
	GOTO        L__main114
	BCF         PORTA+0, 5 
	GOTO        L__main115
L__main114:
	BSF         PORTA+0, 5 
L__main115:
	BTFSC       PORTA+0, 5 
	GOTO        L__main116
	BCF         PORTA+0, 4 
	GOTO        L__main117
L__main116:
	BSF         PORTA+0, 4 
L__main117:
;BlackShadow_code.c,125 :: 		while(1){
L_main4:
;BlackShadow_code.c,127 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_main8
	BTFSS       PORTB+0, 1 
	GOTO        L_main8
L__main86:
;BlackShadow_code.c,128 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,129 :: 		}
	GOTO        L_main9
L_main8:
;BlackShadow_code.c,131 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main85:
;BlackShadow_code.c,132 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,133 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
;BlackShadow_code.c,134 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,135 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
;BlackShadow_code.c,136 :: 		}
	GOTO        L_main15
L_main12:
;BlackShadow_code.c,137 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_main16
;BlackShadow_code.c,138 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,139 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
;BlackShadow_code.c,140 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;BlackShadow_code.c,141 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
	NOP
;BlackShadow_code.c,142 :: 		}
	GOTO        L_main19
L_main16:
;BlackShadow_code.c,143 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_main20
;BlackShadow_code.c,144 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,145 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
;BlackShadow_code.c,146 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,147 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
;BlackShadow_code.c,148 :: 		}
L_main20:
L_main19:
L_main15:
L_main9:
;BlackShadow_code.c,153 :: 		}
	GOTO        L_main4
;BlackShadow_code.c,154 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,158 :: 		void SELEC(){
;BlackShadow_code.c,160 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC119:
	BZ          L__SELEC120
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC119
L__SELEC120:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,162 :: 		switch(seleccion){
	GOTO        L_SELEC23
;BlackShadow_code.c,163 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC25:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC121
	BCF         PORTA+0, 5 
	GOTO        L__SELEC122
L__SELEC121:
	BSF         PORTA+0, 5 
L__SELEC122:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC123
	BCF         PORTA+0, 7 
	GOTO        L__SELEC124
L__SELEC123:
	BSF         PORTA+0, 7 
L__SELEC124:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC125
	BCF         PORTA+0, 6 
	GOTO        L__SELEC126
L__SELEC125:
	BSF         PORTA+0, 6 
L__SELEC126:
;BlackShadow_code.c,166 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,168 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC26:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC127
	BCF         PORTA+0, 5 
	GOTO        L__SELEC128
L__SELEC127:
	BSF         PORTA+0, 5 
L__SELEC128:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC129
	BCF         PORTA+0, 4 
	GOTO        L__SELEC130
L__SELEC129:
	BSF         PORTA+0, 4 
L__SELEC130:
;BlackShadow_code.c,170 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,171 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC27:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC27
	DECFSZ      R12, 1, 1
	BRA         L_SELEC27
	DECFSZ      R11, 1, 1
	BRA         L_SELEC27
	NOP
	NOP
;BlackShadow_code.c,172 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,173 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC28:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC28
	DECFSZ      R12, 1, 1
	BRA         L_SELEC28
	DECFSZ      R11, 1, 1
	BRA         L_SELEC28
;BlackShadow_code.c,177 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,179 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC29:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC131
	BCF         PORTA+0, 5 
	GOTO        L__SELEC132
L__SELEC131:
	BSF         PORTA+0, 5 
L__SELEC132:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC133
	BCF         PORTA+0, 4 
	GOTO        L__SELEC134
L__SELEC133:
	BSF         PORTA+0, 4 
L__SELEC134:
;BlackShadow_code.c,180 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,181 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_SELEC30:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC30
	DECFSZ      R12, 1, 1
	BRA         L_SELEC30
	DECFSZ      R11, 1, 1
	BRA         L_SELEC30
	NOP
	NOP
;BlackShadow_code.c,182 :: 		BRAKE();
	CALL        _BRAKE+0, 0
;BlackShadow_code.c,183 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC31:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC31
	DECFSZ      R12, 1, 1
	BRA         L_SELEC31
	DECFSZ      R11, 1, 1
	BRA         L_SELEC31
;BlackShadow_code.c,185 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,187 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC32:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC135
	BCF         PORTA+0, 6 
	GOTO        L__SELEC136
L__SELEC135:
	BSF         PORTA+0, 6 
L__SELEC136:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC137
	BCF         PORTA+0, 5 
	GOTO        L__SELEC138
L__SELEC137:
	BSF         PORTA+0, 5 
L__SELEC138:
;BlackShadow_code.c,188 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,189 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC33:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC33
	DECFSZ      R12, 1, 1
	BRA         L_SELEC33
	DECFSZ      R11, 1, 1
	BRA         L_SELEC33
	NOP
	NOP
;BlackShadow_code.c,190 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,191 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC34:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC34
	DECFSZ      R12, 1, 1
	BRA         L_SELEC34
	DECFSZ      R11, 1, 1
	BRA         L_SELEC34
;BlackShadow_code.c,193 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,195 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC35:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC139
	BCF         PORTA+0, 7 
	GOTO        L__SELEC140
L__SELEC139:
	BSF         PORTA+0, 7 
L__SELEC140:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC141
	BCF         PORTA+0, 4 
	GOTO        L__SELEC142
L__SELEC141:
	BSF         PORTA+0, 4 
L__SELEC142:
;BlackShadow_code.c,196 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,197 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC36:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC36
	DECFSZ      R12, 1, 1
	BRA         L_SELEC36
	DECFSZ      R11, 1, 1
	BRA         L_SELEC36
	NOP
	NOP
;BlackShadow_code.c,198 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,199 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC37:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC37
	DECFSZ      R12, 1, 1
	BRA         L_SELEC37
	DECFSZ      R11, 1, 1
	BRA         L_SELEC37
;BlackShadow_code.c,200 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,202 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC38:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC143
	BCF         PORTA+0, 5 
	GOTO        L__SELEC144
L__SELEC143:
	BSF         PORTA+0, 5 
L__SELEC144:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC145
	BCF         PORTA+0, 4 
	GOTO        L__SELEC146
L__SELEC145:
	BSF         PORTA+0, 4 
L__SELEC146:
;BlackShadow_code.c,203 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,204 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,206 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC39:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC147
	BCF         PORTA+0, 7 
	GOTO        L__SELEC148
L__SELEC147:
	BSF         PORTA+0, 7 
L__SELEC148:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC149
	BCF         PORTA+0, 4 
	GOTO        L__SELEC150
L__SELEC149:
	BSF         PORTA+0, 4 
L__SELEC150:
;BlackShadow_code.c,207 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,209 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,211 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC40:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC151
	BCF         PORTA+0, 7 
	GOTO        L__SELEC152
L__SELEC151:
	BSF         PORTA+0, 7 
L__SELEC152:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC153
	BCF         PORTA+0, 5 
	GOTO        L__SELEC154
L__SELEC153:
	BSF         PORTA+0, 5 
L__SELEC154:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,213 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,215 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC41:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
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
;BlackShadow_code.c,217 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,219 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC42:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC159
	BCF         PORTA+0, 6 
	GOTO        L__SELEC160
L__SELEC159:
	BSF         PORTA+0, 6 
L__SELEC160:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC161
	BCF         PORTA+0, 7 
	GOTO        L__SELEC162
L__SELEC161:
	BSF         PORTA+0, 7 
L__SELEC162:
;BlackShadow_code.c,222 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,224 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC43:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC163
	BCF         PORTA+0, 4 
	GOTO        L__SELEC164
L__SELEC163:
	BSF         PORTA+0, 4 
L__SELEC164:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC165
	BCF         PORTA+0, 5 
	GOTO        L__SELEC166
L__SELEC165:
	BSF         PORTA+0, 5 
L__SELEC166:
;BlackShadow_code.c,225 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,227 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC44:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC167
	BCF         PORTA+0, 7 
	GOTO        L__SELEC168
L__SELEC167:
	BSF         PORTA+0, 7 
L__SELEC168:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC169
	BCF         PORTA+0, 6 
	GOTO        L__SELEC170
L__SELEC169:
	BSF         PORTA+0, 6 
L__SELEC170:
	BSF         PORTA+0, 5 
;BlackShadow_code.c,228 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,230 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC45:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC171
	BCF         PORTA+0, 4 
	GOTO        L__SELEC172
L__SELEC171:
	BSF         PORTA+0, 4 
L__SELEC172:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC173
	BCF         PORTA+0, 7 
	GOTO        L__SELEC174
L__SELEC173:
	BSF         PORTA+0, 7 
L__SELEC174:
;BlackShadow_code.c,231 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,233 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC46:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC175
	BCF         PORTA+0, 5 
	GOTO        L__SELEC176
L__SELEC175:
	BSF         PORTA+0, 5 
L__SELEC176:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC177
	BCF         PORTA+0, 4 
	GOTO        L__SELEC178
L__SELEC177:
	BSF         PORTA+0, 4 
L__SELEC178:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,234 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,236 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC47:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC179
	BCF         PORTA+0, 5 
	GOTO        L__SELEC180
L__SELEC179:
	BSF         PORTA+0, 5 
L__SELEC180:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC181
	BCF         PORTA+0, 4 
	GOTO        L__SELEC182
L__SELEC181:
	BSF         PORTA+0, 4 
L__SELEC182:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,237 :: 		break;
	GOTO        L_SELEC24
;BlackShadow_code.c,239 :: 		default: L0=L1=L2=L3=0;
L_SELEC48:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC183
	BCF         PORTA+0, 5 
	GOTO        L__SELEC184
L__SELEC183:
	BSF         PORTA+0, 5 
L__SELEC184:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC185
	BCF         PORTA+0, 7 
	GOTO        L__SELEC186
L__SELEC185:
	BSF         PORTA+0, 7 
L__SELEC186:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC187
	BCF         PORTA+0, 6 
	GOTO        L__SELEC188
L__SELEC187:
	BSF         PORTA+0, 6 
L__SELEC188:
;BlackShadow_code.c,240 :: 		}
	GOTO        L_SELEC24
L_SELEC23:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC189
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC189:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC25
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC190
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC190:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC26
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC191
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC191:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC29
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC192
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC192:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC32
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC193
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC193:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC35
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC194
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC194:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC195
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC195:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC196
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC196:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC197
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC197:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC41
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC198
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC198:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC42
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC199
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC199:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC43
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC200
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC200:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC44
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC201
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC201:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC45
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC202
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC202:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC46
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC203
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC203:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC47
	GOTO        L_SELEC48
L_SELEC24:
;BlackShadow_code.c,243 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,245 :: 		void Start(){
;BlackShadow_code.c,246 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,247 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,248 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,249 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,250 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,251 :: 		return;
;BlackShadow_code.c,252 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,253 :: 		void Stop(){
;BlackShadow_code.c,254 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,255 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,256 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,257 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,258 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,259 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,266 :: 		void REC(){
;BlackShadow_code.c,268 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,270 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,271 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,274 :: 		PWM3_Set_Duty(120);    // IN1 = 0
	MOVLW       120
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,275 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,276 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,277 :: 		void DER(){
;BlackShadow_code.c,278 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,279 :: 		PWM1_Set_Duty(200);
	MOVLW       200
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
;BlackShadow_code.c,285 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,286 :: 		void IZQ(){
;BlackShadow_code.c,287 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,288 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,289 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,291 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,292 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,293 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,295 :: 		void REV(){
;BlackShadow_code.c,296 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,297 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,298 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,299 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,300 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,302 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,304 :: 		void LIBRE(){
;BlackShadow_code.c,306 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,307 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,308 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,309 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,310 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,314 :: 		void GIRO180(){
;BlackShadow_code.c,315 :: 		Start();
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
;BlackShadow_code.c,320 :: 		PWM4_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,321 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO18049:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18049
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18049
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18049
	NOP
	NOP
;BlackShadow_code.c,324 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,326 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;BlackShadow_code.c,327 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;BlackShadow_code.c,328 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36050:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36050
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36050
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36050
	NOP
	NOP
;BlackShadow_code.c,329 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,330 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_GIRO36051:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36051
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36051
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36051
	NOP
	NOP
;BlackShadow_code.c,331 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,333 :: 		void BRAKE(){
;BlackShadow_code.c,335 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,336 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,337 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,338 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,339 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,342 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;BlackShadow_code.c,343 :: 		void HARD(){
;BlackShadow_code.c,344 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,345 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,346 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,347 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,349 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_Basura:

;BlackShadow_code.c,351 :: 		void Basura(){
;BlackShadow_code.c,355 :: 		if(SL1==0 && SL2==1)       //SL1=Sensor izquierdo, SL2= Sensor de linea derecho
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura54
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura54
L__Basura94:
;BlackShadow_code.c,356 :: 		DER();                 //Si veo por la izquierda hago una reversa por la derecha.
	CALL        _DER+0, 0
	GOTO        L_Basura55
L_Basura54:
;BlackShadow_code.c,357 :: 		else if(SL1==1 && SL2==0)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura58
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura58
L__Basura93:
;BlackShadow_code.c,358 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura59
L_Basura58:
;BlackShadow_code.c,359 :: 		else if(SL1==0 && SL2==0)
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura62
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura62
L__Basura92:
;BlackShadow_code.c,360 :: 		GIRO180();
	CALL        _GIRO180+0, 0
	GOTO        L_Basura63
L_Basura62:
;BlackShadow_code.c,361 :: 		else if(SL1==1 && SL2==1)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura66
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura66
L__Basura91:
;BlackShadow_code.c,362 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura67
L_Basura66:
;BlackShadow_code.c,369 :: 		else if(S1==1 && S2==0)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura70
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura70
L__Basura90:
;BlackShadow_code.c,370 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura71
L_Basura70:
;BlackShadow_code.c,371 :: 		else if(S1==0 && S2==1)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura74
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura74
L__Basura89:
;BlackShadow_code.c,372 :: 		DER();
	CALL        _DER+0, 0
	GOTO        L_Basura75
L_Basura74:
;BlackShadow_code.c,373 :: 		else if(S1==1 && S2==1)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura78
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura78
L__Basura88:
;BlackShadow_code.c,374 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura79
L_Basura78:
;BlackShadow_code.c,375 :: 		else if(S1==0 && S2==0)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura82
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura82
L__Basura87:
;BlackShadow_code.c,376 :: 		GIRO180();
	CALL        _GIRO180+0, 0
L_Basura82:
L_Basura79:
L_Basura75:
L_Basura71:
L_Basura67:
L_Basura63:
L_Basura59:
L_Basura55:
;BlackShadow_code.c,377 :: 		}
L_end_Basura:
	RETURN      0
; end of _Basura

_INTERRUPT:

;BlackShadow_code.c,379 :: 		void INTERRUPT(){
;BlackShadow_code.c,382 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT83
;BlackShadow_code.c,383 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,384 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,386 :: 		}
L_INTERRUPT83:
;BlackShadow_code.c,388 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT84
;BlackShadow_code.c,389 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,390 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,391 :: 		}
L_INTERRUPT84:
;BlackShadow_code.c,392 :: 		}
L_end_INTERRUPT:
L__INTERRUPT217:
	RETFIE      1
; end of _INTERRUPT
