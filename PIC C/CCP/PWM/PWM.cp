#line 1 "C:/Users/Asad Ur Rehman/Desktop/CCP/PWM/PWM.c"
void main()
{
CCP1CON=0;
PR2=249;
CCPR1L=186;
TRISC.TRISC2=0;
PIE1=0x02;
T2CON=0x01;
CCP1CON=0x3C;
TMR2=0;
T2CON.TMR2ON=1;
while(1)
 {
 PIR1.TMR2IF=0;
 while(PIR1.TMR2IF==0);
 }
}
