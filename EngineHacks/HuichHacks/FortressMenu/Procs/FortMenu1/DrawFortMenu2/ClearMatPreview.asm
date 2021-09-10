@ Clear the material preview indicating how much of which materials
@ will be left after an action is taken.
.thumb

push  {r4-r5, r14}
sub   sp, #0x4

ldr   r4, =CpuSet
mov   r5, #0x0

Loop:
  mov   r0, #0x0
  str   r0, [sp]
  mov   r0, sp
  ldr   r1, =gpBG0MapBuffer
  lsl   r2, r5, #0x6
  add   r1, r2
  add   r1, #0x50
  mov   r2, #0x5
  lsl   r2, #0x18
  add   r2, #0xB
  bl    GOTO_R4
  add   r5, #0x1
  cmp   r5, #0x3
  ble   Loop


Return:
add   sp, #0x4
pop   {r4-r5}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
