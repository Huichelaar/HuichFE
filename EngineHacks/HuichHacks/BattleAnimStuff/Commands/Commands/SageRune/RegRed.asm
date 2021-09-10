@ Mimics 0x59536
.thumb

mov   r0, r7
ldr   r3, =GetAISLayerID
bl    GOTO_R3
cmp   r0, #0x0
bne   Return

  mov   r0, r7
  mov   r1, #0x0
  ldr   r2, =RedRunePalette
  bl    SageRune

Return:
ldr   r0, =0x80596CC
mov   r15, r0
GOTO_R3:
bx    r3
