
_main:

;Capture.c,2 :: 		void main()
;Capture.c,4 :: 		ADCON1 = 0x0A;
	MOVLW      10
	MOVWF      ADCON1+0
;Capture.c,5 :: 		TRISB=0;
	CLRF       TRISB+0
;Capture.c,6 :: 		TRISD = 0;
	CLRF       TRISD+0
;Capture.c,7 :: 		TRISA.TRISA0=0;
	BCF        TRISA+0, 0
;Capture.c,9 :: 		CCP1CON = 0b00000101;
	MOVLW      5
	MOVWF      CCP1CON+0
;Capture.c,10 :: 		CCPR1L=0;
	CLRF       CCPR1L+0
;Capture.c,11 :: 		CCPR1H=0;
	CLRF       CCPR1H+0
;Capture.c,12 :: 		T1CON = 0x80;
	MOVLW      128
	MOVWF      T1CON+0
;Capture.c,13 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;Capture.c,14 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Capture.c,15 :: 		T1CON.TMR1ON=1;
	BSF        T1CON+0, 0
;Capture.c,16 :: 		while(1)
L_main0:
;Capture.c,18 :: 		while(PIR1.CCP1IF == 0);
L_main2:
	BTFSC      PIR1+0, 2
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;Capture.c,19 :: 		PORTA.RA0 =~ PORTA.RA0;
	MOVLW      1
	XORWF      PORTA+0, 1
;Capture.c,20 :: 		PORTB = CCPR1H;
	MOVF       CCPR1H+0, 0
	MOVWF      PORTB+0
;Capture.c,21 :: 		PORTD=CCPR1L;
	MOVF       CCPR1L+0, 0
	MOVWF      PORTD+0
;Capture.c,22 :: 		PIR1.CCP1IF = 0;
	BCF        PIR1+0, 2
;Capture.c,23 :: 		}
	GOTO       L_main0
;Capture.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
