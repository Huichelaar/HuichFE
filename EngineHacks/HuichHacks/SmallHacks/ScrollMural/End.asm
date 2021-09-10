@ Delete Mural procs when deleting BG3 Hslider
.thumb

push  {r4, r14}
ldr   r4, =DeleteEach6C


@ Vanilla
ldr   r0, =Procs_BG3HSlide
bl    GOTO_R4

@ Mural
ldr   r0, =Procs_ScrollMural
bl    GOTO_R4


Return:
pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
