@ Prepare Slam Tiles
.thumb

push  {r4-r7,r14}
sub   sp, #0x4
mov   r5, r0


@ Clear Colour effects
mov   r0, #0x0
mov   r1, #0x0
mov   r1, #0x0
mov   r1, #0x0
ldr   r4, =SetSpecialColourEffectsParam
bl    GOTO_R4


@ Scroll BG0
ldr   r1, =gpDISPCNTbuffer
mov   r0, #0xC0
str   r0, [r1, #0x1C]


@ Prepare BG0 Tiles
ldr   r0, =SlamTiles
ldr   r1, =0x6008000
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4


@ Prepare BG0 palette
ldr   r0, =SlamPalette
mov   r1, #0x0                            @ Overwrite BG palette 0
mov   r2, #0x20                           @ Load 1 palette (1 short per colour)
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


@ Clear BG0 Screen entries
mov   r0, sp
ldr   r1, =0x2FF
strh  r1, [r0]
strh  r1, [r0, #0x2]
ldr   r1, =gpBG0MapBuffer
ldr   r2, =0x1000200
swi   #0xC                                @ CpuFastSet


mov   r0, #0x0
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
