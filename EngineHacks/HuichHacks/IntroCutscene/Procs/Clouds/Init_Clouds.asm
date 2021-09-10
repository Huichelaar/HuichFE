@ Sets up BG1 blend & Prepares clouds. Procvars:
@   +0x29: byte, Timer.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Init Procvars
mov   r0, #0x29
mov   r1, #0x0
strb  r1, [r5, r0]


@ Enable BG1, Disable windows
ldr   r4, =gpDISPCNTbuffer
ldrb  r0, [r4, #0x1]
mov   r1, #0x9F
and   r0, r1
mov   r1, #0x2
orr   r0, r1
strb  r0, [r4, #0x1]


@ BGPriorities
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


@ BG1 VOFS
mov   r0, #0x8
strh  r0, [r4, #0x22]


@ Prepare blend
ldr   r0, =0x241
strh  r0, [r4, #0x3C]
mov   r0, #0x10
str   r0, [r4, #0x44]


@ Prepare clouds
ldr   r0, =CloudsTiles
ldr   r1, =0x6008000
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

ldr   r0, =CloudsPalette
mov   r1, #0x20
mov   r2, #0x20
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4

ldr   r0, =gpBG1MapBuffer
mov   r1, #0x0
ldr   r2, =0x1000
ldr   r3, =0x280

Loop2:
  strh  r2, [r0]
  add   r0, #0x2
  add   r1, #0x1
  add   r2, #0x1
  cmp   r1, r3
  blt   Loop2


mov   r0, #0x1
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
