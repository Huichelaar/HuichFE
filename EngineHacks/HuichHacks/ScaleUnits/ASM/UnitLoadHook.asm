@ Hooked at 0xFB84
@ Store player army level in RAM.
@ Will be used later to scale autolevelled units.
.thumb

@ Stuff overwritten by hook
push  {r4-r7, r14}
mov   r7, r10
mov   r6, r9
mov   r5, r8
push  {r5-r7}
sub   sp, #0x4
mov   r6, r0

@ Calculate and buffer player army level in RAM.
bl    SCU_CalcPlayerLevel
ldr   r1, =PlayerLevelRAM
lsl   r1, #0x5
lsr   r1, #0x5
strb  r0, [r1]

@ Return
ldr   r0, =0x800FB93
bx    r0
