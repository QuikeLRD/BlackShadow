#line 1 "G:/Mi unidad/UPIITA/AR UPIITA/Diseños de Minisumos/Black Shadow/Programación/BlackShadow_code.c"
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
#line 1 "g:/mi unidad/upiita/ar upiita/diseños de minisumos/black shadow/programación/milis.h"



void millis_init(void);
unsigned long millis(void);

extern volatile unsigned long ms_ticks;
#line 3 "G:/Mi unidad/UPIITA/AR UPIITA/Diseños de Minisumos/Black Shadow/Programación/BlackShadow_code.c"
void main() {

 millis_init();
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
