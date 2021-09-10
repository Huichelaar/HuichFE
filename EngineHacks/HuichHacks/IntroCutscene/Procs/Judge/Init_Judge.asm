@ Procstate vars. Format: <location>: <size>, <range>, <description>.
@   +0x29: byte, [0, 3], JudgeTiles ID.
@   +0x2A: short, [0, 256], Timer.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Initialize procvars
mov   r0, #0x29
mov   r1, #0x0
strb  r1, [r5, r0]
mov   r0, #0x2A
strh  r1, [r5, r0]


@ Prepare BG0 Tiles
ldr   r0, =Judge
ldr   r0, [r0]
ldr   r1, =0x6008000
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4


@ Prepare BG0 palette
ldr   r0, =JudgePalette
mov   r1, #0x0                            @ Overwrite BG palette 0
mov   r2, #0x20                           @ Load 1 palette (1 short per colour)
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


@ Prepare BG0 Screen entries
ldr   r0, =gpBG0MapBuffer
mov   r1, #0x0
ldr   r2, =0x400

Loop:
  strh  r1, [r0]
  add   r1, #0x1
  add   r0, #0x2
  cmp   r1, r2
  blt   Loop


mov   r0, #0x0
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
