.thumb

ldr   r0, =gpDISPCNTbuffer
ldrb  r1, [r0, #0x1]
mov   r2, #0x8
bic   r1, r2
strb  r1, [r0, #0x1]

bx    r14
