
_main:

;BlackShadow_code.c,3 :: 		void main() {
;BlackShadow_code.c,5 :: 		millis_init();
	CALL        _millis_init+0, 0
;BlackShadow_code.c,6 :: 		OSCCON = 0b01100110;
	MOVLW       102
	MOVWF       OSCCON+0 
;BlackShadow_code.c,9 :: 		PORTA = 0;
	CLRF        PORTA+0 
;BlackShadow_code.c,10 :: 		PORTB = 0;
	CLRF        PORTB+0 
;BlackShadow_code.c,11 :: 		PORTC = 0;
	CLRF        PORTC+0 
;BlackShadow_code.c,14 :: 		TRISA= 0b00001111;   //El bit 1 del PortaA0 es el ultimo.     //0X0F
	MOVLW       15
	MOVWF       TRISA+0 
;BlackShadow_code.c,15 :: 		TRISB= 0b11011110;    //El bit que tenemos hasta la izquierda es el numero 7.DAT Y CLK se dejan como entrada aunque pueden ser salida, el micro los ocupa para programar
	MOVLW       222
	MOVWF       TRISB+0 
;BlackShadow_code.c,16 :: 		TRISC= 0b11111001;
	MOVLW       249
	MOVWF       TRISC+0 
;BlackShadow_code.c,18 :: 		ANSELA= 0b00000000;
	CLRF        ANSELA+0 
;BlackShadow_code.c,19 :: 		ANSELB= 0b00000000;
	CLRF        ANSELB+0 
;BlackShadow_code.c,20 :: 		ANSELC= 0b00000000;
	CLRF        ANSELC+0 
;BlackShadow_code.c,24 :: 		INTCON3.INT1IE =1;                               //habilitamos interrupción INT1 (RB1)
	BSF         INTCON3+0, 3 
;BlackShadow_code.c,25 :: 		INTCON3.INT2IE =1;                                //habilitamos interrupción INT2 (RB2)
	BSF         INTCON3+0, 4 
;BlackShadow_code.c,27 :: 		INTCON2.INTEDG1 =0;                               //INT1: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 5 
;BlackShadow_code.c,28 :: 		INTCON2.INTEDG2 =0;                                //INT2: Interrumpe en flanco de bajada
	BCF         INTCON2+0, 4 
;BlackShadow_code.c,30 :: 		INTCON.GIE =1;                                    //Interrupciones globales
	BSF         INTCON+0, 7 
;BlackShadow_code.c,31 :: 		INTCON.PEIE =1;                                   //Interrupciones perifericas
	BSF         INTCON+0, 6 
;BlackShadow_code.c,38 :: 		PWM1_Init(20000);   //Se debe poner a 20 000 para el motor y 1000 para simular
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;BlackShadow_code.c,39 :: 		PWM2_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;BlackShadow_code.c,40 :: 		PWM3_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;BlackShadow_code.c,41 :: 		PWM4_Init(20000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;BlackShadow_code.c,44 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;BlackShadow_code.c,45 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;BlackShadow_code.c,46 :: 		PWM3_Set_Duty(0);
	CLRF        FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;BlackShadow_code.c,47 :: 		PWM4_Set_Duty(0);
	CLRF        FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;BlackShadow_code.c,49 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;BlackShadow_code.c,50 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;BlackShadow_code.c,51 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;BlackShadow_code.c,52 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;BlackShadow_code.c,58 :: 		while (DAT == 0){
L_main0:
	BTFSC       PORTB+0, 7 
	GOTO        L_main1
;BlackShadow_code.c,59 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main20
	BCF         PORTA+0, 5 
	GOTO        L__main21
L__main20:
	BSF         PORTA+0, 5 
L__main21:
	BTFSC       PORTA+0, 5 
	GOTO        L__main22
	BCF         PORTA+0, 4 
	GOTO        L__main23
L__main22:
	BSF         PORTA+0, 4 
L__main23:
;BlackShadow_code.c,60 :: 		delay_ms(300);
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
;BlackShadow_code.c,61 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main24
	BCF         PORTA+0, 5 
	GOTO        L__main25
L__main24:
	BSF         PORTA+0, 5 
L__main25:
	BTFSC       PORTA+0, 5 
	GOTO        L__main26
	BCF         PORTA+0, 4 
	GOTO        L__main27
L__main26:
	BSF         PORTA+0, 4 
L__main27:
;BlackShadow_code.c,62 :: 		delay_ms(300);
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
;BlackShadow_code.c,63 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main28
	BCF         PORTA+0, 7 
	GOTO        L__main29
L__main28:
	BSF         PORTA+0, 7 
L__main29:
	BTFSC       PORTA+0, 7 
	GOTO        L__main30
	BCF         PORTA+0, 4 
	GOTO        L__main31
L__main30:
	BSF         PORTA+0, 4 
L__main31:
;BlackShadow_code.c,64 :: 		delay_ms(300);
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
;BlackShadow_code.c,65 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main32
	BCF         PORTA+0, 7 
	GOTO        L__main33
L__main32:
	BSF         PORTA+0, 7 
L__main33:
	BTFSC       PORTA+0, 7 
	GOTO        L__main34
	BCF         PORTA+0, 6 
	GOTO        L__main35
L__main34:
	BSF         PORTA+0, 6 
L__main35:
;BlackShadow_code.c,66 :: 		delay_ms(300);
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
;BlackShadow_code.c,67 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main36
	BCF         PORTA+0, 7 
	GOTO        L__main37
L__main36:
	BSF         PORTA+0, 7 
L__main37:
	BTFSC       PORTA+0, 7 
	GOTO        L__main38
	BCF         PORTA+0, 5 
	GOTO        L__main39
L__main38:
	BSF         PORTA+0, 5 
L__main39:
	BTFSC       PORTA+0, 5 
	GOTO        L__main40
	BCF         PORTA+0, 4 
	GOTO        L__main41
L__main40:
	BSF         PORTA+0, 4 
L__main41:
;BlackShadow_code.c,68 :: 		delay_ms(1000);
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
;BlackShadow_code.c,69 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,70 :: 		delay_ms(250);
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
;BlackShadow_code.c,71 :: 		}
	GOTO        L_main0
L_main1:
;BlackShadow_code.c,72 :: 		while(1){
L_main8:
;BlackShadow_code.c,73 :: 		if (DAT==0){
	BTFSC       PORTB+0, 7 
	GOTO        L_main10
;BlackShadow_code.c,74 :: 		LIBRE();                                     //Deten motores
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,76 :: 		while (DAT == 0){
L_main11:
	BTFSC       PORTB+0, 7 
	GOTO        L_main12
;BlackShadow_code.c,77 :: 		L0=0; L3=L2=L1=1;
	BCF         PORTA+0, 6 
	BSF         PORTA+0, 7 
	BTFSC       PORTA+0, 7 
	GOTO        L__main42
	BCF         PORTA+0, 5 
	GOTO        L__main43
L__main42:
	BSF         PORTA+0, 5 
L__main43:
	BTFSC       PORTA+0, 5 
	GOTO        L__main44
	BCF         PORTA+0, 4 
	GOTO        L__main45
L__main44:
	BSF         PORTA+0, 4 
L__main45:
;BlackShadow_code.c,78 :: 		delay_ms(300);
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
;BlackShadow_code.c,79 :: 		L1=0; L3=L2=L0=1;
	BCF         PORTA+0, 7 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main46
	BCF         PORTA+0, 5 
	GOTO        L__main47
L__main46:
	BSF         PORTA+0, 5 
L__main47:
	BTFSC       PORTA+0, 5 
	GOTO        L__main48
	BCF         PORTA+0, 4 
	GOTO        L__main49
L__main48:
	BSF         PORTA+0, 4 
L__main49:
;BlackShadow_code.c,80 :: 		delay_ms(300);
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
;BlackShadow_code.c,81 :: 		L2=0; L3=L1=L0=1;
	BCF         PORTA+0, 5 
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main50
	BCF         PORTA+0, 7 
	GOTO        L__main51
L__main50:
	BSF         PORTA+0, 7 
L__main51:
	BTFSC       PORTA+0, 7 
	GOTO        L__main52
	BCF         PORTA+0, 4 
	GOTO        L__main53
L__main52:
	BSF         PORTA+0, 4 
L__main53:
;BlackShadow_code.c,82 :: 		delay_ms(300);
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
;BlackShadow_code.c,83 :: 		L3=0; L0=L1=L2=1;
	BCF         PORTA+0, 4 
	BSF         PORTA+0, 5 
	BTFSC       PORTA+0, 5 
	GOTO        L__main54
	BCF         PORTA+0, 7 
	GOTO        L__main55
L__main54:
	BSF         PORTA+0, 7 
L__main55:
	BTFSC       PORTA+0, 7 
	GOTO        L__main56
	BCF         PORTA+0, 6 
	GOTO        L__main57
L__main56:
	BSF         PORTA+0, 6 
L__main57:
;BlackShadow_code.c,84 :: 		delay_ms(300);
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
;BlackShadow_code.c,85 :: 		L3=L2=L1=L0=1;
	BSF         PORTA+0, 6 
	BTFSC       PORTA+0, 6 
	GOTO        L__main58
	BCF         PORTA+0, 7 
	GOTO        L__main59
L__main58:
	BSF         PORTA+0, 7 
L__main59:
	BTFSC       PORTA+0, 7 
	GOTO        L__main60
	BCF         PORTA+0, 5 
	GOTO        L__main61
L__main60:
	BSF         PORTA+0, 5 
L__main61:
	BTFSC       PORTA+0, 5 
	GOTO        L__main62
	BCF         PORTA+0, 4 
	GOTO        L__main63
L__main62:
	BSF         PORTA+0, 4 
L__main63:
;BlackShadow_code.c,86 :: 		delay_ms(1000);
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
;BlackShadow_code.c,87 :: 		LIBRE();
	CALL        _LIBRE+0, 0
;BlackShadow_code.c,88 :: 		delay_ms(250);
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
;BlackShadow_code.c,89 :: 		}
	GOTO        L_main11
L_main12:
;BlackShadow_code.c,90 :: 		}
L_main10:
;BlackShadow_code.c,91 :: 		SELEC();
	CALL        _SELEC+0, 0
;BlackShadow_code.c,93 :: 		}
	GOTO        L_main8
;BlackShadow_code.c,94 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
