
    list p=16F84A
    include "p16F84A.inq"
    ;list p=16F84A

    delcntrl1 equ 0C    

    org 00

INICIO  bsf status, RP0;Cambio a banco1
        movlw B'00010000'
        movwf trisa
        movlw 0FF
        movwf trisb
        bcf status,RP0


FASEA 
    bsf porta, RA0; prueba el terminal del puerto A
	call delay
    bcf porta,RA0
    btfss porta,RA4
    goto FASED
FASEB
    bsf porta, RA1
    call delay
	bcf porta, RA1
	btfss porta,RA4
	goto FASEA
FASEC
    bsf porta, RA2
    call delay
	bcf porta, RA2
	btfss porta,RA4
    goto FASEB
FASED
    bsf porta, RA3
    call delay
	bcf porta, RA3
	btfss porta,RA4
    goto FASEC
    goto FASEA


delay 
        movf portb, 0
        movwf variable
del		
		nop
		nop
		decfsz	variable,1
		goto del
		return; usa dos ciclos de instruccion 

	end
    ; 2 KHz