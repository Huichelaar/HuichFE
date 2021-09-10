@ Only enable option when "Forts accessible" flag, 0x87, is set.
.thumb

push  {r4, r14}


ldr   r0, =FortressAccessibleFlag
lsl   r0, #0x10
lsr   r0, #0x10
ldr   r4, =CheckFlag
bl    GOTO_R4
mov   r1, r0
mov   r0, #0x3
cmp   r1, #0x0
beq   Return
  mov   r0, #0x1


Return:
pop   {r4}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
