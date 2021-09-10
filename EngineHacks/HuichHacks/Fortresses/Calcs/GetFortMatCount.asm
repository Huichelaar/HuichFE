@ Calculates & returns the amount of each material a fort has. Arguments:
@   r0: fort index
@ Returns:
@   r0: WWXXYYZZ, Where WW is material count for material 1, analogous for XX, YY, ZZ.
.thumb

push  {r4}
sub   sp, #0x4

ldr   r1, =FortRAM
lsl   r1, #0x5
lsr   r1, #0x5
mov   r2, #0x5
mul   r0, r2
add   r1, r0

ldrb  r2, [r1, #0x2]
lsl   r2, #0x8
ldrb  r0, [r1, #0x3]
add   r2, r0
lsl   r2, #0x8
ldrb  r0, [r1, #0x4]
add   r2, r0

mov   r0, #0x8
mov   r1, #0x0
mov   r4, sp

Loop:
  mov   r3, r2
  lsl   r3, r0
  lsr   r3, #0x1A
  strb  r3, [r4, r1]
  
  add   r0, #0x6
  add   r1, #0x1
  cmp   r1, #0x3
  ble   Loop

ldr   r0, [sp]
add   sp, #0x4
pop   {r4}
bx    r14
