@ Prepare LCDIO & other stuff.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Display BG0, OBJ, Window0
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x31
strb  r0, [r4, #0x1]


@ Window 0 dimensions & control
ldr   r0, =0x48A8
strh  r0, [r4, #0x2C]
ldr   r0, =0x4060
strh  r0, [r4, #0x30]
mov   r0, #0x10
mov   r1, #0x34
strb  r0, [r4, r1]
mov   r0, #0x30
mov   r1, #0x36
strb  r0, [r4, r1]


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
