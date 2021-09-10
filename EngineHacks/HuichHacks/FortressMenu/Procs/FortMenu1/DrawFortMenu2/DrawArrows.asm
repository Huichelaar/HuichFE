.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
push  {r4-r6}
sub   sp, #0x4

mov   r5, r0
mov   r6, #0x90         @ X
mov   r7, #0x10
lsl   r7, #0x8
add   r7, #0x14         @ OAM 2

ldr   r4, =GetGameClock
bl    GOTO_R4
mov   r1, #0x28
ldr   r4, =Mod
bl    GOTO_R4
mov   r1, #0x8
ldr   r4, =Div
bl    GOTO_R4
lsl   r0, r0, #0x1
mov   r8, r0

mov   r2, #0x29
ldrb  r2, [r5, r2]
cmp   r2, #0x3
bne   L1

mov   r0, r5
mov   r1, r8
mov   r2, r6
mov   r3, r7
bl    DrawArrowsChange
b     Return
L1:

mov   r2, #0x2A
ldrb  r2, [r5, r2]      @ Top fort
mov   r9, r2
ldr   r3, =OAMREGS_Count_1
mov   r10, r3

@ CheckUp
mov   r0, r8
cmp   r2, #0x0
beq   CheckDown

mov   r1, r6
add   r0, r7
str   r0, [sp]
mov   r0, #0x2
mov   r2, #0x30         @ Y
ldr   r4, =RegisterObject
bl    GOTO_R4


CheckDown:
mov   r0, r8
mov   r2, r9
mov   r3, r10
add   r2, #0x2
ldr   r1, =FortCount
lsl   r1, #0x5
lsr   r1, #0x5
sub   r1, #0x1
cmp   r2, r1
beq   Return

mov   r1, #0x80
lsl   r1, #0x6
orr   r1, r6
add   r0, r7
str   r0, [sp]
mov   r0, #0x2
mov   r2, #0x98         @ Y
ldr   r4, =RegisterObject
bl    GOTO_R4


Return:
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
