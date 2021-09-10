@ Before calling 0x73FB5,
@ fade in stats.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Enable BG2
ldr   r0, =gpDISPCNTbuffer
ldrb  r1, [r0, #0x1]
mov   r2, #0x4
orr   r1, r2
strb  r1, [r0, #0x1]


@ Blend windows.
ldr   r0, =Procs_BlendWindows
mov   r1, r5
ldr   r4, =NewBlocking6C
bl    GOTO_R4
mov   r1, #0x29
mov   r2, #0x4
strb  r2, [r0, r1]
mov   r1, #0x2A
mov   r2, #0xFC
strb  r2, [r0, r1]
mov   r1, #0x2B
mov   r2, #0x1
strb  r2, [r0, r1]
ldr   r2, =0x1B44
strh  r2, [r0, #0x2C]
mov   r1, #0x2E
mov   r2, #0x0
strb  r2, [r0, r1]
mov   r1, #0x2F
mov   r2, #0x10
strb  r2, [r0, r1]
mov   r1, #0x30
mov   r2, #0x0
strb  r2, [r0, r1]
mov   r1, #0x31
mov   r2, #0x4
strb  r2, [r0, r1]

mov   r2, #0x0
strh  r2, [r0, #0x32]
strh  r2, [r0, #0x34]
mov   r1, #0x36
mov   r2, #0x3B
strb  r2, [r0, r1]
ldr   r2, =WINDMStatPanelTable
str   r2, [r0, #0x38]
ldr   r2, =0x1F3F
strh  r2, [r0, #0x3C]


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
