.include "m2560def.inc"

.set STRING_SIZE = 6 ;Size of our string

.dseg

upperString: .byte STRING_SIZE ;Store a constant

.cseg

rjmp start

string: .db "325658";String to read from



start:
	ldi ZL, low(string<<1) ;Point to the start of string in program memory
	ldi ZH, high(string<<1) ;^

	ldi r16, 48 ;ASCII char for '0'
	ldi r17, 58 ;ASCII char for '9' + 1
	ldi r18, 0 ;Counter
	
	ldi r20, 0
	ldi r21, 0
	ldi r22, 0;result is r22:r21;r20
	ldi r23, 0
	ldi r24, 0
	ldi r25, 0;buffer
	ldi r26, STRING_SIZE ;String constant for loop
	ldi r27, -48;substract 48
	ldi r28, 0

loop:
	cp r18, r26 ;Compare counter with size of the string to see if we have gone through all chars
	brge end ;If count >= string size
	inc r18 ;Otherwise we increment the counter
    lpm r19, Z+ ;Load program memory into r19 then increment zPointer
	cp r19, r16 ; Compare to '0'
	brge checkLess ;If it is greater than or equal to 'a' we jump to "checkLess"
	rjmp end ;end if it's not a number, curshed
	
checkLess: 
	cp r19, r17 ;Compare with character '9' + 1
	brlo mul10ThenAdd ;If it is less than '9' + 1' we have a lowerCase char
	rjmp end ;end if it's not a number, curshed

mul10ThenAdd:
	mov r23, r20 
	mov r24, r21
	mov r25, r22
	lsl r20 ; Shift byte 0 (least significant byte) left
	rol r21 ; Shift byte 1 left through carry
	rol r22
	clc 
	lsl r20 ; Shift byte 0 (least significant byte) left
	rol r21 ; Shift byte 1 left through carry
	rol r22
	clc
	lsl r20 ; Shift byte 0 (least significant byte) left
	rol r21 ; Shift byte 1 left through carry
	rol r22
	clc
	add r20, r23
	adc r21, r24
	adc r22, r25
	clc
	add r20, r23
	adc r21, r24
	adc r22, r25
	clc
	add r19, r27
	add r20, r19
	adc r21, r28
	rjmp loop
end:
	rjmp end