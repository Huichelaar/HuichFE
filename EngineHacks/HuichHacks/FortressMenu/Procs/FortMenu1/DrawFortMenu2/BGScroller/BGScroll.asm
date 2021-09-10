.thumb

push  {r4, r14}

mov   r1, #0x2C
ldr   r3, [r0, r1]
sub   r1, #0x3
ldrb  r2, [r0, r1]
cmp   r2, #0x0
beq   BreakLoop

sub   r2, #0x1
strb  r2, [r0, r1]

ldr   r0, =gpDISPCNTbuffer
add   r0, #0x26
ldrh  r1, [r0]
add   r1, r3
strh  r1, [r0]

mov   r0, #0x2
ldr   r4, =EnableBackgroundSyncById 
bl    GOTO_R4
b     Return

BreakLoop:
ldr   r4, =Break6CLoop
bl    GOTO_R4

Return:
pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
