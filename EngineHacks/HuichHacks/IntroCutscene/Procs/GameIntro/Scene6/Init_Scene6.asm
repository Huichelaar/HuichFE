@ Prepare LCDIO & other stuff.
@ Procvars:
@   +0x2A, short: timer.
.thumb

push  {r4-r7,r14}
sub   sp, #0x4
mov   r5, r0


@ Display BG0, OBJ, Window 0
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x31
strb  r0, [r4, #0x1]


@ Window 0 dimensions & control
mov   r0, #0xF0
strh  r0, [r4, #0x2C]
ldr   r0, =0x90A0
strh  r0, [r4, #0x30]
mov   r0, #0x10
mov   r1, #0x34
strb  r0, [r4, r1]
mov   r0, #0x35
mov   r1, #0x36
strb  r0, [r4, r1]


@ Reset timer.
mov   r0, #0x0
strh  r0, [r5, #0x2A]


@ Prepare eyes
ldr   r0, =EyesTiles
ldr   r1, =0x6011140
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

ldr   r0, =EyesPalette
ldr   r1, =0x260
mov   r2, #0x20
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


@ Clear BG palettes 0-7
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =palette_buffer
ldr   r2, =0x1000040
swi   #0xC                          @ CpuFastSet


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
