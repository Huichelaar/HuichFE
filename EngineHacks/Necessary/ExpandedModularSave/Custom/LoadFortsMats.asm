@ Input args:
@   r0: Source.
@   r1: Size.
.thumb

push  {r4, r14}


@ Put fort & material data in relevant RAM section.
mov   r2, r1
ldr   r1, =FortRAM
lsl   r1, #0x5
lsr   r1, #0x5
ldr   r4, =gpReadSramFast
ldr   r4, [r4]
bl    GOTO_R4


pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
