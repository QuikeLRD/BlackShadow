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


#define MAX_GIRO_IZQ_MS 250                   // Ajusta: tiempo máximo de giro si no hay detección
#define T_BUSCAR_GIRO_MS 200                  // Tiempo para cada giro antes de alternar
//==========================//
//==Prototipos de función==//
//========================//
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
void RUT_LINEA();

// Definición de enums
typedef enum {
    MOV_IDLE,
    MOV_HIT_REC,
    MOV_HIT_PUSH
} EstadoMovimiento;
//ENUM PARA MAQUINA DE COMBATES
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
//ENUM PARA GIRO IZQ
typedef enum{
    SUB_IZQ_INICIO =0,
    SUB_IZQ_GIRO,
    SUB_IZQ_HARD
    
}   SubEstadoIzq;
//ENUM PARA GIRO DERECHO
typedef enum{

    SUB_DER_INICIO =0,
    SUB_DER_GIRO,
    SUB_DER_HARD

}   SubEstadoDer;
typedef enum{
    SUB_REC_INICIO =0,
    SUB_REC_REC,
    SUB_REC_LIBRE,
    SUB_REC_FIN

}   SubEstadoREC;
typedef enum{
    SUB_IZQ_GIRO_INICIO,
    SUB_IZQ_BUSCAR_CENTRO,
    SUB_IZQ_ATAQUE

}   SubEstadoIZQ_GIRO;

typedef enum{
    SUB_DER_GIRO_INICIO,
    SUB_DER_BUSCAR_CENTRO,
    SUB_DER_ATAQUE
    
}   SubEstadoDER_GIRO;

typedef enum{
    SUB_BUSCAR_IZQ,
    SUB_BUSCAR_DER

}   SubEstadoBUSCAR;


//ENUM para detección de linea
typedef enum{
    LINEA_REC,
    LINEA_HARD_180,
    LINEA_GIRO180,
    LINEA_HARD_FINAL_180,
    LINEA_HARD_IZQ,
    LINEA_IZQ_L,
    LINEA_HARD_DER,
    LINEA_DER_L,
    LINEA_WAIT

    } SubEstadoLINEA;

extern unsigned long millis();
extern volatile unsigned long ms_ticks;

//HIT_NO_BLOQUEANTE
extern volatile EstadoMovimiento estado_movimiento;
extern volatile EstadoCombate estado_combate;
extern volatile unsigned long tiempo_movimiento;

//IZQ_M
extern volatile SubEstadoIzq sub_cmb_izq = SUB_IZQ_INICIO;
extern volatile unsigned long t_cmb_izq = 0;

//DER_M
extern volatile SubEstadoDer sub_cmb_der = SUB_DER_INICIO;
extern volatile unsigned long t_cmb_der = 0;

//REC
extern volatile SubEstadoREC sub_cmb_rec = SUB_REC_INICIO;
extern volatile unsigned long t_cmb_rec = 0;

//IZQ_GIRO
extern volatile SubEstadoIZQ_GIRO sub_cmb_izq_giro = SUB_IZQ_GIRO_INICIO;
extern volatile unsigned long t_cmb_izq_giro = 0;

//DER_GIRO
extern volatile SubEstadoDER_GIRO sub_cmb_der_giro = SUB_DER_GIRO_INICIO;
extern volatile unsigned long t_cmb_der_giro = 0;

//BUSCAR
extern volatile SubEstadoBUSCAR sub_cmb_buscar = SUB_BUSCAR_IZQ;
extern volatile unsigned long t_cmb_buscar = 0;

//LINEA
extern volatile SubEstadoLINEA sub_cmb_linea = LINEA_WAIT;
extern volatile unsigned long t_cmb_linea = 0;