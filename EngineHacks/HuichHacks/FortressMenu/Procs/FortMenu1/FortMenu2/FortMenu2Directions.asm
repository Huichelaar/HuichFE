@ Handles the FortMenu2 direction inputs.
.thumb

push  {r4-r7, r14}
mov   r5, r0

ldr   r0, [r5, #0x14]
ldr   r4, [r0, #0x1C]         @ Aunt/Uncle is Proc_DrawFortMenu2
mov   r2, #0x29
ldrb  r6, [r4, r2]            @ MenuMode, indicates whether gather, upgrade, etc.


@ Copy current command index to last command index
mov   r2, r5
mov   r3, #0x0
add   r2, #0x61
ldrb  r0, [r2]
add   r1, r2, #0x1
strb  r0, [r1]

@ CheckUp
ldr   r1, =KeyStatusBuffer
ldrh  r7, [r1, #0x6]
mov   r0, #0x40
and   r0, r7
cmp   r0, #0x0
beq   CheckDown
mov   r3, #0x1                @ Bool indicating we're moving

@ Check if we need to scroll up
cmp   r6, #0x3
beq   L4                      @ Scroll if mode 0x3
ldrb  r0, [r2]
cmp   r0, #0x0
bne   L1
L4:
mov   r3, #0x0                @ Sike! we're scrolling up instead

@ Scroll up
mov   r0, #0x2B
add   r0, r4
mov   r1, #0x1
strb  r1, [r0]
ldrb  r0, [r2]
add   r0, #0x2

L1:
sub   r0, #0x2                @ Move cursor to higher command
strb  r0, [r2]
mov   r1, #0x56
strb  r0, [r4, r1]            @ Store current command in DrawFortMenu2 proc
b     L3


CheckDown:
mov   r0, #0x80
and   r0, r7
cmp   r0, #0x0
beq   L3
mov   r3, #0x1                @ Bool indicating we're moving

@ Check if we need to scroll down
ldrb  r1, [r2]
sub   r0, r2, #0x1
ldrb  r0, [r0]
sub   r0, #0x2
cmp   r6, #0x3
beq   L5                      @ Scroll if mode 0x3
cmp   r1, r0
bne   L2
L5:
mov   r3, #0x0                @ Sike! we're scrolling down instead

@ Scroll down
mov   r0, #0x2B
add   r0, r4
mov   r1, #0x2
strb  r1, [r0]
ldrb  r1, [r2]
sub   r1, #0x2

L2:
add   r1, #0x2                @ Move cursor to lower command
strb  r1, [r2]
mov   r0, #0x56
strb  r1, [r4, r0]            @ Store current command in DrawFortMenu2 proc


L3:
cmp   r3, #0x0
beq   Return

@ Clear previous command's hoverbar
mov   r6, r2
add   r0, r6, #0x1
ldrb  r1, [r0]
mov   r0, r5
mov   r2, #0x0
bl    FortMenu2DrawHoverThing

@ Draw current command's hoverbar
ldrb  r1, [r6]
mov   r0, r5
mov   r2, #0x1
bl    FortMenu2DrawHoverThing

@ Play move sound
ldr   r0, =ChapterData
add   r0, #0x41
ldrb  r0, [r0]
lsl   r0, #0x1E
cmp   r0, #0x0
blt   Return
mov   r0, #0x66                 @ We play menu-move-sound when moving commands.
bl    PlaySFX


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
