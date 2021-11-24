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

@ Determine which UNIT command to load
ldrb  r0, [r6, #0x3]
bl    SCU_CalcLoadedUnitLevel       @ Calc absolute level.
ldr   r1, =SCU_T1UnitMaxLv
lsl   r1, #0x5
lsr   r1, #0x5
cmp   r0, r1
ble   Return
  add   r6, #0x14                   @ Unit is at least T2.
  ldr   r1, =SCU_T2UnitMaxLv
  lsl   r1, #0x5
  lsr   r1, #0x5
  cmp   r0, r1
  ble   Return
    add   r6, #0x14                 @ Unit is T3.
  
Return:
ldr   r0, =0x800F721
bx    r0
