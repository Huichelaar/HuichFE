@ Initializes Whirlpool gfx.
@ Procvars:
@   +0x2A, short: timer. Used to indicate which palette to load. Initialized to 0.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Reset timer.
mov   r0, #0x0
strh  r0, [r5, #0x2A]


@ Reset BG0 HOFS & VOFS
ldr   r1, =gpDISPCNTbuffer
mov   r0, #0x0
str   r0, [r1, #0x1C]


@ TSA
ldr   r0, =gpBG0MapBuffer
ldr   r1, =WhirlpoolTSA
mov   r2, #0x0
ldr   r4, =FillTileRect
bl    GOTO_R4


@ Tiles
ldr   r0, =WhirlpoolTiles
ldr   r1, =0x6000000
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4


mov   r0, #0x0
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
