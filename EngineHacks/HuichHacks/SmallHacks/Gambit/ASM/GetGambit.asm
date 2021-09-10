@ Returns Gambit Item ID | Gambit remaining charges < 0x8.
@ Returns 0 if no gambit.
@ Input:
@   r0: RAM UnitStruct.
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Check if r0 not NULL
cmp   r5, #0x0
beq   False

  @ Check if unit has Gambit skill.
  ldr   r1, =GambitID
  mov   r0, #0xFF
  and   r1, r0
  mov   r0, r5
  bl    SkillTester
  cmp   r0, #0x0
  beq   False

    @ Determine GambitID
    @ using unit class.
    ldr   r0, [r5, #0x4]
    ldrb  r0, [r0, #0x4]
    ldr   r1, =GambitIDTable
    ldrb  r6, [r1, r0]
    
    @ Determine total uses.
    lsl   r0, r6, #0x5
    lsl   r1, r6, #0x2
    add   r0, r1  
    ldr   r1, =ItemTable
    add   r0, r1
    ldrb  r7, [r0, #0x14]
    
    @ Determine remaining uses.
    ldrb  r0, [r5, #0xB]
    lsl   r0, #0x3
    add   r0, #0x5
    ldr   r1, =DebuffTablePointer
    ldr   r1, [r1]
    ldrb  r0, [r1, r0]
    lsr   r0, #0x5
    sub   r7, r0
    cmp   r7, #0x0
    ble   False
    
      @ There still are uses left.
      lsl   r7, #0x8
      orr   r6, r7
      mov   r0, r6

      @ Equippable gambit?
      ldr   r4, =GetItemAttributes
      bl    GOTO_R4
      mov   r1, #0x1
      tst   r1, r0
      beq   False
      
        @ Can unit use gambit?
        mov   r0, r5
        mov   r1, r6
        ldr   r4, =CanUnitUseWeapon
        bl    GOTO_R4
        cmp   r0, #0x0
        beq   False
          mov   r0, r6
          b     Return


False:
mov   r0, #0x0
Return:
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
