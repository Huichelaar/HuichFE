@ Prepare LCDIO & other stuff
.thumb

push  {r4-r7,r14}
sub   sp, #0x4

@ SetNextGameActionId to 0x3 (animated titlescreen)
mov   r0, #0x3
ldr   r4, =SetNextGameActionId
bl    GOTO_R4


@ Reset BG stuff (screenblocks, charblocks, screensize, etc.)
mov   r0, #0x0
ldr   r4, =SetupBackgrounds
bl    GOTO_R4


@ Make BG0 use Tiles2
ldr   r1, =0x8000                           @ Use Tiles2
mov   r0, #0x0
ldr   r4, =SetBackgroundTileDataOffset
bl    GOTO_R4


@ Display BG0, OBJ
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x11
strb  r0, [r4, #0x1]

@ BG0 priority 3
mov   r0, #0x3
ldrb  r1, [r4, #0xC]
orr   r1, r0
strb  r1, [r4, #0xC]

@ BG HOFS & VOFS
ldr   r0, =0x700010
str   r0, [r4, #0x1C]
mov   r0, #0x0
str   r0, [r4, #0x20]
str   r0, [r4, #0x24]
str   r0, [r4, #0x28]

@ Enable 1-dimensional sprite mapping
@ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x40
ldrb  r1, [r4]
orr   r1, r0
strb  r1, [r4]


@ Fade out BG0
mov   r0, #0x3
mov   r1, #0x0
mov   r2, #0x0
mov   r3, #0x10
ldr   r4, =SetSpecialColourEffectsParam
bl    GOTO_R4
mov   r0, #0x1
mov   r1, #0x0
mov   r2, #0x0
mov   r3, #0x0
str   r1, [sp]
ldr   r4, =BLDCNT1stTargets
bl    GOTO_R4


@ Clear VRAM. For some reason my version of mGBA doesn't do this
@ when resetting. Idk if that's on my end, but either way, this avoids
@ weird tiles popping up.
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =0x6000000
ldr   r2, =0x1006000
swi   #0xC                            @ CpuFastSet


@ Change BGM
mov   r0, #0x0                        @ SongID
mov   r1, #0x1                        @ Fadeout & Fadein rate?
mov   r2, #0x0                        @ No idea
ldr   r4, =Switch_BGM
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
