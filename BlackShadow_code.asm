
_main:

;BlackShadow_code.c,75 :: 		void main() {
;BlackShadow_code.c,76 :: 		OSCCON = 0b01100110;
	MOVLW       102
	MOVWF       OSCCON+0 
;BlackShadow_code.c,79 :: 		PORTA = 0;
	CLRF        PORTA+0 
;BlackShadow_code.c,80 :: 		PORTB = 0;
	CLRF        PORTB+0 
;BlackShadow_code.c,81 :: 		PORTC = 0;
	CLRF        PORTC+0 
;BlackShadow_code.c,84 :: 		TRISA= 0b00001111;   //El bit 1 del PortaA0 es el ultimo.     //0X0F
	MOVLW       15
	MOVWF       TRISA+0 
;BlackShadow_code.c,85 :: 		TRISB= 0b11011110;    //El bit que tenemos hasta la izquierda es el numero 7.DAT Y CLK se dejan como entrada aunque pueden ser salida, el micro los ocupa para programar
	MOVLW       222
	MOVWF       TRISB+0 
;BlackShadow_code.c,86 :: 		TRISC= 0b11111001;
	MOVLW       249
	MOVWF       TRISC+0 
;BlackShadow_code.c,88 :: 		ANSELA= 0b00000000;
	CLRF        ANSELA+0 
;BlackShadow_code.c,89 :: 		ANSELB= 0b00000000;
	CLRF        ANSELB+0 
;BlackShadow_code.c,90 :: 		ANSELC= 0b00000000;
	CLRF        ANSELC+0 
;BlackShadow_code.c,94 :: 		INTCON3.INT1IE =1;                               //habilitamos interrupción INT1 (RB1)
	BSF         INTCON3+0, 3 
;BlackShadow_code.c,95 :: 		INTCON3.INT2IE =1;                                //habilitamos interrupción INT2 (RB2)
	BSF         INTCON3+0, 4 
;BlackShadow_code.c,97 :: 		INTCON2.INTEDG1 =0;                               //INT1: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 5 
;BlackShadow_code.c,98 :: 		INTCON2.INTEDG2 =0;                                //INT2: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 4 
;BlackShadow_code.c,100 :: 		INTCON.GIE =1;                                    //Interrupciones globales
	BSF         INTCON+0, 7 
;BlackShadow_code.c,101 :: 		INTCON.PEIE =1;                                   //Interrupciones perifericas
	BSF         INTCON+0, 6 
;BlackShadow_code.c,109 :: 		PWM1_Init(20000);   //Se debe poner a 20 000 para el motor y 1000 para simular
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;BlackShadow_code.c,110 :: 		PWM2_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;BlackShadow_code.c,111 :: 		PWM3_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;BlackShadow_code.c,112 :: 		PWM4_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;BlackShadow_code.c,115 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,116 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,117 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,118 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,120 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,121 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,122 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,123 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,129 :: 		while (DAT == 0){
L_main0:
	BTFSC       PORTB+0, 7 
	GOTO        L_main1
;BlackShadow_code.c,130 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main127
	BCF         PORTA+0, 5 
	GOTO        L__main128
L__main127:
	BSF         PORTA+0, 5 
L__main128:
	BTFSC       PORTA+0, 5 
	GOTO        L__main129
	BCF         PORTA+0, 4 
	GOTO        L__main130
L__main129:
	BSF         PORTA+0, 4 
L__main130:
;BlackShadow_code.c,131 :: 		delay_ms(300);
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
;BlackShadow_code.c,132 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main131
	BCF         PORTA+0, 5 
	GOTO        L__main132
L__main131:
	BSF         PORTA+0, 5 
L__main132:
	BTFSC       PORTA+0, 5 
	GOTO        L__main133
	BCF         PORTA+0, 4 
	GOTO        L__main134
L__main133:
	BSF         PORTA+0, 4 
L__main134:
;BlackShadow_code.c,133 :: 		delay_ms(300);
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
;BlackShadow_code.c,134 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main135
	BCF         PORTA+0, 7 
	GOTO        L__main136
L__main135:
	BSF         PORTA+0, 7 
L__main136:
	BTFSC       PORTA+0, 7 
	GOTO        L__main137
	BCF         PORTA+0, 4 
	GOTO        L__main138
L__main137:
	BSF         PORTA+0, 4 
L__main138:
;BlackShadow_code.c,135 :: 		delay_ms(300);
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
;BlackShadow_code.c,136 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main139
	BCF         PORTA+0, 7 
	GOTO        L__main140
L__main139:
	BSF         PORTA+0, 7 
L__main140:
	BTFSC       PORTA+0, 7 
	GOTO        L__main141
	BCF         PORTA+0, 6 
	GOTO        L__main142
L__main141:
	BSF         PORTA+0, 6 
L__main142:
;BlackShadow_code.c,137 :: 		delay_ms(300);
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
;BlackShadow_code.c,138 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main143
	BCF         PORTA+0, 7 
	GOTO        L__main144
L__main143:
	BSF         PORTA+0, 7 
L__main144:
	BTFSC       PORTA+0, 7 
	GOTO        L__main145
	BCF         PORTA+0, 5 
	GOTO        L__main146
L__main145:
	BSF         PORTA+0, 5 
L__main146:
	BTFSC       PORTA+0, 5 
	GOTO        L__main147
	BCF         PORTA+0, 4 
	GOTO        L__main148
L__main147:
	BSF         PORTA+0, 4 
L__main148:
;BlackShadow_code.c,139 :: 		delay_ms(1000);
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
;BlackShadow_code.c,140 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,141 :: 		delay_ms(250);
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
;BlackShadow_code.c,142 :: 		}
	GOTO        L_main0
L_main1:
;BlackShadow_code.c,143 :: 		while(1){
L_main8:
;BlackShadow_code.c,144 :: 		if (DAT==0){
	BTFSC       PORTB+0, 7 
	GOTO        L_main10
;BlackShadow_code.c,145 :: 		LIBRE();                                     //Deten motores
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,147 :: 		while (DAT == 0){
L_main11:
	BTFSC       PORTB+0, 7 
	GOTO        L_main12
;BlackShadow_code.c,148 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main149
	BCF         PORTA+0, 5 
	GOTO        L__main150
L__main149:
	BSF         PORTA+0, 5 
L__main150:
	BTFSC       PORTA+0, 5 
	GOTO        L__main151
	BCF         PORTA+0, 4 
	GOTO        L__main152
L__main151:
	BSF         PORTA+0, 4 
L__main152:
;BlackShadow_code.c,149 :: 		delay_ms(300);
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
;BlackShadow_code.c,150 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main153
	BCF         PORTA+0, 5 
	GOTO        L__main154
L__main153:
	BSF         PORTA+0, 5 
L__main154:
	BTFSC       PORTA+0, 5 
	GOTO        L__main155
	BCF         PORTA+0, 4 
	GOTO        L__main156
L__main155:
	BSF         PORTA+0, 4 
L__main156:
;BlackShadow_code.c,151 :: 		delay_ms(300);
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
;BlackShadow_code.c,152 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main157
	BCF         PORTA+0, 7 
	GOTO        L__main158
L__main157:
	BSF         PORTA+0, 7 
L__main158:
	BTFSC       PORTA+0, 7 
	GOTO        L__main159
	BCF         PORTA+0, 4 
	GOTO        L__main160
L__main159:
	BSF         PORTA+0, 4 
L__main160:
;BlackShadow_code.c,153 :: 		delay_ms(300);
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
;BlackShadow_code.c,154 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main161
	BCF         PORTA+0, 7 
	GOTO        L__main162
L__main161:
	BSF         PORTA+0, 7 
L__main162:
	BTFSC       PORTA+0, 7 
	GOTO        L__main163
	BCF         PORTA+0, 6 
	GOTO        L__main164
L__main163:
	BSF         PORTA+0, 6 
L__main164:
;BlackShadow_code.c,155 :: 		delay_ms(300);
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
;BlackShadow_code.c,156 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main165
	BCF         PORTA+0, 7 
	GOTO        L__main166
L__main165:
	BSF         PORTA+0, 7 
L__main166:
	BTFSC       PORTA+0, 7 
	GOTO        L__main167
	BCF         PORTA+0, 5 
	GOTO        L__main168
L__main167:
	BSF         PORTA+0, 5 
L__main168:
	BTFSC       PORTA+0, 5 
	GOTO        L__main169
	BCF         PORTA+0, 4 
	GOTO        L__main170
L__main169:
	BSF         PORTA+0, 4 
L__main170:
;BlackShadow_code.c,157 :: 		delay_ms(1000);
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
;BlackShadow_code.c,158 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,159 :: 		delay_ms(250);
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
;BlackShadow_code.c,160 :: 		}
	GOTO        L_main11
L_main12:
;BlackShadow_code.c,161 :: 		}
L_main10:
;BlackShadow_code.c,162 :: 		SELEC();
	CALL        _SELEC+0, 0
;BlackShadow_code.c,164 :: 		}
	GOTO        L_main8
;BlackShadow_code.c,165 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,169 :: 		void SELEC(){
;BlackShadow_code.c,171 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC172:
	BZ          L__SELEC173
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC172
L__SELEC173:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,173 :: 		switch(seleccion){
	GOTO        L_SELEC19
;BlackShadow_code.c,174 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC21:
	BSF         PORTA+0, 4 
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
;BlackShadow_code.c,177 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,179 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC22:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC180
	BCF         PORTA+0, 5 
	GOTO        L__SELEC181
L__SELEC180:
	BSF         PORTA+0, 5 
L__SELEC181:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC182
	BCF         PORTA+0, 4 
	GOTO        L__SELEC183
L__SELEC182:
	BSF         PORTA+0, 4 
L__SELEC183:
;BlackShadow_code.c,180 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC25
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC25
L__SELEC117:
;BlackShadow_code.c,181 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,182 :: 		}
	GOTO        L_SELEC26
L_SELEC25:
;BlackShadow_code.c,183 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC29
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC29
L__SELEC116:
;BlackShadow_code.c,184 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,185 :: 		delay_ms(100);
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
;BlackShadow_code.c,186 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,187 :: 		delay_ms(100);
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
;BlackShadow_code.c,188 :: 		}
	GOTO        L_SELEC32
L_SELEC29:
;BlackShadow_code.c,189 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC33
;BlackShadow_code.c,190 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,191 :: 		delay_ms(100);
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
;BlackShadow_code.c,192 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;BlackShadow_code.c,193 :: 		delay_ms(100);
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
;BlackShadow_code.c,194 :: 		}
	GOTO        L_SELEC36
L_SELEC33:
;BlackShadow_code.c,195 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC37
;BlackShadow_code.c,196 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,197 :: 		delay_ms(100);
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
;BlackShadow_code.c,198 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,199 :: 		delay_ms(100);
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
;BlackShadow_code.c,200 :: 		}
L_SELEC37:
L_SELEC36:
L_SELEC32:
L_SELEC26:
;BlackShadow_code.c,202 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,204 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC40:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC184
	BCF         PORTA+0, 5 
	GOTO        L__SELEC185
L__SELEC184:
	BSF         PORTA+0, 5 
L__SELEC185:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC186
	BCF         PORTA+0, 4 
	GOTO        L__SELEC187
L__SELEC186:
	BSF         PORTA+0, 4 
L__SELEC187:
;BlackShadow_code.c,205 :: 		combate_estado();
	CALL        _combate_estado+0, 0
;BlackShadow_code.c,207 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,209 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC41:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC188
	BCF         PORTA+0, 6 
	GOTO        L__SELEC189
L__SELEC188:
	BSF         PORTA+0, 6 
L__SELEC189:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC190
	BCF         PORTA+0, 5 
	GOTO        L__SELEC191
L__SELEC190:
	BSF         PORTA+0, 5 
L__SELEC191:
;BlackShadow_code.c,210 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,214 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,216 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC42:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC192
	BCF         PORTA+0, 7 
	GOTO        L__SELEC193
L__SELEC192:
	BSF         PORTA+0, 7 
L__SELEC193:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC194
	BCF         PORTA+0, 4 
	GOTO        L__SELEC195
L__SELEC194:
	BSF         PORTA+0, 4 
L__SELEC195:
;BlackShadow_code.c,217 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,218 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC43:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC43
	DECFSZ      R12, 1, 1
	BRA         L_SELEC43
	DECFSZ      R11, 1, 1
	BRA         L_SELEC43
	NOP
	NOP
;BlackShadow_code.c,219 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,220 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC44:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC44
	DECFSZ      R12, 1, 1
	BRA         L_SELEC44
	DECFSZ      R11, 1, 1
	BRA         L_SELEC44
;BlackShadow_code.c,221 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,223 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC45:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC196
	BCF         PORTA+0, 5 
	GOTO        L__SELEC197
L__SELEC196:
	BSF         PORTA+0, 5 
L__SELEC197:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC198
	BCF         PORTA+0, 4 
	GOTO        L__SELEC199
L__SELEC198:
	BSF         PORTA+0, 4 
L__SELEC199:
;BlackShadow_code.c,224 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,225 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,227 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC46:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC200
	BCF         PORTA+0, 7 
	GOTO        L__SELEC201
L__SELEC200:
	BSF         PORTA+0, 7 
L__SELEC201:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC202
	BCF         PORTA+0, 4 
	GOTO        L__SELEC203
L__SELEC202:
	BSF         PORTA+0, 4 
L__SELEC203:
;BlackShadow_code.c,228 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,230 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,232 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC47:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC204
	BCF         PORTA+0, 7 
	GOTO        L__SELEC205
L__SELEC204:
	BSF         PORTA+0, 7 
L__SELEC205:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC206
	BCF         PORTA+0, 5 
	GOTO        L__SELEC207
L__SELEC206:
	BSF         PORTA+0, 5 
L__SELEC207:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,234 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,236 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC48:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC208
	BCF         PORTA+0, 5 
	GOTO        L__SELEC209
L__SELEC208:
	BSF         PORTA+0, 5 
L__SELEC209:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC210
	BCF         PORTA+0, 7 
	GOTO        L__SELEC211
L__SELEC210:
	BSF         PORTA+0, 7 
L__SELEC211:
;BlackShadow_code.c,238 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,240 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC49:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC212
	BCF         PORTA+0, 6 
	GOTO        L__SELEC213
L__SELEC212:
	BSF         PORTA+0, 6 
L__SELEC213:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC214
	BCF         PORTA+0, 7 
	GOTO        L__SELEC215
L__SELEC214:
	BSF         PORTA+0, 7 
L__SELEC215:
;BlackShadow_code.c,243 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,245 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC50:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC216
	BCF         PORTA+0, 4 
	GOTO        L__SELEC217
L__SELEC216:
	BSF         PORTA+0, 4 
L__SELEC217:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC218
	BCF         PORTA+0, 5 
	GOTO        L__SELEC219
L__SELEC218:
	BSF         PORTA+0, 5 
L__SELEC219:
;BlackShadow_code.c,246 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,248 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC51:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC220
	BCF         PORTA+0, 7 
	GOTO        L__SELEC221
L__SELEC220:
	BSF         PORTA+0, 7 
L__SELEC221:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC222
	BCF         PORTA+0, 6 
	GOTO        L__SELEC223
L__SELEC222:
	BSF         PORTA+0, 6 
L__SELEC223:
	BSF         PORTA+0, 5 
;BlackShadow_code.c,249 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,251 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC52:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC224
	BCF         PORTA+0, 4 
	GOTO        L__SELEC225
L__SELEC224:
	BSF         PORTA+0, 4 
L__SELEC225:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC226
	BCF         PORTA+0, 7 
	GOTO        L__SELEC227
L__SELEC226:
	BSF         PORTA+0, 7 
L__SELEC227:
;BlackShadow_code.c,252 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,254 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC53:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC228
	BCF         PORTA+0, 5 
	GOTO        L__SELEC229
L__SELEC228:
	BSF         PORTA+0, 5 
L__SELEC229:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC230
	BCF         PORTA+0, 4 
	GOTO        L__SELEC231
L__SELEC230:
	BSF         PORTA+0, 4 
L__SELEC231:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,255 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,257 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC54:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC232
	BCF         PORTA+0, 5 
	GOTO        L__SELEC233
L__SELEC232:
	BSF         PORTA+0, 5 
L__SELEC233:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC234
	BCF         PORTA+0, 4 
	GOTO        L__SELEC235
L__SELEC234:
	BSF         PORTA+0, 4 
L__SELEC235:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,258 :: 		break;
	GOTO        L_SELEC20
;BlackShadow_code.c,260 :: 		default: L0=L1=L2=L3=0;
L_SELEC55:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC236
	BCF         PORTA+0, 5 
	GOTO        L__SELEC237
L__SELEC236:
	BSF         PORTA+0, 5 
L__SELEC237:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC238
	BCF         PORTA+0, 7 
	GOTO        L__SELEC239
L__SELEC238:
	BSF         PORTA+0, 7 
L__SELEC239:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC240
	BCF         PORTA+0, 6 
	GOTO        L__SELEC241
L__SELEC240:
	BSF         PORTA+0, 6 
L__SELEC241:
;BlackShadow_code.c,261 :: 		}
	GOTO        L_SELEC20
L_SELEC19:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC242
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC242:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC21
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC243
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC243:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC22
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC244
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC244:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC245
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC245:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC41
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC246
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC246:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC42
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC247
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC247:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC45
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC248
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC248:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC46
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC249
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC249:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC47
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC250
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC250:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC48
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC251
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC251:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC49
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC252
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC252:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC50
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC253
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC253:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC51
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC254
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC254:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC52
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC255
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC255:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC53
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC256
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC256:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC54
	GOTO        L_SELEC55
L_SELEC20:
;BlackShadow_code.c,264 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_combate_estado:

;BlackShadow_code.c,268 :: 		void combate_estado() {
;BlackShadow_code.c,269 :: 		switch (estado_combate) {
	GOTO        L_combate_estado56
;BlackShadow_code.c,270 :: 		case CMB_ESPERA:
L_combate_estado58:
;BlackShadow_code.c,271 :: 		if(SL1 == 0 && S6 == 0 && S2 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado61
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado61
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado61
L__combate_estado125:
;BlackShadow_code.c,272 :: 		estado_combate = CMB_REC;
	MOVLW       1
	MOVWF       _estado_combate+0 
;BlackShadow_code.c,273 :: 		}
	GOTO        L_combate_estado62
L_combate_estado61:
;BlackShadow_code.c,274 :: 		else if (SL1 == 1 && S6 == 0 && S2 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado65
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado65
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado65
L__combate_estado124:
;BlackShadow_code.c,275 :: 		estado_combate = CMB_IZQ_HARD;
	MOVLW       2
	MOVWF       _estado_combate+0 
;BlackShadow_code.c,276 :: 		}
	GOTO        L_combate_estado66
L_combate_estado65:
;BlackShadow_code.c,277 :: 		else if (SL1 == 0 && S6 == 1 && S2 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado69
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado69
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado69
L__combate_estado123:
;BlackShadow_code.c,278 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;BlackShadow_code.c,279 :: 		}
	GOTO        L_combate_estado70
L_combate_estado69:
;BlackShadow_code.c,280 :: 		else if (SL1 == 1 && S6 == 1 && S2 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado73
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado73
	BTFSC       PORTC+0, 6 
	GOTO        L_combate_estado73
L__combate_estado122:
;BlackShadow_code.c,281 :: 		estado_combate = CMB_IZQ_GOLPE;
	MOVLW       4
	MOVWF       _estado_combate+0 
;BlackShadow_code.c,282 :: 		}
	GOTO        L_combate_estado74
L_combate_estado73:
;BlackShadow_code.c,283 :: 		else if (golpe == 1){
	MOVF        _golpe+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_combate_estado75
;BlackShadow_code.c,284 :: 		estado_combate = CMB_HIT;
	MOVLW       3
	MOVWF       _estado_combate+0 
;BlackShadow_code.c,285 :: 		}
	GOTO        L_combate_estado76
L_combate_estado75:
;BlackShadow_code.c,286 :: 		else if (SL1 == 0 && S6 == 0 && S2 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado79
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado79
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado79
L__combate_estado121:
;BlackShadow_code.c,287 :: 		estado_combate = CMB_DER_HARD;
	MOVLW       5
	MOVWF       _estado_combate+0 
;BlackShadow_code.c,288 :: 		}
	GOTO        L_combate_estado80
L_combate_estado79:
;BlackShadow_code.c,289 :: 		else if (SL1 == 1 && S6 == 0 && S2 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado83
	BTFSC       PORTB+0, 4 
	GOTO        L_combate_estado83
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado83
L__combate_estado120:
;BlackShadow_code.c,290 :: 		estado_combate = CMB_LIBRE;
	MOVLW       6
	MOVWF       _estado_combate+0 
;BlackShadow_code.c,291 :: 		}
	GOTO        L_combate_estado84
L_combate_estado83:
;BlackShadow_code.c,292 :: 		else if (SL1 == 0 && S6 == 1 && S2 == 1){
	BTFSC       PORTC+0, 0 
	GOTO        L_combate_estado87
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado87
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado87
L__combate_estado119:
;BlackShadow_code.c,293 :: 		estado_combate = CMB_DER_HIT;
	MOVLW       7
	MOVWF       _estado_combate+0 
;BlackShadow_code.c,294 :: 		}
	GOTO        L_combate_estado88
L_combate_estado87:
;BlackShadow_code.c,295 :: 		else if (SL1 == 1 && S6 == 1 && S2 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_combate_estado91
	BTFSS       PORTB+0, 4 
	GOTO        L_combate_estado91
	BTFSS       PORTC+0, 6 
	GOTO        L_combate_estado91
L__combate_estado118:
;BlackShadow_code.c,296 :: 		estado_combate = CMB_HIT_FULL;
	MOVLW       8
	MOVWF       _estado_combate+0 
;BlackShadow_code.c,297 :: 		}
	GOTO        L_combate_estado92
L_combate_estado91:
;BlackShadow_code.c,299 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,300 :: 		}
L_combate_estado92:
L_combate_estado88:
L_combate_estado84:
L_combate_estado80:
L_combate_estado76:
L_combate_estado74:
L_combate_estado70:
L_combate_estado66:
L_combate_estado62:
;BlackShadow_code.c,301 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,303 :: 		case CMB_REC:
L_combate_estado93:
;BlackShadow_code.c,304 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado258
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado259
L__combate_estado258:
	BSF         PORTA+0, 5 
L__combate_estado259:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado260
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado261
L__combate_estado260:
	BSF         PORTA+0, 7 
L__combate_estado261:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado262
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado263
L__combate_estado262:
	BSF         PORTA+0, 6 
L__combate_estado263:
;BlackShadow_code.c,305 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,306 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_combate_estado94:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado94
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado94
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado94
	NOP
	NOP
;BlackShadow_code.c,307 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,308 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_combate_estado95:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado95
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado95
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado95
;BlackShadow_code.c,309 :: 		golpe = 0;
	CLRF        _golpe+0 
;BlackShadow_code.c,310 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;BlackShadow_code.c,311 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,313 :: 		case CMB_IZQ_HARD:
L_combate_estado96:
;BlackShadow_code.c,314 :: 		L0=0; L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado264
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado265
L__combate_estado264:
	BSF         PORTA+0, 5 
L__combate_estado265:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado266
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado267
L__combate_estado266:
	BSF         PORTA+0, 7 
L__combate_estado267:
;BlackShadow_code.c,315 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,316 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado97:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado97
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado97
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado97
	NOP
;BlackShadow_code.c,317 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,318 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_combate_estado98:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado98
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado98
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado98
	NOP
	NOP
;BlackShadow_code.c,319 :: 		golpe = 0;
	CLRF        _golpe+0 
;BlackShadow_code.c,320 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;BlackShadow_code.c,321 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,323 :: 		case CMB_HIT:
L_combate_estado99:
;BlackShadow_code.c,324 :: 		L1=0; L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado268
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado269
L__combate_estado268:
	BSF         PORTA+0, 5 
L__combate_estado269:
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado270
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado271
L__combate_estado270:
	BSF         PORTA+0, 6 
L__combate_estado271:
;BlackShadow_code.c,325 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,326 :: 		golpe = 1;
	MOVLW       1
	MOVWF       _golpe+0 
;BlackShadow_code.c,327 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;BlackShadow_code.c,328 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,330 :: 		case CMB_IZQ_GOLPE:
L_combate_estado100:
;BlackShadow_code.c,331 :: 		L0=L1=0; L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado272
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado273
L__combate_estado272:
	BSF         PORTA+0, 6 
L__combate_estado273:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado274
	BCF         PORTA+0, 5 
	GOTO        L__combate_estado275
L__combate_estado274:
	BSF         PORTA+0, 5 
L__combate_estado275:
;BlackShadow_code.c,332 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,333 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_combate_estado101:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado101
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado101
	NOP
	NOP
;BlackShadow_code.c,334 :: 		golpe = 1;
	MOVLW       1
	MOVWF       _golpe+0 
;BlackShadow_code.c,335 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;BlackShadow_code.c,336 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,338 :: 		case CMB_DER_HARD:
L_combate_estado102:
;BlackShadow_code.c,339 :: 		L2=0; L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado276
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado277
L__combate_estado276:
	BSF         PORTA+0, 7 
L__combate_estado277:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado278
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado279
L__combate_estado278:
	BSF         PORTA+0, 6 
L__combate_estado279:
;BlackShadow_code.c,340 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,341 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_combate_estado103:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado103
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado103
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado103
	NOP
;BlackShadow_code.c,342 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,343 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_combate_estado104:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado104
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado104
	DECFSZ      R11, 1, 1
	BRA         L_combate_estado104
	NOP
	NOP
;BlackShadow_code.c,344 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;BlackShadow_code.c,345 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,347 :: 		case CMB_LIBRE:
L_combate_estado105:
;BlackShadow_code.c,348 :: 		L0=L2=0; L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado280
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado281
L__combate_estado280:
	BSF         PORTA+0, 6 
L__combate_estado281:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado282
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado283
L__combate_estado282:
	BSF         PORTA+0, 7 
L__combate_estado283:
;BlackShadow_code.c,349 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,350 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;BlackShadow_code.c,351 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,353 :: 		case CMB_DER_HIT:
L_combate_estado106:
;BlackShadow_code.c,354 :: 		L1=L2=0; L0=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado284
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado285
L__combate_estado284:
	BSF         PORTA+0, 7 
L__combate_estado285:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__combate_estado286
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado287
L__combate_estado286:
	BSF         PORTA+0, 6 
L__combate_estado287:
;BlackShadow_code.c,355 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,356 :: 		delay_ms(30);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_combate_estado107:
	DECFSZ      R13, 1, 1
	BRA         L_combate_estado107
	DECFSZ      R12, 1, 1
	BRA         L_combate_estado107
;BlackShadow_code.c,357 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,358 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;BlackShadow_code.c,359 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,361 :: 		case CMB_HIT_FULL:
L_combate_estado108:
;BlackShadow_code.c,362 :: 		L0=L1=L2=0; L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__combate_estado288
	BCF         PORTA+0, 7 
	GOTO        L__combate_estado289
L__combate_estado288:
	BSF         PORTA+0, 7 
L__combate_estado289:
	BTFSC       PORTA+0, 7 
	GOTO        L__combate_estado290
	BCF         PORTA+0, 6 
	GOTO        L__combate_estado291
L__combate_estado290:
	BSF         PORTA+0, 6 
L__combate_estado291:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,363 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,364 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;BlackShadow_code.c,365 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,367 :: 		default:
L_combate_estado109:
;BlackShadow_code.c,368 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,369 :: 		estado_combate = CMB_ESPERA;
	CLRF        _estado_combate+0 
;BlackShadow_code.c,370 :: 		break;
	GOTO        L_combate_estado57
;BlackShadow_code.c,371 :: 		}
L_combate_estado56:
	MOVF        _estado_combate+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado58
	MOVF        _estado_combate+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado93
	MOVF        _estado_combate+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado96
	MOVF        _estado_combate+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado99
	MOVF        _estado_combate+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado100
	MOVF        _estado_combate+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado102
	MOVF        _estado_combate+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado105
	MOVF        _estado_combate+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado106
	MOVF        _estado_combate+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_combate_estado108
	GOTO        L_combate_estado109
L_combate_estado57:
;BlackShadow_code.c,372 :: 		}
L_end_combate_estado:
	RETURN      0
; end of _combate_estado

_Start:

;BlackShadow_code.c,374 :: 		void Start(){
;BlackShadow_code.c,375 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,376 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,377 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,378 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,379 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,380 :: 		return;
;BlackShadow_code.c,381 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,382 :: 		void Stop(){
;BlackShadow_code.c,383 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,384 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,385 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,386 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,387 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,388 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,395 :: 		void REC(){
;BlackShadow_code.c,397 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,399 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,400 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,403 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,404 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,405 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,406 :: 		void DER(){
;BlackShadow_code.c,407 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,408 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,409 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,411 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,412 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,414 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,415 :: 		void IZQ(){
;BlackShadow_code.c,416 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,417 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,418 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,420 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,421 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,422 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,424 :: 		void REV(){
;BlackShadow_code.c,425 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,426 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,427 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,428 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,429 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,431 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,433 :: 		void LIBRE(){
;BlackShadow_code.c,435 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,436 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,437 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,438 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,439 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,443 :: 		void GIRO180(){
;BlackShadow_code.c,444 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,446 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,447 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,449 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,450 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,451 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO180110:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO180110
	DECFSZ      R12, 1, 1
	BRA         L_GIRO180110
	DECFSZ      R11, 1, 1
	BRA         L_GIRO180110
;BlackShadow_code.c,452 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,455 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,457 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;BlackShadow_code.c,458 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;BlackShadow_code.c,459 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO360111:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO360111
	DECFSZ      R12, 1, 1
	BRA         L_GIRO360111
	DECFSZ      R11, 1, 1
	BRA         L_GIRO360111
	NOP
	NOP
;BlackShadow_code.c,460 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,462 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,464 :: 		void BRAKE(){
;BlackShadow_code.c,466 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,467 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,468 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,469 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,470 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,473 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;BlackShadow_code.c,474 :: 		void HARD(){
;BlackShadow_code.c,475 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,476 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,477 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,478 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,481 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;BlackShadow_code.c,482 :: 		void PUSH(){
;BlackShadow_code.c,483 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,485 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,486 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,489 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,490 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,492 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;BlackShadow_code.c,493 :: 		void HIT(){
;BlackShadow_code.c,495 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,496 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT112:
	DECFSZ      R13, 1, 1
	BRA         L_HIT112
	DECFSZ      R12, 1, 1
	BRA         L_HIT112
	NOP
	NOP
;BlackShadow_code.c,497 :: 		PUSH();
	CALL        _PUSH+0, 0
;BlackShadow_code.c,498 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT113:
	DECFSZ      R13, 1, 1
	BRA         L_HIT113
	DECFSZ      R12, 1, 1
	BRA         L_HIT113
	DECFSZ      R11, 1, 1
	BRA         L_HIT113
	NOP
	NOP
;BlackShadow_code.c,499 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_INTERRUPT:

;BlackShadow_code.c,501 :: 		void INTERRUPT(){
;BlackShadow_code.c,504 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT114
;BlackShadow_code.c,505 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,506 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,508 :: 		}
L_INTERRUPT114:
;BlackShadow_code.c,510 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT115
;BlackShadow_code.c,511 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,512 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,513 :: 		}
L_INTERRUPT115:
;BlackShadow_code.c,514 :: 		}
L_end_INTERRUPT:
L__INTERRUPT306:
	RETFIE      1
; end of _INTERRUPT
