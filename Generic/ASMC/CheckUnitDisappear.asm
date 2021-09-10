@ Args:
@   Memory slot 0x2: Unit, or special input.
@ Like all unit-targeting commands in FE8, special inputs are:
@   0xFFFF: checks active unit (currently selected for moving/attacking, or set using SET_ACTIVE).
@   0xFFFE: checks unit at coordinates stored to Memory slot 0xB.
@         Note, conditionals may hang if there is no unit at this co-ord.
@         It may be useful to use CHECK_AT with 0xFFFF.
@         See the node above CHECK_ALLEGIANCE.
@   0xFFFD: checks unit of ID stored to Memory slot 0x2. Kinda pointless here, so don't use this.
@ Returns in Memory slot 0xC:
@   1 if unit has disappeared AKA REMU ([unitstruct+0xC]|0x4010000 != 0).
@   0 otherwise.
.thumb

push  {r4, r14}


ldr   r0, =Slot0+0x8
ldr   r0, [r0]
ldr   r4, =GetUnitStructFromEventParameter
bl    GOTO_R4
mov   r2, #0x0
cmp   r0, #0x0
beq   Return                  @ Didn't find unit, return 0.
  ldr   r0, [r0, #0xC]
  ldr   r1, =0x4010000
  tst   r1, r0
  beq   Return                @ Unit didn't disappear, return 0.
    ldr   r1, =Slot0+0x30
    mov   r2, #0x1            @ Unit disappeared, return 1.


Return:
ldr   r0, =Slot0+0x30
str   r2, [r0]
pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
