@ Procstate vars. Format: <location>: <size>, <range>, <description>.
@   +0x29: byte, [0, 31], Timer.
@   +0x2A: byte, [0, 240], PrevX. Initialized to 0
@   +0x2B: byte, [0, 160], PrevY. Initialized to 0
@   +0x2C: byte, [0, 3], Transition index. Indicates which transition we're doing.
@   +0x2D: byte, [0, 1], indicates which background we're sliding. Initialized to 0.
.thumb

push  {r4-r7,r14}
sub   sp, #0x4
mov   r5, r0


@ Initialize procvars
mov   r0, #0x0
strh  r0, [r5, #0x2A]
strh  r0, [r5, #0x2C]


@ Set blend targets
mov   r0, #0x0
mov   r1, #0x1
mov   r2, #0x0
mov   r3, #0x1
str   r2, [sp]
ldr   r4, =BLDCNT1stTargets
bl    GOTO_R4
mov   r0, #0x1
mov   r1, #0x0
mov   r2, #0x1
mov   r3, #0x0
str   r3, [sp]
ldr   r4, =BLDCNT2ndTargets
bl    GOTO_R4


@ Prepare BGs

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

@ Move GemCharEntries
ldr   r0, =0x6012000
ldr   r1, =0x6005800
ldr   r2, =0x200
swi   #0xC                            @ CpuFastSet

@ BGGemTSA
ldr   r0, =GemTSA
ldr   r1, =gGenericBuffer
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

@ Change GemScreenEntries
ldr   r0, =WMScreenEntries
ldrb  r6, [r0]
sub   r6, #0x1
mov   r0, #0xF
and   r6, r0

ldr   r0, =gpBG2MapBuffer
ldr   r1, =gGenericBuffer
lsl   r2, r6, #0x6
ldr   r4, =FillTileRect
bl    GOTO_R4
ldr   r0, =gpBG3MapBuffer
ldr   r1, =gGenericBuffer
mov   r2, #0x40
add   r2, r6
lsl   r2, #0x6
bl    GOTO_R4


@ Change BG2 & BG3 Char Blocks
mov   r0, #0x2D
ldrb  r6, [r5, r0]
lsl   r1, r6, #0xF
mov   r0, #0x2
ldr   r4, =SetBackgroundTileDataOffset
bl    GOTO_R4
lsl   r1, r6, #0xF
mov   r0, #0x3
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
