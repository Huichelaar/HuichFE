@ Draws Affinity icon. Args:
@   r0: IconID. Clear tiles if 0.
@   r1: Vertical position, [0-15]
.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r4, r0
mov   r5, r1
mov   r6, #0x7
and   r6, r1


cmp   r4, #0x0
bne   L1

  @ Clear Tiles
  mov   r0, #0x0
  str   r0, [sp]
  mov   r0, sp
  ldr   r1, =0x6006C00
  lsl   r2, r6, #0x7
  add   r1, r2
  ldr   r2, =0x1000020
  swi   #0xC                      @ CPUFastSet
  b     Return

L1:

@ Load Affinity Icon.
sub   r0, r4, #0x1
lsl   r0, #0x7
ldr   r1, =AffinityIcons
add   r0, r1
ldr   r1, =0x6006C00
lsl   r2, r6, #0x7
add   r1, r2
mov   r2, #0x20
swi   #0xC                        @ CPUFastSet


@ Draw Affinity Icon.
ldr   r0, =gpBG2MapBuffer+0x8
lsl   r1, r5, #0x7
add   r0, r1
lsl   r1, r6, #0x2
ldr   r2, =0x3360
add   r1, r2
mov   r2, #0x0
mov   r3, #0x0

Loop:
  strh  r1, [r0]
  add   r1, #0x1
  add   r0, #0x2
  add   r2, #0x1
  cmp   r2, #0x1
  ble   Loop
  
    add   r0, #0x3C
    mov   r2, #0x0
    add   r3, #0x1
    cmp   r3, #0x1
    ble   Loop


Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
