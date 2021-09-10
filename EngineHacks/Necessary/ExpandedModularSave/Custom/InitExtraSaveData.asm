@ Initialize the Fort and Material settings, PuzzleWeaponFlags
.thumb

push  {r4, r14}


@ Overwritten by hook
ldr   r4, =ClearUnits
bl    GOTO_R4
ldr   r4, =ClearConvoyItems
bl    GOTO_R4
ldr   r4, =ClearGlobalTriggerState
bl    GOTO_R4


@ Mimic LoadFortsMats
@ Initialize Fort & Material RAM
ldr   r4, =FortMatSaveChunkSize
lsl   r4, #0x5
lsr   r4, #0x5
ldr   r0, =InitFortMatSettings
ldr   r1, =FortRAM
lsl   r1, #0x5
lsr   r1, #0x5
lsr   r2, r4, #0x1
swi   #0xB                    @ CpuSet
lsr   r0, r4, #0x1
bcc   L1
  @ Not halfword aligned, one more byte.
  ldr   r0, =InitFortMatSettings
  ldr   r1, =FortRAM
  lsl   r1, #0x5
  lsr   r1, #0x5
  sub   r2, r4, #0x1
  ldrb  r3, [r0, r2]
  strb  r3, [r1, r2]
L1:


@ Initialize PuzzleWeaponFlags
mov   r0, #0x0
ldr   r1, =PuzzleWeaponFlagsRAM
ldr   r1, [r1]
strb  r0, [r1]


pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
