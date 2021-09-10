@ Executed when FortMenu1 any command is selected. Starts FortMenu2.
.thumb

push  {r14}

@ Set previous command to 0xFF to run DrawMatPreview on init
ldr   r1, [r0, #0x1C]         @ Sibling is Proc_DrawFortMenu2
mov   r2, #0x55
mov   r3, #0xFF
strb  r3, [r1, r2]


mov   r2, r0
ldr   r0, =FortMenu2
ldr   r1, =0x00160708               @ Geometry
bl    NewFortMenu2BG0BG1

mov   r0, #0x0                      @ Return bitfield

pop   {r1}
bx    r1
