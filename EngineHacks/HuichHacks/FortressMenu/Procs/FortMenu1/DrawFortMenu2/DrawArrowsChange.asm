.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
push  {r4-r6}
sub   sp, #0x4

mov   r5, r0
mov   r6, r2                  @ X
add   r7, r1, r3              @ OAM 2


@ Up
mov   r0, #0x2                @ Root node index (priority stuff)
mov   r1, r6                  @ X
mov   r2, #0x56
ldrb  r2, [r5, r2]            @ Current command
lsl   r2, #0x4
add   r2, #0x30               @ Y
mov   r5, r2
ldr   r3, =OAMREGS_Count_1    @ ROM OAM data pointer
str   r7, [sp]
ldr   r4, =RegisterObject
bl    GOTO_R4


@ Down
mov   r0, #0x2
mov   r1, #0x80
lsl   r1, #0x6
orr   r1, r6
mov   r2, r5
add   r2, #0x28
ldr   r3, =OAMREGS_Count_1    @ ROM OAM data pointer
str   r7, [sp]
ldr   r4, =RegisterObject
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r6}
mov   r10, r6
mov   r9, r5
mov   r8, r4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
