@ Apply status to and reduce HP of all enemy units
@ in gambits' range, if using gambit.
@ Called by PostBattleCalcLoop.
.thumb

push  {r4-r7, r14}
ldr   r5, =RightBattleStruct
ldr   r6, =LeftBattleStruct


@ Check if we're post-combat
ldr   r0, =ActionData
ldrb  r0, [r0, #0x11]
cmp   r0, #0x2
bne   Return

  @ Check if attack missed.
  ldr   r0, =gpCurrentRound
  ldr   r0, [r0]
  sub   r0, #0x8                            @ Should be in the previous round.
  ldr   r0, [r0]
  mov   r1, #0x2                            @ Miss.
  tst   r0, r1
  bne   Return

    @ Check if weapon has GambitTargetStruct.
    mov   r0, #0x4A
    ldrb  r0, [r5, r0]
    lsl   r0, #0x2
    ldr   r1, =GambitTargetStructTable
    ldr   r7, [r1, r0]
    cmp   r7, #0x0
    beq   Return
      
      mov   r0, r5
      mov   r1, r6
      mov   r2, r7
      bl    GAM_GambitPrepRange

      @ Apply HP reduction and
      @ status to each enemy in range.
      L1:
      ldr   r0, =GAM_GambitHitTarget+1
      ldr   r4, =ForEachUnitInRange
      bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
