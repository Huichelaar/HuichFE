.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r5, r0


@ Increment timer
ldrh  r0, [r5, #0x2A]
cmp   r0, #0x67
bge   ResetTimer
add   r0, #0x1
b     L1
ResetTimer:
mov   r0, #0x0
L1:
mov   r6, r0
strh  r6, [r5, #0x2A]


@ Draw Plateau
mov   r0, #0x3
mov   r1, #0x0
mov   r2, #0x0
ldr   r3, =PlateauOAM
strb  r2, [sp]
ldr   r4, =RegisterObject
bl    GOTO_R4


@ Draw Tree, also, shake tree on certain frames
mov   r1, #0x0
cmp   r6, #0x41
beq   L2
cmp   r6, #0x42
beq   L2
cmp   r6, #0x43
beq   L3
b     L4
L2:
mov   r1, #0x1
b     L4
L3:
mov   r1, #0x20
lsl   r1, #0x4
sub   r1, #0x1
L4:
mov   r0, #0x3
mov   r2, #0x0
ldr   r3, =TreeOAM
strb  r2, [sp]
ldr   r4, =RegisterObject
bl    GOTO_R4


@ Draw Pirate/Lumberjack
ldr   r0, =LumberjackFrame
lsl   r1, r6, #0x1
ldrh  r0, [r0, r1]
lsl   r0, #0x1
ldr   r3, =LumberjackOAM
add   r3, r0
mov   r0, #0x3
mov   r1, #0x0
mov   r2, #0x0
strb  r2, [sp]
ldr   r4, =RegisterObject
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
