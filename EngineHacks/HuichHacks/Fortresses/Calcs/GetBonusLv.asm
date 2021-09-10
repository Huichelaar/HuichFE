@ Calculates & returns Unit Ability bonus. Arguments:
@   r0 = FortID
@ Returns bonus level based on Fort lvl and unit-fort affinity matchup.
.thumb

push  {r4-r7, r14}
mov   r6, r0


ldr   r1, =FortRAM
lsl   r1, #0x5
lsr   r1, #0x5
mov   r2, #0x5
mul   r0, r2
add   r1, r0
ldrb  r5, [r1, #0x1]
lsr   r5, #0x6                              @ Fort Level

ldrb  r0, [r1]                              @ Unit ID
mov   r1, r6
bl    GetAffinityBonus
add   r0, r5                                @ Fort level + Affinity boost


pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
