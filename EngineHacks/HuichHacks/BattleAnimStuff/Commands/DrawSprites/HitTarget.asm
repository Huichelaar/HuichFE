@ Hit target.
@ Called by sprite FrameData.
.thumb

push  {r4-r7, r14}


ldr   r0, =Procs_BACDrawSprites
ldr   r4, =Find6C
bl    GOTO_R4
cmp   r0, #0x0
beq   Return

  @ AIStructs.
  ldr   r0, [r0, #0x30]
  mov   r6, r0
  ldr   r4, =GetTargetAIS
  bl    GOTO_R4
  mov   r7, r0
  
  @ Check if missed.
  mov   r0, r6
  ldr   r4, =GetSomeAISRelatedIndexMaybe
  bl    GOTO_R4
  lsl   r0, #0x10
  asr   r0, #0x10
  ldr   r4, =CheckMiss
  bl    GOTO_R4
  mov   r5, r0
  cmp   r5, #0x1
  beq   L1

    @ If defender got hurt,
    @ display hit-flash.
    @ FIXME, what about devil effect?
    @ FIXME, critflashes won't happen.
    ldr   r4, =DidAISTakeDamage
    bl    GOTO_R4
    cmp   r0, #0x2
    beq   L1
      mov   r0, r6
      mov   r1, #0x6
      ldr   r4, =LoadFlashBG
      bl    GOTO_R4
    L1:
    
  @ Set some flags in AIS and target AIS.
  @   flag 0 set, perform anim.
  @   flag 3 set, end hold anim.
  @ If the attack missed,
  @ target performs their dodge anim.
  ldrh  r0, [r7, #0x10]
  mov   r1, #0x1
  orr   r0, r1
  strh  r0, [r7, #0x10]
  @ Main AIS doesn't hold anim.
  ldrh  r0, [r6, #0x10]
  mov   r1, #0x9
  orr   r0, r1
  strh  r0, [r6, #0x10]
  
  
  @ Decrease target's HP.
  mov   r1, r5
  mov   r0, r7
  ldr   r4, =DepleteHP
  bl    GOTO_R4
  
  @ If we didn't miss,
  @ play hit/crit/NODMG sound effect.
  cmp   r5, #0x0
  bne   Return
    mov   r0, r7
    ldr   r4, =PlayHitSound
    bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
