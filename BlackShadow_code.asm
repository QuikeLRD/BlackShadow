
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
	GOTO        L__main103
	BCF         PORTA+0, 5 
	GOTO        L__main104
L__main103:
	BSF         PORTA+0, 5 
L__main104:
	BTFSC       PORTA+0, 5 
	GOTO        L__main105
	BCF         PORTA+0, 4 
	GOTO        L__main106
L__main105:
	BSF         PORTA+0, 4 
L__main106:
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
	GOTO        L__main107
	BCF         PORTA+0, 7 
	GOTO        L__main108
L__main107:
	BSF         PORTA+0, 7 
L__main108:
	BTFSC       PORTA+0, 7 
	GOTO        L__main109
	BCF         PORTA+0, 4 
	GOTO        L__main110
L__main109:
	BSF         PORTA+0, 4 
L__main110:
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
	GOTO        L__main111
	BCF         PORTA+0, 7 
	GOTO        L__main112
L__main111:
	BSF         PORTA+0, 7 
L__main112:
	BTFSC       PORTA+0, 7 
	GOTO        L__main113
	BCF         PORTA+0, 6 
	GOTO        L__main114
L__main113:
	BSF         PORTA+0, 6 
L__main114:
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
	GOTO        L__main115
	BCF         PORTA+0, 7 
	GOTO        L__main116
L__main115:
	BSF         PORTA+0, 7 
L__main116:
	BTFSC       PORTA+0, 7 
	GOTO        L__main117
	BCF         PORTA+0, 5 
	GOTO        L__main118
L__main117:
	BSF         PORTA+0, 5 
L__main118:
	BTFSC       PORTA+0, 5 
	GOTO        L__main119
	BCF         PORTA+0, 4 
	GOTO        L__main120
L__main119:
	BSF         PORTA+0, 4 
L__main120:
;BlackShadow_code.c,121 :: 		while(1){
L_main4:
;BlackShadow_code.c,123 :: 		if      (SL1 ==0 && S6 ==0 && S2 ==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_main8
	BTFSC       PORTB+0, 4 
	GOTO        L_main8
	BTFSC       PORTC+0, 6 
	GOTO        L_main8
L__main95:
;BlackShadow_code.c,124 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,125 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;BlackShadow_code.c,126 :: 		BRAKE();
	CALL        _BRAKE+0, 0
;BlackShadow_code.c,127 :: 		}
	GOTO        L_main10
L_main8:
;BlackShadow_code.c,128 :: 		else if (SL1 ==1 && S6 ==0 && S2 ==0){
	BTFSS       PORTC+0, 0 
	GOTO        L_main13
	BTFSC       PORTB+0, 4 
	GOTO        L_main13
	BTFSC       PORTC+0, 6 
	GOTO        L_main13
L__main94:
;BlackShadow_code.c,129 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,130 :: 		delay_ms(100);
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
;BlackShadow_code.c,131 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,133 :: 		}
	GOTO        L_main15
L_main13:
;BlackShadow_code.c,134 :: 		else if (SL1 ==0 && S6 ==1 && S2 ==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_main18
	BTFSS       PORTB+0, 4 
	GOTO        L_main18
	BTFSC       PORTC+0, 6 
	GOTO        L_main18
L__main93:
;BlackShadow_code.c,135 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,136 :: 		}
	GOTO        L_main19
L_main18:
;BlackShadow_code.c,137 :: 		else if (SL1 ==1 && S6==1 && S2 ==0){
	BTFSS       PORTC+0, 0 
	GOTO        L_main22
	BTFSS       PORTB+0, 4 
	GOTO        L_main22
	BTFSC       PORTC+0, 6 
	GOTO        L_main22
L__main92:
;BlackShadow_code.c,138 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,139 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	NOP
	NOP
;BlackShadow_code.c,140 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,142 :: 		}
	GOTO        L_main24
L_main22:
;BlackShadow_code.c,143 :: 		else if (SL1 ==0 && S6==0 && S2 ==1){
	BTFSC       PORTC+0, 0 
	GOTO        L_main27
	BTFSC       PORTB+0, 4 
	GOTO        L_main27
	BTFSS       PORTC+0, 6 
	GOTO        L_main27
L__main91:
;BlackShadow_code.c,144 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,145 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main28:
	DECFSZ      R13, 1, 1
	BRA         L_main28
	DECFSZ      R12, 1, 1
	BRA         L_main28
	DECFSZ      R11, 1, 1
	BRA         L_main28
	NOP
;BlackShadow_code.c,146 :: 		}
	GOTO        L_main29
L_main27:
;BlackShadow_code.c,147 :: 		else if (SL1 ==1 && S6==0 && S2 ==1){
	BTFSS       PORTC+0, 0 
	GOTO        L_main32
	BTFSC       PORTB+0, 4 
	GOTO        L_main32
	BTFSS       PORTC+0, 6 
	GOTO        L_main32
L__main90:
;BlackShadow_code.c,148 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,149 :: 		}
	GOTO        L_main33
L_main32:
;BlackShadow_code.c,150 :: 		else if (SL1 ==0 && S6==1 && S2 ==1){
	BTFSC       PORTC+0, 0 
	GOTO        L_main36
	BTFSS       PORTB+0, 4 
	GOTO        L_main36
	BTFSS       PORTC+0, 6 
	GOTO        L_main36
L__main89:
;BlackShadow_code.c,151 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,152 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	NOP
	NOP
;BlackShadow_code.c,153 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,154 :: 		}
	GOTO        L_main38
L_main36:
;BlackShadow_code.c,155 :: 		else if (SL1 ==1 && S6==1 && S2 ==1){
	BTFSS       PORTC+0, 0 
	GOTO        L_main41
	BTFSS       PORTB+0, 4 
	GOTO        L_main41
	BTFSS       PORTC+0, 6 
	GOTO        L_main41
L__main88:
;BlackShadow_code.c,156 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,157 :: 		}
	GOTO        L_main42
L_main41:
;BlackShadow_code.c,159 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,160 :: 		}
L_main42:
L_main38:
L_main33:
L_main29:
L_main24:
L_main19:
L_main15:
L_main10:
;BlackShadow_code.c,164 :: 		}
	GOTO        L_main4
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
L__SELEC122:
	BZ          L__SELEC123
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__SELEC122
L__SELEC123:
	MOVF        R0, 0 
	ADDWF       SELEC_seleccion_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      SELEC_seleccion_L0+1, 1 
;BlackShadow_code.c,173 :: 		switch(seleccion){
	GOTO        L_SELEC43
;BlackShadow_code.c,174 :: 		case 0: L0=L1=L2=L3=1;
L_SELEC45:
	BSF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC124
	BCF         PORTA+0, 5 
	GOTO        L__SELEC125
L__SELEC124:
	BSF         PORTA+0, 5 
L__SELEC125:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC126
	BCF         PORTA+0, 7 
	GOTO        L__SELEC127
L__SELEC126:
	BSF         PORTA+0, 7 
L__SELEC127:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC128
	BCF         PORTA+0, 6 
	GOTO        L__SELEC129
L__SELEC128:
	BSF         PORTA+0, 6 
L__SELEC129:
;BlackShadow_code.c,177 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,179 :: 		case 1: L0=0; L3=L2=L1=1;
L_SELEC46:
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC130
	BCF         PORTA+0, 5 
	GOTO        L__SELEC131
L__SELEC130:
	BSF         PORTA+0, 5 
L__SELEC131:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC132
	BCF         PORTA+0, 4 
	GOTO        L__SELEC133
L__SELEC132:
	BSF         PORTA+0, 4 
L__SELEC133:
;BlackShadow_code.c,181 :: 		while(1){
L_SELEC47:
;BlackShadow_code.c,182 :: 		if(S4 != 0 && S3 != 0){
	BTFSS       PORTB+0, 2 
	GOTO        L_SELEC51
	BTFSS       PORTB+0, 1 
	GOTO        L_SELEC51
L__SELEC97:
;BlackShadow_code.c,183 :: 		REC();
	CALL        _REC+0, 0
;BlackShadow_code.c,184 :: 		}
	GOTO        L_SELEC52
L_SELEC51:
;BlackShadow_code.c,186 :: 		else if(S4 == 0 && S3 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC55
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC55
L__SELEC96:
;BlackShadow_code.c,187 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,188 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC56:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC56
	DECFSZ      R12, 1, 1
	BRA         L_SELEC56
	DECFSZ      R11, 1, 1
	BRA         L_SELEC56
	NOP
;BlackShadow_code.c,189 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,190 :: 		delay_ms(100);
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
;BlackShadow_code.c,191 :: 		}
	GOTO        L_SELEC58
L_SELEC55:
;BlackShadow_code.c,192 :: 		else if (S3 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_SELEC59
;BlackShadow_code.c,193 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,194 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC60:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC60
	DECFSZ      R12, 1, 1
	BRA         L_SELEC60
	DECFSZ      R11, 1, 1
	BRA         L_SELEC60
	NOP
;BlackShadow_code.c,195 :: 		GIRO360();
	CALL        _GIRO360+0, 0
;BlackShadow_code.c,196 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC61:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC61
	DECFSZ      R12, 1, 1
	BRA         L_SELEC61
	DECFSZ      R11, 1, 1
	BRA         L_SELEC61
	NOP
;BlackShadow_code.c,197 :: 		}
	GOTO        L_SELEC62
L_SELEC59:
;BlackShadow_code.c,198 :: 		else if (S4 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_SELEC63
;BlackShadow_code.c,199 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,200 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_SELEC64:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC64
	DECFSZ      R12, 1, 1
	BRA         L_SELEC64
	DECFSZ      R11, 1, 1
	BRA         L_SELEC64
	NOP
;BlackShadow_code.c,201 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,202 :: 		delay_ms(100);
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
;BlackShadow_code.c,203 :: 		}
L_SELEC63:
L_SELEC62:
L_SELEC58:
L_SELEC52:
;BlackShadow_code.c,204 :: 		}
	GOTO        L_SELEC47
;BlackShadow_code.c,207 :: 		case 2: L1=0; L3=L2=L0=1;
L_SELEC66:
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC134
	BCF         PORTA+0, 5 
	GOTO        L__SELEC135
L__SELEC134:
	BSF         PORTA+0, 5 
L__SELEC135:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC136
	BCF         PORTA+0, 4 
	GOTO        L__SELEC137
L__SELEC136:
	BSF         PORTA+0, 4 
L__SELEC137:
;BlackShadow_code.c,209 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,211 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,213 :: 		case 3: L0=L1=0; L2=L3==1;
L_SELEC67:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC138
	BCF         PORTA+0, 6 
	GOTO        L__SELEC139
L__SELEC138:
	BSF         PORTA+0, 6 
L__SELEC139:
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC140
	BCF         PORTA+0, 5 
	GOTO        L__SELEC141
L__SELEC140:
	BSF         PORTA+0, 5 
L__SELEC141:
;BlackShadow_code.c,214 :: 		IZQ();
	CALL        _IZQ+0, 0
;BlackShadow_code.c,215 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC68:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC68
	DECFSZ      R12, 1, 1
	BRA         L_SELEC68
	DECFSZ      R11, 1, 1
	BRA         L_SELEC68
	NOP
	NOP
;BlackShadow_code.c,216 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,217 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC69:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC69
	DECFSZ      R12, 1, 1
	BRA         L_SELEC69
	DECFSZ      R11, 1, 1
	BRA         L_SELEC69
;BlackShadow_code.c,219 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,221 :: 		case 4: L2=0; L3=L1=L0=1;
L_SELEC70:
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC142
	BCF         PORTA+0, 7 
	GOTO        L__SELEC143
L__SELEC142:
	BSF         PORTA+0, 7 
L__SELEC143:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC144
	BCF         PORTA+0, 4 
	GOTO        L__SELEC145
L__SELEC144:
	BSF         PORTA+0, 4 
L__SELEC145:
;BlackShadow_code.c,222 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,223 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_SELEC71:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC71
	DECFSZ      R12, 1, 1
	BRA         L_SELEC71
	DECFSZ      R11, 1, 1
	BRA         L_SELEC71
	NOP
	NOP
;BlackShadow_code.c,224 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,225 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_SELEC72:
	DECFSZ      R13, 1, 1
	BRA         L_SELEC72
	DECFSZ      R12, 1, 1
	BRA         L_SELEC72
	DECFSZ      R11, 1, 1
	BRA         L_SELEC72
;BlackShadow_code.c,226 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,228 :: 		case 5: L2=L0=0; L3=L1=1;
L_SELEC73:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC146
	BCF         PORTA+0, 5 
	GOTO        L__SELEC147
L__SELEC146:
	BSF         PORTA+0, 5 
L__SELEC147:
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC148
	BCF         PORTA+0, 4 
	GOTO        L__SELEC149
L__SELEC148:
	BSF         PORTA+0, 4 
L__SELEC149:
;BlackShadow_code.c,229 :: 		DER();
	CALL        _DER+0, 0
;BlackShadow_code.c,230 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,232 :: 		case 6: L1=L2=0; L3=L0=1;
L_SELEC74:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC150
	BCF         PORTA+0, 7 
	GOTO        L__SELEC151
L__SELEC150:
	BSF         PORTA+0, 7 
L__SELEC151:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC152
	BCF         PORTA+0, 4 
	GOTO        L__SELEC153
L__SELEC152:
	BSF         PORTA+0, 4 
L__SELEC153:
;BlackShadow_code.c,233 :: 		GIRO180();
	CALL        _GIRO180+0, 0
;BlackShadow_code.c,235 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,237 :: 		case 7: L2=L1=L0=0; L3=1;
L_SELEC75:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC154
	BCF         PORTA+0, 7 
	GOTO        L__SELEC155
L__SELEC154:
	BSF         PORTA+0, 7 
L__SELEC155:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC156
	BCF         PORTA+0, 5 
	GOTO        L__SELEC157
L__SELEC156:
	BSF         PORTA+0, 5 
L__SELEC157:
	BSF         PORTA+0, 4 
;BlackShadow_code.c,239 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,241 :: 		case 8: L3=0; L1=L2=L0=1;
L_SELEC76:
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC158
	BCF         PORTA+0, 5 
	GOTO        L__SELEC159
L__SELEC158:
	BSF         PORTA+0, 5 
L__SELEC159:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC160
	BCF         PORTA+0, 7 
	GOTO        L__SELEC161
L__SELEC160:
	BSF         PORTA+0, 7 
L__SELEC161:
;BlackShadow_code.c,243 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,245 :: 		case 9: L0=L3=0; L1=L2=1;
L_SELEC77:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC162
	BCF         PORTA+0, 6 
	GOTO        L__SELEC163
L__SELEC162:
	BSF         PORTA+0, 6 
L__SELEC163:
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC164
	BCF         PORTA+0, 7 
	GOTO        L__SELEC165
L__SELEC164:
	BSF         PORTA+0, 7 
L__SELEC165:
;BlackShadow_code.c,248 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,250 :: 		case 10: L3=L1=0; L2=L0=1;
L_SELEC78:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC166
	BCF         PORTA+0, 4 
	GOTO        L__SELEC167
L__SELEC166:
	BSF         PORTA+0, 4 
L__SELEC167:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC168
	BCF         PORTA+0, 5 
	GOTO        L__SELEC169
L__SELEC168:
	BSF         PORTA+0, 5 
L__SELEC169:
;BlackShadow_code.c,251 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,253 :: 		case 11: L0=L1=L3=0; L2=1;
L_SELEC79:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
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
	BSF         PORTA+0, 5 
;BlackShadow_code.c,254 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,256 :: 		case 12: L3=L2=0; L1=L0=1;
L_SELEC80:
	BCF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC174
	BCF         PORTA+0, 4 
	GOTO        L__SELEC175
L__SELEC174:
	BSF         PORTA+0, 4 
L__SELEC175:
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC176
	BCF         PORTA+0, 7 
	GOTO        L__SELEC177
L__SELEC176:
	BSF         PORTA+0, 7 
L__SELEC177:
;BlackShadow_code.c,257 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,259 :: 		case 13: L3=L2=L0=0; L1=1;
L_SELEC81:
	BCF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__SELEC178
	BCF         PORTA+0, 5 
	GOTO        L__SELEC179
L__SELEC178:
	BSF         PORTA+0, 5 
L__SELEC179:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC180
	BCF         PORTA+0, 4 
	GOTO        L__SELEC181
L__SELEC180:
	BSF         PORTA+0, 4 
L__SELEC181:
	BSF         PORTA+0, 7 
;BlackShadow_code.c,260 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,262 :: 		case 14: L3=L2=L1=0; L0=1;
L_SELEC82:
	BCF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC182
	BCF         PORTA+0, 5 
	GOTO        L__SELEC183
L__SELEC182:
	BSF         PORTA+0, 5 
L__SELEC183:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC184
	BCF         PORTA+0, 4 
	GOTO        L__SELEC185
L__SELEC184:
	BSF         PORTA+0, 4 
L__SELEC185:
	BSF         PORTA+0, 6 
;BlackShadow_code.c,263 :: 		break;
	GOTO        L_SELEC44
;BlackShadow_code.c,265 :: 		default: L0=L1=L2=L3=0;
L_SELEC83:
	BCF         PORTA+0, 4 
	BTFSC       PORTA+0, 4 
	GOTO        L__SELEC186
	BCF         PORTA+0, 5 
	GOTO        L__SELEC187
L__SELEC186:
	BSF         PORTA+0, 5 
L__SELEC187:
	BTFSC       PORTA+0, 5 
	GOTO        L__SELEC188
	BCF         PORTA+0, 7 
	GOTO        L__SELEC189
L__SELEC188:
	BSF         PORTA+0, 7 
L__SELEC189:
	BTFSC       PORTA+0, 7 
	GOTO        L__SELEC190
	BCF         PORTA+0, 6 
	GOTO        L__SELEC191
L__SELEC190:
	BSF         PORTA+0, 6 
L__SELEC191:
;BlackShadow_code.c,266 :: 		}
	GOTO        L_SELEC44
L_SELEC43:
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC192
	MOVLW       0
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC192:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC45
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC193
	MOVLW       1
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC193:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC46
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC194
	MOVLW       2
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC194:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC66
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC195
	MOVLW       3
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC195:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC67
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC196
	MOVLW       4
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC196:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC70
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC197
	MOVLW       5
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC197:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC73
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC198
	MOVLW       6
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC198:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC74
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC199
	MOVLW       7
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC199:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC75
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC200
	MOVLW       8
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC200:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC76
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC201
	MOVLW       9
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC201:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC77
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC202
	MOVLW       10
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC202:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC78
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC203
	MOVLW       11
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC203:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC79
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC204
	MOVLW       12
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC204:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC80
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC205
	MOVLW       13
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC205:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC81
	MOVLW       0
	XORWF       SELEC_seleccion_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SELEC206
	MOVLW       14
	XORWF       SELEC_seleccion_L0+0, 0 
L__SELEC206:
	BTFSC       STATUS+0, 2 
	GOTO        L_SELEC82
	GOTO        L_SELEC83
L_SELEC44:
;BlackShadow_code.c,269 :: 		}
L_end_SELEC:
	RETURN      0
; end of _SELEC

_Start:

;BlackShadow_code.c,271 :: 		void Start(){
;BlackShadow_code.c,272 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,273 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,274 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,275 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,276 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;BlackShadow_code.c,277 :: 		return;
;BlackShadow_code.c,278 :: 		}
L_end_Start:
	RETURN      0
; end of _Start

_Stop:

;BlackShadow_code.c,279 :: 		void Stop(){
;BlackShadow_code.c,280 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;BlackShadow_code.c,281 :: 		PWM2_Stop();
	CALL        _PWM2_Stop+0, 0
;BlackShadow_code.c,282 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;BlackShadow_code.c,283 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;BlackShadow_code.c,284 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;BlackShadow_code.c,285 :: 		}
L_end_Stop:
	RETURN      0
; end of _Stop

_REC:

;BlackShadow_code.c,292 :: 		void REC(){
;BlackShadow_code.c,294 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,296 :: 		PWM1_Set_Duty(170); // IN1 = PWM
	MOVLW       170
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,297 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,300 :: 		PWM3_Set_Duty(120);    // IN1 = 0
	MOVLW       120
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,301 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,302 :: 		}
L_end_REC:
	RETURN      0
; end of _REC

_DER:

;BlackShadow_code.c,303 :: 		void DER(){
;BlackShadow_code.c,304 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,305 :: 		PWM1_Set_Duty(200);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,306 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,308 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,309 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,311 :: 		}
L_end_DER:
	RETURN      0
; end of _DER

_IZQ:

;BlackShadow_code.c,312 :: 		void IZQ(){
;BlackShadow_code.c,313 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,314 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,315 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,317 :: 		PWM3_Set_Duty(160);
	MOVLW       160
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,318 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,319 :: 		}
L_end_IZQ:
	RETURN      0
; end of _IZQ

_REV:

;BlackShadow_code.c,321 :: 		void REV(){
;BlackShadow_code.c,322 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,323 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,324 :: 		PWM2_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,325 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,326 :: 		PWM4_Set_Duty(190);
	MOVLW       190
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,328 :: 		}
L_end_REV:
	RETURN      0
; end of _REV

_LIBRE:

;BlackShadow_code.c,330 :: 		void LIBRE(){
;BlackShadow_code.c,332 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,333 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,334 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,335 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,336 :: 		}
L_end_LIBRE:
	RETURN      0
; end of _LIBRE

_GIRO180:

;BlackShadow_code.c,340 :: 		void GIRO180(){
;BlackShadow_code.c,341 :: 		Start();
	CALL        _Start+0, 0
;BlackShadow_code.c,343 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,344 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,346 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,347 :: 		PWM4_Set_Duty(180);
	MOVLW       180
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,348 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_GIRO18084:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO18084
	DECFSZ      R12, 1, 1
	BRA         L_GIRO18084
	DECFSZ      R11, 1, 1
	BRA         L_GIRO18084
;BlackShadow_code.c,349 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,352 :: 		}
L_end_GIRO180:
	RETURN      0
; end of _GIRO180

_GIRO360:

;BlackShadow_code.c,354 :: 		void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
;BlackShadow_code.c,355 :: 		IZQ();                         //de la Izquierda
	CALL        _IZQ+0, 0
;BlackShadow_code.c,356 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_GIRO36085:
	DECFSZ      R13, 1, 1
	BRA         L_GIRO36085
	DECFSZ      R12, 1, 1
	BRA         L_GIRO36085
	DECFSZ      R11, 1, 1
	BRA         L_GIRO36085
	NOP
	NOP
;BlackShadow_code.c,357 :: 		HARD();
	CALL        _HARD+0, 0
;BlackShadow_code.c,359 :: 		}
L_end_GIRO360:
	RETURN      0
; end of _GIRO360

_BRAKE:

;BlackShadow_code.c,361 :: 		void BRAKE(){
;BlackShadow_code.c,363 :: 		Stop();
	CALL        _Stop+0, 0
;BlackShadow_code.c,364 :: 		LATC.F2=0;                                //PWM1
	BCF         LATC+0, 2 
;BlackShadow_code.c,365 :: 		LATC.F1=0;                                //PWM2                                 -
	BCF         LATC+0, 1 
;BlackShadow_code.c,366 :: 		LATB.F5=0;                                //PWM3
	BCF         LATB+0, 5 
;BlackShadow_code.c,367 :: 		LATB.F0=0;                                //PWM4
	BCF         LATB+0, 0 
;BlackShadow_code.c,370 :: 		}
L_end_BRAKE:
	RETURN      0
; end of _BRAKE

_HARD:

;BlackShadow_code.c,371 :: 		void HARD(){
;BlackShadow_code.c,372 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,373 :: 		PWM2_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,374 :: 		PWM3_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,375 :: 		PWM4_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,377 :: 		}
L_end_HARD:
	RETURN      0
; end of _HARD

_INTERRUPT:

;BlackShadow_code.c,380 :: 		void INTERRUPT(){
;BlackShadow_code.c,383 :: 		if (INTCON3.INT1IF) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPT86
;BlackShadow_code.c,384 :: 		INTCON3.INT1IF = 0; // Limpia la bandera de INT1
	BCF         INTCON3+0, 0 
;BlackShadow_code.c,385 :: 		linea_izq_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_izq_detectada+0 
;BlackShadow_code.c,387 :: 		}
L_INTERRUPT86:
;BlackShadow_code.c,389 :: 		if (INTCON3.INT2IF) {
	BTFSS       INTCON3+0, 1 
	GOTO        L_INTERRUPT87
;BlackShadow_code.c,390 :: 		INTCON3.INT2IF = 0; // Limpia la bandera de INT2
	BCF         INTCON3+0, 1 
;BlackShadow_code.c,391 :: 		linea_der_detectada = 1;    // Solo activa la bandera
	MOVLW       1
	MOVWF       _linea_der_detectada+0 
;BlackShadow_code.c,392 :: 		}
L_INTERRUPT87:
;BlackShadow_code.c,393 :: 		}
L_end_INTERRUPT:
L__INTERRUPT219:
	RETFIE      1
; end of _INTERRUPT
