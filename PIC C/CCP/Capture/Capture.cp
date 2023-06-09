#line 1 "C:/Users/Asad Ur Rehman/Desktop/CCP/Capture/Capture.c"

void main()
 {
ADCON1 = 0x0A;
TRISB=0;
TRISD = 0;
TRISA.TRISA0=0;

CCP1CON = 0b00000101;
CCPR1L=0;
CCPR1H=0;
T1CON = 0x80;
TMR1H = 0;
TMR1L = 0;
T1CON.TMR1ON=1;
while(1)
 {
 while(PIR1.CCP1IF == 0);
 PORTA.RA0 =~ PORTA.RA0;
 PORTB = CCPR1H;
 PORTD=CCPR1L;
 PIR1.CCP1IF = 0;
 }

}
