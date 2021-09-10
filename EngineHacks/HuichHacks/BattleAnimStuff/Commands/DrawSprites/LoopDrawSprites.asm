@ Clear and initialize AIStructs when anim moves to next phase.
@ Otherwise, update X and Y relative to main linked AIS.
@ Procvars:
@   +0x2A, short.       Time left until next phase.
@   +0x2C, poin.        Current phasestruct.
@   +0x30, poin.        Main linked (parent?) AIStruct.
@   +0x34, poin array.  Array[14] of pointers to AIStructs used by the sprites.
.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
mov   r7, r11
push  {r4-r7}
mov   r5, r0
ldr   r0, [r5, #0x30]
mov   r1, #0x2
ldsh  r1, [r0, r1]
mov   r9, r1                              @ Main linked AIStruct's X
mov   r1, #0x4
ldsh  r1, [r0, r1]
mov   r10, r1                             @ Main linked AIStruct's Y
ldr   r0, =gSomeSubAnim6CCounter
ldr   r0, [r0]
mov   r11, r0


@ Timer.
mov   r0, #0x2A
ldsh  r6, [r5, r0]
mov   r0, #0x1
neg   r0, r0
cmp   r6, r0
beq   L3                                  @ If timer is -1, don't decrement.
  ldr   r0, [r5, #0x2C]
  ldrh  r0, [r0, #0xE]
  mov   r1, #0x1
  tst   r0, r1
  beq   L7                                @ If PhaseStruct bitfield bit 0 is set...
    ldr   r0, [r5, #0x30]
    ldr   r4, =GetTargetAIS
    bl    GOTO_R4
    ldr   r4, =GetAISSubjectID
    bl    GOTO_R4
    lsl   r0, #0x1
    ldr   r1, =HPDepletingBool
    ldrh  r0, [r1, r0]
    cmp   r0, #0x0                        @ ...and target's HP is changing...
    bne   L3                              @ ...don't decrement timer.
  L7:
  sub   r6, #0x1
  strh  r6, [r5, #0x2A]
  cmp   r6, #0x0
  bne   L3                              @ If not 0, don't move to next phase.


@ Phase ended, move to next phase.
ldr   r0, [r5, #0x2C]
ldr   r6, [r0, #0x8]
str   r6, [r5, #0x2C]                   @ Update Next PhaseStruct.


@ Deallocate AIS.
ldr   r4, =AIS_Free
mov   r7, #0x0
Loop:
  lsl   r1, r7, #0x2
  add   r1, #0x34
  ldr   r0, [r5, r1]
  cmp   r0, #0x0
  beq   L1                              @ If AIS not allocated, don't deallocate.
  
    mov   r1, #0x1
    neg   r1, r1
    add   r11, r1                       @ Decrement gSomeSubAnim6CCounter
      
    mov   r2, #0x0
    str   r2, [r5, r1]                  @ Remove AIS pointer from procstate.
    bl    GOTO_R4
    add   r7, #0x1
    cmp   r7, #0xE
    blt   Loop

L1:
cmp   r6, #0x0
bne   L2

  @ 'Spell' finished.
  @ Unset spell effect bool.
  ldr   r0, =gBoolSpellFxActive
  mov   r1, #0x0
  str   r1, [r0]

  @ No next PhaseStruct, end proc.
  mov   r0, r5
  ldr   r4, =Break6CLoop
  bl    GOTO_R4
  
  b     L3

L2:

@ Palette.
ldr   r0, [r6]
cmp   r0, #0x0
beq   L4
  mov   r1, #0x20
  ldr   r4, =StoreSpellPaletteOBJ
  bl    GOTO_R4
L4:

@ Tiles.
ldr   r0, [r6, #0x4]
cmp   r0, #0x0
beq   L5
  ldr   r1, =0x2000
  bl    StoreSpellTilesOBJ2
L5:

@ Grab new timer.
ldrh  r0, [r6, #0xC]
strh  r0, [r5, #0x2A]

@ Allocate AIS.
ldr   r0, =AIS_New
mov   r8, r0
mov   r7, #0x0
Loop2:
  lsl   r0, r7, #0x2
  add   r0, #0x10
  ldr   r4, [r6, r0]
  cmp   r4, #0x0
  beq   L3                              @ If no UnitPhaseStruct, we done.
    
    mov   r0, #0x1
    add   r11, r0                       @ Increment gSomeSubAnim6CCounter
    
    ldr   r0, [r4]
    ldrb  r1, [r4, #0x10]
    bl    GOTO_R8
    lsl   r1, r7, #0x2
    add   r1, #0x34
    str   r0, [r5, r1]
    
    @ Clear Current OAMData pointer
    mov   r1, #0x0
    str   r1, [r0, #0x3C]
    
    ldrh  r1, [r4, #0x4]
    ldrh  r2, [r4, #0x6]
    lsl   r2, #0x10
    add   r1, r2
    str   r1, [r0, #0x1C]               @ OAM0 and OAM1 masks.
    ldrh  r1, [r4, #0x8]
    strh  r1, [r0, #0x8]                @ OAM2 mask.
    ldrh  r1, [r4, #0xA]
    strh  r1, [r0, #0x6]                @ Delay timer.
    add   r7, #0x1
    cmp   r7, #0xE
    blt   Loop2

L3:


@ Update gSomeSubAnim6CCounter
ldr   r0, =gSomeSubAnim6CCounter
mov   r1, r11
str   r1, [r0]


@ Update X and Y relative to main linked AIS.
ldr   r4, [r5, #0x2C]
mov   r7, #0x0

Loop3:
  lsl   r0, r7, #0x2
  add   r0, #0x34
  ldr   r0, [r5, r0]
  cmp   r0, #0x0
  beq   Return                            @ If no AIS, return.
    lsl   r1, r7, #0x2
    add   r1, #0x10
    ldr   r1, [r4, r1]                    @ UnitPhaseStruct.
    cmp   r1, #0x0
    beq   Return                          @ If no UnitPhaseStruct, return.
      mov   r2, #0xC
      ldsh  r2, [r1, r2]
      add   r2, r9
      strh  r2, [r0, #0x2]                @ X relative to main linked AIStruct.
      mov   r2, #0xE
      ldsh  r2, [r1, r2]
      add   r2, r10
      strh  r2, [r0, #0x4]                @ Y relative to main linked AIStruct.
      add   r7, #0x1
      cmp   r7, #0xE
      blt   Loop3


Return:
pop   {r4-r7}
mov   r8, r4
mov   r9, r5
mov   r10, r6
mov   r11, r7
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
GOTO_R8:
bx    r8
