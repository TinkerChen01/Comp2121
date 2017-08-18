.include "m2560def.inc"

.def i=r16
.def arrayl=r17
.def arrayh=r18
.def suml=r19
.def sumh=r20

.dseg
sum: .byte 2
array: .byte 20

.cseg
clr arrayl
clr arrayh
clr suml
clr sumh
ldi r21, 200
ldi xl, low(array)
ldi xh, high(array)

clr i

loop:
mul i, r21
st x+, r0
st x+, r1
inc i
cpi i, 10
brlt loop
ldi xl, low(array)
ldi xh, high(array)
clr i
addloop:
ld arrayl, x+
ld arrayh, x+
add suml, arrayl
add sumh, arrayh
inc i
cpi i,10
brlt addloop

end:
rjmp end
