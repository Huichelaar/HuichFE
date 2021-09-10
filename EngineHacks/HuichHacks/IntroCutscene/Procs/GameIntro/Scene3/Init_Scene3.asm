@ Prepare LCDIO & other stuff
.thumb

push  {r4-r7,r14}


@ Make BG1 use Tiles2
ldr   r1, =0x8000                           @ Use Tiles2
mov   r0, #0x1
ldr   r4, =SetBackgroundTileDataOffset
bl    GOTO_R4


@ Display BG0, BG1, BG2, BG3, OBJ, OBJ window
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x9F
strb  r0, [r4, #0x1]


@ BGPriorities
mov   r0, #0x2
ldrb  r2, [r4, #0xC]
lsr   r2, #0x2
lsl   r2, #0x2
orr   r2, r0
strb  r2, [r4, #0xC]

mov   r0, #0x0
ldrb  r2, [r4, #0x10]
lsr   r2, #0x2
lsl   r2, #0x2
orr   r2, r0
strb  r2, [r4, #0x10]

mov   r0, #0x3
ldrb  r2, [r4, #0x14]
lsr   r2, #0x2
lsl   r2, #0x2
orr   r2, r0
strb  r2, [r4, #0x14]

mov   r0, #0x1
ldrb  r2, [r4, #0x18]
lsr   r2, #0x2
lsl   r2, #0x2
orr   r2, r0
strb  r2, [r4, #0x18]


@ OBJ Window control
ldr   r0, =0x2C33
strh  r0, [r4, #0x36]


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
