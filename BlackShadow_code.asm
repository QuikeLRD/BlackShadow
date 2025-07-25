
_main:

;BlackShadow_code.c,59 :: 		void main() {
;BlackShadow_code.c,60 :: 		OSCCON = 0b01100110;
	MOVLW       102
	MOVWF       OSCCON+0 
;BlackShadow_code.c,63 :: 		PORTA = 0;
	CLRF        PORTA+0 
;BlackShadow_code.c,64 :: 		PORTB = 0;
	CLRF        PORTB+0 
;BlackShadow_code.c,65 :: 		PORTC = 0;
	CLRF        PORTC+0 
;BlackShadow_code.c,68 :: 		TRISA= 0b00001111;   //El bit 1 del PortaA0 es el ultimo.     //0X0F
	MOVLW       15
	MOVWF       TRISA+0 
;BlackShadow_code.c,69 :: 		TRISB= 0b11011110;    //El bit que tenemos hasta la izquierda es el numero 7.DAT Y CLK se dejan como entrada aunque pueden ser salida, el micro los ocupa para programar
	MOVLW       222
	MOVWF       TRISB+0 
;BlackShadow_code.c,70 :: 		TRISC= 0b11111001;
	MOVLW       249
	MOVWF       TRISC+0 
;BlackShadow_code.c,72 :: 		ANSELA= 0b00000000;
	CLRF        ANSELA+0 
;BlackShadow_code.c,73 :: 		ANSELB= 0b00000000;
	CLRF        ANSELB+0 
;BlackShadow_code.c,74 :: 		ANSELC= 0b00000000;
	CLRF        ANSELC+0 
;BlackShadow_code.c,78 :: 		INTCON3.INT1IE =1;                               //habilitamos interrupción INT1 (RB1)
	BSF         INTCON3+0, 3 
;BlackShadow_code.c,79 :: 		INTCON3.INT2IE =1;                                //habilitamos interrupción INT2 (RB2)
	BSF         INTCON3+0, 4 
;BlackShadow_code.c,81 :: 		INTCON2.INTEDG1 =0;                               //INT1: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 5 
;BlackShadow_code.c,82 :: 		INTCON2.INTEDG2 =0;                                //INT2: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 4 
;BlackShadow_code.c,84 :: 		INTCON.GIE =1;                                    //Interrupciones globales
	BSF         INTCON+0, 7 
;BlackShadow_code.c,85 :: 		INTCON.PEIE =1;                                   //Interrupciones perifericas
	BSF         INTCON+0, 6 
;BlackShadow_code.c,94 :: 		PWM1_Init(20000);   //Se debe poner a 20 000 para el motor y 1000 para simular
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;BlackShadow_code.c,95 :: 		PWM2_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;BlackShadow_code.c,96 :: 		PWM3_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;BlackShadow_code.c,97 :: 		PWM4_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;BlackShadow_code.c,100 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,101 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,102 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,103 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,105 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,106 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,107 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,108 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,114 :: 		while (DAT == 0){
L_main0:
	BTFSC       PORTB+0, 7 
	GOTO        L_main1
;BlackShadow_code.c,115 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main112
	BCF         PORTA+0, 5 
	GOTO        L__main113
L__main112:
	BSF         PORTA+0, 5 
L__main113:
	BTFSC       PORTA+0, 5 
	GOTO        L__main114
	BCF         PORTA+0, 4 
	GOTO        L__main115
L__main114:
	BSF         PORTA+0, 4 
L__main115:
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
;BlackShadow_code.c,117 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main116
	BCF         PORTA+0, 5 
	GOTO        L__main117
L__main116:
	BSF         PORTA+0, 5 
L__main117:
	BTFSC       PORTA+0, 5 
	GOTO        L__main118
	BCF         PORTA+0, 4 
	GOTO        L__main119
L__main118:
	BSF         PORTA+0, 4 
L__main119:
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
;BlackShadow_code.c,119 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main120
	BCF         PORTA+0, 7 
	GOTO        L__main121
L__main120:
	BSF         PORTA+0, 7 
L__main121:
	BTFSC       PORTA+0, 7 
	GOTO        L__main122
	BCF         PORTA+0, 4 
	GOTO        L__main123
L__main122:
	BSF         PORTA+0, 4 
L__main123:
;BlackShadow_code.c,120 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;BlackShadow_code.c,121 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main124
	BCF         PORTA+0, 7 
	GOTO        L__main125
L__main124:
	BSF         PORTA+0, 7 
L__main125:
	BTFSC       PORTA+0, 7 
	GOTO        L__main126
	BCF         PORTA+0, 6 
	GOTO        L__main127
L__main126:
	BSF         PORTA+0, 6 
L__main127:
;BlackShadow_code.c,122 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;BlackShadow_code.c,123 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main128
	BCF         PORTA+0, 7 
	GOTO        L__main129
L__main128:
	BSF         PORTA+0, 7 
L__main129:
	BTFSC       PORTA+0, 7 
	GOTO        L__main130
	BCF         PORTA+0, 5 
	GOTO        L__main131
L__main130:
	BSF         PORTA+0, 5 
L__main131:
	BTFSC       PORTA+0, 5 
	GOTO        L__main132
	BCF         PORTA+0, 4 
	GOTO        L__main133
L__main132:
	BSF         PORTA+0, 4 
L__main133:
;BlackShadow_code.c,124 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;BlackShadow_code.c,125 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,126 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;BlackShadow_code.c,127 :: 		}
	GOTO        L_main0
L_main1:
;BlackShadow_code.c,128 :: 		while(1){
L_main8:
;BlackShadow_code.c,129 :: 		if (DAT==0){
	BTFSC       PORTB+0, 7 
	GOTO        L_main10
;BlackShadow_code.c,130 :: 		LIBRE();                                     //Deten motores
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,132 :: 		while (DAT == 0){
L_main11:
	BTFSC       PORTB+0, 7 
	GOTO        L_main12
;BlackShadow_code.c,133 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main134
	BCF         PORTA+0, 5 
	GOTO        L__main135
L__main134:
	BSF         PORTA+0, 5 
L__main135:
	BTFSC       PORTA+0, 5 
	GOTO        L__main136
	BCF         PORTA+0, 4 
	GOTO        L__main137
L__main136:
	BSF         PORTA+0, 4 
L__main137:
;BlackShadow_code.c,134 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
	NOP
;BlackShadow_code.c,135 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main138
	BCF         PORTA+0, 5 
	GOTO        L__main139
L__main138:
	BSF         PORTA+0, 5 
L__main139:
	BTFSC       PORTA+0, 5 
	GOTO        L__main140
	BCF         PORTA+0, 4 
	GOTO        L__main141
L__main140:
	BSF         PORTA+0, 4 
L__main141:
;BlackShadow_code.c,136 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
	NOP
;BlackShadow_code.c,137 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main142
	BCF         PORTA+0, 7 
	GOTO        L__main143
L__main142:
	BSF         PORTA+0, 7 
L__main143:
	BTFSC       PORTA+0, 7 
	GOTO        L__main144
	BCF         PORTA+0, 4 
	GOTO        L__main145
L__main144:
	BSF         PORTA+0, 4 
L__main145:
;BlackShadow_code.c,138 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
	NOP
;BlackShadow_code.c,139 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main146
	BCF         PORTA+0, 7 
	GOTO        L__main147
L__main146:
	BSF         PORTA+0, 7 
L__main147:
	BTFSC       PORTA+0, 7 
	GOTO        L__main148
	BCF         PORTA+0, 6 
	GOTO        L__main149
L__main148:
	BSF         PORTA+0, 6 
L__main149:
;BlackShadow_code.c,140 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	DECFSZ      R11, 1, 1
	BRA         L_main16
	NOP
	NOP
;BlackShadow_code.c,141 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main150
	BCF         PORTA+0, 7 
	GOTO        L__main151
L__main150:
	BSF         PORTA+0, 7 
L__main151:
	BTFSC       PORTA+0, 7 
	GOTO        L__main152
	BCF         PORTA+0, 5 
	GOTO        L__main153
L__main152:
	BSF         PORTA+0, 5 
L__main153:
	BTFSC       PORTA+0, 5 
	GOTO        L__main154
	BCF         PORTA+0, 4 
	GOTO        L__main155
L__main154:
	BSF         PORTA+0, 4 
L__main155:
;BlackShadow_code.c,142 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
	NOP
;BlackShadow_code.c,143 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,144 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
	NOP
	NOP
;BlackShadow_code.c,145 :: 		}
	GOTO        L_main11
L_main12:
;BlackShadow_code.c,146 :: 		}
L_main10:
;BlackShadow_code.c,147 :: 		SELEC();
	CALL        _SELEC+0, 0
;BlackShadow_code.c,151 :: 		}
	GOTO        L_main8
;BlackShadow_code.c,152 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,156 :: 		void SELEC(){
;BlackShadow_code.c,158 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC157:
	BZ          L__SELEC158
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC157
L__SELEC158:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,160 :: 		switch(seleccion){
	GOTO        L_SELEC19
;BlackShadow_code.c,161 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC21:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC159
	BCF         PORTA+0, 5 
	GOTO        L__SELEC160
L__SELEC159:
	BSF         PORTA+0, 5 
L__SELEC160:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC161
	BCF         PORTA+0, 7 
	GOTO        L__SELEC162
L__SELEC161:
	BSF         PORTA+0, 7 
L__SELEC162:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC163
	BCF         PORTA+0, 6 
	GOTO        L__SELEC164
L__SELEC163:
	BSF         PORTA+0, 6 
L__SELEC164:
;BlackShadow_code.c,164 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,166 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC22:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC165
	BCF         PORTA+0, 5 
	GOTO        L__SELEC166
L__SELEC165:
	BSF         PORTA+0, 5 
L__SELEC166:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC167
	BCF         PORTA+0, 4 
	GOTO        L__SELEC168
L__SELEC167:
	BSF         PORTA+0, 4 
L__SELEC168:
;BlackShadow_code.c,168 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC25
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC25
L__SELEC110:
;BlackShadow_code.c,169 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,170 :: 		}
	GOTO        L_SELEC26
L_SELEC25:
;BlackShadow_code.c,172 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC29
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC29
L__SELEC109:
;BlackShadow_code.c,173 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,174 :: 		delay_ms(100);
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
;BlackShadow_code.c,175 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,176 :: 		delay_ms(100);
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
;BlackShadow_code.c,177 :: 		}
	GOTO        L_SELEC32
L_SELEC29:
;BlackShadow_code.c,178 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC33
;BlackShadow_code.c,179 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,180 :: 		delay_ms(100);
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
;BlackShadow_code.c,181 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;BlackShadow_code.c,182 :: 		delay_ms(100);
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
;BlackShadow_code.c,183 :: 		}
	GOTO        L_SELEC36
L_SELEC33:
;BlackShadow_code.c,184 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC37
;BlackShadow_code.c,185 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,186 :: 		delay_ms(100);
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
;BlackShadow_code.c,187 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,188 :: 		delay_ms(100);
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
;BlackShadow_code.c,189 :: 		}
L_SELEC37:
L_SELEC36:
L_SELEC32:
L_SELEC26:
;BlackShadow_code.c,191 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,193 :: 		case 2: L1=0; L3=L2=L0=1; delay_ms(250);
L_SELEC40:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC169
	BCF         PORTA+0, 5 
	GOTO        L__SELEC170
L__SELEC169:
	BSF         PORTA+0, 5 
L__SELEC170:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC171
	BCF         PORTA+0, 4 
	GOTO        L__SELEC172
L__SELEC171:
	BSF         PORTA+0, 4 
L__SELEC172:
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC41:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC41
	DECFSZ      R12, 1, 1
	BRA         L_SELEC41
	DECFSZ      R11, 1, 1
	BRA         L_SELEC41
	NOP
	NOP
;BlackShadow_code.c,197 :: 		if      (SL1 ==0 && S6 ==0 && S2 ==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC44
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC44
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC44
L__SELEC108:
;BlackShadow_code.c,199 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC173
	BCF         PORTA+0, 5 
	GOTO        L__SELEC174
L__SELEC173:
	BSF         PORTA+0, 5 
L__SELEC174:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC175
	BCF         PORTA+0, 7 
	GOTO        L__SELEC176
L__SELEC175:
	BSF         PORTA+0, 7 
L__SELEC176:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC177
	BCF         PORTA+0, 6 
	GOTO        L__SELEC178
L__SELEC177:
	BSF         PORTA+0, 6 
L__SELEC178:
;BlackShadow_code.c,200 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,201 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_SELEC45:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC45
	DECFSZ      R12, 1, 1
	BRA         L_SELEC45
	NOP
	NOP
;BlackShadow_code.c,202 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,203 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC46:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC46
	DECFSZ      R12, 1, 1
	BRA         L_SELEC46
	DECFSZ      R11, 1, 1
	BRA         L_SELEC46
	NOP
;BlackShadow_code.c,204 :: 		}
	GOTO        L_SELEC47
L_SELEC44:
;BlackShadow_code.c,205 :: 		else if (SL1 ==1 && S6 ==0 && S2 ==0){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC50
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC50
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC50
L__SELEC107:
;BlackShadow_code.c,206 :: 		L0=0;   L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC179
	BCF         PORTA+0, 5 
	GOTO        L__SELEC180
L__SELEC179:
	BSF         PORTA+0, 5 
L__SELEC180:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC181
	BCF         PORTA+0, 7 
	GOTO        L__SELEC182
L__SELEC181:
	BSF         PORTA+0, 7 
L__SELEC182:
;BlackShadow_code.c,207 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,208 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC51:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC51
	DECFSZ      R12, 1, 1
	BRA         L_SELEC51
	DECFSZ      R11, 1, 1
	BRA         L_SELEC51
	NOP
;BlackShadow_code.c,209 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,211 :: 		}
	GOTO        L_SELEC52
L_SELEC50:
;BlackShadow_code.c,212 :: 		else if (SL1 ==0 && S6 ==1 && S2 ==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC55
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC55
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC55
L__SELEC106:
;BlackShadow_code.c,213 :: 		L1=0;   L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC183
	BCF         PORTA+0, 5 
	GOTO        L__SELEC184
L__SELEC183:
	BSF         PORTA+0, 5 
L__SELEC184:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC185
	BCF         PORTA+0, 6 
	GOTO        L__SELEC186
L__SELEC185:
	BSF         PORTA+0, 6 
L__SELEC186:
;BlackShadow_code.c,214 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,215 :: 		}
	GOTO        L_SELEC56
L_SELEC55:
;BlackShadow_code.c,216 :: 		else if (SL1 ==1 && S6==1 && S2 ==0){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC59
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC59
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC59
L__SELEC105:
;BlackShadow_code.c,217 :: 		L0=L1=0;     L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC187
	BCF         PORTA+0, 6 
	GOTO        L__SELEC188
L__SELEC187:
	BSF         PORTA+0, 6 
L__SELEC188:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC189
	BCF         PORTA+0, 5 
	GOTO        L__SELEC190
L__SELEC189:
	BSF         PORTA+0, 5 
L__SELEC190:
;BlackShadow_code.c,218 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,219 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_SELEC60:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC60
	DECFSZ      R12, 1, 1
	BRA         L_SELEC60
	NOP
	NOP
;BlackShadow_code.c,220 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,222 :: 		}
	GOTO        L_SELEC61
L_SELEC59:
;BlackShadow_code.c,223 :: 		else if (SL1 ==0 && S6==0 && S2 ==1){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC64
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC64
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC64
L__SELEC104:
;BlackShadow_code.c,224 :: 		L2=0;   L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC191
	BCF         PORTA+0, 7 
	GOTO        L__SELEC192
L__SELEC191:
	BSF         PORTA+0, 7 
L__SELEC192:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC193
	BCF         PORTA+0, 6 
	GOTO        L__SELEC194
L__SELEC193:
	BSF         PORTA+0, 6 
L__SELEC194:
;BlackShadow_code.c,225 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,226 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC65:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC65
	DECFSZ      R12, 1, 1
	BRA         L_SELEC65
	DECFSZ      R11, 1, 1
	BRA         L_SELEC65
	NOP
;BlackShadow_code.c,227 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,229 :: 		}
	GOTO        L_SELEC66
L_SELEC64:
;BlackShadow_code.c,230 :: 		else if (SL1 ==1 && S6==0 && S2 ==1){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC69
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC69
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC69
L__SELEC103:
;BlackShadow_code.c,231 :: 		L0=L2=0;     L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC195
	BCF         PORTA+0, 6 
	GOTO        L__SELEC196
L__SELEC195:
	BSF         PORTA+0, 6 
L__SELEC196:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC197
	BCF         PORTA+0, 7 
	GOTO        L__SELEC198
L__SELEC197:
	BSF         PORTA+0, 7 
L__SELEC198:
;BlackShadow_code.c,233 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,234 :: 		}
	GOTO        L_SELEC70
L_SELEC69:
;BlackShadow_code.c,235 :: 		else if (SL1 ==0 && S6==1 && S2 ==1){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC73
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC73
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC73
L__SELEC102:
;BlackShadow_code.c,236 :: 		L1=L2=0;     L0=L3=0;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC199
	BCF         PORTA+0, 7 
	GOTO        L__SELEC200
L__SELEC199:
	BSF         PORTA+0, 7 
L__SELEC200:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC201
	BCF         PORTA+0, 6 
	GOTO        L__SELEC202
L__SELEC201:
	BSF         PORTA+0, 6 
L__SELEC202:
;BlackShadow_code.c,237 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,238 :: 		delay_ms(30);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_SELEC74:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC74
	DECFSZ      R12, 1, 1
	BRA         L_SELEC74
;BlackShadow_code.c,239 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,240 :: 		}
	GOTO        L_SELEC75
L_SELEC73:
;BlackShadow_code.c,241 :: 		else if (SL1 ==1 && S6==1 && S2 ==1){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC78
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC78
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC78
L__SELEC101:
;BlackShadow_code.c,242 :: 		L0=L1=L2=0;  L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC203
	BCF         PORTA+0, 7 
	GOTO        L__SELEC204
L__SELEC203:
	BSF         PORTA+0, 7 
L__SELEC204:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC205
	BCF         PORTA+0, 6 
	GOTO        L__SELEC206
L__SELEC205:
	BSF         PORTA+0, 6 
L__SELEC206:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,243 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,244 :: 		}
	GOTO        L_SELEC79
L_SELEC78:
;BlackShadow_code.c,246 :: 		L0=L1=L2=L3=0;
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC207
	BCF         PORTA+0, 5 
	GOTO        L__SELEC208
L__SELEC207:
	BSF         PORTA+0, 5 
L__SELEC208:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC209
	BCF         PORTA+0, 7 
	GOTO        L__SELEC210
L__SELEC209:
	BSF         PORTA+0, 7 
L__SELEC210:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC211
	BCF         PORTA+0, 6 
	GOTO        L__SELEC212
L__SELEC211:
	BSF         PORTA+0, 6 
L__SELEC212:
;BlackShadow_code.c,247 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,248 :: 		}
L_SELEC79:
L_SELEC75:
L_SELEC70:
L_SELEC66:
L_SELEC61:
L_SELEC56:
L_SELEC52:
L_SELEC47:
;BlackShadow_code.c,252 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,254 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC80:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC213
	BCF         PORTA+0, 6 
	GOTO        L__SELEC214
L__SELEC213:
	BSF         PORTA+0, 6 
L__SELEC214:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC215
	BCF         PORTA+0, 5 
	GOTO        L__SELEC216
L__SELEC215:
	BSF         PORTA+0, 5 
L__SELEC216:
;BlackShadow_code.c,255 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,259 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,261 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC81:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC217
	BCF         PORTA+0, 7 
	GOTO        L__SELEC218
L__SELEC217:
	BSF         PORTA+0, 7 
L__SELEC218:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC219
	BCF         PORTA+0, 4 
	GOTO        L__SELEC220
L__SELEC219:
	BSF         PORTA+0, 4 
L__SELEC220:
;BlackShadow_code.c,262 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,263 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC82:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC82
	DECFSZ      R12, 1, 1
	BRA         L_SELEC82
	DECFSZ      R11, 1, 1
	BRA         L_SELEC82
	NOP
	NOP
;BlackShadow_code.c,264 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,265 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC83:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC83
	DECFSZ      R12, 1, 1
	BRA         L_SELEC83
	DECFSZ      R11, 1, 1
	BRA         L_SELEC83
;BlackShadow_code.c,266 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,268 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC84:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC221
	BCF         PORTA+0, 5 
	GOTO        L__SELEC222
L__SELEC221:
	BSF         PORTA+0, 5 
L__SELEC222:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC223
	BCF         PORTA+0, 4 
	GOTO        L__SELEC224
L__SELEC223:
	BSF         PORTA+0, 4 
L__SELEC224:
;BlackShadow_code.c,269 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,270 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,272 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC85:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC225
	BCF         PORTA+0, 7 
	GOTO        L__SELEC226
L__SELEC225:
	BSF         PORTA+0, 7 
L__SELEC226:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC227
	BCF         PORTA+0, 4 
	GOTO        L__SELEC228
L__SELEC227:
	BSF         PORTA+0, 4 
L__SELEC228:
;BlackShadow_code.c,273 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,275 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,277 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC86:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC229
	BCF         PORTA+0, 7 
	GOTO        L__SELEC230
L__SELEC229:
	BSF         PORTA+0, 7 
L__SELEC230:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC231
	BCF         PORTA+0, 5 
	GOTO        L__SELEC232
L__SELEC231:
	BSF         PORTA+0, 5 
L__SELEC232:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,279 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,281 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC87:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC233
	BCF         PORTA+0, 5 
	GOTO        L__SELEC234
L__SELEC233:
	BSF         PORTA+0, 5 
L__SELEC234:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC235
	BCF         PORTA+0, 7 
	GOTO        L__SELEC236
L__SELEC235:
	BSF         PORTA+0, 7 
L__SELEC236:
;BlackShadow_code.c,283 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,285 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC88:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC237
	BCF         PORTA+0, 6 
	GOTO        L__SELEC238
L__SELEC237:
	BSF         PORTA+0, 6 
L__SELEC238:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC239
	BCF         PORTA+0, 7 
	GOTO        L__SELEC240
L__SELEC239:
	BSF         PORTA+0, 7 
L__SELEC240:
;BlackShadow_code.c,288 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,290 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC89:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC241
	BCF         PORTA+0, 4 
	GOTO        L__SELEC242
L__SELEC241:
	BSF         PORTA+0, 4 
L__SELEC242:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC243
	BCF         PORTA+0, 5 
	GOTO        L__SELEC244
L__SELEC243:
	BSF         PORTA+0, 5 
L__SELEC244:
;BlackShadow_code.c,291 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,293 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC90:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC245
	BCF         PORTA+0, 7 
	GOTO        L__SELEC246
L__SELEC245:
	BSF         PORTA+0, 7 
L__SELEC246:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC247
	BCF         PORTA+0, 6 
	GOTO        L__SELEC248
L__SELEC247:
	BSF         PORTA+0, 6 
L__SELEC248:
	BSF         PORTA+0, 5 
;BlackShadow_code.c,294 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,296 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC91:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC249
	BCF         PORTA+0, 4 
	GOTO        L__SELEC250
L__SELEC249:
	BSF         PORTA+0, 4 
L__SELEC250:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC251
	BCF         PORTA+0, 7 
	GOTO        L__SELEC252
L__SELEC251:
	BSF         PORTA+0, 7 
L__SELEC252:
;BlackShadow_code.c,297 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,299 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC92:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC253
	BCF         PORTA+0, 5 
	GOTO        L__SELEC254
L__SELEC253:
	BSF         PORTA+0, 5 
L__SELEC254:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC255
	BCF         PORTA+0, 4 
	GOTO        L__SELEC256
L__SELEC255:
	BSF         PORTA+0, 4 
L__SELEC256:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,300 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,302 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC93:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC257
	BCF         PORTA+0, 5 
	GOTO        L__SELEC258
L__SELEC257:
	BSF         PORTA+0, 5 
L__SELEC258:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC259
	BCF         PORTA+0, 4 
	GOTO        L__SELEC260
L__SELEC259:
	BSF         PORTA+0, 4 
L__SELEC260:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,303 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,305 :: 		default: L0=L1=L2=L3=0;
L_SELEC94:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC261
	BCF         PORTA+0, 5 
	GOTO        L__SELEC262
L__SELEC261:
	BSF         PORTA+0, 5 
L__SELEC262:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC263
	BCF         PORTA+0, 7 
	GOTO        L__SELEC264
L__SELEC263:
	BSF         PORTA+0, 7 
L__SELEC264:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC265
	BCF         PORTA+0, 6 
	GOTO        L__SELEC266
L__SELEC265:
	BSF         PORTA+0, 6 
L__SELEC266:
;BlackShadow_code.c,306 :: 		}
	GOTO        L_SELEC20
L_SELEC19:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC267
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC267:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC21
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC268
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC268:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC22
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC269
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC269:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC270
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC270:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC80
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC271
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC271:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC81
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC272
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC272:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC84
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC273
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC273:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC85
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC274
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC274:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC86
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC275
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC275:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC87
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC276
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC276:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC88
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC277
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC277:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC89
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC278
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC278:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC90
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC279
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC279:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC91
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC280
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC280:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC92
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC281
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC281:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC93
	GOTO        L_SELEC94
L_SELEC20:
;BlackShadow_code.c,309 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,311 :: 		void Start(){
;BlackShadow_code.c,312 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,313 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,314 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,315 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,316 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,317 :: 		return;
;BlackShadow_code.c,318 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,319 :: 		void Stop(){
;BlackShadow_code.c,320 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,321 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,322 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,323 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,324 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,325 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,332 :: 		void REC(){
;BlackShadow_code.c,334 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,336 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,337 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,340 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,341 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,342 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,343 :: 		void DER(){
;BlackShadow_code.c,344 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,345 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,346 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,348 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,349 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,351 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,352 :: 		void IZQ(){
;BlackShadow_code.c,353 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,354 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,355 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,357 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,358 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,359 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,361 :: 		void REV(){
;BlackShadow_code.c,362 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,363 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,364 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,365 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,366 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,368 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,370 :: 		void LIBRE(){
;BlackShadow_code.c,372 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,373 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,374 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,375 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,376 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,380 :: 		void GIRO180(){
;BlackShadow_code.c,381 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,383 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,384 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,386 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,387 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,388 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18095:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18095
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18095
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18095
;BlackShadow_code.c,389 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,392 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,394 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;BlackShadow_code.c,395 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;BlackShadow_code.c,396 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36096:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36096
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36096
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36096
	NOP
	NOP
;BlackShadow_code.c,397 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,399 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,401 :: 		void BRAKE(){
;BlackShadow_code.c,403 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,404 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,405 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,406 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,407 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,410 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;BlackShadow_code.c,411 :: 		void HARD(){
;BlackShadow_code.c,412 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,413 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,414 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,415 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,417 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;BlackShadow_code.c,418 :: 		void PUSH(){
;BlackShadow_code.c,419 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,421 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,422 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,425 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,426 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,428 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;BlackShadow_code.c,429 :: 		void HIT(){
;BlackShadow_code.c,431 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,432 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT97:
	DECFSZ      R13, 1, 1
	BRA         L_HIT97
	DECFSZ      R12, 1, 1
	BRA         L_HIT97
	NOP
	NOP
;BlackShadow_code.c,433 :: 		PUSH();
	CALL        _PUSH+0, 0
;BlackShadow_code.c,434 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT98:
	DECFSZ      R13, 1, 1
	BRA         L_HIT98
	DECFSZ      R12, 1, 1
	BRA         L_HIT98
	DECFSZ      R11, 1, 1
	BRA         L_HIT98
	NOP
	NOP
;BlackShadow_code.c,435 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_INTERRUPT:

;BlackShadow_code.c,437 :: 		void INTERRUPT(){
;BlackShadow_code.c,440 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT99
;BlackShadow_code.c,441 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,442 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,444 :: 		}
L_INTERRUPT99:
;BlackShadow_code.c,446 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT100
;BlackShadow_code.c,447 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,448 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,449 :: 		}
L_INTERRUPT100:
;BlackShadow_code.c,450 :: 		}
L_end_INTERRUPT:
L__INTERRUPT296:
	RETFIE      1
; end of _INTERRUPT
