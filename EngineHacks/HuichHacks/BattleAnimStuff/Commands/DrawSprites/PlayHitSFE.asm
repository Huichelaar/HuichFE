@ Play Hit SFE.
@ Called by sprite FrameData.
.thumb

push  {r4-r7, r14}


ldr   r0, =Procs_BACDrawSprites
ldr   r4, =Find6C
bl    GOTO_R4
mov   r5, r0
cmp   r5, #0x0
beq   Return


  @ AIStructs
  ldr   r0, [r5, #0x30]
  mov   r6, r0
  ldr   r4, =GetTargetAIS
  bl    GOTO_R4
  mov   r7, r0

  @ Check if a unit is dying.
  @ldr   r0, =DeathActiveBool
  @ldrb  r0, [r0]
  @cmp   r0, #0x0
  @bne   Return
  
    @ Check if target is being drawn.
    @ldrh  r0, [r7]
    @mov   r1, #0x2
    @tst   r0, r1
    @bne   Return

      @ If we didn't miss,
      @ play hit/crit/NODMG sound effect.
      mov   r0, r6
      ldr   r4, =GetSomeAISRelatedIndexMaybe
      bl    GOTO_R4
      lsl   r0, #0x10
      asr   r0, #0x10
      ldr   r4, =CheckMiss
      bl    GOTO_R4
      cmp   r0, #0x0
      bne   Return
      
        @ Temporarily set to previous round.
        ldr   r6, =0x203E152
        mov   r0, #0x0
        ldsh  r0, [r6, r0]
        sub   r0, #0x1
        strh  r0, [r6]
        mov   r0, #0x2
        ldsh  r0, [r6, r0]
        sub   r0, #0x1
        strh  r0, [r6, #0x2]
        
        mov   r0, r7
        ldr   r4, =PlayHitSound
        bl    GOTO_R4
        
        @ Set back to current round.
        mov   r0, #0x0
        ldsh  r0, [r6, r0]
        add   r0, #0x1
        strh  r0, [r6]
        mov   r0, #0x2
        ldsh  r0, [r6, r0]
        add   r0, #0x1
        strh  r0, [r6, #0x2]


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
