#line 1 "G:/Mi unidad/UPIITA/AR UPIITA/Diseños de Minisumos/Black Shadow/Programación/BlackShadow_code.c"
#line 32 "G:/Mi unidad/UPIITA/AR UPIITA/Diseños de Minisumos/Black Shadow/Programación/BlackShadow_code.c"
volatile char linea_izq_detectada = 0;
volatile char linea_der_detectada = 0;
volatile char golpe = 0;


typedef enum{

CMB_ESPERA,
CMB_REC,
CMB_IZQ_HARD,
CMB_HIT,
CMB_IZQ_GOLPE,
CMB_DER_HARD,
CMB_LIBRE,
CMB_DER_HIT,
CMB_HIT_FULL
} EstadoCombate;

volatile EstadoCombate estado_combate = CMB_ESPERA;




void SELEC();
void Start();
void Stop();
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
void INTERRUPT();
void combate_estado();



void main() {
 OSCCON = 0b01100110;


 PORTA = 0;
 PORTB = 0;
 PORTC = 0;


 TRISA= 0b00001111;
 TRISB= 0b11011110;
 TRISC= 0b11111001;

 ANSELA= 0b00000000;
 ANSELB= 0b00000000;
 ANSELC= 0b00000000;



 INTCON3.INT1IE =1;
 INTCON3.INT2IE =1;

 INTCON2.INTEDG1 =0;
 INTCON2.INTEDG2 =0;

 INTCON.GIE =1;
 INTCON.PEIE =1;







 PWM1_Init(20000);
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





while ( PORTB.F7  == 0){
  PORTA.F6 =0;  PORTA.F4 = PORTA.F5 = PORTA.F7 =1;
 delay_ms(300);
  PORTA.F7 =0;  PORTA.F4 = PORTA.F5 = PORTA.F6 =1;
 delay_ms(300);
  PORTA.F5 =0;  PORTA.F4 = PORTA.F7 = PORTA.F6 =1;
 delay_ms(300);
  PORTA.F4 =0;  PORTA.F6 = PORTA.F7 = PORTA.F5 =1;
 delay_ms(300);
  PORTA.F4 = PORTA.F5 = PORTA.F7 = PORTA.F6 =1;
 delay_ms(1000);
 LIBRE();
 delay_ms(250);
}
while(1){
 if ( PORTB.F7 ==0){
 LIBRE();

 while ( PORTB.F7  == 0){
  PORTA.F6 =0;  PORTA.F4 = PORTA.F5 = PORTA.F7 =1;
 delay_ms(300);
  PORTA.F7 =0;  PORTA.F4 = PORTA.F5 = PORTA.F6 =1;
 delay_ms(300);
  PORTA.F5 =0;  PORTA.F4 = PORTA.F7 = PORTA.F6 =1;
 delay_ms(300);
  PORTA.F4 =0;  PORTA.F6 = PORTA.F7 = PORTA.F5 =1;
 delay_ms(300);
  PORTA.F4 = PORTA.F5 = PORTA.F7 = PORTA.F6 =1;
 delay_ms(1000);
 LIBRE();
 delay_ms(250);
 }
 }
 SELEC();

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
 REC();
 }
 else if( PORTB.F2  == 0 &&  PORTB.F1  == 0){
 HARD();
 delay_ms(100);
 GIRO180();
 delay_ms(100);
 }
 else if ( PORTB.F1  == 0){
 HARD();
 delay_ms(100);
 GIRO360();
 delay_ms(100);
 }
 else if ( PORTB.F2  == 0){
 HARD();
 delay_ms(100);
 DER();
 delay_ms(100);
 }

 break;

 case 2:  PORTA.F7 =0;  PORTA.F4 = PORTA.F5 = PORTA.F6 =1;
 combate_estado();

 break;

 case 3:  PORTA.F6 = PORTA.F7 =0;  PORTA.F5 = PORTA.F4 ==1;
 HIT();



 break;

 case 4:  PORTA.F5 =0;  PORTA.F4 = PORTA.F7 = PORTA.F6 =1;
 DER();
 delay_ms(250);
 LIBRE();
 delay_ms(4000);
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
 switch (estado_combate) {
 case CMB_ESPERA:
 if( PORTC.F0  == 0 &&  PORTB.F4  == 0 &&  PORTC.F6  == 0){
 estado_combate = CMB_REC;
 }
 else if ( PORTC.F0  == 1 &&  PORTB.F4  == 0 &&  PORTC.F6  == 0){
 estado_combate = CMB_IZQ_HARD;
 }
 else if ( PORTC.F0  == 0 &&  PORTB.F4  == 1 &&  PORTC.F6  == 0){
 estado_combate = CMB_HIT;
 }
 else if ( PORTC.F0  == 1 &&  PORTB.F4  == 1 &&  PORTC.F6  == 0){
 estado_combate = CMB_IZQ_GOLPE;
 }
 else if (golpe == 1){
 estado_combate = CMB_HIT;
 }
 else if ( PORTC.F0  == 0 &&  PORTB.F4  == 0 &&  PORTC.F6  == 1){
 estado_combate = CMB_DER_HARD;
 }
 else if ( PORTC.F0  == 1 &&  PORTB.F4  == 0 &&  PORTC.F6  == 1){
 estado_combate = CMB_LIBRE;
 }
 else if ( PORTC.F0  == 0 &&  PORTB.F4  == 1 &&  PORTC.F6  == 1){
 estado_combate = CMB_DER_HIT;
 }
 else if ( PORTC.F0  == 1 &&  PORTB.F4  == 1 &&  PORTC.F6  == 1){
 estado_combate = CMB_HIT_FULL;
 }
 else{
 LIBRE();
 }
 break;

 case CMB_REC:
  PORTA.F6 = PORTA.F7 = PORTA.F5 = PORTA.F4 =1;
 REC();
 delay_ms(250);
 LIBRE();
 delay_ms(200);
 golpe = 0;
 estado_combate = CMB_ESPERA;
 break;

 case CMB_IZQ_HARD:
  PORTA.F6 =0;  PORTA.F7 = PORTA.F5 = PORTA.F4 =1;
 IZQ();
 delay_ms(100);
 HARD();
 delay_ms(250);
 golpe = 0;
 estado_combate = CMB_ESPERA;
 break;

 case CMB_HIT:
  PORTA.F7 =0;  PORTA.F6 = PORTA.F5 = PORTA.F4 =1;
 HIT();
 golpe = 1;
 estado_combate = CMB_ESPERA;
 break;

 case CMB_IZQ_GOLPE:
  PORTA.F6 = PORTA.F7 =0;  PORTA.F5 = PORTA.F4 =1;
 IZQ();
 delay_ms(20);
 golpe = 1;
 estado_combate = CMB_ESPERA;
 break;

 case CMB_DER_HARD:
  PORTA.F5 =0;  PORTA.F6 = PORTA.F7 = PORTA.F4 =1;
 DER();
 delay_ms(100);
 HARD();
 delay_ms(250);
 estado_combate = CMB_ESPERA;
 break;

 case CMB_LIBRE:
  PORTA.F6 = PORTA.F5 =0;  PORTA.F7 = PORTA.F4 =1;
 LIBRE();
 estado_combate = CMB_ESPERA;
 break;

 case CMB_DER_HIT:
  PORTA.F7 = PORTA.F5 =0;  PORTA.F6 = PORTA.F4 =1;
 DER();
 delay_ms(30);
 HIT();
 estado_combate = CMB_ESPERA;
 break;

 case CMB_HIT_FULL:
  PORTA.F6 = PORTA.F7 = PORTA.F5 =0;  PORTA.F4 =1;
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






void REC(){

 Start();

 PWM1_Set_Duty(170);
 PWM2_Set_Duty(0);


 PWM3_Set_Duty(140);
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

void INTERRUPT(){


 if (INTCON3.INT1IF) {
 INTCON3.INT1IF = 0;
 linea_izq_detectada = 1;

}

 if (INTCON3.INT2IF) {
 INTCON3.INT2IF = 0;
 linea_der_detectada = 1;
 }
}
