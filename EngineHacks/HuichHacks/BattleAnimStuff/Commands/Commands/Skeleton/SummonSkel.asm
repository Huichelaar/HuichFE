@ Summon skeletons command.
.thumb

push  {r4-r7}
sub   sp, #0xC

mov   r0, r7
ldr   r4, =GetAISLayerID
bl    GOTO_R4
cmp   r0, #0x0
bne   Return

  ldr   r4, =ClearBG1Setup
  bl    GOTO_R4
  ldr   r0, =Procs_BACDrawSprites
  mov   r1, #0x6
  ldr   r4, =New6C
  bl    GOTO_R4
  mov   r4, r0
  
  
  @ TODO determine whether melee or ranged, left or right.
  ldr   r0, =SkeletonMeleeRightPhaseStruct
  str   r0, [r4, #0x2C]                     @ Current PhaseStruct.
  str   r7, [r4, #0x30]                     @ Main linked (parent?) AIStruct.
  mov   r0, #0x0
  str   r0, [sp]
  mov   r0, sp
  mov   r1, #0x34                           @ Array[14] of pointers to AIStructs.
  add   r1, r4
  ldr   r2, =0x500000E
  swi   #0xB                                @ CpuSet.
  
  
  @ Grab five random palettes
  @ for the skeletons.
  mov   r1, sp
  ldr   r0, =0x240
  strh  r0, [r1]
  add   r0, #0x20
  strh  r0, [r1, #0x2]
  add   r0, #0x20
  strh  r0, [r1, #0x4]
  ldr   r0, =0x3C0
  strh  r0, [r1, #0x6]
  add   r0, #0x20
  strh  r0, [r1, #0x8]
  
  ldr   r4, =NextRN_N
  ldr   r5, =CopyToPaletteBuffer
  ldr   r6, =SkelMeleePalettes
  mov   r7, #0x0
  
  Loop:
    mov   r0, #0x5
    bl    GOTO_R4
    lsl   r0, #0x5
    add   r0, r6
    
    lsl   r1, r7, #0x1
    mov   r2, sp
    ldrh  r1, [r2, r1]
    
    mov   r2, #0x20
    bl    GOTO_R5
    add   r7, #0x1
    cmp   r7, #0x5
    blt   Loop
    

Return:
add   sp, #0xC
pop   {r4-r7}
ldr   r0, =0x80596CC
mov   r15, r0
GOTO_R4:
bx    r4
GOTO_R5:
bx    r5
