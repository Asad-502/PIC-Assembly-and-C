
_main:

;Compare.c,2 :: 		void main (void)
;Compare.c,4 :: 		INTCON=0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;Compare.c,5 :: 		PIE1=0x05;
	MOVLW      5
	MOVWF      PIE1+0
;Compare.c,6 :: 		TRISD=0;
	CLRF       TRISD+0
;Compare.c,7 :: 		PORTD.B1=0;
	BCF        PORTD+0, 1
;Compare.c,8 :: 		CCP1CON = 0x08;
	MOVLW      8
	MOVWF      CCP1CON+0
;Compare.c,9 :: 		T1CON = 0x02;
	MOVLW      2
	MOVWF      T1CON+0
;Compare.c,10 :: 		TRISC.TRISC2 = 0;
	BCF        TRISC+0, 2
;Compare.c,11 :: 		TRISC.TRISC0 = 1;
	BSF        TRISC+0, 0
;Compare.c,12 :: 		Portc.b2=0;
	BCF        PORTC+0, 2
;Compare.c,13 :: 		CCPR1L=3;
	MOVLW      3
	MOVWF      CCPR1L+0
;Compare.c,14 :: 		CCPR1H=0;
	CLRF       CCPR1H+0
;Compare.c,15 :: 		while(1)
L_main0:
;Compare.c,16 :: 		{   CCP1CON=0x00;
	CLRF       CCP1CON+0
;Compare.c,17 :: 		CCP1CON=0x08;
	MOVLW      8
	MOVWF      CCP1CON+0
;Compare.c,20 :: 		TMR1H=0;
	CLRF       TMR1H+0
;Compare.c,21 :: 		TMR1L=0;
	CLRF       TMR1L+0
;Compare.c,22 :: 		T1CON.TMR1ON=1;
	BSF        T1CON+0, 0
;Compare.c,23 :: 		while (PIR1.CCP1IF==0);
L_main2:
	BTFSC      PIR1+0, 2
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;Compare.c,24 :: 		T1CON.TMR1ON=0;
	BCF        T1CON+0, 0
;Compare.c,27 :: 		Portc.b2=0;
	BCF        PORTC+0, 2
;Compare.c,28 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Compare.c,30 :: 		PIR1.CCP1IF = 0;
	BCF        PIR1+0, 2
;Compare.c,31 :: 		CCPR1L=5;
	MOVLW      5
	MOVWF      CCPR1L+0
;Compare.c,32 :: 		CCPR1H=0;
	CLRF       CCPR1H+0
;Compare.c,33 :: 		}
	GOTO       L_main0
;Compare.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
