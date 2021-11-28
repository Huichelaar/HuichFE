@ Huichelaar edit: Prepromotes no longer use lv 255 to gain skills.
@ Therefore we do not call GetUnitLevelSkills with (0xFE, 0xFF] anymore.
.thumb

lGetUnitLevelSkills = EALiterals+0x00

GetInitialSkillList:
@ Arguments: r0 = Unit, r1 = output buffer (0x10 bytes seems reasonable).
@ Returns:   r0 = output buffer (for convenience).
push  {r4-r5, lr}     @ Note: [sp] = output buffer.
mov   r4, r0          @ Var r4 = unit.
mov   r5, r1          @ Var r5 = output buffer.

ldr   r3, lGetUnitLevelSkills
mov   ip, r3
mov   r0, r4          @ Arg r0 = unit.
mov   r1, #0          @ Arg r1 = level from (here: 0).
ldrb  r2, [r4, #0x8]  @ Arg r2 = level to (here: level).
mov   r3, r5          @ Arg r3 = output buffer.
bl    BXIP

mov   r0, r5          @ Note: r0 = output buffer.
pop   {r4-r5}
pop   {r3}
BXR3:
bx    r3
BXIP:
bx    ip

.pool
.align

EALiterals:
@ POIN (GetUnitLevelSkills|1)
