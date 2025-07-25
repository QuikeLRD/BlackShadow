
_main:

;BlackShadow_code.c,60 :: 		void main() {
;BlackShadow_code.c,61 :: 		OSCCON = 0b01100110;
	MOVLW       102
	MOVWF       OSCCON+0 
;BlackShadow_code.c,64 :: 		PORTA = 0;
	CLRF        PORTA+0 
;BlackShadow_code.c,65 :: 		PORTB = 0;
	CLRF        PORTB+0 
;BlackShadow_code.c,66 :: 		PORTC = 0;
	CLRF        PORTC+0 
;BlackShadow_code.c,69 :: 		TRISA= 0b00001111;   //El bit 1 del PortaA0 es el ultimo.     //0X0F
	MOVLW       15
	MOVWF       TRISA+0 
;BlackShadow_code.c,70 :: 		TRISB= 0b11011110;    //El bit que tenemos hasta la izquierda es el numero 7.DAT Y CLK se dejan como entrada aunque pueden ser salida, el micro los ocupa para programar
	MOVLW       222
	MOVWF       TRISB+0 
;BlackShadow_code.c,71 :: 		TRISC= 0b11111001;
	MOVLW       249
	MOVWF       TRISC+0 
;BlackShadow_code.c,73 :: 		ANSELA= 0b00000000;
	CLRF        ANSELA+0 
;BlackShadow_code.c,74 :: 		ANSELB= 0b00000000;
	CLRF        ANSELB+0 
;BlackShadow_code.c,75 :: 		ANSELC= 0b00000000;
	CLRF        ANSELC+0 
;BlackShadow_code.c,79 :: 		INTCON3.INT1IE =1;                               //habilitamos interrupción INT1 (RB1)
	BSF         INTCON3+0, 3 
;BlackShadow_code.c,80 :: 		INTCON3.INT2IE =1;                                //habilitamos interrupción INT2 (RB2)
	BSF         INTCON3+0, 4 
;BlackShadow_code.c,82 :: 		INTCON2.INTEDG1 =0;                               //INT1: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 5 
;BlackShadow_code.c,83 :: 		INTCON2.INTEDG2 =0;                                //INT2: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 4 
;BlackShadow_code.c,85 :: 		INTCON.GIE =1;                                    //Interrupciones globales
	BSF         INTCON+0, 7 
;BlackShadow_code.c,86 :: 		INTCON.PEIE =1;                                   //Interrupciones perifericas
	BSF         INTCON+0, 6 
;BlackShadow_code.c,95 :: 		PWM1_Init(20000);   //Se debe poner a 20 000 para el motor y 1000 para simular
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;BlackShadow_code.c,96 :: 		PWM2_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;BlackShadow_code.c,97 :: 		PWM3_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;BlackShadow_code.c,98 :: 		PWM4_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;BlackShadow_code.c,101 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,102 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,103 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,104 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,106 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,107 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,108 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,109 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,115 :: 		while (DAT == 0){
L_main0:
	BTFSC       PORTB+0, 7 
	GOTO        L_main1
;BlackShadow_code.c,116 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
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
;BlackShadow_code.c,117 :: 		delay_ms(300);
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
;BlackShadow_code.c,118 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main118
	BCF         PORTA+0, 5 
	GOTO        L__main119
L__main118:
	BSF         PORTA+0, 5 
L__main119:
	BTFSC       PORTA+0, 5 
	GOTO        L__main120
	BCF         PORTA+0, 4 
	GOTO        L__main121
L__main120:
	BSF         PORTA+0, 4 
L__main121:
;BlackShadow_code.c,119 :: 		delay_ms(300);
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
;BlackShadow_code.c,120 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main122
	BCF         PORTA+0, 7 
	GOTO        L__main123
L__main122:
	BSF         PORTA+0, 7 
L__main123:
	BTFSC       PORTA+0, 7 
	GOTO        L__main124
	BCF         PORTA+0, 4 
	GOTO        L__main125
L__main124:
	BSF         PORTA+0, 4 
L__main125:
;BlackShadow_code.c,121 :: 		delay_ms(300);
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
;BlackShadow_code.c,122 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main126
	BCF         PORTA+0, 7 
	GOTO        L__main127
L__main126:
	BSF         PORTA+0, 7 
L__main127:
	BTFSC       PORTA+0, 7 
	GOTO        L__main128
	BCF         PORTA+0, 6 
	GOTO        L__main129
L__main128:
	BSF         PORTA+0, 6 
L__main129:
;BlackShadow_code.c,123 :: 		delay_ms(300);
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
;BlackShadow_code.c,124 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main130
	BCF         PORTA+0, 7 
	GOTO        L__main131
L__main130:
	BSF         PORTA+0, 7 
L__main131:
	BTFSC       PORTA+0, 7 
	GOTO        L__main132
	BCF         PORTA+0, 5 
	GOTO        L__main133
L__main132:
	BSF         PORTA+0, 5 
L__main133:
	BTFSC       PORTA+0, 5 
	GOTO        L__main134
	BCF         PORTA+0, 4 
	GOTO        L__main135
L__main134:
	BSF         PORTA+0, 4 
L__main135:
;BlackShadow_code.c,125 :: 		delay_ms(1000);
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
;BlackShadow_code.c,126 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,127 :: 		delay_ms(250);
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
;BlackShadow_code.c,128 :: 		}
	GOTO        L_main0
L_main1:
;BlackShadow_code.c,129 :: 		while(1){
L_main8:
;BlackShadow_code.c,130 :: 		if (DAT==0){
	BTFSC       PORTB+0, 7 
	GOTO        L_main10
;BlackShadow_code.c,131 :: 		LIBRE();                                     //Deten motores
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,133 :: 		while (DAT == 0){
L_main11:
	BTFSC       PORTB+0, 7 
	GOTO        L_main12
;BlackShadow_code.c,134 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main136
	BCF         PORTA+0, 5 
	GOTO        L__main137
L__main136:
	BSF         PORTA+0, 5 
L__main137:
	BTFSC       PORTA+0, 5 
	GOTO        L__main138
	BCF         PORTA+0, 4 
	GOTO        L__main139
L__main138:
	BSF         PORTA+0, 4 
L__main139:
;BlackShadow_code.c,135 :: 		delay_ms(300);
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
;BlackShadow_code.c,136 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main140
	BCF         PORTA+0, 5 
	GOTO        L__main141
L__main140:
	BSF         PORTA+0, 5 
L__main141:
	BTFSC       PORTA+0, 5 
	GOTO        L__main142
	BCF         PORTA+0, 4 
	GOTO        L__main143
L__main142:
	BSF         PORTA+0, 4 
L__main143:
;BlackShadow_code.c,137 :: 		delay_ms(300);
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
;BlackShadow_code.c,138 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main144
	BCF         PORTA+0, 7 
	GOTO        L__main145
L__main144:
	BSF         PORTA+0, 7 
L__main145:
	BTFSC       PORTA+0, 7 
	GOTO        L__main146
	BCF         PORTA+0, 4 
	GOTO        L__main147
L__main146:
	BSF         PORTA+0, 4 
L__main147:
;BlackShadow_code.c,139 :: 		delay_ms(300);
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
;BlackShadow_code.c,140 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main148
	BCF         PORTA+0, 7 
	GOTO        L__main149
L__main148:
	BSF         PORTA+0, 7 
L__main149:
	BTFSC       PORTA+0, 7 
	GOTO        L__main150
	BCF         PORTA+0, 6 
	GOTO        L__main151
L__main150:
	BSF         PORTA+0, 6 
L__main151:
;BlackShadow_code.c,141 :: 		delay_ms(300);
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
;BlackShadow_code.c,142 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main152
	BCF         PORTA+0, 7 
	GOTO        L__main153
L__main152:
	BSF         PORTA+0, 7 
L__main153:
	BTFSC       PORTA+0, 7 
	GOTO        L__main154
	BCF         PORTA+0, 5 
	GOTO        L__main155
L__main154:
	BSF         PORTA+0, 5 
L__main155:
	BTFSC       PORTA+0, 5 
	GOTO        L__main156
	BCF         PORTA+0, 4 
	GOTO        L__main157
L__main156:
	BSF         PORTA+0, 4 
L__main157:
;BlackShadow_code.c,143 :: 		delay_ms(1000);
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
;BlackShadow_code.c,144 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,145 :: 		delay_ms(250);
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
;BlackShadow_code.c,146 :: 		}
	GOTO        L_main11
L_main12:
;BlackShadow_code.c,147 :: 		}
L_main10:
;BlackShadow_code.c,148 :: 		SELEC();
	CALL        _SELEC+0, 0
;BlackShadow_code.c,152 :: 		}
	GOTO        L_main8
;BlackShadow_code.c,153 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,157 :: 		void SELEC(){
;BlackShadow_code.c,159 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC159:
	BZ          L__SELEC160
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC159
L__SELEC160:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,161 :: 		switch(seleccion){
	GOTO        L_SELEC19
;BlackShadow_code.c,162 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC21:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC161
	BCF         PORTA+0, 5 
	GOTO        L__SELEC162
L__SELEC161:
	BSF         PORTA+0, 5 
L__SELEC162:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC163
	BCF         PORTA+0, 7 
	GOTO        L__SELEC164
L__SELEC163:
	BSF         PORTA+0, 7 
L__SELEC164:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC165
	BCF         PORTA+0, 6 
	GOTO        L__SELEC166
L__SELEC165:
	BSF         PORTA+0, 6 
L__SELEC166:
;BlackShadow_code.c,165 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,167 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC22:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
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
;BlackShadow_code.c,169 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC25
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC25
L__SELEC112:
;BlackShadow_code.c,170 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,171 :: 		}
	GOTO        L_SELEC26
L_SELEC25:
;BlackShadow_code.c,173 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC29
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC29
L__SELEC111:
;BlackShadow_code.c,174 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,175 :: 		delay_ms(100);
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
;BlackShadow_code.c,176 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,177 :: 		delay_ms(100);
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
;BlackShadow_code.c,178 :: 		}
	GOTO        L_SELEC32
L_SELEC29:
;BlackShadow_code.c,179 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC33
;BlackShadow_code.c,180 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,181 :: 		delay_ms(100);
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
;BlackShadow_code.c,182 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;BlackShadow_code.c,183 :: 		delay_ms(100);
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
;BlackShadow_code.c,184 :: 		}
	GOTO        L_SELEC36
L_SELEC33:
;BlackShadow_code.c,185 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC37
;BlackShadow_code.c,186 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,187 :: 		delay_ms(100);
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
;BlackShadow_code.c,188 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,189 :: 		delay_ms(100);
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
;BlackShadow_code.c,190 :: 		}
L_SELEC37:
L_SELEC36:
L_SELEC32:
L_SELEC26:
;BlackShadow_code.c,192 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,194 :: 		case 2: L1=0; L3=L2=L0=1; delay_ms(250);
L_SELEC40:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC171
	BCF         PORTA+0, 5 
	GOTO        L__SELEC172
L__SELEC171:
	BSF         PORTA+0, 5 
L__SELEC172:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC173
	BCF         PORTA+0, 4 
	GOTO        L__SELEC174
L__SELEC173:
	BSF         PORTA+0, 4 
L__SELEC174:
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
;BlackShadow_code.c,198 :: 		if(SL1 ==0 && S6 ==0 && S2 ==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC44
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC44
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC44
L__SELEC110:
;BlackShadow_code.c,200 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC175
	BCF         PORTA+0, 5 
	GOTO        L__SELEC176
L__SELEC175:
	BSF         PORTA+0, 5 
L__SELEC176:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC177
	BCF         PORTA+0, 7 
	GOTO        L__SELEC178
L__SELEC177:
	BSF         PORTA+0, 7 
L__SELEC178:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC179
	BCF         PORTA+0, 6 
	GOTO        L__SELEC180
L__SELEC179:
	BSF         PORTA+0, 6 
L__SELEC180:
;BlackShadow_code.c,201 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,202 :: 		delay_ms(250);
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
;BlackShadow_code.c,203 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,204 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_SELEC46:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC46
	DECFSZ      R12, 1, 1
	BRA         L_SELEC46
	DECFSZ      R11, 1, 1
	BRA         L_SELEC46
;BlackShadow_code.c,205 :: 		golpe = 0;
	CLRF        _golpe+0 
;BlackShadow_code.c,206 :: 		}
	GOTO        L_SELEC47
L_SELEC44:
;BlackShadow_code.c,207 :: 		else if (SL1 ==1 && S6 ==0 && S2 ==0){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC50
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC50
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC50
L__SELEC109:
;BlackShadow_code.c,208 :: 		L0=0;   L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC181
	BCF         PORTA+0, 5 
	GOTO        L__SELEC182
L__SELEC181:
	BSF         PORTA+0, 5 
L__SELEC182:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC183
	BCF         PORTA+0, 7 
	GOTO        L__SELEC184
L__SELEC183:
	BSF         PORTA+0, 7 
L__SELEC184:
;BlackShadow_code.c,209 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,210 :: 		delay_ms(100);
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
;BlackShadow_code.c,211 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,212 :: 		golpe = 0;
	CLRF        _golpe+0 
;BlackShadow_code.c,214 :: 		}
	GOTO        L_SELEC52
L_SELEC50:
;BlackShadow_code.c,215 :: 		else if (SL1 ==0 && S6 ==1 && S2 ==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC55
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC55
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC55
L__SELEC108:
;BlackShadow_code.c,216 :: 		L1=0;   L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC185
	BCF         PORTA+0, 5 
	GOTO        L__SELEC186
L__SELEC185:
	BSF         PORTA+0, 5 
L__SELEC186:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC187
	BCF         PORTA+0, 6 
	GOTO        L__SELEC188
L__SELEC187:
	BSF         PORTA+0, 6 
L__SELEC188:
;BlackShadow_code.c,217 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,218 :: 		golpe = 1;
	MOVLW       1
	MOVWF       _golpe+0 
;BlackShadow_code.c,219 :: 		}
	GOTO        L_SELEC56
L_SELEC55:
;BlackShadow_code.c,220 :: 		else if (SL1 ==1 && S6==1 && S2 ==0){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC59
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC59
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC59
L__SELEC107:
;BlackShadow_code.c,221 :: 		L0=L1=0;     L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC189
	BCF         PORTA+0, 6 
	GOTO        L__SELEC190
L__SELEC189:
	BSF         PORTA+0, 6 
L__SELEC190:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC191
	BCF         PORTA+0, 5 
	GOTO        L__SELEC192
L__SELEC191:
	BSF         PORTA+0, 5 
L__SELEC192:
;BlackShadow_code.c,222 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,223 :: 		delay_ms(20);
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
;BlackShadow_code.c,224 :: 		golpe = 1;
	MOVLW       1
	MOVWF       _golpe+0 
;BlackShadow_code.c,225 :: 		}
	GOTO        L_SELEC61
L_SELEC59:
;BlackShadow_code.c,226 :: 		else if (golpe ==1){
	MOVF        _golpe+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SELEC62
;BlackShadow_code.c,227 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,228 :: 		golpe = 0;
	CLRF        _golpe+0 
;BlackShadow_code.c,229 :: 		}
	GOTO        L_SELEC63
L_SELEC62:
;BlackShadow_code.c,230 :: 		else if (SL1 ==0 && S6==0 && S2 ==1){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC66
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC66
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC66
L__SELEC106:
;BlackShadow_code.c,231 :: 		L2=0;   L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC193
	BCF         PORTA+0, 7 
	GOTO        L__SELEC194
L__SELEC193:
	BSF         PORTA+0, 7 
L__SELEC194:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC195
	BCF         PORTA+0, 6 
	GOTO        L__SELEC196
L__SELEC195:
	BSF         PORTA+0, 6 
L__SELEC196:
;BlackShadow_code.c,232 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,233 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC67:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC67
	DECFSZ      R12, 1, 1
	BRA         L_SELEC67
	DECFSZ      R11, 1, 1
	BRA         L_SELEC67
	NOP
;BlackShadow_code.c,234 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,236 :: 		}
	GOTO        L_SELEC68
L_SELEC66:
;BlackShadow_code.c,237 :: 		else if (SL1 ==1 && S6==0 && S2 ==1){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC71
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC71
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC71
L__SELEC105:
;BlackShadow_code.c,238 :: 		L0=L2=0;     L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC197
	BCF         PORTA+0, 6 
	GOTO        L__SELEC198
L__SELEC197:
	BSF         PORTA+0, 6 
L__SELEC198:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC199
	BCF         PORTA+0, 7 
	GOTO        L__SELEC200
L__SELEC199:
	BSF         PORTA+0, 7 
L__SELEC200:
;BlackShadow_code.c,240 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,241 :: 		}
	GOTO        L_SELEC72
L_SELEC71:
;BlackShadow_code.c,242 :: 		else if (SL1 ==0 && S6==1 && S2 ==1){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC75
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC75
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC75
L__SELEC104:
;BlackShadow_code.c,243 :: 		L1=L2=0;     L0=L3=0;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC201
	BCF         PORTA+0, 7 
	GOTO        L__SELEC202
L__SELEC201:
	BSF         PORTA+0, 7 
L__SELEC202:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC203
	BCF         PORTA+0, 6 
	GOTO        L__SELEC204
L__SELEC203:
	BSF         PORTA+0, 6 
L__SELEC204:
;BlackShadow_code.c,244 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,245 :: 		delay_ms(30);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_SELEC76:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC76
	DECFSZ      R12, 1, 1
	BRA         L_SELEC76
;BlackShadow_code.c,246 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,247 :: 		}
	GOTO        L_SELEC77
L_SELEC75:
;BlackShadow_code.c,248 :: 		else if (SL1 ==1 && S6==1 && S2 ==1){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC80
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC80
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC80
L__SELEC103:
;BlackShadow_code.c,249 :: 		L0=L1=L2=0;  L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC205
	BCF         PORTA+0, 7 
	GOTO        L__SELEC206
L__SELEC205:
	BSF         PORTA+0, 7 
L__SELEC206:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC207
	BCF         PORTA+0, 6 
	GOTO        L__SELEC208
L__SELEC207:
	BSF         PORTA+0, 6 
L__SELEC208:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,250 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,251 :: 		}
	GOTO        L_SELEC81
L_SELEC80:
;BlackShadow_code.c,253 :: 		L0=L1=L2=L3=0;
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC209
	BCF         PORTA+0, 5 
	GOTO        L__SELEC210
L__SELEC209:
	BSF         PORTA+0, 5 
L__SELEC210:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC211
	BCF         PORTA+0, 7 
	GOTO        L__SELEC212
L__SELEC211:
	BSF         PORTA+0, 7 
L__SELEC212:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC213
	BCF         PORTA+0, 6 
	GOTO        L__SELEC214
L__SELEC213:
	BSF         PORTA+0, 6 
L__SELEC214:
;BlackShadow_code.c,254 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,255 :: 		}
L_SELEC81:
L_SELEC77:
L_SELEC72:
L_SELEC68:
L_SELEC63:
L_SELEC61:
L_SELEC56:
L_SELEC52:
L_SELEC47:
;BlackShadow_code.c,259 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,261 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC82:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC215
	BCF         PORTA+0, 6 
	GOTO        L__SELEC216
L__SELEC215:
	BSF         PORTA+0, 6 
L__SELEC216:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC217
	BCF         PORTA+0, 5 
	GOTO        L__SELEC218
L__SELEC217:
	BSF         PORTA+0, 5 
L__SELEC218:
;BlackShadow_code.c,262 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,266 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,268 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC83:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC219
	BCF         PORTA+0, 7 
	GOTO        L__SELEC220
L__SELEC219:
	BSF         PORTA+0, 7 
L__SELEC220:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC221
	BCF         PORTA+0, 4 
	GOTO        L__SELEC222
L__SELEC221:
	BSF         PORTA+0, 4 
L__SELEC222:
;BlackShadow_code.c,269 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,270 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC84:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC84
	DECFSZ      R12, 1, 1
	BRA         L_SELEC84
	DECFSZ      R11, 1, 1
	BRA         L_SELEC84
	NOP
	NOP
;BlackShadow_code.c,271 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,272 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC85:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC85
	DECFSZ      R12, 1, 1
	BRA         L_SELEC85
	DECFSZ      R11, 1, 1
	BRA         L_SELEC85
;BlackShadow_code.c,273 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,275 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC86:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC223
	BCF         PORTA+0, 5 
	GOTO        L__SELEC224
L__SELEC223:
	BSF         PORTA+0, 5 
L__SELEC224:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC225
	BCF         PORTA+0, 4 
	GOTO        L__SELEC226
L__SELEC225:
	BSF         PORTA+0, 4 
L__SELEC226:
;BlackShadow_code.c,276 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,277 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,279 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC87:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC227
	BCF         PORTA+0, 7 
	GOTO        L__SELEC228
L__SELEC227:
	BSF         PORTA+0, 7 
L__SELEC228:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC229
	BCF         PORTA+0, 4 
	GOTO        L__SELEC230
L__SELEC229:
	BSF         PORTA+0, 4 
L__SELEC230:
;BlackShadow_code.c,280 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,282 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,284 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC88:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC231
	BCF         PORTA+0, 7 
	GOTO        L__SELEC232
L__SELEC231:
	BSF         PORTA+0, 7 
L__SELEC232:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC233
	BCF         PORTA+0, 5 
	GOTO        L__SELEC234
L__SELEC233:
	BSF         PORTA+0, 5 
L__SELEC234:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,286 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,288 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC89:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC235
	BCF         PORTA+0, 5 
	GOTO        L__SELEC236
L__SELEC235:
	BSF         PORTA+0, 5 
L__SELEC236:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC237
	BCF         PORTA+0, 7 
	GOTO        L__SELEC238
L__SELEC237:
	BSF         PORTA+0, 7 
L__SELEC238:
;BlackShadow_code.c,290 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,292 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC90:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC239
	BCF         PORTA+0, 6 
	GOTO        L__SELEC240
L__SELEC239:
	BSF         PORTA+0, 6 
L__SELEC240:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC241
	BCF         PORTA+0, 7 
	GOTO        L__SELEC242
L__SELEC241:
	BSF         PORTA+0, 7 
L__SELEC242:
;BlackShadow_code.c,295 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,297 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC91:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC243
	BCF         PORTA+0, 4 
	GOTO        L__SELEC244
L__SELEC243:
	BSF         PORTA+0, 4 
L__SELEC244:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC245
	BCF         PORTA+0, 5 
	GOTO        L__SELEC246
L__SELEC245:
	BSF         PORTA+0, 5 
L__SELEC246:
;BlackShadow_code.c,298 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,300 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC92:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC247
	BCF         PORTA+0, 7 
	GOTO        L__SELEC248
L__SELEC247:
	BSF         PORTA+0, 7 
L__SELEC248:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC249
	BCF         PORTA+0, 6 
	GOTO        L__SELEC250
L__SELEC249:
	BSF         PORTA+0, 6 
L__SELEC250:
	BSF         PORTA+0, 5 
;BlackShadow_code.c,301 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,303 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC93:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC251
	BCF         PORTA+0, 4 
	GOTO        L__SELEC252
L__SELEC251:
	BSF         PORTA+0, 4 
L__SELEC252:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC253
	BCF         PORTA+0, 7 
	GOTO        L__SELEC254
L__SELEC253:
	BSF         PORTA+0, 7 
L__SELEC254:
;BlackShadow_code.c,304 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,306 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC94:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC255
	BCF         PORTA+0, 5 
	GOTO        L__SELEC256
L__SELEC255:
	BSF         PORTA+0, 5 
L__SELEC256:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC257
	BCF         PORTA+0, 4 
	GOTO        L__SELEC258
L__SELEC257:
	BSF         PORTA+0, 4 
L__SELEC258:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,307 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,309 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC95:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC259
	BCF         PORTA+0, 5 
	GOTO        L__SELEC260
L__SELEC259:
	BSF         PORTA+0, 5 
L__SELEC260:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC261
	BCF         PORTA+0, 4 
	GOTO        L__SELEC262
L__SELEC261:
	BSF         PORTA+0, 4 
L__SELEC262:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,310 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,312 :: 		default: L0=L1=L2=L3=0;
L_SELEC96:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC263
	BCF         PORTA+0, 5 
	GOTO        L__SELEC264
L__SELEC263:
	BSF         PORTA+0, 5 
L__SELEC264:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC265
	BCF         PORTA+0, 7 
	GOTO        L__SELEC266
L__SELEC265:
	BSF         PORTA+0, 7 
L__SELEC266:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC267
	BCF         PORTA+0, 6 
	GOTO        L__SELEC268
L__SELEC267:
	BSF         PORTA+0, 6 
L__SELEC268:
;BlackShadow_code.c,313 :: 		}
	GOTO        L_SELEC20
L_SELEC19:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC269
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC269:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC21
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC270
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC270:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC22
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC271
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC271:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC272
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC272:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC82
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC273
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC273:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC83
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC274
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC274:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC86
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC275
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC275:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC87
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC276
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC276:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC88
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC277
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC277:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC89
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC278
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC278:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC90
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC279
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC279:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC91
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC280
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC280:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC92
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC281
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC281:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC93
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC282
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC282:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC94
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC283
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC283:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC95
	GOTO        L_SELEC96
L_SELEC20:
;BlackShadow_code.c,316 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,318 :: 		void Start(){
;BlackShadow_code.c,319 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,320 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,321 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,322 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,323 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,324 :: 		return;
;BlackShadow_code.c,325 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,326 :: 		void Stop(){
;BlackShadow_code.c,327 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,328 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,329 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,330 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,331 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,332 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,339 :: 		void REC(){
;BlackShadow_code.c,341 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,343 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,344 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,347 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,348 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,349 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,350 :: 		void DER(){
;BlackShadow_code.c,351 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,352 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,353 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,355 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,356 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,358 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,359 :: 		void IZQ(){
;BlackShadow_code.c,360 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,361 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,362 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,364 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,365 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,366 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,368 :: 		void REV(){
;BlackShadow_code.c,369 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,370 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,371 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,372 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,373 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,375 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,377 :: 		void LIBRE(){
;BlackShadow_code.c,379 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,380 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,381 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,382 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,383 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,387 :: 		void GIRO180(){
;BlackShadow_code.c,388 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,390 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,391 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,393 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,394 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,395 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18097:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18097
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18097
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18097
;BlackShadow_code.c,396 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,399 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,401 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;BlackShadow_code.c,402 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;BlackShadow_code.c,403 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36098:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36098
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36098
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36098
	NOP
	NOP
;BlackShadow_code.c,404 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,406 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,408 :: 		void BRAKE(){
;BlackShadow_code.c,410 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,411 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,412 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,413 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,414 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,417 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;BlackShadow_code.c,418 :: 		void HARD(){
;BlackShadow_code.c,419 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,420 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,421 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,422 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,424 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;BlackShadow_code.c,425 :: 		void PUSH(){
;BlackShadow_code.c,426 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,428 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,429 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,432 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,433 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,435 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;BlackShadow_code.c,436 :: 		void HIT(){
;BlackShadow_code.c,438 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,439 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT99:
	DECFSZ      R13, 1, 1
	BRA         L_HIT99
	DECFSZ      R12, 1, 1
	BRA         L_HIT99
	NOP
	NOP
;BlackShadow_code.c,440 :: 		PUSH();
	CALL        _PUSH+0, 0
;BlackShadow_code.c,441 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT100:
	DECFSZ      R13, 1, 1
	BRA         L_HIT100
	DECFSZ      R12, 1, 1
	BRA         L_HIT100
	DECFSZ      R11, 1, 1
	BRA         L_HIT100
	NOP
	NOP
;BlackShadow_code.c,442 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_INTERRUPT:

;BlackShadow_code.c,444 :: 		void INTERRUPT(){
;BlackShadow_code.c,447 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT101
;BlackShadow_code.c,448 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,449 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,451 :: 		}
L_INTERRUPT101:
;BlackShadow_code.c,453 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT102
;BlackShadow_code.c,454 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,455 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,456 :: 		}
L_INTERRUPT102:
;BlackShadow_code.c,457 :: 		}
L_end_INTERRUPT:
L__INTERRUPT298:
	RETFIE      1
; end of _INTERRUPT
