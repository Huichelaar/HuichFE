@ Prepares moon & blends gem to moon.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Enable BG0, BG1, Window 1
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x43
ldrb  r1, [r4, #0x1]
orr   r1, r0
strb  r1, [r4, #0x1]


@ Window 1 dimensions & control
ldr   r0, =0x48A8
strh  r0, [r4, #0x2E]
ldr   r0, =0x1888
strh  r0, [r4, #0x32]
mov   r0, #0x33
mov   r1, #0x35
strb  r0, [r4, r1]


@ Prepare moon
ldr   r0, =MoonTiles
ldr   r1, =0x6000000
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

ldr   r0, =MoonPalette
mov   r1, #0x0
mov   r2, #0x20
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4

ldr   r0, =gpBG0MapBuffer
mov   r1, #0x0
ldr   r2, =0x280

Loop:
  strh  r1, [r0]
  add   r0, #0x2
  add   r1, #0x1
  cmp   r1, r2
  blt   Loop


@ Prepare blend
ldr   r0, =Procs_Blend
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
ldr   r1, =0x152
strh  r1, [r0, #0x2C]
mov   r1, #0x10
strh  r1, [r0, #0x2E]
mov   r1, #0xFF
mov   r2, #0x29
strb  r1, [r0, r2]
mov   r1, #0x1
mov   r2, #0x2A
strb  r1, [r0, r2]
mov   r1, #0x2
mov   r2, #0x2B
strb  r1, [r0, r2]
mov   r1, #0x20
mov   r2, #0x31
strb  r1, [r0, r2]


mov   r0, #0x3
ldr   r4, =EnableBackgroundSyncByMask
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
