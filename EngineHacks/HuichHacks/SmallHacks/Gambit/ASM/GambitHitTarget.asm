@ Apply status and reduce HP to enemy unit.
@ Called by BattleProcCalcLoop. Args:
@   r0: target unitstruct
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Check if unit is enemy.
ldrb  r0, [r5, #0xB]
mov   r1, #0x80
tst   r1, r0
beq   Return

  @ Check if unit is main target.
  ldr   r1, =LeftBattleStruct
  ldrb  r1, [r1, #0xB]
  cmp   r0, r1
  beq   Return


    @ Reduce HP.
    @ Grab gambit might.
    ldr   r6, =RightBattleStruct
    mov   r0, #0x4A
    ldrb  r0, [r6, r0]
    lsl   r1, r0, #0x5
    lsl   r0, #0x2
    add   r0, r1
    ldr   r1, =ItemTable
    add   r7, r0, r1
    ldrb  r0, [r7, #0x15]                 @ Gambit might.
    
    @ Calculate damage.
    @ Ignore skills, debuffs, etc.
    ldrb  r1, [r7, #0x8]
    mov   r2, #0x2
    tst   r2, r1
    beq   Physical
    
      @ Magic damage.
      @ Assumes str/mag split.
      mov   r1, #0x3A
      ldrb  r1, [r6, r1]                  @ Magic.
      ldrb  r2, [r5, #0x18]               @ Resistance.
      b     L1
      
    Physical:
    
      ldrb  r1, [r6, #0x14]               @ Strength.
      ldrb  r2, [r5, #0x17]               @ Defense.
      
    L1:
    add   r0, r1
    cmp   r2, r0
    bge   InflictStatus                   @ Skip if damage lower than def or res.
      sub   r0, r2
      lsr   r0, #0x1                      @ Half damage output.
      ldrb  r1, [r5, #0x13]
      sub   r2, r1, r0
      cmp   r0, r1
      blt   L2
      
        @ Damage >= current HP
        @ Set current HP to 1.
        mov   r2, #0x1
        
      L2:
      strb  r2, [r5, #0x13]
        
    
    @ Inflict gambit's status.
    @ Will overwrite current status if any.
    @ Only works if status set to effect 0xD.
    @ Assumes Status Weapons.
    InflictStatus:
    ldrb  r0, [r7, #0x1F]
    cmp   r0, #0xD
    bne   Return
    
      @ Effect and duration in +0x22
      mov   r0, #0x22
      ldrb  r0, [r7, r0]
      mov   r1, #0x30
      strb  r0, [r5, r1]


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
