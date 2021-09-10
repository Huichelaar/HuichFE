@ Reduce gambit charges, if using gambit.
@ Called by PostBattleCalcLoop.
.thumb

push  {r4-r7, r14}
ldr   r5, =RightBattleStruct


@ Check if we're post-combat.
ldr   r0, =ActionData
ldrb  r0, [r0, #0x11]
cmp   r0, #0x2
bne   Return

  @ Check if weapon has GambitTargetStruct.
  mov   r0, #0x4A
  ldrb  r0, [r5, r0]
  lsl   r0, #0x2
  ldr   r1, =GambitTargetStructTable
  ldr   r0, [r1, r0]
  cmp   r0, #0x0
  beq   Return
  
    @ Reduce gambit charges.
    ldrb  r0, [r5, #0xB]
    lsl   r0, #0x3
    add   r0, #0x5
    ldr   r1, =DebuffTablePointer
    ldr   r1, [r1]
    add   r0, r1
    ldrb  r1, [r0]
    lsr   r2, r1, #0x5
    cmp   r2, #0x7
    beq   Return                          @ Don't cause overflow. Shouldn't get here though.
      
      add   r2, #0x1
      lsl   r2, #0x5
      mov   r3, #0x1F
      and   r1, r3
      orr   r1, r2
      strb  r1, [r0]


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
