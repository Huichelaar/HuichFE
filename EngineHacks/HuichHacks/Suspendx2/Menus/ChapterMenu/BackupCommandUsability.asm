.thumb

mov   r0, #0x1
mov   r1, #0xE
lsl   r1, #0x18
add   r1, #0xD4
ldrb  r1, [r1]
cmp   r1, #0x0
bne   Return

  @ Don't display options if no return-to-backups left.
  mov   r0, #0x3

Return:
bx    r14
