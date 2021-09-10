@ Sets DrawFortMenu2 +0x29, byte holding ID [0-2] indicating which things to draw. Arguments:
@   r0 = MenuProcState
.thumb

push  {r4, r14}


ldr   r0, [r0, #0x1C]       @ Previous sibling, DrawFortMenu2 proc
mov   r1, #0x29
mov   r2, #0x0
strb  r2, [r0, r1]          @ Set +0x29 to 0 for Gather items (Resources/Materials and counts)

mov   r1, #0x0
ldr   r4, =Goto6CLabel
bl    GOTO_R4               @ Re-draw right items


pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
