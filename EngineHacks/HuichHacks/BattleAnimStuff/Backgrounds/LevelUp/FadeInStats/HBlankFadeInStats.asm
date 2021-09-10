@ Change BLDA EVA and EVB on HBlank.
.thumb


ldr   r0, =REG_VCOUNT
ldrh  r0, [r0]
add   r0, #0x1
cmp   r0, #0xE4                   @ There're only 228 scanlines.
bne   L1
  mov   r0, #0x0
L1:
cmp   r0, #0x8F                   @ Only care about scanlines up to 144.
bhi   Return
  ldr   r1, =BLDARAM
  ldr   r1, [r1]
  add   r1, #0xA
  cmp   r0, #0x50
  blo   L2
    sub   r0, #0x50
    lsr   r0, #0x4
    lsl   r0, #0x1
    ldrh  r1, [r1, r0]
    b     L3
  L2:
    ldrh  r1, [r1, #0x8]
  L3:
  ldr   r2, =0x4000052
  strh  r1, [r2]

Return:
bx    r14
