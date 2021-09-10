.thumb

push  {r4, r14}
mov   r2, r1
ldr   r1, =PuzzleWeaponFlagsRAM
ldr   r1, [r1]
ldr   r4, =gpReadSramFast
ldr   r4, [r4]
bl    GOTO_R4

pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
