@ Hooks at 0x139F4. Fade-in face palette.
.thumb


@ Vanilla.
add   r2, r2, r0
ldrh  r0, [r2]              @ Colour.


@ Check if Sepia or not.
push  {r0-r1}
ldr   r0, =SepiaFlag
lsl   r0, #5
lsr   r0, #5
ldr   r1, =0x8083DA9        @ CheckFlag routine.
bl    GOTO_R1
cmp   r0, #0x0
bne   Sepia
  @ No sepia, return.
  pop   {r0-r1}
  b     Return

Sepia:
pop   {r0}
bl    GetSepia
pop   {r1}


Return:
mov   r2, #0x1F           @ Vanilla.
and   r2, r0
ldr   r3, =0x80139FD
mov   r15, r3
GOTO_R1:
bx    r1
