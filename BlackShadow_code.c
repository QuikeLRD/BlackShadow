//Lerdo Crisostomo Luis Enrique
#define SW3 PORTA.F0
#define SW2 PORTA.F1
#define SW1 PORTA.F2
#define SW0 PORTA.F3
#define L3  PORTA.F4
#define L2  PORTA.F5
#define L0  PORTA.F6
#define L1  PORTA.F7

#define I2  PORTB.F0
#define S3  PORTB.F1
#define S4  PORTB.F2
#define S5  PORTB.F3
#define S6  PORTB.F4                           //SENSOR LATERAL DERECHO
#define I1  PORTB.F5
#define CLK PORTB.F6
#define DAT PORTB.F7

#define SL1 PORTC.F0                          //SENSOR LATERAL IZQUIERDO
#define D2  PORTC.F1
#define D1  PORTC.F2
#define CH2 PORTC.F3
#define SL2 PORTC.F4
#define S1  PORTC.F5
#define S2  PORTC.F6                          //SENSOR FRONTAL
#define GO  PORTC.F7

//======================//
//==Variables globales==//
//=====================//
volatile char linea_izq_detectada = 0;
volatile char linea_der_detectada = 0;

//==========================//
//==Prototipos de funci�n==//
//========================//
void SELEC();
void Start();
void Stop();
void SELEC();
void INTERRUPT();
void HARD();
void PUSH();

void REC();
void REV();
void DER();
void IZQ();
void BRAKE();
void LIBRE();
void GIRO180();
void GIRO360();
void HIT();

//======================//
//==Codigo General=====//
//====================//
void main() {
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

 //CONFIGURACI�N DE INTERRUPCIONES
 //CONFIGURAMOS INTERRUPCIONES
 INTCON3.INT1IE =1;                               //habilitamos interrupci�n INT1 (RB1)
 INTCON3.INT2IE =1;                                //habilitamos interrupci�n INT2 (RB2)
 //ACTIVACI�N POR FLANCO DE BAJADA
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
 L0=0; L3=L2=L1=1;
 delay_ms(300);
 L1=0; L3=L2=L0=1;
 delay_ms(300);
 L2=0; L3=L1=L0=1;
 delay_ms(300);
 L3=0; L0=L1=L2=1;
 delay_ms(300);
 L3=L2=L1=L0=1;
 delay_ms(1000);

while(1){

         SELEC();
    // Prueba sensores de l�nea:
    // if(S4 == 0) L0 = 0; else L0 = 1; // Si es blanco, LED encendido
    // if(S3 == 0) L2 = 0; else L2 = 1;
}
}
//======================//
//======Funciones======//
//====================//
void SELEC(){
     int seleccion;
 seleccion=SW0*1+SW1*2+SW2*4+SW3*8;

   switch(seleccion){
   case 0: L0=L1=L2=L3=1;


   break;

   case 1: L0=0; L3=L2=L1=1;

    while(1){
    if(S4 != 0 && S3 != 0){
        REC();
    }

    else if(S4 == 0 && S3 == 0){
         HARD();
         delay_ms(100);
         GIRO180();
         delay_ms(100);
    }
    else if (S3 == 0){
        HARD();
        delay_ms(100);
        GIRO360();
        delay_ms(100);
    }
    else if (S4 == 0){
        HARD();
        delay_ms(100);
        DER();
        delay_ms(100);
    }
  }
   break;

   case 2: L1=0; L3=L2=L0=1; delay_ms(250);
   

    while(1){
    if      (SL1 ==0 && S6 ==0 && S2 ==0){
    
    L0=L1=L2=L3=1;
    REC();
    delay_ms(20);
    LIBRE();
    delay_ms(100);
    }
    else if (SL1 ==1 && S6 ==0 && S2 ==0){
    L0=0;   L1=L2=L3=1;
    IZQ();
    delay_ms(100);
    HARD();

    }
    else if (SL1 ==0 && S6 ==1 && S2 ==0){
    L1=0;   L0=L2=L3=1;
    HIT();
    }
    else if (SL1 ==1 && S6==1 && S2 ==0){
    L0=L1=0;     L2=L3=1;
    IZQ();
    delay_ms(20);
    HIT();

    }
    else if (SL1 ==0 && S6==0 && S2 ==1){
    L2=0;   L0=L1=L3=1;
    DER();
    delay_ms(100);
    HARD();
    
    }
    else if (SL1 ==1 && S6==0 && S2 ==1){
    L0=L2=0;     L1=L3=1;
    
    LIBRE();
    }
    else if (SL1 ==0 && S6==1 && S2 ==1){
    L1=L2=0;     L0=L3=0;
    DER();
    delay_ms(30);
    HIT();
    }
    else if (SL1 ==1 && S6==1 && S2 ==1){
    L0=L1=L2=0;  L3=1;
    HIT();
    }
    else{
    L0=L1=L2=L3=0;
    LIBRE();
    }
          
          
    }
   break;

   case 3: L0=L1=0; L2=L3==1;
           HIT();



   break;

   case 4: L2=0; L3=L1=L0=1;
           DER();
           delay_ms(250);
           LIBRE();
           delay_ms(4000);
   break;

   case 5: L2=L0=0; L3=L1=1;
           DER();
   break;

   case 6: L1=L2=0; L3=L0=1;
           GIRO180();
   
   break;

   case 7: L2=L1=L0=0; L3=1;

   break;

   case 8: L3=0; L1=L2=L0=1;

   break;

   case 9: L0=L3=0; L1=L2=1;


   break;

  case 10: L3=L1=0; L2=L0=1;
   break;

  case 11: L0=L1=L3=0; L2=1;
   break;

  case 12: L3=L2=0; L1=L0=1;
   break;

  case 13: L3=L2=L0=0; L1=1;
   break;

  case 14: L3=L2=L1=0; L0=1;
   break;

  default: L0=L1=L2=L3=0;
  }


}

void Start(){
     PWM1_Start();
     PWM2_Start();
     PWM3_Start();
     PWM4_Start();
     PWM5_Start();
     return;
}
void Stop(){
     PWM1_Stop();
     PWM2_Stop();
     PWM3_Stop();
     PWM4_Stop();
     PWM5_Stop();
     }

//================================//
//==Funciones de movimiento======//
//==============================//


void REC(){

    Start();
     // Motor I (PWM1 y PWM2)
    PWM1_Set_Duty(170); // IN1 = PWM
    PWM2_Set_Duty(0);

    // Motor D (PWM3 y PWM4)
    PWM3_Set_Duty(140);    // IN1 = 0
    PWM4_Set_Duty(0);
     }
void DER(){
     Start();
     PWM1_Set_Duty(170);
     PWM2_Set_Duty(0);

     PWM3_Set_Duty(0);
     PWM4_Set_Duty(0);

     }
void IZQ(){
     Start();
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);

     PWM3_Set_Duty(160);
     PWM4_Set_Duty(0);
     }

void REV(){
     Start();
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(190);
     PWM3_Set_Duty(0);
     PWM4_Set_Duty(190);

     }
     
void LIBRE(){

     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);
     PWM3_Set_Duty(0);
     PWM4_Set_Duty(0);
     }
     
     
     
void GIRO180(){
     Start();

     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);

     PWM3_Set_Duty(0);
     PWM4_Set_Duty(180);
     delay_ms(200);
     HARD();


}

void GIRO360(){                     //Produce un grio que beneficia si se activo el sesnor de linea
     IZQ();                         //de la Izquierda
     delay_ms(250);
     HARD();

}

void BRAKE(){

    Stop();
    LATC.F2=0;                                //PWM1
    LATC.F1=0;                                //PWM2                                 -
    LATB.F5=0;                                //PWM3
    LATB.F0=0;                                //PWM4


}
void HARD(){
     PWM1_Set_Duty(255);
     PWM2_Set_Duty(255);
     PWM3_Set_Duty(255);
     PWM4_Set_Duty(255);

}
void PUSH(){
     Start();
     // Motor I (PWM1 y PWM2)
    PWM1_Set_Duty(255); // IN1 = PWM
    PWM2_Set_Duty(0);

    // Motor D (PWM3 y PWM4)
    PWM3_Set_Duty(205);    // IN1 = 0
    PWM4_Set_Duty(0);

}
void HIT(){
     
     REC();
     delay_ms(20);
     PUSH();
     delay_ms(250);
}

void INTERRUPT(){

  // INT1 - Sensor de l�nea izquierda
    if (INTCON3.INT1IF) {
        INTCON3.INT1IF = 0; // Limpia la bandera de INT1
        linea_izq_detectada = 1;    // Solo activa la bandera

}
    // INT2 - Sensor de l�nea derecha
    if (INTCON3.INT2IF) {
        INTCON3.INT2IF = 0; // Limpia la bandera de INT2
         linea_der_detectada = 1;    // Solo activa la bandera
    }
}