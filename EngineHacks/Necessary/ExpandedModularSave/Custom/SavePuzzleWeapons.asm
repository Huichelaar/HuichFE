.thumb

push  {r4, r14}
mov   r2, r1
mov   r1, r0
ldr   r0, =PuzzleWeaponFlagsRAM
ldr   r0, [r0]
ldr   r4, =SRAMTransfer_WithCheck
bl    GOTO_R4

pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
