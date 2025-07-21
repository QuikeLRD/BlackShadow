
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
;BlackShadow_code.c,113 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main104
	BCF         PORTA+0, 5 
	GOTO        L__main105
L__main104:
	BSF         PORTA+0, 5 
L__main105:
	BTFSC       PORTA+0, 5 
	GOTO        L__main106
	BCF         PORTA+0, 4 
	GOTO        L__main107
L__main106:
	BSF         PORTA+0, 4 
L__main107:
;BlackShadow_code.c,114 :: 		delay_ms(300);
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
;BlackShadow_code.c,115 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main108
	BCF         PORTA+0, 5 
	GOTO        L__main109
L__main108:
	BSF         PORTA+0, 5 
L__main109:
	BTFSC       PORTA+0, 5 
	GOTO        L__main110
	BCF         PORTA+0, 4 
	GOTO        L__main111
L__main110:
	BSF         PORTA+0, 4 
L__main111:
;BlackShadow_code.c,116 :: 		delay_ms(300);
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
;BlackShadow_code.c,117 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
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
	BCF         PORTA+0, 4 
	GOTO        L__main115
L__main114:
	BSF         PORTA+0, 4 
L__main115:
;BlackShadow_code.c,118 :: 		delay_ms(300);
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
;BlackShadow_code.c,119 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main116
	BCF         PORTA+0, 7 
	GOTO        L__main117
L__main116:
	BSF         PORTA+0, 7 
L__main117:
	BTFSC       PORTA+0, 7 
	GOTO        L__main118
	BCF         PORTA+0, 6 
	GOTO        L__main119
L__main118:
	BSF         PORTA+0, 6 
L__main119:
;BlackShadow_code.c,120 :: 		delay_ms(300);
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
;BlackShadow_code.c,121 :: 		L3=L2=L1=L0=1;
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
	BCF         PORTA+0, 5 
	GOTO        L__main123
L__main122:
	BSF         PORTA+0, 5 
L__main123:
	BTFSC       PORTA+0, 5 
	GOTO        L__main124
	BCF         PORTA+0, 4 
	GOTO        L__main125
L__main124:
	BSF         PORTA+0, 4 
L__main125:
;BlackShadow_code.c,122 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
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
;BlackShadow_code.c,124 :: 		while(1){
L_main5:
;BlackShadow_code.c,126 :: 		SELEC();
	CALL        _SELEC+0, 0
;BlackShadow_code.c,130 :: 		}
	GOTO        L_main5
;BlackShadow_code.c,131 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,135 :: 		void SELEC(){
;BlackShadow_code.c,137 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC127:
	BZ          L__SELEC128
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC127
L__SELEC128:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,139 :: 		switch(seleccion){
	GOTO        L_SELEC7
;BlackShadow_code.c,140 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC9:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC129
	BCF         PORTA+0, 5 
	GOTO        L__SELEC130
L__SELEC129:
	BSF         PORTA+0, 5 
L__SELEC130:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC131
	BCF         PORTA+0, 7 
	GOTO        L__SELEC132
L__SELEC131:
	BSF         PORTA+0, 7 
L__SELEC132:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC133
	BCF         PORTA+0, 6 
	GOTO        L__SELEC134
L__SELEC133:
	BSF         PORTA+0, 6 
L__SELEC134:
;BlackShadow_code.c,143 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,145 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC10:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC135
	BCF         PORTA+0, 5 
	GOTO        L__SELEC136
L__SELEC135:
	BSF         PORTA+0, 5 
L__SELEC136:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC137
	BCF         PORTA+0, 4 
	GOTO        L__SELEC138
L__SELEC137:
	BSF         PORTA+0, 4 
L__SELEC138:
;BlackShadow_code.c,147 :: 		while(1){
L_SELEC11:
;BlackShadow_code.c,148 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC15
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC15
L__SELEC102:
;BlackShadow_code.c,149 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,150 :: 		}
	GOTO        L_SELEC16
L_SELEC15:
;BlackShadow_code.c,152 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC19
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC19
L__SELEC101:
;BlackShadow_code.c,153 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,154 :: 		delay_ms(100);
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
;BlackShadow_code.c,155 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,156 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC21:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC21
	DECFSZ      R12, 1, 1
	BRA         L_SELEC21
	DECFSZ      R11, 1, 1
	BRA         L_SELEC21
	NOP
;BlackShadow_code.c,157 :: 		}
	GOTO        L_SELEC22
L_SELEC19:
;BlackShadow_code.c,158 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC23
;BlackShadow_code.c,159 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,160 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC24:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC24
	DECFSZ      R12, 1, 1
	BRA         L_SELEC24
	DECFSZ      R11, 1, 1
	BRA         L_SELEC24
	NOP
;BlackShadow_code.c,161 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;BlackShadow_code.c,162 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC25:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC25
	DECFSZ      R12, 1, 1
	BRA         L_SELEC25
	DECFSZ      R11, 1, 1
	BRA         L_SELEC25
	NOP
;BlackShadow_code.c,163 :: 		}
	GOTO        L_SELEC26
L_SELEC23:
;BlackShadow_code.c,164 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC27
;BlackShadow_code.c,165 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,166 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC28:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC28
	DECFSZ      R12, 1, 1
	BRA         L_SELEC28
	DECFSZ      R11, 1, 1
	BRA         L_SELEC28
	NOP
;BlackShadow_code.c,167 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,168 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC29:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC29
	DECFSZ      R12, 1, 1
	BRA         L_SELEC29
	DECFSZ      R11, 1, 1
	BRA         L_SELEC29
	NOP
;BlackShadow_code.c,169 :: 		}
L_SELEC27:
L_SELEC26:
L_SELEC22:
L_SELEC16:
;BlackShadow_code.c,170 :: 		}
	GOTO        L_SELEC11
;BlackShadow_code.c,173 :: 		case 2: L1=0; L3=L2=L0=1; delay_ms(250);
L_SELEC30:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC139
	BCF         PORTA+0, 5 
	GOTO        L__SELEC140
L__SELEC139:
	BSF         PORTA+0, 5 
L__SELEC140:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC141
	BCF         PORTA+0, 4 
	GOTO        L__SELEC142
L__SELEC141:
	BSF         PORTA+0, 4 
L__SELEC142:
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC31:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC31
	DECFSZ      R12, 1, 1
	BRA         L_SELEC31
	DECFSZ      R11, 1, 1
	BRA         L_SELEC31
	NOP
	NOP
;BlackShadow_code.c,176 :: 		while(1){
L_SELEC32:
;BlackShadow_code.c,177 :: 		if      (SL1 ==0 && S6 ==0 && S2 ==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC36
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC36
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC36
L__SELEC100:
;BlackShadow_code.c,179 :: 		L0=L1=L2=L3=1;
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
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
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC147
	BCF         PORTA+0, 6 
	GOTO        L__SELEC148
L__SELEC147:
	BSF         PORTA+0, 6 
L__SELEC148:
;BlackShadow_code.c,180 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,181 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_SELEC37:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC37
	DECFSZ      R12, 1, 1
	BRA         L_SELEC37
	NOP
	NOP
;BlackShadow_code.c,182 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,183 :: 		delay_ms(100);
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
;BlackShadow_code.c,184 :: 		}
	GOTO        L_SELEC39
L_SELEC36:
;BlackShadow_code.c,185 :: 		else if (SL1 ==1 && S6 ==0 && S2 ==0){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC42
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC42
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC42
L__SELEC99:
;BlackShadow_code.c,186 :: 		L0=0;   L1=L2=L3=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC149
	BCF         PORTA+0, 5 
	GOTO        L__SELEC150
L__SELEC149:
	BSF         PORTA+0, 5 
L__SELEC150:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC151
	BCF         PORTA+0, 7 
	GOTO        L__SELEC152
L__SELEC151:
	BSF         PORTA+0, 7 
L__SELEC152:
;BlackShadow_code.c,187 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,188 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC43:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC43
	DECFSZ      R12, 1, 1
	BRA         L_SELEC43
	DECFSZ      R11, 1, 1
	BRA         L_SELEC43
	NOP
;BlackShadow_code.c,189 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,191 :: 		}
	GOTO        L_SELEC44
L_SELEC42:
;BlackShadow_code.c,192 :: 		else if (SL1 ==0 && S6 ==1 && S2 ==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC47
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC47
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC47
L__SELEC98:
;BlackShadow_code.c,193 :: 		L1=0;   L0=L2=L3=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC153
	BCF         PORTA+0, 5 
	GOTO        L__SELEC154
L__SELEC153:
	BSF         PORTA+0, 5 
L__SELEC154:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC155
	BCF         PORTA+0, 6 
	GOTO        L__SELEC156
L__SELEC155:
	BSF         PORTA+0, 6 
L__SELEC156:
;BlackShadow_code.c,194 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,195 :: 		}
	GOTO        L_SELEC48
L_SELEC47:
;BlackShadow_code.c,196 :: 		else if (SL1 ==1 && S6==1 && S2 ==0){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC51
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC51
	BTFSC       PORTC+0, 6 
	GOTO        L_SELEC51
L__SELEC97:
;BlackShadow_code.c,197 :: 		L0=L1=0;     L2=L3=1;
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC157
	BCF         PORTA+0, 6 
	GOTO        L__SELEC158
L__SELEC157:
	BSF         PORTA+0, 6 
L__SELEC158:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC159
	BCF         PORTA+0, 5 
	GOTO        L__SELEC160
L__SELEC159:
	BSF         PORTA+0, 5 
L__SELEC160:
;BlackShadow_code.c,198 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,199 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_SELEC52:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC52
	DECFSZ      R12, 1, 1
	BRA         L_SELEC52
	NOP
	NOP
;BlackShadow_code.c,200 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,202 :: 		}
	GOTO        L_SELEC53
L_SELEC51:
;BlackShadow_code.c,203 :: 		else if (SL1 ==0 && S6==0 && S2 ==1){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC56
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC56
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC56
L__SELEC96:
;BlackShadow_code.c,204 :: 		L2=0;   L0=L1=L3=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
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
;BlackShadow_code.c,205 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,206 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC57:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC57
	DECFSZ      R12, 1, 1
	BRA         L_SELEC57
	DECFSZ      R11, 1, 1
	BRA         L_SELEC57
	NOP
;BlackShadow_code.c,207 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,209 :: 		}
	GOTO        L_SELEC58
L_SELEC56:
;BlackShadow_code.c,210 :: 		else if (SL1 ==1 && S6==0 && S2 ==1){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC61
	BTFSC       PORTB+0, 4 
	GOTO        L_SELEC61
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC61
L__SELEC95:
;BlackShadow_code.c,211 :: 		L0=L2=0;     L1=L3=1;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC165
	BCF         PORTA+0, 6 
	GOTO        L__SELEC166
L__SELEC165:
	BSF         PORTA+0, 6 
L__SELEC166:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC167
	BCF         PORTA+0, 7 
	GOTO        L__SELEC168
L__SELEC167:
	BSF         PORTA+0, 7 
L__SELEC168:
;BlackShadow_code.c,213 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,214 :: 		}
	GOTO        L_SELEC62
L_SELEC61:
;BlackShadow_code.c,215 :: 		else if (SL1 ==0 && S6==1 && S2 ==1){
	BTFSC       PORTC+0, 0 
	GOTO        L_SELEC65
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC65
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC65
L__SELEC94:
;BlackShadow_code.c,216 :: 		L1=L2=0;     L0=L3=0;
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC169
	BCF         PORTA+0, 7 
	GOTO        L__SELEC170
L__SELEC169:
	BSF         PORTA+0, 7 
L__SELEC170:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC171
	BCF         PORTA+0, 6 
	GOTO        L__SELEC172
L__SELEC171:
	BSF         PORTA+0, 6 
L__SELEC172:
;BlackShadow_code.c,217 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,218 :: 		delay_ms(30);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_SELEC66:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC66
	DECFSZ      R12, 1, 1
	BRA         L_SELEC66
;BlackShadow_code.c,219 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,220 :: 		}
	GOTO        L_SELEC67
L_SELEC65:
;BlackShadow_code.c,221 :: 		else if (SL1 ==1 && S6==1 && S2 ==1){
	BTFSS       PORTC+0, 0 
	GOTO        L_SELEC70
	BTFSS       PORTB+0, 4 
	GOTO        L_SELEC70
	BTFSS       PORTC+0, 6 
	GOTO        L_SELEC70
L__SELEC93:
;BlackShadow_code.c,222 :: 		L0=L1=L2=0;  L3=1;
	BCF         PORTA+0, 5 
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
	BSF         PORTA+0, 4 
;BlackShadow_code.c,223 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,224 :: 		}
	GOTO        L_SELEC71
L_SELEC70:
;BlackShadow_code.c,226 :: 		L0=L1=L2=L3=0;
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC177
	BCF         PORTA+0, 5 
	GOTO        L__SELEC178
L__SELEC177:
	BSF         PORTA+0, 5 
L__SELEC178:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC179
	BCF         PORTA+0, 7 
	GOTO        L__SELEC180
L__SELEC179:
	BSF         PORTA+0, 7 
L__SELEC180:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC181
	BCF         PORTA+0, 6 
	GOTO        L__SELEC182
L__SELEC181:
	BSF         PORTA+0, 6 
L__SELEC182:
;BlackShadow_code.c,227 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,228 :: 		}
L_SELEC71:
L_SELEC67:
L_SELEC62:
L_SELEC58:
L_SELEC53:
L_SELEC48:
L_SELEC44:
L_SELEC39:
;BlackShadow_code.c,231 :: 		}
	GOTO        L_SELEC32
;BlackShadow_code.c,234 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC72:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC183
	BCF         PORTA+0, 6 
	GOTO        L__SELEC184
L__SELEC183:
	BSF         PORTA+0, 6 
L__SELEC184:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC185
	BCF         PORTA+0, 5 
	GOTO        L__SELEC186
L__SELEC185:
	BSF         PORTA+0, 5 
L__SELEC186:
;BlackShadow_code.c,235 :: 		HIT();
	CALL        _HIT+0, 0
;BlackShadow_code.c,239 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,241 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC73:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC187
	BCF         PORTA+0, 7 
	GOTO        L__SELEC188
L__SELEC187:
	BSF         PORTA+0, 7 
L__SELEC188:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC189
	BCF         PORTA+0, 4 
	GOTO        L__SELEC190
L__SELEC189:
	BSF         PORTA+0, 4 
L__SELEC190:
;BlackShadow_code.c,242 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,243 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC74:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC74
	DECFSZ      R12, 1, 1
	BRA         L_SELEC74
	DECFSZ      R11, 1, 1
	BRA         L_SELEC74
	NOP
	NOP
;BlackShadow_code.c,244 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,245 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC75:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC75
	DECFSZ      R12, 1, 1
	BRA         L_SELEC75
	DECFSZ      R11, 1, 1
	BRA         L_SELEC75
;BlackShadow_code.c,246 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,248 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC76:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC191
	BCF         PORTA+0, 5 
	GOTO        L__SELEC192
L__SELEC191:
	BSF         PORTA+0, 5 
L__SELEC192:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC193
	BCF         PORTA+0, 4 
	GOTO        L__SELEC194
L__SELEC193:
	BSF         PORTA+0, 4 
L__SELEC194:
;BlackShadow_code.c,249 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,250 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,252 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC77:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC195
	BCF         PORTA+0, 7 
	GOTO        L__SELEC196
L__SELEC195:
	BSF         PORTA+0, 7 
L__SELEC196:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC197
	BCF         PORTA+0, 4 
	GOTO        L__SELEC198
L__SELEC197:
	BSF         PORTA+0, 4 
L__SELEC198:
;BlackShadow_code.c,253 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,255 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,257 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC78:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC199
	BCF         PORTA+0, 7 
	GOTO        L__SELEC200
L__SELEC199:
	BSF         PORTA+0, 7 
L__SELEC200:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC201
	BCF         PORTA+0, 5 
	GOTO        L__SELEC202
L__SELEC201:
	BSF         PORTA+0, 5 
L__SELEC202:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,259 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,261 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC79:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC203
	BCF         PORTA+0, 5 
	GOTO        L__SELEC204
L__SELEC203:
	BSF         PORTA+0, 5 
L__SELEC204:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC205
	BCF         PORTA+0, 7 
	GOTO        L__SELEC206
L__SELEC205:
	BSF         PORTA+0, 7 
L__SELEC206:
;BlackShadow_code.c,263 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,265 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC80:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC207
	BCF         PORTA+0, 6 
	GOTO        L__SELEC208
L__SELEC207:
	BSF         PORTA+0, 6 
L__SELEC208:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC209
	BCF         PORTA+0, 7 
	GOTO        L__SELEC210
L__SELEC209:
	BSF         PORTA+0, 7 
L__SELEC210:
;BlackShadow_code.c,268 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,270 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC81:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC211
	BCF         PORTA+0, 4 
	GOTO        L__SELEC212
L__SELEC211:
	BSF         PORTA+0, 4 
L__SELEC212:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC213
	BCF         PORTA+0, 5 
	GOTO        L__SELEC214
L__SELEC213:
	BSF         PORTA+0, 5 
L__SELEC214:
;BlackShadow_code.c,271 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,273 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC82:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC215
	BCF         PORTA+0, 7 
	GOTO        L__SELEC216
L__SELEC215:
	BSF         PORTA+0, 7 
L__SELEC216:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC217
	BCF         PORTA+0, 6 
	GOTO        L__SELEC218
L__SELEC217:
	BSF         PORTA+0, 6 
L__SELEC218:
	BSF         PORTA+0, 5 
;BlackShadow_code.c,274 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,276 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC83:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC219
	BCF         PORTA+0, 4 
	GOTO        L__SELEC220
L__SELEC219:
	BSF         PORTA+0, 4 
L__SELEC220:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC221
	BCF         PORTA+0, 7 
	GOTO        L__SELEC222
L__SELEC221:
	BSF         PORTA+0, 7 
L__SELEC222:
;BlackShadow_code.c,277 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,279 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC84:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC223
	BCF         PORTA+0, 5 
	GOTO        L__SELEC224
L__SELEC223:
	BSF         PORTA+0, 5 
L__SELEC224:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC225
	BCF         PORTA+0, 4 
	GOTO        L__SELEC226
L__SELEC225:
	BSF         PORTA+0, 4 
L__SELEC226:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,280 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,282 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC85:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC227
	BCF         PORTA+0, 5 
	GOTO        L__SELEC228
L__SELEC227:
	BSF         PORTA+0, 5 
L__SELEC228:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC229
	BCF         PORTA+0, 4 
	GOTO        L__SELEC230
L__SELEC229:
	BSF         PORTA+0, 4 
L__SELEC230:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,283 :: 		break;
	GOTO        L_SELEC8
;BlackShadow_code.c,285 :: 		default: L0=L1=L2=L3=0;
L_SELEC86:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC231
	BCF         PORTA+0, 5 
	GOTO        L__SELEC232
L__SELEC231:
	BSF         PORTA+0, 5 
L__SELEC232:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC233
	BCF         PORTA+0, 7 
	GOTO        L__SELEC234
L__SELEC233:
	BSF         PORTA+0, 7 
L__SELEC234:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC235
	BCF         PORTA+0, 6 
	GOTO        L__SELEC236
L__SELEC235:
	BSF         PORTA+0, 6 
L__SELEC236:
;BlackShadow_code.c,286 :: 		}
	GOTO        L_SELEC8
L_SELEC7:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC237
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC237:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC9
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC238
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC238:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC10
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC239
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC239:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC30
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC240
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC240:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC72
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC241
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC241:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC73
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC242
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC242:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC76
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC243
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC243:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC77
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC244
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC244:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC78
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC245
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC245:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC79
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC246
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC246:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC80
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC247
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC247:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC81
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC248
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC248:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC82
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC249
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC249:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC83
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC250
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC250:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC84
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC251
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC251:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC85
	GOTO        L_SELEC86
L_SELEC8:
;BlackShadow_code.c,289 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,291 :: 		void Start(){
;BlackShadow_code.c,292 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,293 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,294 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,295 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,296 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,297 :: 		return;
;BlackShadow_code.c,298 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,299 :: 		void Stop(){
;BlackShadow_code.c,300 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,301 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,302 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,303 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,304 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,305 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,312 :: 		void REC(){
;BlackShadow_code.c,314 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,316 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,317 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,320 :: 		PWM3_Set_Duty(140);    // IN1 = 0
	MOVLW       140
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,321 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,322 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,323 :: 		void DER(){
;BlackShadow_code.c,324 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,325 :: 		PWM1_Set_Duty(170);
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,326 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,328 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,329 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,331 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,332 :: 		void IZQ(){
;BlackShadow_code.c,333 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,334 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,335 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,337 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,338 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,339 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,341 :: 		void REV(){
;BlackShadow_code.c,342 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,343 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,344 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,345 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,346 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,348 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,350 :: 		void LIBRE(){
;BlackShadow_code.c,352 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,353 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,354 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,355 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,356 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,360 :: 		void GIRO180(){
;BlackShadow_code.c,361 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,363 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,364 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,366 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,367 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,368 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18087:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18087
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18087
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18087
;BlackShadow_code.c,369 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,372 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,374 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;BlackShadow_code.c,375 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;BlackShadow_code.c,376 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36088:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36088
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36088
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36088
	NOP
	NOP
;BlackShadow_code.c,377 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,379 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,381 :: 		void BRAKE(){
;BlackShadow_code.c,383 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,384 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,385 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,386 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,387 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,390 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;BlackShadow_code.c,391 :: 		void HARD(){
;BlackShadow_code.c,392 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,393 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,394 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,395 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,397 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_PUSH:

;BlackShadow_code.c,398 :: 		void PUSH(){
;BlackShadow_code.c,399 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,401 :: 		PWM1_Set_Duty(255); // IN1 = PWM
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,402 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,405 :: 		PWM3_Set_Duty(205);    // IN1 = 0
	MOVLW       205
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,406 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,408 :: 		}
L_end_PUSH:
	RETURN      0
; end of _PUSH

_HIT:

;BlackShadow_code.c,409 :: 		void HIT(){
;BlackShadow_code.c,411 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,412 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_HIT89:
	DECFSZ      R13, 1, 1
	BRA         L_HIT89
	DECFSZ      R12, 1, 1
	BRA         L_HIT89
	NOP
	NOP
;BlackShadow_code.c,413 :: 		PUSH();
	CALL        _PUSH+0, 0
;BlackShadow_code.c,414 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_HIT90:
	DECFSZ      R13, 1, 1
	BRA         L_HIT90
	DECFSZ      R12, 1, 1
	BRA         L_HIT90
	DECFSZ      R11, 1, 1
	BRA         L_HIT90
	NOP
	NOP
;BlackShadow_code.c,415 :: 		}
L_end_HIT:
	RETURN      0
; end of _HIT

_INTERRUPT:

;BlackShadow_code.c,417 :: 		void INTERRUPT(){
;BlackShadow_code.c,420 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT91
;BlackShadow_code.c,421 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,422 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,424 :: 		}
L_INTERRUPT91:
;BlackShadow_code.c,426 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT92
;BlackShadow_code.c,427 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,428 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,429 :: 		}
L_INTERRUPT92:
;BlackShadow_code.c,430 :: 		}
L_end_INTERRUPT:
L__INTERRUPT266:
	RETFIE      1
; end of _INTERRUPT
