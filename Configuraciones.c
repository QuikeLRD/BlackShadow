#include "Configuraciones.h"
#include "milis.h"
//======================//
//==Variables globales==//
//=====================//
volatile char linea_izq_detectada = 0;
volatile char linea_der_detectada = 0;
volatile char linea_detectada = 0;
volatile char golpe = 0;

volatile EstadoMovimiento estado_movimiento = MOV_IDLE;
volatile EstadoCombate estado_combate = CMB_ESPERA;
volatile unsigned long tiempo_movimiento = 0;
//VARIABLES GIRO IZQUIERDO
volatile SubEstadoIzq sub_cmb_izq = SUB_IZQ_INICIO;
volatile unsigned long t_cmb_izq = 0;

//VARIABLES GIRO DERECHA
volatile SubEstadoDer sub_cmb_der = SUB_DER_INICIO;
volatile unsigned long t_cmb_der = 0;

//VARIABLES RECTO
volatile unsigned long t_cmb_rec = 0;
volatile SubEstadoREC sub_cmb_rec = SUB_REC_INICIO;

//VARIABLES GIRO IZQUIERDA
volatile unsigned long t_cmb_izq_giro =0;
volatile SubEstadoIZQ_GIRO sub_cmb_izq_giro = SUB_IZQ_GIRO;

//VARIABLES GIRO DERECHA
volatile unsigned long t_cmb_der_giro =0;
volatile SubEstadoDER_GIRO sub_cmb_der_giro = SUB_DER_GIRO_INICIO;

//VARIABLES BUSCAR
volatile unsigned long t_cmb_buscar = 0;
volatile SubEstadoBUSCAR sub_cmb_buscar = SUB_BUSCAR_IZQ;

//VARIABLES DETECCIÓN
volatile unsigned long t_cmb_linea = 0;
volatile SubEstadoLINEA sub_cmb_linea = LINEA_IDLE;


//======================//
//======Funciones======//
//====================//
void INTERRUPT_ISR(void) {
    // Timer0: incremento de milisegundos
    if (INTCON.TMR0IF) {
        INTCON.TMR0IF = 0;
        TMR0L = 131;
        ms_ticks++;
    }
    // Aquí van otras interrupciones, por ejemplo las de línea:
    INTERRUPT();
}

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
    //S4 IZQ  S3 DER
   case 1: L0=0; L3=L2=L1=1;
    if(S4 != 0 && S3 != 0){
        L0=L3=L2=L1=1;
        
        REC();
    }
    else if(S4 == 0 && S3 == 0){
         L0=L3=1; L2=L1=0;
         HARD();
         delay_ms(100);
         GIRO180();
         delay_ms(300);
         HARD();
         delay_ms(100);


    }
    else if (S3 == 0){
        L2=0; L0=L3=L1=1;
        HARD();
        delay_ms(100);
        IZQ_L();
        delay_ms(100);



    }    //Caso a revisar
    else if (S4 == 0){
        L0=0; L3=L2=L1=1;

        HARD();
        delay_ms(50);
        DER_L();
        delay_ms(20);
    }

   break;

   case 2: L1=0; L3=L2=L0=1;
           combate_estado();

   break;

   case 3: L0=L1=0; L2=L3==1;
        REC();
        delay_ms(2000);
        HARD();
        delay_ms(500);




   break;

   case 4: L2=0; L3=L1=L0=1;
           GIRO180();
           delay_ms(300);
           HARD();
           delay_ms(750);
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
//===================================//
//==STATE MACHINE PARA EL COMBATE====//
//===================================//
void combate_estado() {
    if(linea_detectada){
    HARD();
    LOGICA_LINEA();
    linea_detectada = 0;
    estado_combate = CMB_ESPERA;
    estado_movimiento = MOV_IDLE;
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
            estado_combate = CMB_DER;
        }
        else if (SL1 == 1 && S2 == 0 && S6 == 1){
            estado_combate = CMB_BUSCAR;
            sub_cmb_buscar = SUB_BUSCAR_IZQ;
            t_cmb_buscar = millis();
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
        REC_M();
        break;

    case CMB_IZQ:
        L0=0; L1=L2=L3=1;
        IZQ_M();
        break;

    case CMB_HIT:
        L1=0; L0=L2=L3=1;
        HIT_NO_BLOQUEANTE();
        break;

    case CMB_IZQ_GOLPE:
        L0=L1=0; L2=L3=1;
        IZQ_GIRO();
        break;

    case CMB_DER:
        L2=0; L0=L1=L3=1;
        DER_M();
        break;

    case CMB_BUSCAR:
        L0=L2=0; L1=L3=1;
        BUSCAR();
        break;

    case CMB_DER_HIT:
        L1=L2=0; L0=L3=1;
        DER_GIRO();
        break;

    case CMB_HIT_FULL:
        L0=L1=L2=0; L3=1;
        HIT_NO_BLOQUEANTE();
        break;

    default:
        LIBRE(); // Detén motores, ponlo en modo seguro
        estado_combate = CMB_ESPERA; // Vuelve a esperar nueva condición
        estado_movimiento = MOV_IDLE; // Resetea movimiento si lo usas
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
    PWM1_Set_Duty(200); // IN1 = PWM
    PWM2_Set_Duty(0);

    // Motor D (PWM3 y PWM4)
    PWM3_Set_Duty(140);    // IN1 = 0
    PWM4_Set_Duty(0);
     }
void DER(){
     Start();
     PWM1_Set_Duty(180);
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

     PWM3_Set_Duty(200);
     PWM4_Set_Duty(0);
     }

void IZQ_L(){
     Start();
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);

     PWM3_Set_Duty(180);
     PWM4_Set_Duty(0);

}
void DER_L(){
     Start();
     PWM1_Set_Duty(200);
     PWM2_Set_Duty(0);

     PWM3_Set_Duty(0);
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
     PWM4_Set_Duty(200);

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
void HIT_NO_BLOQUEANTE(){
     unsigned long now = millis(); // Usa tu función de tiempo

    switch (estado_movimiento) {
        case MOV_IDLE:
            PUSH(); // Avanza rápido
            tiempo_movimiento = now;
            estado_movimiento = MOV_HIT_REC;
            break;

        case MOV_HIT_REC:
            // Espera 20 ms avanzando
            if (now - tiempo_movimiento >= 20) {
                PUSH(); // Empuje fuerte
                tiempo_movimiento = now;
                estado_movimiento = MOV_HIT_PUSH;
            }
            break;

        case MOV_HIT_PUSH:
            // Mantiene empuje mientras S2 detecte rival al frente
            if (S2 == 0) {
                // Sigue empujando
                PUSH();
                tiempo_movimiento = now; // Actualiza tiempo si quieres tiempo máximo de empuje
            } else {
                // Si ya no hay rival, termina empuje
                HARD();
                estado_movimiento = MOV_IDLE;
                estado_combate = CMB_ESPERA;
            }
            // Puedes agregar un timeout de empuje, ejemplo:
            // if (now - tiempo_movimiento >= 1500) { // máximo 1.5 s de empuje frontal
            //     LIBRE();
            //     estado_movimiento = MOV_IDLE;
            //     estado_combate = CMB_ESPERA;
            // }
            break;
    }
}
void IZQ_M(){
        unsigned long now = millis();
    switch (sub_cmb_izq) {

        case SUB_IZQ_INICIO:
            IZQ();
            t_cmb_izq = now;
            sub_cmb_izq = SUB_IZQ_GIRO;
            break;

        case SUB_IZQ_GIRO:
            if (now - t_cmb_izq >= 100) {
                HARD();
                t_cmb_izq = now;
                sub_cmb_izq = SUB_IZQ_HARD;
            } else {
                IZQ(); // si necesitas mantener comando
            }
            break;

        case SUB_IZQ_HARD:
            if (now - t_cmb_izq >= 100) {
                sub_cmb_izq = SUB_IZQ_INICIO;
                estado_combate = CMB_ESPERA;
            } else {
                HARD(); // si necesitas mantener comando
            }
            break;
    }
}
void DER_M() {
    unsigned long now = millis();
    // Aquí asumo que detecto_rival_der es true cuando detecta, false cuando no.
    switch (sub_cmb_der) {
        case SUB_DER_INICIO:
            DER_Z();
            t_cmb_der = now;
            sub_cmb_der = SUB_DER_GIRO;
            break;

        case SUB_DER_GIRO:
            // SALE si ya NO detecta
            if (S6 ==0) {
                estado_combate = CMB_ESPERA;
                sub_cmb_der = SUB_DER_INICIO;
                break;
            }
            if (now - t_cmb_der >= 100) {
                HARD();
                t_cmb_der = now;
                sub_cmb_der = SUB_DER_HARD;
            } else {
                DER_Z();
            }
            break;

        case SUB_DER_HARD:
            // SALE si ya NO detecta
            if (S6==0) {
                estado_combate = CMB_ESPERA;
                sub_cmb_der = SUB_DER_INICIO;
                break;
            }
            if (now - t_cmb_der >= 100) {
                estado_combate = CMB_ESPERA;
                sub_cmb_der = SUB_DER_INICIO;
            } else {
                HARD();
            }
            break;
    }
}
void REC_M() {
    unsigned long now = millis();
    switch (sub_cmb_rec) {
        case SUB_REC_INICIO:
            REC();
            t_cmb_rec = now;
            sub_cmb_rec = SUB_REC_REC;
            break;

        case SUB_REC_REC:
            if (now - t_cmb_rec >= 50) { // Espera 250 ms
                LIBRE();
                t_cmb_rec = now;
                sub_cmb_rec = SUB_REC_LIBRE;
            }
            break;

        case SUB_REC_LIBRE:
            if (now - t_cmb_rec >= 100) { // Espera 200 ms
                sub_cmb_rec = SUB_REC_FIN;
            }
            break;

        case SUB_REC_FIN:
            estado_combate = CMB_ESPERA;
            sub_cmb_rec = SUB_REC_INICIO; // Reinicia para próxima vez
            break;
    }
}
void IZQ_GIRO(){
unsigned long now = millis();
    switch (sub_cmb_izq_giro) {
        case SUB_IZQ_GIRO:
            // Girar a la izquierda por cierto tiempo
            IZQ(); // función de giro izquierda
            t_cmb_izq_giro = now;
            sub_cmb_izq_giro = SUB_IZQ_BUSCAR_CENTRO;
            break;

        case SUB_IZQ_BUSCAR_CENTRO:
            // Espera a que solo S2 detecte
            if (SL1 == 0 && S2 == 1 && S6 == 0) {
                sub_cmb_izq_giro = SUB_IZQ_ATAQUE;
            }
            break;

        case SUB_IZQ_ATAQUE:
            // Ataque fuerte
            HIT_NO_BLOQUEANTE(); // función de ataque
            estado_combate = CMB_ESPERA;
            sub_cmb_izq_giro = SUB_IZQ_GIRO; // Reinicia para próxima vez
            break;
    }
}
void DER_GIRO(){
unsigned long now = millis();
    switch(sub_cmb_der_giro){
        case SUB_DER_GIRO_INICIO:
            DER();
            t_cmb_der_giro = now;
            sub_cmb_der_giro = SUB_DER_BUSCAR_CENTRO;
            break;
        
        case SUB_DER_BUSCAR_CENTRO:
            if(SL1 ==0 && S2 ==1 && S6==0){
               sub_cmb_der_giro = SUB_DER_ATAQUE;
            }
            break;
        
        case SUB_DER_ATAQUE:
            HIT_NO_BLOQUEANTE();
            estado_combate = CMB_ESPERA;
            sub_cmb_der_giro = SUB_DER_GIRO_INICIO;
            break;
    }

}
void BUSCAR(){
    switch (sub_cmb_buscar) {
        case SUB_BUSCAR_IZQ:
            IZQ(); // Ejecuta giro izquierda
            if (S2 == 1) { // Rival al frente detectado
                estado_combate = CMB_HIT;
            } else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
                sub_cmb_buscar = SUB_BUSCAR_DER;
                t_cmb_buscar = millis();
            }
            break;
        case SUB_BUSCAR_DER:
            DER(); // Ejecuta giro derecha
            if (S2 == 1) { // Rival al frente detectado
                estado_combate = CMB_HIT;
            } else if (millis() - t_cmb_buscar > T_BUSCAR_GIRO_MS) {
                estado_combate = CMB_ESPERA; // O vuelve a búsqueda, como prefieras
            }
            break;
    }
}
void LOGICA_LINEA(){

     unsigned long now = millis();
    //ENTEORIA DEBERIA SALIRSE DEBIDO AL CASO QUE LE PUSE AL INICIO DE AVANZAR
    switch (sub_cmb_linea) {
        case LINEA_IDLE:
            if (S4 != 0 && S3 != 0) {
                L0 = L3 = L2 = L1 = 1;
                REC();
                sub_cmb_linea = LINEA_REC;
            }
            else if (S4 == 0 && S3 == 0) {
                L0 = L3 = 1; L2 = L1 = 0;
                HARD();
                t_cmb_linea = now;
                sub_cmb_linea = LINEA_HARD_180;
            }
            else if (S3 == 0) {
                L2 = 0; L0 = L3 = L1 = 1;
                HARD();
                t_cmb_linea = now;
                sub_cmb_linea = LINEA_HARD_IZQ;
            }
            else if (S4 == 0) {
                L0 = 0; L3 = L2 = L1 = 1;
                HARD();
                t_cmb_linea = now;
                sub_cmb_linea = LINEA_HARD_DER;
            }
            break;

        case LINEA_REC:
            // Si quieres que vuelva rápidamente a IDLE, lo puedes dejar así
            sub_cmb_linea = LINEA_IDLE;
            break;

        case LINEA_HARD_180:
            if (now - t_cmb_linea >= 100) {
                GIRO180();
                t_cmb_linea = now;
                sub_cmb_linea = LINEA_GIRO180;
            }
            break;

        case LINEA_GIRO180:
            if (now - t_cmb_linea >= 300) {
                HARD();
                t_cmb_linea = now;
                sub_cmb_linea = LINEA_HARD_FINAL_180;
            }
            break;

        case LINEA_HARD_FINAL_180:
            if (now - t_cmb_linea >= 100) {
                sub_cmb_linea = LINEA_IDLE;
            }
            break;

        case LINEA_HARD_IZQ:
            if (now - t_cmb_linea >= 100) {
                IZQ_L();
                t_cmb_linea = now;
                sub_cmb_linea = LINEA_IZQ_L;
            }
            break;

        case LINEA_IZQ_L:
            if (now - t_cmb_linea >= 100) {
                sub_cmb_linea = LINEA_IDLE;
            }
            break;

        case LINEA_HARD_DER:
            if (now - t_cmb_linea >= 50) {
                DER_L();
                t_cmb_linea = now;
                sub_cmb_linea = LINEA_DER_L;
            }
            break;

        case LINEA_DER_L:
            if (now - t_cmb_linea >= 20) {
                sub_cmb_linea = LINEA_IDLE;
            }
            break;
    }
}