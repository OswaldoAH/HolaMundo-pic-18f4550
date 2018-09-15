;24-08-2018
;Blink de led
;Arquitectura del computador II
;Mynor Oswaldo Alvarez Hernández 22814-16
list p=18f4550				;Listo el pic a utiliza
#include <p18f4550.inc>			;Incluyo las librería
    org	     0x0000			;inicializo el pic en reset
    goto     inicio			;Salto a inicio
    org	     0x0020			;Me muevo a la posicion 0x0019 de la la ram
    contador equ 0x90			;Declaro mi variable contador
inicio:					;configuracion
    clrf    TRISD			;puerto d como salida
    clrf    PORTD			;portd=0
bascular:
    btg	    PORTD, 0			;Niega lo que evalua 1=0, 0=1
retardo:
    decfsz  contador, 1			;DECREMENTA CONTADOR Y EVALUA SI ES 0
    goto    retardo			;Sino slta a retardo
    movlw    0x90			;si cumple asignamos 144 decimal y 0x90 hexadecimal al registro W
    movwf   contador			;Movemos lo que tiene el registro w a contador "contador=255"
    goto    bascular			;Salta a Bascular
END					;Termina el programa