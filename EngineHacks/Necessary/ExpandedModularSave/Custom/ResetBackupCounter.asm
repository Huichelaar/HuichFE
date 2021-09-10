.thumb

mov   r0, #0xE
lsl   r0, #0x18
add   r0, #0xD4
mov   r1, #0xFF
strb  r1, [r0]

bx    r14
