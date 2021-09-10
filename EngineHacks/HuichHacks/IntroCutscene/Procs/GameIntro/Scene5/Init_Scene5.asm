@ Prepare LCDIO & other stuff.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ BGPriorities
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x0
ldrb  r1, [r4, #0xC]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0xC]

mov   r0, #0x1
ldrb  r1, [r4, #0x10]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x10]


@ Reset BG1 HOFS & VOFS
mov   r0, #0x0
str   r0, [r4, #0x20]


@ Make BG1 use Tiles1
mov   r1, #0x0                              @ Use Tiles1
mov   r0, #0x1
ldr   r4, =SetBackgroundTileDataOffset
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
