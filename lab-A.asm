;
; lab00-1.asm
;
; Created: 11/08/2017 3:20:40 PM
; Author : Comp2121
;


; Replace with your application code
.include "m2560def.inc"

;.def num
;.def 

;.def b_l= r18
;.def b_h= r19

start:
	ldi r16, low(256)
	ldi r17, high(256)

	ldi r18, low(512)
	ldi r19, high(512)

loop:
	cp r16, r18
	cpc r17, r19
	breq end
	brsh forward
	sub r18, r16
	sbc r19, r17
	rjmp loop
	
forward:
	sub r16, r18
	sbc r17, r19
	jmp loop 

end:
	rjmp end