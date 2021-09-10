@ Hooked into from 0x95A20,
@ RestartScreenMenuScrollingBg.
.thumb

push  {r4, r14}
ldr   r4, =DeleteEach6C


@ Vanilla
ldr   r0, =Procs_BG3HSlide
bl    GOTO_R4

@ Mural
ldr   r0, =Procs_ScrollMural
bl    GOTO_R4


@ Vanilla
mov   r0, #0x0
mov   r1, #0x0
mov   r2, #0xA
ldr   r4, =0x8086BB9
bl    GOTO_R4


pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
