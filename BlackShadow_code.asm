
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
;BlackShadow_code.c,58 :: 		while(1){
L_main0:
;BlackShadow_code.c,59 :: 		if (DAT == 0) {
	BTFSC       PORTB+0, 7 
	GOTO        L_main2
;BlackShadow_code.c,60 :: 		WAIT(); // Solo parpadea si DAT se baja
	CALL        _WAIT+0, 0
;BlackShadow_code.c,61 :: 		} else {
	GOTO        L_main3
L_main2:
;BlackShadow_code.c,62 :: 		SELEC(); // Si go está activo, combate inmediato
	CALL        _SELEC+0, 0
;BlackShadow_code.c,63 :: 		}
L_main3:
;BlackShadow_code.c,64 :: 		}
	GOTO        L_main0
;BlackShadow_code.c,65 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
