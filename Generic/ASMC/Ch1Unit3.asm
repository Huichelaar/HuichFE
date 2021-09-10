@ Return a value indicating which unit to load
@ based on the weapon obtained in the prologue.
.thumb


@ Check which weapon was obtained in chap 0.
@ We grab the first flag that's set, as only
@ one should be set at this point.
ldr   r0, =PuzzleWeaponFlagsRAM
ldr   r0, [r0]
ldrb  r0, [r0]
cmp   r0, #0x0
beq   Return                        @ In case no flag is set (which shouldn't happen).

  ldr   r1, =0x100
  mov   r2, #0x8

  Loop:
    sub   r2, #0x1
    lsr   r1, #0x1
    tst   r0, r1
    beq   Loop

  mov   r0, r2


@ Put return value in slot 0xC
Return:
ldr   r1, =Slot0+0x30
str   r0, [r1]


bx    r14
