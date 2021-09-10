@ Clears SinusoidCNT
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Clear SinusoidCNT
ldr   r0, =SinusoidRAM
ldr   r0, [r0]
mov   r1, #0x0
strb  r1, [r0]


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
