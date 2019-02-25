LIST P = 18f45K50
    #include <p18f45K50.inc>
    CONFIG WDTEN = OFF		;Desabilita el Watch Dog
    CONFIG MCLRE = ON		;Habilita el pin MCLRE
    CONFIG DEBUG = OFF		;Desabilita el modo Debug
    CONFIG LVP = OFF		;Desabilita Low Voltage Programming
    CONFIG FOSC = INTOSCIO	;Habilita el osciolador interno
    
    org 0			;inicia codigo en la linea 0
    Aux1 EQU 0x00		;reserva un byte en registro 0
    Aux2 EQU 0x01
    Aux3 EQU 0x02
    Aux4 EQU 0x03
    Aux5 EQU 0x04
 Start:
    MOVLB 0x0F
    CLRF Aux1
    Clrf Aux2
    Clrf Aux3
    CLRF Aux4
    CLRF Aux5
    
    CLRF ANSELA 
    CLRF ANSELD
    CLRF ANSELB
    
    CLRF TRISD
    CLRF TRISA
    CLRF TRISB
    
    MOVLW b'01010011'		;Configura Registro OSCCON
    MOVWF OSCCON
    
    Mainloop:

    BTFSC PORTA,0
    GOTO  STOP
    BTFSC PORTA,1
    GOTO SUBIR_PRIMER_SEGUNDO
    BTFSC PORTA,2
    GOTO SUBIR_SEGUNDO_TERCER
    BTFSC PORTA,3
    GOTO BAJAR_TERCER_SEGUNDO
    BTFSC PORTA,4
    GOTO BAJAR_TERCER_PRIMER
    BTFSC PORTA,5
    GOTO BAJAR_SEGUNDO_PRIMER
    BTFSC PORTA,6
    GOTO SUBIR_PRIMER_TERCERO
    
    STOP:
    MOVLW 0x00
    MOVWF LATD
    MOVLW 0x00
    MOVWF LATB
    GOTO Mainloop
    
SUBIR_PRIMER_SEGUNDO:
    
   
    
    MOVLW 0x82
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
   
    MOVLW 0x08
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x00
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    
    GOTO Mainloop
    
SUBIR_PRIMER_TERCERO:
    MOVLW 0x82
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    
    MOVLW 0x20
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x00
    MOVWF LATD
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    
    GOTO Mainloop    
    
  SUBIR_SEGUNDO_TERCER:
    MOVLW 0x88
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x20
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x00
    MOVWF LATD
  
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    GOTO Mainloop 
    
    BAJAR_TERCER_SEGUNDO:
    MOVLW 0x60
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x08
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x00
    MOVWF LATD
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    GOTO Mainloop
    
    BAJAR_TERCER_PRIMER:
    MOVLW 0x60
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x02
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x00
    MOVWF LATD
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    GOTO Mainloop
    
    BAJAR_SEGUNDO_PRIMER:
    MOVLW 0x48
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x02
    MOVWF LATD
    CALL RETARDO
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    MOVLW 0x00
    MOVWF LATB
    CALL Retardo_1
    
    MOVLW 0x00
    MOVWF LATD
    
    MOVLW 0x01
    MOVWF LATB
    CALL Retardo_1
    GOTO Mainloop
    
   

    
    RETARDO:
    TRES:
    MOVLW 0XFA
    MOVWF Aux2
    DOS:
    MOVLW 0XFA
    MOVWF Aux3 
    UNO:
    NOP
    NOP
    DECFSZ Aux1 ,1
    GOTO UNO
    DECFSZ Aux2, 1
    GOTO DOS
 
    RETURN 
   
   Retardo_1:
    DECFSZ Aux4, 1		
    GOTO Retardo_1		
    DECFSZ Aux5, 1		
    GOTO Retardo_1		
    RETURN 
    
    END