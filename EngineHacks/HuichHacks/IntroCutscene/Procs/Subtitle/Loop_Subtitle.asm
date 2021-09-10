@ Draw Subtitle & "Press START" sprites.
@ Procvars:
@   +0x29: byte, Timer1. Used to determine "Press START" palette.
@   +0x2A: byte, Timer2. Used to determine "Press START" palette.
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Update timers
mov   r1, #0x29
ldrb  r4, [r5, r1]
mov   r7, #0x2A
ldrb  r6, [r5, r7]
add   r0, r4, #0x1
cmp   r0, #0x3
blt   L1
  mov   r0, #0x0
L1:
strb  r0, [r5, r1]

mov   r1, #0x3
swi   #0x6                                @ mod
cmp   r1, #0x0
bne   L2

  @ Update Timer2 every 3 frames.
  add   r6, #0x1
  mov   r0, #0x1F
  and   r6, r0
  strb  r6, [r5, r7]

L2:


@ Update "Press START" palette
mov   r0, #0x10
tst   r0, r6
beq   L3
  mov   r0, #0xF
  and   r0, r6
  b     L4
L3:
  mov   r0, #0x1F
  sub   r0, r6
  mov   r1, #0xF
  and   r0, r1
L4:
lsl   r0, #0x1
ldr   r1, =PressStartPal+0x80
add   r0, r1
ldr   r1, =0x210
mov   r2, #0x2
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


@ Draw Subtitle
mov   r0, #0x0
mov   r1, #0x0
ldr   r2, =SubtitleOAM
mov   r3, #0x0
ldr   r4, =PushToSecondaryOAM
bl    GOTO_R4

@ Draw "Press START"
mov   r0, #0xB8
mov   r1, #0x80
ldr   r2, =OAM_64x32
ldr   r3, =0x440
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
