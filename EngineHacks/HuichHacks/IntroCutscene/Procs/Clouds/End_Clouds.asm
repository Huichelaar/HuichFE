@ Disable blend to prepare for fade-out.
@   +0x29: byte, Timer.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Disable blend
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x0
strh  r0, [r4, #0x3C]
mov   r1, #0x44
strh  r0, [r4, r1]


@ Change BG0 & BG1 priorities
mov   r0, #0x1
ldrb  r1, [r4, #0xC]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0xC]

ldrb  r1, [r4, #0x10]
lsr   r1, #0x2
lsl   r1, #0x2
strb  r1, [r4, #0x10]


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
