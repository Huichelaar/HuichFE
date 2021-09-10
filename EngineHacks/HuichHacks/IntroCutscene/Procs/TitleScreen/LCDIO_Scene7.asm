@ More LCDIO stuff.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Enable BG0, OBJ
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x11
strb  r0, [r4, #0x1]


@ BGPriorities
mov   r0, #0x2
ldrb  r1, [r4, #0xC]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0xC]


@ Reset BG0 HOFS & VOFS
mov   r0, #0x0
str   r0, [r4, #0x1C]


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
