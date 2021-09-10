@ Skip animation if:
@   Anim is long range (4+), or
@   L-button is pressed.
.thumb

push  {r14}


mov   r0, #0x1

ldr   r1, =AnimDistance
mov   r2, #0x0
ldsh  r1, [r1, r2]
cmp   r1, #0x2
beq   Skip                            @ Skip if long range anim.

  ldr   r1, =KeyStatusBuffer
  ldrh  r1, [r1, #0x4]
  ldr   r2, =0x200
  tst   r1, r2
  bne   Skip                          @ Skip if L is pressed.
  
    ldr   r0, =ChapterData
    add   r0, #0x42
    ldrb  r0, [r0]
    lsl   r0, #0x1D
    lsr   r0, #0x1E
    ldr   r1, =0x802CAA5
    bx    r1

Skip:
ldr   r1, =0x802CAF3
bx    r1
