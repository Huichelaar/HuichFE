@ Technically, not part of ScrollBG proc. Used by parent proc to initialize it instead.
@ Arguments:
@   r1: parent procstate
@   r0: short, bits:
@     0: Horizontal direction. 0 means left, 1 means right.
@     1: Vertical direction. 0 means up, 1 means down.
@     2: Horizontal scroll.
@     3: Vertical scroll.
@     4-7: Scroll BG0-BG3.
@     8-15: ScrollSpeed. Scroll by 1 every ScrollSpeed frames.
@
@ ScrollBG Procvars:
@   +0x2A: byte, arg r1 LSB.
@   +0x2B: byte, arg r1 MSB, ScrollSpeed.
.thumb

push  {r4-r7, r14}
mov   r5, r1
mov   r6, r0


@ Create ScrollBG child
ldr   r0, =Procs_ScrollBG
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
strh  r6, [r0, #0x2A]


mov   r0, #0x1
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
