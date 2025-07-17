
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
	GOTO        L__main97
	BCF         PORTA+0, 5 
	GOTO        L__main98
L__main97:
	BSF         PORTA+0, 5 
L__main98:
	BTFSC       PORTA+0, 5 
	GOTO        L__main99
	BCF         PORTA+0, 4 
	GOTO        L__main100
L__main99:
	BSF         PORTA+0, 4 
L__main100:
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
	GOTO        L__main101
	BCF         PORTA+0, 7 
	GOTO        L__main102
L__main101:
	BSF         PORTA+0, 7 
L__main102:
	BTFSC       PORTA+0, 7 
	GOTO        L__main103
	BCF         PORTA+0, 4 
	GOTO        L__main104
L__main103:
	BSF         PORTA+0, 4 
L__main104:
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
	GOTO        L__main105
	BCF         PORTA+0, 7 
	GOTO        L__main106
L__main105:
	BSF         PORTA+0, 7 
L__main106:
	BTFSC       PORTA+0, 7 
	GOTO        L__main107
	BCF         PORTA+0, 6 
	GOTO        L__main108
L__main107:
	BSF         PORTA+0, 6 
L__main108:
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
	GOTO        L__main109
	BCF         PORTA+0, 7 
	GOTO        L__main110
L__main109:
	BSF         PORTA+0, 7 
L__main110:
	BTFSC       PORTA+0, 7 
	GOTO        L__main111
	BCF         PORTA+0, 5 
	GOTO        L__main112
L__main111:
	BSF         PORTA+0, 5 
L__main112:
	BTFSC       PORTA+0, 5 
	GOTO        L__main113
	BCF         PORTA+0, 4 
	GOTO        L__main114
L__main113:
	BSF         PORTA+0, 4 
L__main114:
;BlackShadow_code.c,125 :: 		while(1){
L_main4:
;BlackShadow_code.c,127 :: 		SELEC();
	CALL        _SELEC+0, 0
;BlackShadow_code.c,132 :: 		}
	GOTO        L_main4
;BlackShadow_code.c,133 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_SELEC:

;BlackShadow_code.c,137 :: 		void SELEC(){
;BlackShadow_code.c,139 :: 		seleccion=SW0*1+SW1*2+SW2*4+SW3*8;
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
L__SELEC116:
	BZ          L__SELEC117
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC116
L__SELEC117:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,141 :: 		switch(seleccion){
	GOTO        L_SELEC6
;BlackShadow_code.c,142 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC8:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC118
	BCF         PORTA+0, 5 
	GOTO        L__SELEC119
L__SELEC118:
	BSF         PORTA+0, 5 
L__SELEC119:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC120
	BCF         PORTA+0, 7 
	GOTO        L__SELEC121
L__SELEC120:
	BSF         PORTA+0, 7 
L__SELEC121:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC122
	BCF         PORTA+0, 6 
	GOTO        L__SELEC123
L__SELEC122:
	BSF         PORTA+0, 6 
L__SELEC123:
;BlackShadow_code.c,145 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,147 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC9:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC124
	BCF         PORTA+0, 5 
	GOTO        L__SELEC125
L__SELEC124:
	BSF         PORTA+0, 5 
L__SELEC125:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC126
	BCF         PORTA+0, 4 
	GOTO        L__SELEC127
L__SELEC126:
	BSF         PORTA+0, 4 
L__SELEC127:
;BlackShadow_code.c,149 :: 		while(1){
L_SELEC10:
;BlackShadow_code.c,150 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC14
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC14
L__SELEC83:
;BlackShadow_code.c,151 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,152 :: 		}
	GOTO        L_SELEC15
L_SELEC14:
;BlackShadow_code.c,154 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC18
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC18
L__SELEC82:
;BlackShadow_code.c,155 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,156 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC19:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC19
	DECFSZ      R12, 1, 1
	BRA         L_SELEC19
	DECFSZ      R11, 1, 1
	BRA         L_SELEC19
	NOP
;BlackShadow_code.c,157 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,158 :: 		delay_ms(100);
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
;BlackShadow_code.c,159 :: 		}
	GOTO        L_SELEC21
L_SELEC18:
;BlackShadow_code.c,160 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC22
;BlackShadow_code.c,161 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,162 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC23:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC23
	DECFSZ      R12, 1, 1
	BRA         L_SELEC23
	DECFSZ      R11, 1, 1
	BRA         L_SELEC23
	NOP
;BlackShadow_code.c,163 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;BlackShadow_code.c,164 :: 		delay_ms(100);
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
;BlackShadow_code.c,165 :: 		}
	GOTO        L_SELEC25
L_SELEC22:
;BlackShadow_code.c,166 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC26
;BlackShadow_code.c,167 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,168 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC27:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC27
	DECFSZ      R12, 1, 1
	BRA         L_SELEC27
	DECFSZ      R11, 1, 1
	BRA         L_SELEC27
	NOP
;BlackShadow_code.c,169 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,170 :: 		delay_ms(100);
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
;BlackShadow_code.c,171 :: 		}
L_SELEC26:
L_SELEC25:
L_SELEC21:
L_SELEC15:
;BlackShadow_code.c,172 :: 		}
	GOTO        L_SELEC10
;BlackShadow_code.c,175 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC29:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC128
	BCF         PORTA+0, 5 
	GOTO        L__SELEC129
L__SELEC128:
	BSF         PORTA+0, 5 
L__SELEC129:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC130
	BCF         PORTA+0, 4 
	GOTO        L__SELEC131
L__SELEC130:
	BSF         PORTA+0, 4 
L__SELEC131:
;BlackShadow_code.c,177 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,179 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,181 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC30:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC132
	BCF         PORTA+0, 6 
	GOTO        L__SELEC133
L__SELEC132:
	BSF         PORTA+0, 6 
L__SELEC133:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC134
	BCF         PORTA+0, 5 
	GOTO        L__SELEC135
L__SELEC134:
	BSF         PORTA+0, 5 
L__SELEC135:
;BlackShadow_code.c,182 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,183 :: 		delay_ms(250);
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
;BlackShadow_code.c,184 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,185 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC32:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC32
	DECFSZ      R12, 1, 1
	BRA         L_SELEC32
	DECFSZ      R11, 1, 1
	BRA         L_SELEC32
;BlackShadow_code.c,187 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,189 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC33:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC136
	BCF         PORTA+0, 7 
	GOTO        L__SELEC137
L__SELEC136:
	BSF         PORTA+0, 7 
L__SELEC137:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC138
	BCF         PORTA+0, 4 
	GOTO        L__SELEC139
L__SELEC138:
	BSF         PORTA+0, 4 
L__SELEC139:
;BlackShadow_code.c,190 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,191 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC34:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC34
	DECFSZ      R12, 1, 1
	BRA         L_SELEC34
	DECFSZ      R11, 1, 1
	BRA         L_SELEC34
	NOP
	NOP
;BlackShadow_code.c,192 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,193 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC35:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC35
	DECFSZ      R12, 1, 1
	BRA         L_SELEC35
	DECFSZ      R11, 1, 1
	BRA         L_SELEC35
;BlackShadow_code.c,194 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,196 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC36:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC140
	BCF         PORTA+0, 5 
	GOTO        L__SELEC141
L__SELEC140:
	BSF         PORTA+0, 5 
L__SELEC141:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC142
	BCF         PORTA+0, 4 
	GOTO        L__SELEC143
L__SELEC142:
	BSF         PORTA+0, 4 
L__SELEC143:
;BlackShadow_code.c,197 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,198 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,200 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC37:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC144
	BCF         PORTA+0, 7 
	GOTO        L__SELEC145
L__SELEC144:
	BSF         PORTA+0, 7 
L__SELEC145:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC146
	BCF         PORTA+0, 4 
	GOTO        L__SELEC147
L__SELEC146:
	BSF         PORTA+0, 4 
L__SELEC147:
;BlackShadow_code.c,201 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,203 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,205 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC38:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC148
	BCF         PORTA+0, 7 
	GOTO        L__SELEC149
L__SELEC148:
	BSF         PORTA+0, 7 
L__SELEC149:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC150
	BCF         PORTA+0, 5 
	GOTO        L__SELEC151
L__SELEC150:
	BSF         PORTA+0, 5 
L__SELEC151:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,207 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,209 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC39:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC152
	BCF         PORTA+0, 5 
	GOTO        L__SELEC153
L__SELEC152:
	BSF         PORTA+0, 5 
L__SELEC153:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC154
	BCF         PORTA+0, 7 
	GOTO        L__SELEC155
L__SELEC154:
	BSF         PORTA+0, 7 
L__SELEC155:
;BlackShadow_code.c,211 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,213 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC40:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC156
	BCF         PORTA+0, 6 
	GOTO        L__SELEC157
L__SELEC156:
	BSF         PORTA+0, 6 
L__SELEC157:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC158
	BCF         PORTA+0, 7 
	GOTO        L__SELEC159
L__SELEC158:
	BSF         PORTA+0, 7 
L__SELEC159:
;BlackShadow_code.c,216 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,218 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC41:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC160
	BCF         PORTA+0, 4 
	GOTO        L__SELEC161
L__SELEC160:
	BSF         PORTA+0, 4 
L__SELEC161:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC162
	BCF         PORTA+0, 5 
	GOTO        L__SELEC163
L__SELEC162:
	BSF         PORTA+0, 5 
L__SELEC163:
;BlackShadow_code.c,219 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,221 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC42:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
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
	BSF         PORTA+0, 5 
;BlackShadow_code.c,222 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,224 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC43:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC168
	BCF         PORTA+0, 4 
	GOTO        L__SELEC169
L__SELEC168:
	BSF         PORTA+0, 4 
L__SELEC169:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC170
	BCF         PORTA+0, 7 
	GOTO        L__SELEC171
L__SELEC170:
	BSF         PORTA+0, 7 
L__SELEC171:
;BlackShadow_code.c,225 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,227 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC44:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC172
	BCF         PORTA+0, 5 
	GOTO        L__SELEC173
L__SELEC172:
	BSF         PORTA+0, 5 
L__SELEC173:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC174
	BCF         PORTA+0, 4 
	GOTO        L__SELEC175
L__SELEC174:
	BSF         PORTA+0, 4 
L__SELEC175:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,228 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,230 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC45:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC176
	BCF         PORTA+0, 5 
	GOTO        L__SELEC177
L__SELEC176:
	BSF         PORTA+0, 5 
L__SELEC177:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC178
	BCF         PORTA+0, 4 
	GOTO        L__SELEC179
L__SELEC178:
	BSF         PORTA+0, 4 
L__SELEC179:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,231 :: 		break;
	GOTO        L_SELEC7
;BlackShadow_code.c,233 :: 		default: L0=L1=L2=L3=0;
L_SELEC46:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC180
	BCF         PORTA+0, 5 
	GOTO        L__SELEC181
L__SELEC180:
	BSF         PORTA+0, 5 
L__SELEC181:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC182
	BCF         PORTA+0, 7 
	GOTO        L__SELEC183
L__SELEC182:
	BSF         PORTA+0, 7 
L__SELEC183:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC184
	BCF         PORTA+0, 6 
	GOTO        L__SELEC185
L__SELEC184:
	BSF         PORTA+0, 6 
L__SELEC185:
;BlackShadow_code.c,234 :: 		}
	GOTO        L_SELEC7
L_SELEC6:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC186
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC186:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC8
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC187
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC187:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC9
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC188
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC188:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC29
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC189
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC189:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC30
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC190
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC190:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC33
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC191
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC191:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC36
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC192
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC192:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC37
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC193
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC193:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC38
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC194
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC194:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC39
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC195
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC195:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC40
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC196
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC196:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC41
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC197
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC197:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC42
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC198
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC198:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC43
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC199
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC199:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC44
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC200
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC200:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC45
	GOTO        L_SELEC46
L_SELEC7:
;BlackShadow_code.c,237 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,239 :: 		void Start(){
;BlackShadow_code.c,240 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,241 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,242 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,243 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,244 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,245 :: 		return;
;BlackShadow_code.c,246 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,247 :: 		void Stop(){
;BlackShadow_code.c,248 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,249 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,250 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,251 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,252 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,253 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,260 :: 		void REC(){
;BlackShadow_code.c,262 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,264 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,265 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,268 :: 		PWM3_Set_Duty(120);    // IN1 = 0
	MOVLW       120
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,269 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,270 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,271 :: 		void DER(){
;BlackShadow_code.c,272 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,273 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,274 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,276 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,277 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,279 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,280 :: 		void IZQ(){
;BlackShadow_code.c,281 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,282 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,283 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,285 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,286 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,287 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,289 :: 		void REV(){
;BlackShadow_code.c,290 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,291 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,292 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,293 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,294 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,296 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,298 :: 		void LIBRE(){
;BlackShadow_code.c,300 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,301 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,302 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,303 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,304 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,308 :: 		void GIRO180(){
;BlackShadow_code.c,309 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,311 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,312 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,314 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,315 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,316 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18047:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18047
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18047
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18047
;BlackShadow_code.c,317 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,320 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,322 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;BlackShadow_code.c,323 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;BlackShadow_code.c,324 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36048:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36048
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36048
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36048
	NOP
	NOP
;BlackShadow_code.c,325 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,327 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,329 :: 		void BRAKE(){
;BlackShadow_code.c,331 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,332 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,333 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,334 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,335 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,338 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;BlackShadow_code.c,339 :: 		void HARD(){
;BlackShadow_code.c,340 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,341 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,342 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,343 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,345 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_Basura:

;BlackShadow_code.c,347 :: 		void Basura(){
;BlackShadow_code.c,351 :: 		if(SL1==0 && SL2==1)       //SL1=Sensor izquierdo, SL2= Sensor de linea derecho
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura51
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura51
L__Basura91:
;BlackShadow_code.c,352 :: 		DER();                 //Si veo por la izquierda hago una reversa por la derecha.
	CALL        _DER+0, 0
	GOTO        L_Basura52
L_Basura51:
;BlackShadow_code.c,353 :: 		else if(SL1==1 && SL2==0)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura55
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura55
L__Basura90:
;BlackShadow_code.c,354 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura56
L_Basura55:
;BlackShadow_code.c,355 :: 		else if(SL1==0 && SL2==0)
	BTFSC       PORTC+0, 0 
	GOTO        L_Basura59
	BTFSC       PORTC+0, 4 
	GOTO        L_Basura59
L__Basura89:
;BlackShadow_code.c,356 :: 		GIRO180();
	CALL        _GIRO180+0, 0
	GOTO        L_Basura60
L_Basura59:
;BlackShadow_code.c,357 :: 		else if(SL1==1 && SL2==1)
	BTFSS       PORTC+0, 0 
	GOTO        L_Basura63
	BTFSS       PORTC+0, 4 
	GOTO        L_Basura63
L__Basura88:
;BlackShadow_code.c,358 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura64
L_Basura63:
;BlackShadow_code.c,365 :: 		else if(S1==1 && S2==0)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura67
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura67
L__Basura87:
;BlackShadow_code.c,366 :: 		IZQ();
	CALL        _IZQ+0, 0
	GOTO        L_Basura68
L_Basura67:
;BlackShadow_code.c,367 :: 		else if(S1==0 && S2==1)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura71
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura71
L__Basura86:
;BlackShadow_code.c,368 :: 		DER();
	CALL        _DER+0, 0
	GOTO        L_Basura72
L_Basura71:
;BlackShadow_code.c,369 :: 		else if(S1==1 && S2==1)
	BTFSS       PORTC+0, 5 
	GOTO        L_Basura75
	BTFSS       PORTC+0, 6 
	GOTO        L_Basura75
L__Basura85:
;BlackShadow_code.c,370 :: 		REC();
	CALL        _REC+0, 0
	GOTO        L_Basura76
L_Basura75:
;BlackShadow_code.c,371 :: 		else if(S1==0 && S2==0)
	BTFSC       PORTC+0, 5 
	GOTO        L_Basura79
	BTFSC       PORTC+0, 6 
	GOTO        L_Basura79
L__Basura84:
;BlackShadow_code.c,372 :: 		GIRO180();
	CALL        _GIRO180+0, 0
L_Basura79:
L_Basura76:
L_Basura72:
L_Basura68:
L_Basura64:
L_Basura60:
L_Basura56:
L_Basura52:
;BlackShadow_code.c,373 :: 		}
L_end_Basura:
	RETURN      0
; end of _Basura

_INTERRUPT:

;BlackShadow_code.c,375 :: 		void INTERRUPT(){
;BlackShadow_code.c,378 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT80
;BlackShadow_code.c,379 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,380 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,382 :: 		}
L_INTERRUPT80:
;BlackShadow_code.c,384 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT81
;BlackShadow_code.c,385 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,386 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,387 :: 		}
L_INTERRUPT81:
;BlackShadow_code.c,388 :: 		}
L_end_INTERRUPT:
L__INTERRUPT214:
	RETFIE      1
; end of _INTERRUPT
