@ Run this routine to win the chapter.
.thumb

push  {r14}
ldr   r0, =0x03005270
ldrb  r1, [r0]
mov   r2, #0x4
orr   r1, r2
strb  r1, [r0]                          @ Set Chapter win flag.
ldr   r3, =0x08083281                   @ Call End event.
bl    GOTO_R3
mov   r0, #0x16
pop   {r1}
bx    r1
GOTO_R3:
bx    r3
