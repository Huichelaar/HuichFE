@ Break loop block if all gems ended movement and timer has run out.
@ Also updates shineframe timer.
.thumb

push  {r4-r7, r14}
mov   r5, r1
mov   r6, r0


@ Update shine timer
mov   r0, #0x64
ldrb  r1, [r5, r0]
add   r1, #0x1
cmp   r1, #0x78
blt   L1
  mov   r1, #0x0
L1:
strb  r1, [r5, r0]


@ Break loop block if all movement has ended and timer has run out.
mov   r0, #0x0
mov   r1, #0x37

Loop:
  ldrb  r2, [r5, r1]
  lsr   r2, #0x7
  cmp   r2, #0x1
  bne   Return                            @ Return if a gem hasn't finished yet
    add   r1, #0x8
    add   r0, #0x1
    cmp   r0, #0x5
    ble   Loop
  
mov   r1, #0x66
ldrh  r2, [r5, r1]
cmp   r2, #0x0
ble   BreakLoop

  @ Decrement timer
  sub   r2, #0x1
  strh  r2, [r5, r1]
  b     Return

BreakLoop:
ldr   r2, =EndLabels
lsl   r0, r6, #0x2
ldr   r2, [r2, r0]
str   r2, [r5, #0x4]


Return:
mov   r0, #0x1
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
