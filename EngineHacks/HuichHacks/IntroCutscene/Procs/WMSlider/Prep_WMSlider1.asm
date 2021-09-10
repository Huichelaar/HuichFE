@ Procstate vars. Format: <location>: <size>, <range>, <description>.
@   +0x29: byte, [0, 31], Timer.
@   +0x2A: byte, [0, 240], PrevX.
@   +0x2B: byte, [0, 160], PrevY.
@   +0x2C: byte, [0, 4], Transition index. Indicates which transition we're doing.
@   +0x2D: byte, [0, 1], indicates which background we're sliding.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ BGGemPalettes
mov   r0, #0x2C
ldrb  r0, [r5, r0]
lsl   r0, #0x6
ldr   r1, =WMGemPalettes
add   r0, r1
ldr   r1, =0x160
mov   r2, #0x40
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


@ Reset Timer.
mov   r0, #0x29
mov   r1, #0x0
strb  r1, [r5, r0]


@ Flip BG to slide
mov   r0, #0x2D
ldrb  r6, [r5, r0]
neg   r2, r6
add   r2, #0x1
strb  r2, [r5, r0]


mov   r0, #0xF
ldr   r4, =EnableBackgroundSyncByMask
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
