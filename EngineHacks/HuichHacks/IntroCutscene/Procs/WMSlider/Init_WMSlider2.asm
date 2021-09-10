@ Procstate vars. Format: <location>: <size>, <range>, <description>.
@   +0x2A: byte, [0, 240], PrevX. Initialized to 0
@   +0x2B: byte, [0, 160], PrevY. Initialized to 0
@   +0x2C: byte, [0, ??], Timer.
.thumb

push  {r4-r7,r14}
sub   sp, #0x4
mov   r5, r0


@ Initialize procvars
mov   r0, #0x0
strh  r0, [r5, #0x2A]
strh  r0, [r5, #0x2C]


@ Enable BG2
ldr   r4, =gpDISPCNTbuffer
ldrb  r0, [r4, #0x1]
mov   r1, #0x4
orr   r0, r1
strb  r0, [r4, #0x1]


@ BG2 priority
mov   r0, #0x2
ldrb  r1, [r4, #0x14]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x14]


@ Reset BG2 HOFS & VOFS
mov   r0, #0x0
str   r0, [r4, #0x24]


@ Prepare WM
@ WM Palettes
ldr   r0, =WMPalette
mov   r1, #0xE0                           @ Overwrite BG palettes 7-10
mov   r2, #0x80                           @ Load 4 palettes (1 short per colour)
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4

@ Prepare Palette Map
ldr   r0, =WMPaletteMap
ldr   r1, =WMPaletteRAM
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4


@ Prepare blend
ldr   r0, =Procs_Blend
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
ldr   r1, =0x441
strh  r1, [r0, #0x2C]
mov   r1, #0x10
mov   r2, #0x2E
strb  r1, [r0, r2]
mov   r1, #0x0
mov   r2, #0x2F
strb  r1, [r0, r2]
mov   r1, #0x0
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


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
