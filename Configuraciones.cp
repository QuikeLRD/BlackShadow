#line 1 "G:/Mi unidad/UPIITA/AR UPIITA/Diseños de Minisumos/Black Shadow/Programación/Configuraciones.c"
#line 1 "g:/mi unidad/upiita/ar upiita/diseños de minisumos/black shadow/programación/configuraciones.h"
#line 34 "g:/mi unidad/upiita/ar upiita/diseños de minisumos/black shadow/programación/configuraciones.h"
void SELEC();
void Start();
void Stop();
void HARD();
void PUSH();

void REC();
void REC_M();
void REV();
void DER();
void DER_Z();
void DER_GIRO();
void DER_M();
void IZQ();
void IZQ_M();
void IZQ_GIRO();
void IZQ_L();
void DER_L();

void BRAKE();
void LIBRE();
void GIRO180();
void GIRO360();
void HIT();
void HIT_NO_BLOQUEANTE();
void INTERRUPT();
void INTERRUPT_ISR();
void combate_estado();
void LOGICA_LINEA();
void BUSCAR();



typedef enum {
 MOV_IDLE,
 MOV_HIT_REC,
 MOV_HIT_PUSH
} EstadoMovimiento;

typedef enum {
 CMB_ESPERA,
 CMB_REC,
 CMB_IZQ,
 CMB_HIT,
 CMB_IZQ_GOLPE,
 CMB_DER,
 CMB_BUSCAR,
 CMB_DER_HIT,
 CMB_HIT_FULL
} EstadoCombate;

typedef enum{
 SUB_IZQ_INICIO =0,
 SUB_IZQ_GIRO,
 SUB_IZQ_HARD

} SubEstadoIzq;

typedef enum{

 SUB_DER_INICIO =0,
 SUB_DER_GIRO,
 SUB_DER_HARD

} SubEstadoDer;
typedef enum{
 SUB_REC_INICIO =0,
 SUB_REC_REC,
 SUB_REC_LIBRE,
 SUB_REC_FIN

} SubEstadoREC;
typedef enum{
 SUB_IZQ_GIRO_INICIO,
 SUB_IZQ_BUSCAR_CENTRO,
 SUB_IZQ_ATAQUE

} SubEstadoIZQ_GIRO;

typedef enum{
 SUB_DER_GIRO_INICIO,
 SUB_DER_BUSCAR_CENTRO,
 SUB_DER_ATAQUE

} SubEstadoDER_GIRO;

typedef enum{
 SUB_BUSCAR_IZQ,
 SUB_BUSCAR_DER

} SubEstadoBUSCAR;



typedef enum{
 LINEA_IDLE,
 LINEA_REC,
 LINEA_HARD_IZQ,
 LINEA_IZQ_L,
 LINEA_HARD_DER,
 LINEA_DER_L,
 LINEA_HARD_180,
 LINEA_GIRO180,
 LINEA_HARD_FINAL_180

 } SubEstadoLINEA;

extern unsigned long millis();
extern volatile unsigned long ms_ticks;


extern volatile EstadoMovimiento estado_movimiento;
extern volatile EstadoCombate estado_combate;
extern volatile unsigned long tiempo_movimiento;


extern volatile SubEstadoIzq sub_cmb_izq = SUB_IZQ_INICIO;
extern volatile unsigned long t_cmb_izq = 0;


extern volatile SubEstadoDer sub_cmb_der = SUB_DER_INICIO;
extern volatile unsigned long t_cmb_der = 0;


extern volatile SubEstadoREC sub_cmb_rec = SUB_REC_INICIO;
extern volatile unsigned long t_cmb_rec = 0;


extern volatile SubEstadoIZQ_GIRO sub_cmb_izq_giro = SUB_IZQ_GIRO_INICIO;
extern volatile unsigned long t_cmb_izq_giro = 0;


extern volatile SubEstadoDER_GIRO sub_cmb_der_giro = SUB_DER_GIRO_INICIO;
extern volatile unsigned long t_cmb_der_giro = 0;


extern volatile SubEstadoBUSCAR sub_cmb_buscar = SUB_BUSCAR_IZQ;
extern volatile unsigned long t_cmb_buscar = 0;


extern volatile SubEstadoLINEA sub_cmb_linea = LINEA_IDLE;
extern volatile unsigned long t_cmb_linea = 0;
#line 1 "g:/mi unidad/upiita/ar upiita/diseños de minisumos/black shadow/programación/milis.h"



void millis_init(void);
unsigned long millis(void);

extern volatile unsigned long ms_ticks;
#line 6 "G:/Mi unidad/UPIITA/AR UPIITA/Diseños de Minisumos/Black Shadow/Programación/Configuraciones.c"
volatile char linea_izq_detectada = 0;
volatile char linea_der_detectada = 0;
volatile char linea_detectada = 0;
volatile char golpe = 0;

volatile EstadoMovimiento estado_movimiento = MOV_IDLE;
volatile EstadoCombate estado_combate = CMB_ESPERA;
volatile unsigned long tiempo_movimiento = 0;

volatile SubEstadoIzq sub_cmb_izq = SUB_IZQ_INICIO;
volatile unsigned long t_cmb_izq = 0;


volatile SubEstadoDer sub_cmb_der = SUB_DER_INICIO;
volatile unsigned long t_cmb_der = 0;


volatile unsigned long t_cmb_rec = 0;
volatile SubEstadoREC sub_cmb_rec = SUB_REC_INICIO;


volatile unsigned long t_cmb_izq_giro =0;
volatile SubEstadoIZQ_GIRO sub_cmb_izq_giro = SUB_IZQ_GIRO;


volatile unsigned long t_cmb_der_giro =0;
volatile SubEstadoDER_GIRO sub_cmb_der_giro = SUB_DER_GIRO_INICIO;


volatile unsigned long t_cmb_buscar = 0;
volatile SubEstadoBUSCAR sub_cmb_buscar = SUB_BUSCAR_IZQ;


volatile unsigned long t_cmb_linea = 0;
volatile SubEstadoLINEA sub_cmb_linea = LINEA_IDLE;





void INTERRUPT_ISR(void) {

 if (INTCON.TMR0IF) {
 INTCON.TMR0IF = 0;
 TMR0L = 131;
 ms_ticks++;
 }

 INTERRUPT();
}

void INTERRUPT(){


 if (INTCON3.INT1IF) {
 INTCON3.INT1IF = 0;
 linea_izq_detectada = 1;
 linea_detectada = 1;
}

 if (INTCON3.INT2IF) {
 INTCON3.INT2IF = 0;
 linea_der_detectada = 1;
 linea_detectada = 1;
 }
}


void SELEC(){
 int seleccion;
 seleccion= PORTA.F3 *1+ PORTA.F2 *2+ PORTA.F1 *4+ PORTA.F0 *8;

 switch(seleccion){
 case 0:  PORTA.F6 = PORTA.F7 = PORTA.F5 = PORTA.F4 =1;


 break;

 case 1:  PORTA.F6 =0;  PORTA.F4 = PORTA.F5 = PORTA.F7 =1;
 if( PORTB.F2  != 0 &&  PORTB.F1  != 0){
  PORTA.F6 = PORTA.F4 = PORTA.F5 = PORTA.F7 =1;

 REC();
 }
 else if( PORTB.F2  == 0 &&  PORTB.F1  == 0){
  PORTA.F6 = PORTA.F4 =1;  PORTA.F5 = PORTA.F7 =0;
 HARD();
 delay_ms(100);
 GIRO180();
 delay_ms(300);
 HARD();
 delay_ms(100);


 }
 else if ( PORTB.F1  == 0){
  PORTA.F5 =0;  PORTA.F6 = PORTA.F4 = PORTA.F7 =1;
 HARD();
 delay_ms(100);
 IZQ_L();
 delay_ms(100);



 }
 else if ( PORTB.F2  == 0){
  PORTA.F6 =0;  PORTA.F4 = PORTA.F5 = PORTA.F7 =1;

 HARD();
 delay_ms(50);
 DER_L();
 delay_ms(20);
 }

 break;

 case 2:  PORTA.F7 =0;  PORTA.F4 = PORTA.F5 = PORTA.F6 =1;
 combate_estado();

 break;

 case 3:  PORTA.F6 = PORTA.F7 =0;  PORTA.F5 = PORTA.F4 ==1;
 REC();
 delay_ms(2000);
 HARD();
 delay_ms(500);




 break;

 case 4:  PORTA.F5 =0;  PORTA.F4 = PORTA.F7 = PORTA.F6 =1;
 GIRO180();
 delay_ms(300);
 HARD();
 delay_ms(750);
 break;

 case 5:  PORTA.F5 = PORTA.F6 =0;  PORTA.F4 = PORTA.F7 =1;
 DER();
 break;

 case 6:  PORTA.F7 = PORTA.F5 =0;  PORTA.F4 = PORTA.F6 =1;
 GIRO180();

 break;

 case 7:  PORTA.F5 = PORTA.F7 = PORTA.F6 =0;  PORTA.F4 =1;

 break;

 case 8:  PORTA.F4 =0;  PORTA.F7 = PORTA.F5 = PORTA.F6 =1;

 break;

 case 9:  PORTA.F6 = PORTA.F4 =0;  PORTA.F7 = PORTA.F5 =1;


 break;

 case 10:  PORTA.F4 = PORTA.F7 =0;  PORTA.F5 = PORTA.F6 =1;
 break;

 case 11:  PORTA.F6 = PORTA.F7 = PORTA.F4 =0;  PORTA.F5 =1;
 break;

 case 12:  PORTA.F4 = PORTA.F5 =0;  PORTA.F7 = PORTA.F6 =1;
 break;

 case 13:  PORTA.F4 = PORTA.F5 = PORTA.F6 =0;  PORTA.F7 =1;
 break;

 case 14:  PORTA.F4 = PORTA.F5 = PORTA.F7 =0;  PORTA.F6 =1;
 break;

 default:  PORTA.F6 = PORTA.F7 = PORTA.F5 = PORTA.F4 =0;
 }


}



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
 if( PORTC.F0  == 0 &&  PORTC.F6  == 0 &&  PORTB.F4  == 0){
 estado_combate = CMB_REC;
 }
 else if ( PORTC.F0  == 1 &&  PORTC.F6  == 0 &&  PORTB.F4  == 0){
 estado_combate = CMB_IZQ;
 }
 else if ( PORTC.F0  == 0 &&  PORTC.F6  == 1 &&  PORTB.F4  == 0){
 estado_combate = CMB_HIT;
 }
 else if ( PORTC.F0  == 1 &&  PORTC.F6  == 1 &&  PORTB.F4  == 0){
 estado_combate = CMB_IZQ_GOLPE;
 }
 else if ( PORTC.F0  == 0 &&  PORTC.F6  == 0 &&  PORTB.F4  == 1){
 estado_combate = CMB_DER;
 }
 else if ( PORTC.F0  == 1 &&  PORTC.F6  == 0 &&  PORTB.F4  == 1){
 estado_combate = CMB_BUSCAR;
 sub_cmb_buscar = SUB_BUSCAR_IZQ;
 t_cmb_buscar = millis();
 }
 else if ( PORTC.F0  == 0 &&  PORTC.F6  == 1 &&  PORTB.F4  == 1){
 estado_combate = CMB_DER_HIT;
 }
 else if ( PORTC.F0  == 1 &&  PORTC.F6  == 1 &&  PORTB.F4  == 1){
 estado_combate = CMB_HIT_FULL;
 }
 else{
 LIBRE();
 }
 break;

 case CMB_REC:
  PORTA.F6 = PORTA.F7 = PORTA.F5 = PORTA.F4 =1;
 REC_M();
 break;

 case CMB_IZQ:
  PORTA.F6 =0;  PORTA.F7 = PORTA.F5 = PORTA.F4 =1;
 IZQ_M();
 break;

 case CMB_HIT:
  PORTA.F7 =0;  PORTA.F6 = PORTA.F5 = PORTA.F4 =1;
 HIT_NO_BLOQUEANTE();
 break;

 case CMB_IZQ_GOLPE:
  PORTA.F6 = PORTA.F7 =0;  PORTA.F5 = PORTA.F4 =1;
 IZQ_GIRO();
 break;

 case CMB_DER:
  PORTA.F5 =0;  PORTA.F6 = PORTA.F7 = PORTA.F4 =1;
 DER_M();
 break;

 case CMB_BUSCAR:
  PORTA.F6 = PORTA.F5 =0;  PORTA.F7 = PORTA.F4 =1;
 BUSCAR();
 break;

 case CMB_DER_HIT:
  PORTA.F7 = PORTA.F5 =0;  PORTA.F6 = PORTA.F4 =1;
 DER_GIRO();
 break;

 case CMB_HIT_FULL:
  PORTA.F6 = PORTA.F7 = PORTA.F5 =0;  PORTA.F4 =1;
 HIT_NO_BLOQUEANTE();
 break;

 default:
 LIBRE();
 estado_combate = CMB_ESPERA;
 estado_movimiento = MOV_IDLE;
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






void REC(){

 Start();

 PWM1_Set_Duty(200);
 PWM2_Set_Duty(0);


 PWM3_Set_Duty(140);
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

void GIRO360(){
 IZQ();
 delay_ms(250);
 HARD();

}

void BRAKE(){

 Stop();
 LATC.F2=0;
 LATC.F1=0;
 LATB.F5=0;
 LATB.F0=0;


}
void HARD(){
 PWM1_Set_Duty(255);
 PWM2_Set_Duty(255);
 PWM3_Set_Duty(255);
 PWM4_Set_Duty(255);


}
void PUSH(){
 Start();

 PWM1_Set_Duty(255);
 PWM2_Set_Duty(0);


 PWM3_Set_Duty(205);
 PWM4_Set_Duty(0);

}
void HIT(){

 REC();
 delay_ms(20);
 PUSH();
 delay_ms(250);
}
void HIT_NO_BLOQUEANTE(){
 unsigned long now = millis();

 switch (estado_movimiento) {
 case MOV_IDLE:
 PUSH();
 tiempo_movimiento = now;
 estado_movimiento = MOV_HIT_REC;
 break;

 case MOV_HIT_REC:

 if (now - tiempo_movimiento >= 20) {
 PUSH();
 tiempo_movimiento = now;
 estado_movimiento = MOV_HIT_PUSH;
 }
 break;

 case MOV_HIT_PUSH:

 if ( PORTC.F6  == 0) {

 PUSH();
 tiempo_movimiento = now;
 } else {

 HARD();
 estado_movimiento = MOV_IDLE;
 estado_combate = CMB_ESPERA;
 }






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
 IZQ();
 }
 break;

 case SUB_IZQ_HARD:
 if (now - t_cmb_izq >= 100) {
 sub_cmb_izq = SUB_IZQ_INICIO;
 estado_combate = CMB_ESPERA;
 } else {
 HARD();
 }
 break;
 }
}
void DER_M() {
 unsigned long now = millis();

 switch (sub_cmb_der) {
 case SUB_DER_INICIO:
 DER_Z();
 t_cmb_der = now;
 sub_cmb_der = SUB_DER_GIRO;
 break;

 case SUB_DER_GIRO:

 if ( PORTB.F4  ==0) {
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

 if ( PORTB.F4 ==0) {
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
 if (now - t_cmb_rec >= 50) {
 LIBRE();
 t_cmb_rec = now;
 sub_cmb_rec = SUB_REC_LIBRE;
 }
 break;

 case SUB_REC_LIBRE:
 if (now - t_cmb_rec >= 100) {
 sub_cmb_rec = SUB_REC_FIN;
 }
 break;

 case SUB_REC_FIN:
 estado_combate = CMB_ESPERA;
 sub_cmb_rec = SUB_REC_INICIO;
 break;
 }
}
void IZQ_GIRO(){
unsigned long now = millis();
 switch (sub_cmb_izq_giro) {
 case SUB_IZQ_GIRO:

 IZQ();
 t_cmb_izq_giro = now;
 sub_cmb_izq_giro = SUB_IZQ_BUSCAR_CENTRO;
 break;

 case SUB_IZQ_BUSCAR_CENTRO:

 if ( PORTC.F0  == 0 &&  PORTC.F6  == 1 &&  PORTB.F4  == 0) {
 sub_cmb_izq_giro = SUB_IZQ_ATAQUE;
 }
 break;

 case SUB_IZQ_ATAQUE:

 HIT_NO_BLOQUEANTE();
 estado_combate = CMB_ESPERA;
 sub_cmb_izq_giro = SUB_IZQ_GIRO;
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
 if( PORTC.F0  ==0 &&  PORTC.F6  ==1 &&  PORTB.F4 ==0){
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
 IZQ();
 if ( PORTC.F6  == 1) {
 estado_combate = CMB_HIT;
 } else if (millis() - t_cmb_buscar >  200 ) {
 sub_cmb_buscar = SUB_BUSCAR_DER;
 t_cmb_buscar = millis();
 }
 break;
 case SUB_BUSCAR_DER:
 DER();
 if ( PORTC.F6  == 1) {
 estado_combate = CMB_HIT;
 } else if (millis() - t_cmb_buscar >  200 ) {
 estado_combate = CMB_ESPERA;
 }
 break;
 }
}
void LOGICA_LINEA(){

 unsigned long now = millis();

 switch (sub_cmb_linea) {
 case LINEA_IDLE:
 if ( PORTB.F2  != 0 &&  PORTB.F1  != 0) {
  PORTA.F6  =  PORTA.F4  =  PORTA.F5  =  PORTA.F7  = 1;
 REC();
 sub_cmb_linea = LINEA_REC;
 }
 else if ( PORTB.F2  == 0 &&  PORTB.F1  == 0) {
  PORTA.F6  =  PORTA.F4  = 1;  PORTA.F5  =  PORTA.F7  = 0;
 HARD();
 t_cmb_linea = now;
 sub_cmb_linea = LINEA_HARD_180;
 }
 else if ( PORTB.F1  == 0) {
  PORTA.F5  = 0;  PORTA.F6  =  PORTA.F4  =  PORTA.F7  = 1;
 HARD();
 t_cmb_linea = now;
 sub_cmb_linea = LINEA_HARD_IZQ;
 }
 else if ( PORTB.F2  == 0) {
  PORTA.F6  = 0;  PORTA.F4  =  PORTA.F5  =  PORTA.F7  = 1;
 HARD();
 t_cmb_linea = now;
 sub_cmb_linea = LINEA_HARD_DER;
 }
 break;

 case LINEA_REC:

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
