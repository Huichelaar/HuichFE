@ Draws the upper screen entries of BG3
@ Arguments:
@   r0: StartTile index
.thumb


mov   r3, r0

@ Bottom Row
ldr   r1, =gpBG3MapBuffer+0x7FE
strh  r0, [r1]

sub   r1, #0x3E
add   r0, #0x1
mov   r2, #0x0

Loop:
  strh  r0, [r1]
  add   r0, #0x1
  add   r1, #0x2
  add   r2, #0x1
  cmp   r2, #0x1F
  blt   Loop


@ Leftmost column
mov   r0, r3
add   r0, #0x24
ldr   r1, =gpBG3MapBuffer+0x3E
mov   r2, #0x0

Loop2:
  strh  r0, [r1]
  add   r0, #0x24
  add   r1, #0x40
  add   r2, #0x1
  cmp   r2, #0x10
  blt   Loop2


@ The remaining 31x16 tiles
mov   r0, r3
add   r0, #0x25
ldr   r1, =gpBG3MapBuffer
mov   r2, #0x0
mov   r3, #0x0

Loop3:
  strh  r0, [r1]
  add   r1, #0x2
  add   r0, #0x1
  add   r2, #0x1
  cmp   r2, #0x1F
  blt   Loop3
    mov   r2, #0x0
    add   r1, #0x2
    add   r0, #0x5
    add   r3, #0x1
    cmp   r3, #0x10
    blt   Loop3

bx    r14
