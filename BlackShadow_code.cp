#line 1 "G:/Mi unidad/UPIITA/AR UPIITA/Diseños de Minisumos/Black Shadow/Programación/BlackShadow_code.c"
#line 1 "g:/mi unidad/upiita/ar upiita/diseños de minisumos/black shadow/programación/configuraciones.h"
#line 31 "g:/mi unidad/upiita/ar upiita/diseños de minisumos/black shadow/programación/configuraciones.h"
void SELEC();
void Start();
void Stop();
void HARD();
void PUSH();

void REC();
void REV();
void DER();
void DER_Z();
void IZQ();
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
 CMB_DER_HARD,
 CMB_LIBRE,
 CMB_DER_HIT,
 CMB_HIT_FULL
} EstadoCombate;

extern volatile EstadoMovimiento estado_movimiento;
extern volatile EstadoCombate estado_combate;
extern volatile unsigned long tiempo_movimiento;
extern volatile unsigned long ms_ticks;

extern unsigned long millis();
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
