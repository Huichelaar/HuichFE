@ Mimic 0x22CA4, but use gambit item.
.thumb

push  {r4-r5, r14}


ldr   r5, =ActiveUnit
ldr   r0, [r5]
bl    GAM_GetGambit
cmp   r0, #0x0
beq   Return
  mov   r4, r0
  ldr   r0, [r5]
  bl    New_Attack_Map


Return:
mov   r0, #0x3
pop   {r4-r5}
pop   {r1}
bx    r1
