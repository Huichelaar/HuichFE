@ Mimics 0x249AC, AttackCommandUsability,
@ but checks for gambit as well.
.thumb

push  {r4-r7, r14}


@ Check if unit is canto-ing.
ldr   r0, =ActiveUnit
ldr   r5, [r0]
ldr   r0, [r5, #0xC]
mov   r1, #0x40
and   r1, r0
cmp   r1, #0x0
bne   False

  @ Check if unit is in ballista.
  ldr   r1, =0x800
  and   r1, r0
  cmp   r1, #0x0
  bne   False
  
    @ Check if unit has any weapons they can use.
    mov   r6, #0x0
    
    Loop:
      lsl   r0, r6, #0x1
      add   r0, #0x1E
      ldrh  r7, [r5, r0]
      cmp   r7, #0x0
      beq   GambitCheck
      
        mov   r0, r7
        ldr   r4, =GetItemAttributes
        bl    GOTO_R4
        mov   r1, #0x1
        and   r1, r0
        cmp   r1, #0x0
        beq   L1
        
          mov   r0, r5
          mov   r1, r7
          ldr   r4, =CanUnitUseWeapon
          bl    GOTO_R4
          cmp   r0, #0x0
          beq   L1
          
            L2:
            mov   r0, r5
            mov   r1, r7
            ldr   r4, =MakeTargetListForWeapon
            bl    GOTO_R4
            ldr   r4, =GetTargetListSize
            bl    GOTO_R4
            mov   r1, r0
            mov   r0, #0x1
            cmp   r1, #0x0
            bne   Return
            
        L1:
        add   r6, #0x1
        cmp   r6, #0x4
        ble   Loop
          cmp   r6, #0x5
          bgt   False
          
            GambitCheck:
            mov   r6, #0x5
            mov   r0, r5
            bl    GAM_GetGambit
            cmp   r0, #0x0
            beq   False
              mov   r7, r0
              b     L2


False:
mov   r0, #0x3
Return:
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
