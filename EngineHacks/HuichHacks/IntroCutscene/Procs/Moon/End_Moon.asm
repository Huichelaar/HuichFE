@ Ends blend. Procvars:
@   +0x29: byte, Timer.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Disable blend
mov   r0, #0x0
strh  r0, [r4, #0x3C]
str   r0, [r4, #0x44]


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
