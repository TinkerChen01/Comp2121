;
; lab00-1.asm
;
; Created: 11/08/2017 3:20:40 PM
; Author : Comp2121
;


; Replace with your application code
.include "m2560def.inc"

.def a_l= r16
.def a_h= r17

.def b_l= r18
.def b_h= r19

start:
	ldi a_l, 4
	ldi a_h, 0

	ldi b_l, 10
	ldi b_h, 0

loop:
	cp a_h, b_h
	cpc a_l, b_l
	breq end
	brsh forward
	sub b_l, a_l
	sub b_h, a_h
	rjmp loop
	
forward:
	sbc a_l, b_l
	sub a_h, b_h 

end:
	rjmp end