#line 1 "C:/Users/Asad Ur Rehman/Desktop/CCP/Compare/Compare.c"

void main (void)
{
 INTCON=0xC0;
 PIE1=0x05;
 TRISD=0;
 PORTD.B1=0;
 CCP1CON = 0x08;
 T1CON = 0x02;
 TRISC.TRISC2 = 0;
 TRISC.TRISC0 = 1;
 Portc.b2=0;
 CCPR1L=3;
 CCPR1H=0;
 while(1)
 { CCP1CON=0x00;
 CCP1CON=0x08;


 TMR1H=0;
 TMR1L=0;
 T1CON.TMR1ON=1;
 while (PIR1.CCP1IF==0);
 T1CON.TMR1ON=0;


 Portc.b2=0;
 delay_ms(500);

 PIR1.CCP1IF = 0;
 CCPR1L=5;
 CCPR1H=0;
 }
}
