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

//==========================//
//==Prototipos de función==//
//========================//
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

