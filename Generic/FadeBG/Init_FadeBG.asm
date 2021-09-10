@ Technically, not part of FadeBG proc. Used by parent proc to initialize it instead.
@ Arguments:
@   r1: parent procstate
@   r0: Two bytes:
@     LSB:
@       bits 0-5: BLDCNT 1st targets [0, 3F]
@       bit 6: Fade in (0) or out (1) bool.
@     MSB: FadeSpeed. Increase/Decrease BLDY by 1 every FadeSpeed frames.
@
@ FadeBG Procvars:
@   +0x29: byte, FadeSpeed. Increase/Decrease BLDY by 1 every FadeSpeed frames.
@   +0x2A: byte, Fade in (0) or out (1) bool.
.thumb

push  {r4-r7, r14}
mov   r5, r1
mov   r6, r0


@ Set blend targets.
lsl   r0, r6, #0x1A
lsr   r0, #0x1A
mov   r1, #0xC0
orr   r0, r1
ldr   r1, =gpDISPCNTbuffer
mov   r2, #0x3C
strb  r0, [r1, r2]


@ Initialize BLDY to 0x10 or 0x0
@ldr   r1, =gpDISPCNTbuffer
mov   r7, #0x40
and   r7, r6
lsr   r7, #0x6
mov   r2, #0x10
cmp   r7, #0x0
beq   L1
  mov   r2, #0x0
L1:
mov   r0, #0x46
strb  r2, [r1, r0]


@ Create FadeBG child
ldr   r0, =Procs_FadeBG
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
mov   r1, #0x29
lsr   r2, r6, #0x8
strb  r2, [r0, r1]
mov   r1, #0x2A
strb  r7, [r0, r1]

mov   r0, #0x1
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
