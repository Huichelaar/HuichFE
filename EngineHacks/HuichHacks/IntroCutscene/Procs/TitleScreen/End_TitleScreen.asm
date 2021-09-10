@ Does stuff as well.
.thumb

push  {r4,r14}


@ Disable 1-dimensional sprite mapping
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0xBF
ldrb  r1, [r4]
and   r1, r0
strb  r1, [r4]


@ Unset HBlankHandler
mov   r0, #0x0
ldr   r4, =SetPrimaryHBlankHandler
bl    GOTO_R4


pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
