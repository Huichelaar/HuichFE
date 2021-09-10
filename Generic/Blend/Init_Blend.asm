@ Prepares alphablend.
@ Procvars:
@   +0x29: signed byte, value to add to 1st targets every loop iteration.
@   +0x2A: signed byte, value to add to 2nd targets every loop iteration.
@   +0x2B: byte, the amount of frames per blend update.
@   +0x2C: short, BLDCNT
@   +0x2E: byte, initial 1st targets value.
@   +0x2F: byte, initial 2nd targets value.
@   +0x30: byte, timer. increased every frame. End proc if this is equal to limit.
@   +0x31: byte, limit. End proc if this is equal to timer.
.thumb

push  {r4-r7,r14}
mov   r5, r0


mov   r0, #0x0
mov   r1, #0x30
strb  r0, [r5, r1]


ldr   r4, =gpDISPCNTbuffer
ldrh  r0, [r5, #0x2C]
strh  r0, [r4, #0x3C]
ldrh  r0, [r5, #0x2E]
mov   r1, #0x44
strh  r0, [r4, r1]


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
