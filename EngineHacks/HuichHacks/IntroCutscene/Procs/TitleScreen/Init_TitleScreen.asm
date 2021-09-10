@ Does a few things.
@ Procvars:
@   +0x2A, short, [0, 63]. Not sure what this does, main loop increments this though
@   +0x2C, word, [0, 815]. Timer. Determines how long we'll stay on titlescreen for.
.thumb

push  {r4-r7,r14}
sub   sp, #0x4
mov   r5, r0


@ Initialize procvars
mov   r0, #0x0
strh  r0, [r5, #0x2A]
str   r0, [r5, #0x2C]


@ LCDIO
@ Enable BG0, BG1, OBJ
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x13
strb  r0, [r4, #0x1]


@ BGPriorities
mov   r0, #0x2
ldrb  r1, [r4, #0xC]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0xC]

@mov   r0, #0x0
ldrb  r1, [r4, #0x10]
lsr   r1, #0x2
lsl   r1, #0x2
@orr   r1, r0
strb  r1, [r4, #0x10]

mov   r0, #0x1
ldrb  r1, [r4, #0x14]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x14]

mov   r0, #0x1
ldrb  r1, [r4, #0x18]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x18]


@ Reset HOFS & VOFS
mov   r0, #0x0
str   r0, [r4, #0x1C]
str   r0, [r4, #0x20]
str   r0, [r4, #0x24]
str   r0, [r4, #0x28]


@ Enable 1-dimensional sprite mapping
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x40
ldrb  r1, [r4]
orr   r1, r0
strb  r1, [r4]


@ Change Tile offset
mov   r0, #0x0
mov   r1, #0x0
ldr   r4, =SetBackgroundTileDataOffset
bl    GOTO_R4
mov   r0, #0x1
mov   r1, #0x0
bl    GOTO_R4
mov   r0, #0x2
ldr   r1, =0x8000
bl    GOTO_R4
mov   r0, #0x3
ldr   r1, =0x8000
bl    GOTO_R4


@ Move ScreenEntries
mov   r0, #0x0
ldr   r1, =0x6000
ldr   r4, =SetBackgroundMapDataOffset
bl    GOTO_R4
mov   r0, #0x1
ldr   r1, =0x6800
bl    GOTO_R4
mov   r0, #0x2
ldr   r1, =0x7000
bl    GOTO_R4
mov   r0, #0x3
ldr   r1, =0x7800
bl    GOTO_R4


@ Clear palettes
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =palette_buffer
ldr   r2, =0x1000100
swi   #0xC                            @ CpuFastSet


@ Clear BG
ldr   r0, =0x460046
str   r0, [sp]
mov   r0, sp
ldr   r1, =gpBG0MapBuffer
ldr   r2, =0x1000800
swi   #0xC                            @ CpuFastSet


mov   r0, #0xF
ldr   r4, =EnableBackgroundSyncByMask
bl    GOTO_R4
ldr   r4, =EnablePaletteSync
bl    GOTO_R4


@ Check whether we should skip titlescreen buildup
mov   r0, #0x29
ldrb  r0, [r5, r0]
lsl   r0, #0x18
asr   r0, #0x18
cmp   r0, #0x0
beq   Return

  @ Set, we build up the titlescreen.
  mov   r0, r5
  mov   r1, #0x0
  ldr   r4, =Goto6CLabel
  bl    GOTO_R4


Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
