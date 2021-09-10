@ Called on change and construction of
@ gambit target list. 
@ Updates rangedisplay. Args:
@   r0: Target Selection 6C
@   r1: ROM Target Struct
.thumb

push  {r4-r7, r14}
ldr   r5, [r0, #0x30]


ldr   r4, =HideMoveRangeGraphics
bl    GOTO_R4


@ Check if target exists.
ldrb  r0, [r5, #0x2]              @ Target deployment byte.
ldr   r4, =GetUnitStruct
bl    GOTO_R4
cmp   r0, #0x0
beq   Return

  @ Check if actor has gambit.
  mov   r6, r0
  ldr   r0, =ActiveUnit
  ldr   r7, [r0]
  mov   r0, r7
  bl    GAM_GetGambit
  cmp   r0, #0x0
  beq   Return
  
    @ Check if weapon has GambitTargetStruct.
    lsl   r0, #0x18
    lsr   r0, #0x16
    ldr   r1, =GambitTargetStructTable
    ldr   r2, [r1, r0]
    cmp   r2, #0x0
    beq   Return

      mov   r0, r7
      mov   r1, r6
      bl    GAM_GambitPrepRange


ldr   r0, =0x8000                         @ Purple range squares
ldr   r4, =DisplayMoveRangeGraphics
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
