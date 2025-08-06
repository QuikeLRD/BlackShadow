#include "Configuraciones.h"
//======================//
//==Variables globales==//
//=====================//
volatile char linea_izq_detectada = 0;
volatile char linea_der_detectada = 0;
volatile char linea_detectada = 0;
volatile char golpe = 0;

//MAQUINA DE ESTADOS
typedef enum{

CMB_ESPERA,
CMB_REC,
CMB_IZQ,
CMB_HIT,
CMB_IZQ_GOLPE,
CMB_DER_HARD,
CMB_LIBRE,
CMB_DER_HIT,
CMB_HIT_FULL
} EstadoCombate;

volatile EstadoCombate estado_combate = CMB_ESPERA;


//======================//
//======Funciones======//
//====================//
void INTERRUPT(){

  // INT1 - Sensor de línea izquierda
    if (INTCON3.INT1IF) {
        INTCON3.INT1IF = 0; // Limpia la bandera de INT1
        linea_izq_detectada = 1;    // Solo activa la bandera
        linea_detectada = 1;        //Activamos bandera global
}
    // INT2 - Sensor de línea derecha
    if (INTCON3.INT2IF) {
        INTCON3.INT2IF = 0; // Limpia la bandera de INT2
         linea_der_detectada = 1;    // Solo activa la bandera
         linea_detectada = 1;
    }
}


void SELEC(){
     int seleccion;
 seleccion=SW0*1+SW1*2+SW2*4+SW3*8;

   switch(seleccion){
   case 0: L0=L1=L2=L3=1;


   break;

   case 1: L0=0; L3=L2=L1=1;
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

   break;

   case 2: L1=0; L3=L2=L0=1;
           combate_estado();

   break;

   case 3: L0=L1=0; L2=L3==1;
        DER_Z();
        delay_ms(400);
        HARD();
        delay_ms(50);




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
//=========================//
//==STATE MACHINE====//
//=======================//
void combate_estado() {
    if(linea_detectada){
    LOGICA_LINEA();
    linea_detectada = 0;
    estado_combate = CMB_ESPERA;
    return;
    }
    switch (estado_combate) {
    case CMB_ESPERA:
        if(SL1 == 0 && S2 == 0 && S6 == 0){
            estado_combate = CMB_REC;
        }
        else if (SL1 == 1 && S2 == 0 && S6 == 0){
            estado_combate = CMB_IZQ;
        }
        else if (SL1 == 0 && S2 == 1 && S6 == 0){
            estado_combate = CMB_HIT;
        }
        else if (SL1 == 1 && S2 == 1 && S6 == 0){
            estado_combate = CMB_IZQ_GOLPE;
        }
        else if (SL1 == 0 && S2 == 0 && S6 == 1){
            estado_combate = CMB_DER_HARD;
        }
        else if (SL1 == 1 && S2 == 0 && S6 == 1){
            estado_combate = CMB_LIBRE;
        }
        else if (SL1 == 0 && S2 == 1 && S6 == 1){
            estado_combate = CMB_DER_HIT;
        }
        else if (SL1 == 1 && S2 == 1 && S6 == 1){
            estado_combate = CMB_HIT_FULL;
        }
        else{
            LIBRE();
        }
        break;

    case CMB_REC:
        L0=L1=L2=L3=1;
        REC();
        delay_ms(250);
        LIBRE();
        delay_ms(200);
        estado_combate = CMB_ESPERA;
        break;

    case CMB_IZQ:
        L0=0; L1=L2=L3=1;
        IZQ();
        delay_ms(100);
        HARD();
        delay_ms(100);
        estado_combate = CMB_ESPERA;
        break;

    case CMB_HIT:
        L1=0; L0=L2=L3=1;
        HIT();
        estado_combate = CMB_ESPERA;
        break;

    case CMB_IZQ_GOLPE:
        L0=L1=0; L2=L3=1;
        IZQ();
        delay_ms(20);
        HARD;
        delay_ms(100);
        estado_combate = CMB_ESPERA;
        break;

    case CMB_DER_HARD:
        L2=0; L0=L1=L3=1;
        DER_Z();
        delay_ms(400);
        HARD();
        delay_ms(50);
        estado_combate = CMB_ESPERA;
        break;

    case CMB_LIBRE:
        L0=L2=0; L1=L3=1;
        LIBRE();
        estado_combate = CMB_ESPERA;
        break;

    case CMB_DER_HIT:
        L1=L2=0; L0=L3=1;
        DER_Z();
        delay_ms(400);
        HARD();
        delay_ms(50);
        estado_combate = CMB_ESPERA;
        break;

    case CMB_HIT_FULL:
        L0=L1=L2=0; L3=1;
        HIT();
        estado_combate = CMB_ESPERA;
        break;

    default:
        LIBRE();
        estado_combate = CMB_ESPERA;
        break;
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
void DER_Z(){
     Start();
     PWM1_Set_Duty(230);
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
void LOGICA_LINEA(){
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
