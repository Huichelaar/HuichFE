@ Prepares the shine animation
@   +0x29: byte, Gem VRAM index. Initialized to 0
.thumb

push  {r4-r7, r14}
mov   r7, r0


mov   r1, #0x29
mov   r2, #0x0
strb  r2, [r7, r1]                        @ Gem VRAM index


pop   {r4-r7}
pop   {r0}
bx    r0
