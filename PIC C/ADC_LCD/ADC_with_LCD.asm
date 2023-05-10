
_main:

;ADC_with_LCD.c,78 :: 		void main()
;ADC_with_LCD.c,80 :: 		TRISC=0;
	CLRF       TRISC+0
;ADC_with_LCD.c,81 :: 		TRISD=0;
	CLRF       TRISD+0
;ADC_with_LCD.c,82 :: 		TRISB=0;
	CLRF       TRISB+0
;ADC_with_LCD.c,83 :: 		TRISE.B0=1;
	BSF        TRISE+0, 0
;ADC_with_LCD.c,84 :: 		ADCON0=0xA9;
	MOVLW      169
	MOVWF      ADCON0+0
;ADC_with_LCD.c,85 :: 		ADCON1=0xC9;
	MOVLW      201
	MOVWF      ADCON1+0
;ADC_with_LCD.c,86 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ADC_with_LCD.c,87 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ADC_with_LCD.c,89 :: 		while(1)
L_main0:
;ADC_with_LCD.c,91 :: 		delay_ms(1);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
;ADC_with_LCD.c,92 :: 		Bin_Out=ADC_Read(5);
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _Bin_Out+0
	MOVF       R0+1, 0
	MOVWF      _Bin_Out+1
;ADC_with_LCD.c,93 :: 		Voltage=Bin_Out*(0.00488);
	CALL       _word2double+0
	MOVLW      104
	MOVWF      R4+0
	MOVLW      232
	MOVWF      R4+1
	MOVLW      31
	MOVWF      R4+2
	MOVLW      119
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _Voltage+0
	MOVF       R0+1, 0
	MOVWF      _Voltage+1
	MOVF       R0+2, 0
	MOVWF      _Voltage+2
	MOVF       R0+3, 0
	MOVWF      _Voltage+3
;ADC_with_LCD.c,94 :: 		PORTC=ADRESL;
	MOVF       ADRESL+0, 0
	MOVWF      PORTC+0
;ADC_with_LCD.c,95 :: 		PORTD=ADRESH;
	MOVF       ADRESH+0, 0
	MOVWF      PORTD+0
;ADC_with_LCD.c,99 :: 		floattostr(Voltage,txt1);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _txt1+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;ADC_with_LCD.c,100 :: 		intToStr(Bin_Out,txt2);
	MOVF       _Bin_Out+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _Bin_Out+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ADC_with_LCD.c,101 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC_with_LCD.c,102 :: 		lcd_Out(1,1,"Volt:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ADC_with_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC_with_LCD.c,103 :: 		LCD_Out_Cp(txt1);
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;ADC_with_LCD.c,104 :: 		lcd_Out(2,1,"Bin_Out:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_ADC_with_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC_with_LCD.c,105 :: 		LCD_Out_Cp(txt2);
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;ADC_with_LCD.c,106 :: 		delay_ms(1000);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;ADC_with_LCD.c,107 :: 		}
	GOTO       L_main0
;ADC_with_LCD.c,108 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
