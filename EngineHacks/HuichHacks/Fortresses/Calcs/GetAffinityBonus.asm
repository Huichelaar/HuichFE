@ Calculates & returns Affinity matchup bonus. Arguments:
@   r0 = UnitID
@   r1 = FortID
.thumb

push  {r4-r7, r14}
mov   r4, r0
mov   r5, r1


@mov   r0, r4
cmp   r0, #0x0
beq   Return

  @ Obtain ROM Unit struct
  lsl   r1, r0, #0x5
  lsl   r2, r0, #0x4
  add   r1, r2
  lsl   r2, r0, #0x2
  add   r1, r2                              @ Multiply by 0x34
  ldr   r0, =CharacterTable
  add   r0, r1
  
  @ Affinity boost
  ldrb  r0, [r0, #0x9]                      @ Unit Affinity
  ldr   r1, =AffinityMatchupBonusTable
  lsl   r0, #0x3
  add   r0, r1
  lsl   r1, r5, #0x5
  add   r1, #0x15
  ldr   r2, =FortsTable
  ldrb  r1, [r2, r1]                        @ Fort Affinity
  ldrb  r0, [r0, r1]                        @ Affinity matchup bonus


Return:
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
