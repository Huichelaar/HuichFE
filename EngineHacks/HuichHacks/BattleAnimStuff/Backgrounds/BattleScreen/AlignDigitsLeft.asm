.thumb

ldr   r0, =0x2017712
mov   r1, #0x0
Loop:
  ldrh  r2, [r0, #0x2]
  cmp   r2, #0xB
  bne   L1
    ldrh  r3, [r0, #0x4]
    strh  r3, [r0]
    strh  r2, [r0, #0x4]
    b     L2
  L1:
  ldrh  r2, [r0]
  cmp   r2, #0xB
  bne   L2
    ldrh  r3, [r0, #0x2]
    strh  r3, [r0]
    ldrh  r3, [r0, #0x4]
    strh  r3, [r0, #0x2]
    strh  r2, [r0, #0x4]
  L2:
  add   r0, #0x6
  add   r1, #0x1
  cmp   r1, #0x3
  blt   Loop

mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =0x20169C8
ldr   r2, =0x1000100
swi   #0xC      @ CpuFastSet

bx    r14
.ltorg
