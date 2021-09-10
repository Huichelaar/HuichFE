@ Initialize procvars, prepare tiles, load palettes.
@ Procvars:
@   +0x29: byte, Timer1. Used to determine "Press START" palette.
@   +0x2A: byte, Timer2. Used to determine "Press START" palette.
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Display BG0, BG1, BG2, OBJ
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x17
strb  r0, [r4, #0x1]


@ BG2 HOFS & VOFS
mov   r0, #0xC8
strh  r0, [r4, #0x24]
mov   r0, #0xB8
strh  r0, [r4, #0x26]


@ Init timers.
mov   r0, #0x29
mov   r1, #0x0
strb  r1, [r5, r0]
mov   r0, #0x2A
strb  r1, [r5, r0]


@ Prepare tiles
ldr   r0, =SubtitleTiles
ldr   r1, =0x6010000
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4
ldr   r0, =0x6010000
ldr   r1, =0x6008000
ldr   r2, =0x300
swi   #0xC                                @ CpuFastSet


@ Prepare OBJ palettes
ldr   r0, =PressStartPal
ldr   r1, =0x200
mov   r2, #0x20
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4
ldr   r0, =SubtitlePalette
ldr   r1, =0x2E0
mov   r2, #0x20
bl    GOTO_R4


@ Skip buildup
ldr   r0, [r5, #0x14]
mov   r1, #0x29
ldrb  r0, [r0, r1]
cmp   r0, #0x0
bne   L1

  @ Set; Skip to spritedrawing
  mov   r0, r5
  mov   r1, #0x0
  ldr   r4, =Goto6CLabel
  bl    GOTO_R4
  b     Return
  
L1:


@ Prepare BG palettes
ldr   r0, =PressStartPal
ldr   r1, =0x180
mov   r2, #0x20
bl    GOTO_R4
ldr   r0, =SubtitlePalette
ldr   r1, =0x1A0
mov   r2, #0x20
bl    GOTO_R4


@ Prepare ScreenEntries
ldr   r0, =SubtitleTSA
ldr   r1, =gGenericBuffer
mov   r2, #0x41
swi   #0xB                                @ CpuSet
ldr   r0, =gpBG2MapBuffer
ldr   r1, =gGenericBuffer
ldr   r2, =0xD000
ldr   r4, =FillTileRect
bl    GOTO_R4


@ Prepare blend
ldr   r0, =Procs_Blend
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
ldr   r1, =0x134C
strh  r1, [r0, #0x2C]
mov   r1, #0x0
mov   r2, #0x2E
strb  r1, [r0, r2]
mov   r1, #0x10
mov   r2, #0x2F
strb  r1, [r0, r2]
mov   r1, #0x1
mov   r2, #0x29
strb  r1, [r0, r2]
mov   r1, #0xFF
mov   r2, #0x2A
strb  r1, [r0, r2]
mov   r1, #0x1
mov   r2, #0x2B
strb  r1, [r0, r2]
mov   r1, #0x10
mov   r2, #0x31
strb  r1, [r0, r2]


mov   r0, #0x2
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
