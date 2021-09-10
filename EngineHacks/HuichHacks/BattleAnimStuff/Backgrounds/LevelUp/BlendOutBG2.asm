.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r5, r0


@ Disable windows
ldr   r0, =gpDISPCNTbuffer
ldrb  r1, [r0, #0x1]
mov   r2, #0x1F
and   r1, r2
strb  r1, [r0, #0x1]


@ Start blend
ldr   r0, =Procs_Blend
mov   r1, r5
ldr   r4, =NewBlocking6C
bl    GOTO_R4
ldr   r1, =0x3B44
strh  r1, [r0, #0x2C]
mov   r1, #0x10
mov   r2, #0x2E
strb  r1, [r0, r2]
mov   r1, #0x0
mov   r2, #0x2F
strb  r1, [r0, r2]
mov   r1, #0xFE
mov   r2, #0x29
strb  r1, [r0, r2]
mov   r1, #0x2
mov   r2, #0x2A
strb  r1, [r0, r2]
mov   r1, #0x1
mov   r2, #0x2B
strb  r1, [r0, r2]
mov   r1, #0x8
mov   r2, #0x31
strb  r1, [r0, r2]


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
