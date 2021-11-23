@ Loop through player army and return
@ highest level of all living units.
.thumb

push  {r4-r7, r14}

mov   r0, #0x1

pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
