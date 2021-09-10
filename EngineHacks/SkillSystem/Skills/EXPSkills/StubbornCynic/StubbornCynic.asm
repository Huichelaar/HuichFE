@ Stubborn Cynic: This unit will not gain any exp.
@ Make sure this skill is put at the end of the EXPCalcLoop.
@ r0 = current EXP, r1 = this battle struct, r2 = enemy battle struct. Return modified EXP.
.thumb

push  {r4-r7, r14}
mov   r5, r0

mov   r0, r1
ldr   r1, =StubbornCynicID
lsl   r1, #0x18
lsr   r1, #0x18
bl    SkillTester
cmp   r0, #0x0
beq   Return

  @ Clear exp if unit has Stubborn Cynic
  mov   r5, #0x0

Return:
mov   r0, r5
pop   {r4-r7}
pop   {r1}
bx    r1
