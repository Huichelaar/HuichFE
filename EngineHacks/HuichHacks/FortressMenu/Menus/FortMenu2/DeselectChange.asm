@ Executed when any FortMenu2 command is deselected
@ after FortMenu1's Change command was selected.
@ Resets window, resets BG2VOFS, re-draws entries
@ & clears BG0 block. Arguments:
@   r0 = DrawFortMenu2 proc pointer
.thumb

push  {r4, r14}
sub   sp, #0x4

@ Reset window0
ldr   r2, =gpDISPCNTbuffer                  @ DISPCNT
add   r2, #0x30
mov   r3, #0x98                             @ Vertical...
mov   r1, #0x38                             @ ... Dimensions
strb  r3, [r2]
strb  r1, [r2, #0x1]

@ Reset BG2VOFS
mov   r1, #0x52
ldrh  r1, [r0, r1]
ldr   r2, =gpDISPCNTbuffer                  @ DISPCNT
strh  r1, [r2, #0x26]

@ Re-draw entries
mov   r1, #0x0
ldr   r4, =Goto6CLabel
bl    GOTO_R4

@ Clear BG0 block, fort names have been written here.
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =gpBG0MapBuffer
mov   r2, #0x25
lsl   r2, #0x4
add   r2, #0xA
add   r1, r2
mov   r2, #0x1
lsl   r2, #0x18                           @ Copy
add   r2, #0xA0
ldr   r4, =CpuFastSet
bl    GOTO_R4

mov   r0, #0x0
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4

add   sp, #0x4
pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
