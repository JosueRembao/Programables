
	list p=16F84A ;Sirve para indicar al IDE
	
	;include "p16F84A.inq"
	
	
	
status equ 03
porta equ 05
trisa equ 05
portb equ 06
trisb equ 06
RP0 equ 05
RA0 equ 00
RB2	equ 00
delcntrl1 equ 0C

		org 00; Esta directiva escribe a sigui
	
;Inicializar
start bsf status,RP0 ;Selecciona el banco 1 de memoria
	movlw B'00000001'
	movwf trisa; Todos los terminales del puerto A TrisA es el registro del control del puerto A
	movlw B'00000000'
	movwf trisb; Todos los terminales del puerto B
	bcf status, RP0
;El programa principal inicia aqui
	movlw 00; Borra todos los bits de los puertos A y B
	clrf porta	;movwf porta
	clrf portb	;movwf portb

	;Clase
;loop btfsc porta, RA0; prueba el terminal del puerto A
	;goto Led_On
	;goto Led_Off
;Led_On	bsf portb, RB2
;	goto loop
;Led_Off bcf portb, RB2
;	goto loop

;Practica
loop portb,0
	call delay250
	bcf portb,0
	call delay250
	goto loop

delay250	movlw D'50'
			movwf delcntrl1
del		nop
		nop
		decfsz	delcntrl1,1
		goto del
		return

	end


;TrisA Registro de control del puerto, un 1 en un bit indica que el terminal
;correspondiente en el puerto A va a funcionar como entrada, un cero indica que funcionan
;Como salida, ejemplo:
;Si queremos que RA7,RA4, RA3 y RA1 sean salidas, y el resto salidas debemos escribir TrisA
