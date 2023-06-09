
_main:

;PWM.c,1 :: 		void main()
;PWM.c,3 :: 		CCP1CON=0;
	CLRF       CCP1CON+0
;PWM.c,4 :: 		PR2=249;
	MOVLW      249
	MOVWF      PR2+0
;PWM.c,5 :: 		CCPR1L=186;  //75% duty cycle  i.e  75%*PR2=186.75
	MOVLW      186
	MOVWF      CCPR1L+0
;PWM.c,6 :: 		TRISC.TRISC2=0;
	BCF        TRISC+0, 2
;PWM.c,7 :: 		PIE1=0x02;
	MOVLW      2
	MOVWF      PIE1+0
;PWM.c,8 :: 		T2CON=0x01;
	MOVLW      1
	MOVWF      T2CON+0
;PWM.c,9 :: 		CCP1CON=0x3C;   //PWM mode , 11 for DC1B1:DC1B0  (0.75 fraction of  CCPR1L)
	MOVLW      60
	MOVWF      CCP1CON+0
;PWM.c,10 :: 		TMR2=0;
	CLRF       TMR2+0
;PWM.c,11 :: 		T2CON.TMR2ON=1;
	BSF        T2CON+0, 2
;PWM.c,12 :: 		while(1)
L_main0:
;PWM.c,14 :: 		PIR1.TMR2IF=0;
	BCF        PIR1+0, 1
;PWM.c,15 :: 		while(PIR1.TMR2IF==0);
L_main2:
	BTFSC      PIR1+0, 1
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;PWM.c,16 :: 		}
	GOTO       L_main0
;PWM.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
