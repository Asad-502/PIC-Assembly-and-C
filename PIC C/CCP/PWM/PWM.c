void main()
{
CCP1CON=0;
PR2=249;
CCPR1L=186;  //75% duty cycle  i.e  75%*PR2=186.75
TRISC.TRISC2=0;
PIE1=0x02;
T2CON=0x01;
CCP1CON=0x3C;   //PWM mode , 11 for DC1B1:DC1B0  (0.75 fraction of  CCPR1L)
TMR2=0;
T2CON.TMR2ON=1;
while(1)
	{
		PIR1.TMR2IF=0;
		while(PIR1.TMR2IF==0);
	}
}
