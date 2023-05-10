/*void main(void)
{
TRISC=0;
TRISD=0;
TRISE.B0=1;
ADCON0= 0xA9;      // Fosc/64, Channel 5, A/D is on
ADCON1= 0xC9;   // Right justified, Fosc/64, AN5 =Analog
while(1)
        {
        delay_ms(1);  //Give A/D Channel time to sample
        ADCON0.GO_DONE=1;  //Start Converting
        while(ADCON0.GO_DONE == 1);  //wait for completion of conversion
        PORTC=ADRESL;  // Display low byte on PORT C
        PORTD=ADRESH;  //Display high byte on PORT D
        delay_ms(250);    //wait for one quarter of second
        }
}*/








/*void main()
{
 TRISC=0;
 TRISD=0;
 TRISE.B0=1;
 ADCON0= 0xA9;
 ADCON1= 0xC9;
 ADC_Init();

while(1)
{
 delay_ms(1);
 ADC_Read(5);
 PORTC=ADRESL;
 PORTD=ADRESH;
 delay_ms(1000);
}
}*/













// Lcd pinout settings
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;
// Pin direction
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

//int Voltage;
float Voltage;
unsigned Bin_Out;
char txt1[20];
char txt2[20];

void main()
{
     TRISC=0;
     TRISD=0;
     TRISB=0;
     TRISE.B0=1;
     ADCON0=0xA9;
     ADCON1=0xC9;
     ADC_Init();
     Lcd_Init();

while(1)
 {
        delay_ms(1);
        Bin_Out=ADC_Read(5);
        Voltage=Bin_Out*(0.00488);
        PORTC=ADRESL;
        PORTD=ADRESH;
        //Bin_Out=ADRESH;
        //Bin_Out = (ADRESH<<8)|(ADRESL);
        //intToStr(Voltage,txt1);
        floattostr(Voltage,txt1);
        intToStr(Bin_Out,txt2);
        lcd_cmd(_LCD_CLEAR);
        lcd_Out(1,1,"Volt:");
        LCD_Out_Cp(txt1);
        lcd_Out(2,1,"Bin_Out:");
        LCD_Out_Cp(txt2);
        delay_ms(1000);
 }
}