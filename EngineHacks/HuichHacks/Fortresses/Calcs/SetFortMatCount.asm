@ Sets the values of a Forts materials. Arguments:
@   r0: fort index
@   r1: WWXXYYZZ, Where WW is material count for material 1, analogous for XX, YY, ZZ.
.thumb

sub   sp, #0x4
mov   r12, r0
str   r1, [sp]


@ Pack material count bytes into three bytes
mov   r0, #0x0
mov   r1, sp
mov   r2, #0x0
Loop:
  lsl   r2, #0x6
  ldrb  r3, [r1, r0]
  add   r2, r3
  add   r0, #0x1
  cmp   r0, #0x3
  ble   Loop


@ Store material count in fort
str   r2, [r1]
ldr   r0, =FortRAM
lsl   r0, #0x5
lsr   r0, #0x5
mov   r1, #0x5
mov   r3, r12
mul   r1, r3
add   r0, r1
add   r0, #0x2

mov   r1, sp
mov   r2, #0x0
Loop2:
  mov   r3, #0x2
  sub   r3, r2
  ldrb  r3, [r1, r3]
  strb  r3, [r0, r2]
  add   r2, #0x1
  cmp   r2, #0x2
  ble   Loop2

add   sp, #0x4
bx    r14
