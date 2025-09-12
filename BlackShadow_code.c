#include "Configuraciones.h"
#include "milis.h"
void main() {
  
  millis_init();
  OSCCON = 0b01100110;
 
 //LIMPIAMOS LOS PUERTOS
    PORTA = 0;
    PORTB = 0;
    PORTC = 0;
 //DEFINIMOS ENTRADAS Y SALIDAS
 // 7 6 5 4 3 2 1 0
 TRISA= 0b00001111;   //El bit 1 del PortaA0 es el ultimo.     //0X0F
 TRISB= 0b11011110;    //El bit que tenemos hasta la izquierda es el numero 7.DAT Y CLK se dejan como entrada aunque pueden ser salida, el micro los ocupa para programar
 TRISC= 0b11111001;
 //CONFIGURAMOS ENTRADAS ANALOGICAS Y DIGITALES
 ANSELA= 0b00000000;
 ANSELB= 0b00000000;
 ANSELC= 0b00000000;

 //CONFIGURACIÓN DE INTERRUPCIONES
 //CONFIGURAMOS INTERRUPCIONES
 INTCON3.INT1IE =1;                               //habilitamos interrupción INT1 (RB1)
 INTCON3.INT2IE =1;                                //habilitamos interrupción INT2 (RB2)
 //ACTIVACIÓN POR FLANCO DE BAJADA
 INTCON2.INTEDG1 =0;                               //INT1: Interrumpe en flanco de bajada
 INTCON2.INTEDG2 =0;                                //INT2: Interrumpe en flanco de bajada
 //HABILITAMOS INTERRUPCIONES GLOBALES
 INTCON.GIE =1;                                    //Interrupciones globales
 INTCON.PEIE =1;                                   //Interrupciones perifericas
 

//=====================//
//==Inicializar PWM====//
//====================//

 PWM1_Init(20000);   //Se debe poner a 20 000 para el motor y 1000 para simular
 PWM2_Init(20000);
 PWM3_Init(20000);
 PWM4_Init(20000);


 PWM1_Set_Duty(0);
 PWM2_Set_Duty(0);
 PWM3_Set_Duty(0);
 PWM4_Set_Duty(0);
 
 PWM1_Start();
 PWM2_Start();
 PWM3_Start();
 PWM4_Start();

//======================//
//==Codigo General=====//
//====================//
 //Parpadeo de leds para esperar arranque
while(1){
        if (DAT == 0) {
            WAIT(); // Solo parpadea si DAT se baja
        } else {
            SELEC(); // Si go está activo, combate inmediato
        }
    }
}