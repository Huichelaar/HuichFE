@ Prepare LCDIO & other stuff
.thumb

push  {r4-r7,r14}
sub   sp, #0x4


@ Display BG0, OBJ, Window 0
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x31
strb  r0, [r4, #0x1]


@ BGPriorities
mov   r0, #0x3
ldrb  r1, [r4, #0xC]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0xC]

mov   r0, #0x2
ldrb  r1, [r4, #0x10]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x10]

mov   r0, #0x3
ldrb  r1, [r4, #0x14]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x14]

mov   r0, #0x3
ldrb  r1, [r4, #0x18]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x18]


@ Reset BG positions
mov   r0, #0x0
str   r0, [r4, #0x1C]
str   r0, [r4, #0x20]
str   r0, [r4, #0x24]
str   r0, [r4, #0x28]


@ Window 0 dimensions & control
mov   r0, #0xF0
strh  r0, [r4, #0x2C]
ldr   r0, =0x90A0
strh  r0, [r4, #0x30]
mov   r0, #0x10
mov   r1, #0x34
strb  r0, [r4, r1]
mov   r0, #0x31
mov   r1, #0x36
strb  r0, [r4, r1]


@ 'Clear' Tiles & Screen entry buffers
ldr   r0, =0xCCCCCCCC
str   r0, [sp]
mov   r0, sp
ldr   r1, =0x6000000
ldr   r2, =0x1004000
swi   #0xC                        @ CpuFastSet
ldr   r0, =0x2800280
str   r0, [sp]
mov   r0, sp
ldr   r1, =gpBG0MapBuffer
ldr   r2, =0x1000800
swi   #0xC                        @ CpuFastSet


mov   r0, #0xF
ldr   r4, =EnableBackgroundSyncByMask
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
