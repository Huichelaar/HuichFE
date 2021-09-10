@ Prepares next blend. Procvars:
@   +0x29: byte, Timer.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Disable Window 1
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0xBF
ldrb  r1, [r4, #0x1]
and   r1, r0
strb  r1, [r4, #0x1]


@ Disable BG1
ldrb  r0, [r4, #0x1]
mov   r1, #0xFD
and   r0, r1
strb  r0, [r4, #0x1]


@ Prepare blend
ldr   r0, =Procs_Blend
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
ldr   r1, =0x152
strh  r1, [r0, #0x2C]
mov   r1, #0x10
strh  r1, [r0, #0x2E]
mov   r1, #0xFF
mov   r2, #0x29
strb  r1, [r0, r2]
mov   r1, #0x1
mov   r2, #0x2A
strb  r1, [r0, r2]
mov   r1, #0x2
mov   r2, #0x2B
strb  r1, [r0, r2]
mov   r1, #0x20
mov   r2, #0x31
strb  r1, [r0, r2]


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
