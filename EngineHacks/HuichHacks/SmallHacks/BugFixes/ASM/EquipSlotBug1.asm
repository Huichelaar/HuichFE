@ Hooked at 0x322B0. Don't check inventory slot
@ against Nightmare if unit equipped slot >4.
@ r0 = unitstruct.
@ r4 = actiondata, 0x203A958
.thumb


ldrb  r1, [r4, #0x12]
cmp   r1, #0x4
bgt   L1


  @ Not using ballista
  @ or gambit. Vanilla.
  lsl   r1, r1, #0x1
  add   r0, #0x1E
  add   r0, r1
  ldrh  r0, [r0]
  lsl   r0, #0x18
  lsr   r0, #0x18
  bx    r14


@ Unit is using equipped slot >4
@ Skip Nightmare check.
L1:
ldr   r0, =0x80322FD
bx    r0
