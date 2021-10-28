@ Hooks at 0xDB8, CopyToPaletteBuffer. Args:
@   r0: pointer to palette.
@   r1: palette bank offset.
@   r2: number of bytes to copy.
.thumb

push	{r4-r6,r14}
mov   r4, r0
mov   r5, r1
mov   r6, r2


@ Check if Sepia or not.
ldr   r0, =SepiaFlag
lsl   r0, #5
lsr   r0, #5
ldr   r1, =0x8083DA9        @ CheckFlag routine.
bl    GOTO_R1
cmp   r0, #0x0
bne   Sepia
  @ No sepia, return to vanilla.
  mov   r0, r4
  mov   r1, r5
  mov   r3, r6
  pop   {r4-r6}
  push  {r4}
  mov   r4, r0
  mov   r0, #0x1F
  ldr   r2, =0x8000DC1
  mov   r15, r2
  
Sepia:
asr		r5,#1
lsl		r5,#1
ldr		r2,=0x20228A8         @ Palette buffer.
add		r5,r2
lsr		r6,#1
Loop:
  ldrh	r0,[r4]
  bl		GetSepia
  strh	r0,[r5]
  add		r4,#2
  add		r5,#2
  sub		r6,#1
  cmp		r6,#0
  bgt		Loop

ldr		r0,=0x300000E         @ Flush palette buffer flag.
mov		r1,#1
strb	r1,[r0]


pop		{r4-r6}
pop		{r0}
bx		r0
GOTO_R1:
bx    r1
