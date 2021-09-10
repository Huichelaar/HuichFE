@ Blends the two whirlpools.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ BG1 whirlpool
ldr   r0, =gpBG1MapBuffer
ldr   r1, =WhirlpoolTSA
ldr   r2, =0x7000
ldr   r4, =FillTileRect
bl    GOTO_R4


@ BGPriorities
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x1
ldrb  r1, [r4, #0xC]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0xC]

mov   r0, #0x0
ldrb  r1, [r4, #0x10]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x10]


@ Prepare blend
ldr   r0, =Procs_Blend
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
ldr   r1, =0x142
strh  r1, [r0, #0x2C]
mov   r1, #0x0
mov   r2, #0x2E
strb  r1, [r0, r2]
mov   r1, #0x10
mov   r2, #0x2F
strb  r1, [r0, r2]
mov   r1, #0x1
mov   r2, #0x29
strb  r1, [r0, r2]
mov   r1, #0xFF
mov   r2, #0x2A
strb  r1, [r0, r2]
mov   r1, #0x3
mov   r2, #0x2B
strb  r1, [r0, r2]
mov   r1, #0x30
mov   r2, #0x31
strb  r1, [r0, r2]


mov   r0, #0x1
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
