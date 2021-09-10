@ Mark gambit target struct tiles
@ in range map. Args:
@   r0: actor unitstruct.
@   r1: defender unitstruct.
@   r2: Gambit Target Struct.
.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
push  {r4-r6}
mov   r5, r0
mov   r6, r1
mov   r7, r2


@ Change gpSubjectMap to range map.
ldr   r0, =gpSubjectMap
ldr   r1, [r0]
mov   r8, r1
ldr   r1, =gMapRange
ldr   r1, [r1]
str   r1, [r0]

@ Clear range map.
ldr   r0, =gMapRange
ldr   r0, [r0]
mov   r1, #0x0
ldr   r4, =ClearMapWith
bl    GOTO_R4


@ Get gambit direction.
mov   r0, #0x10
mov   r2, r0
mov   r1, #0x11
mov   r3, r1
ldsb  r0, [r5, r0]
ldsb  r1, [r5, r1]
ldsb  r2, [r6, r2]
ldsb  r3, [r6, r3]
ldr   r4, =GetFacingDirection
bl    GOTO_R4
lsl   r0, #0x2
ldr   r2, [r7, r0]

@ Check if radius or custom range.
cmp   r2, #0xFF
ble   Radius

  @ Custom range.
  ldr   r4, =MapAddInRange
  mov   r5, r2                        @ GambitTargetStruct.
  mov   r0, #0x11
  ldsb  r7, [r6, r0]                  @ Target Y.
  mov   r0, #0x10
  ldsb  r6, [r6, r0]                  @ Target X.
  ldr   r0, =gMapSize
  ldrh  r1, [r0, #0x2]
  ldrh  r0, [r0]
  sub   r0, #0x1
  sub   r1, #0x1
  mov   r9, r0                        @ Map width.
  mov   r10, r1                       @ Map height.
  
  Loop:
  
    @ Finished if terminator.
    mov   r0, #0x0
    ldsb  r0, [r5, r0]
    cmp   r0, #0x7F
    beq   L1
    mov   r1, #0x1
    ldsb  r1, [r5, r1]
    cmp   r1, #0x7F
    beq   L1
      
      @ Skip if tile out of bounds.
      add   r0, r6
      add   r1, r7
      cmp   r0, #0x0
      blt   L2
      cmp   r0, r9
      bgt   L2
      cmp   r1, #0x0
      blt   L2
      cmp   r1, r10
      bgt   L2
      
        mov   r2, #0x0
        mov   r3, #0x1
        bl    GOTO_R4
      
      L2:
      add   r5, #0x2
      b     Loop

@ Radius range.
Radius:
  
  @ Fill in radius.
  mov   r0, #0x10
  ldsb  r0, [r6, r0]
  mov   r1, #0x11
  ldsb  r1, [r6, r1]
  mov   r3, #0x1
  ldr   r4, =MapAddInRange
  bl    GOTO_R4


@ Set gpSubjectMap back
L1:
ldr   r0, =gpSubjectMap
mov   r1, r8
str   r1, [r0]


pop   {r4-r6}
mov   r8, r4
mov   r9, r5
mov   r10, r6
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
