@ Clears some stuff.
.thumb

push  {r4,r14}
sub   sp, #0x4


@ Display nothing
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x0
strb  r0, [r4, #0x1]


@ Clear palettes
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =palette_buffer
ldr   r2, =0x1000100
swi   #0xC                            @ CpuFastSet


@ Unset HBlankHandler
mov   r0, #0x0
ldr   r4, =SetPrimaryHBlankHandler
bl    GOTO_R4


add   sp, #0x4
pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
