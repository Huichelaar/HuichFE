@ Start FortMenu1 proc
.thumb

push  {r4-r5, r14}
mov   r5, r0

mov   r2, r5
ldr   r0, =FortMenu1
ldr   r1, =0x00070001               @ Geometry
ldr   r4, =NewMenu_BG0BG1
bl    GOTO_R4

ldr   r0, =Proc_DrawFortMenu2
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4

ldr   r0, =Procs_BG3HSlide          @ This proc directly flushes to LCD, but it's vanilla, so Ig it's cool?
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4

ldr   r0, =Proc_DrawSprites         @ Draw the labourer spritestuff
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4

pop   {r4-r5}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
