@ Creates DrawTextSprites proc.
@ Arguments:
@   r0: Initial Textsprite ID.
@   r1: Parent proc.
@ Procstate vars. Format: <location>: <size>, <range>, <description>.
@   +0x29: byte, [0, 11], Textsprite ID.
@   +0x2A: short, [0, 270], Timer.
.thumb

push  {r4-r7,r14}
mov   r6, r0
mov   r5, r1


@ Create proc
ldr   r0, =Procs_DrawTextSprites
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4

mov   r1, #0x29
strb  r6, [r0, r1]
mov   r1, #0x0
strh  r1, [r0, #0x2A]


@ Prepare TextSprite palette
ldr   r0, =TextPalettes
ldr   r1, =0x200                          @ Overwrite OBJ palette 0
mov   r2, #0x20                           @ Load 1 palette (1 short per colour)
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


@ Prepare TextSprite tiles
ldr   r0, =TextLine
lsl   r1, r6, #0x2
ldr   r0, [r0, r1]
ldr   r1, =0x6010000
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4


mov   r0, #0x1
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
