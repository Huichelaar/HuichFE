@ During battle animations,
@ execute tree 6 after 3, before 5.
@ Hooked at 0x4FF08 and 0x15320.
.thumb

push  {r4-r7, r14}
ldr   r5, =TreePointerArray
ldr   r4, =Exec6C


@ Execute tree 6.
ldr   r0, [r5, #0x18]
bl    GOTO_R4


@ Vanilla
ldr   r0, [r5, #0x14]
bl    GOTO_R4
mov   r0, #0x0
ldr   r4, =0x8005459
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
