@ Hooked at 0xF714. Picks the UNIT command
@ which fits the absolute level.
@ Pick UNIT:
@   +0      if absolute level <= SCU_T1UnitMaxLv,
@   +0x14   if SCU_T1UnitMaxLv < absolute level <= SCU_T2UnitMaxLv,
@   +0x28   otherwise.
@ Regs:
@   r0-r3: Idc. They will be overwritten when we return.
@   r6: pointer to where UNIT command is buffered.
@ Returns:
@   Nothing, but changes the pointer in r6 to reflect
@   the UNIT that should be loaded.
.thumb


@ Overwritten by hook +
@ moving scratch reg stuff to
@ non-scratch regs.
mov   r8, r1
lsl   r2, #0x18
lsr   r2, #0x18
mov   r9, r2
lsl   r3, #0x18
lsr   r4, r3, #0x18

@ Buffer first pointer to first UNIT command.
ldr   r0, =FirstUNITCommand
lsl   r0, #5
lsr   r0, #5
str   r6, [r0]

@ Determine which UNIT command to load
ldrb  r0, [r6, #0x3]
bl    SCU_CalcLoadedUnitLevel       @ Calc absolute level.
ldr   r1, =ClassPromoLevelTableLABEL
ldrb  r2, [r6, #0x1]
ldrb  r2, [r1, r2]
cmp   r2, r0
blt   Return
  add   r6, #0x14
  ldrb  r2, [r6, #0x1]
  ldrb  r2, [r1, r2]
  cmp   r2, r0
  blt   Return
    add   r6, #0x14
  
Return:
ldr   r0, =0x800F721
bx    r0
