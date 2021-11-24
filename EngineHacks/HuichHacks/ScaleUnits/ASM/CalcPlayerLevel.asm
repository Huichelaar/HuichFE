@ Loop through player army and return
@ highest level of all living units.
.thumb


ldr   r0, =gUnitArrayBlue   @ Array.
mov   r1, #0x0              @ Array index.
mov   r2, #0x1              @ Greatest level found.

Loop:
  ldr   r3, [r0]            @ Check if there's a unit in this slot.
  cmp   r3, #0x0
  beq   Next
    ldr   r3, [r0, #0xC]    @ Check if unit is alive.
    lsr   r3, #0x3
    bcs   Next
      ldrb  r3, [r0, #0x8]  @ Check if level needs to update.
      cmp   r2, r3
      bge   Next
        mov   r2, r3
  Next:
  add   r0, #0x48
  add   r1, #0x1
  cmp   r1, #62
  blt   Loop

mov   r0, r2
bx    r14
