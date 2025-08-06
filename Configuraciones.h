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


// Definición de enums
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
