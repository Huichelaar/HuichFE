@ Hook at 0x18B28.
@ Make GetUnitUseFlags also consider gambits.
@   r0 = Unitstruct.
.thumb

push  {r4-r7, r14}
mov   r7, r8
push  {r7}
mov   r5, r0
mov   r6, #0x0
mov   r7, #0x0


@ Check for gambit.
bl    GAM_GetGambit
cmp   r0, #0x0
beq   Return
  mov   r6, #0x1
    
Return:
ldr   r0, =0x8018B35
bx    r0
