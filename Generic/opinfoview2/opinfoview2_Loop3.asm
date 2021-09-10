@ FE7U 0x80AF4D4, but custom Y.
.thumb

push {r4,r5,r6,r7,lr}
mov r7, r8
push {r7}
sub sp, #0xc
mov r5 ,r0
ldrh r1, [r5, #0x2a]
mov r6, #0x80
lsl r6 ,r6 ,#0x1
add r2 ,r1, r6
sub r3 ,r6, r1
mov r0, #0x2E
ldsh r4, [r5, r0]
mov r0 ,r4
sub r0, #0x58
mul r0 ,r1
mul r0 ,r1
asr r0 ,r0 ,#0xf
ldrh r1, [r5, #0x2c]
mov r12, r1
mov r7, #0x2C
add r7 ,r7, r5
mov r8, r7
add r4 ,r4, r0
lsl r2 ,r2 ,#0x10
lsr r2 ,r2 ,#0x10
lsl r3 ,r3 ,#0x10
lsr r3 ,r3 ,#0x10
str r3,[sp]                     @ [sp]
ldrh r0, [r5, #0x2a]
asr r0 ,r0 ,#0x4
lsl r0 ,r0 ,#0x18
lsr r0 ,r0 ,#0x18
str r0,[sp, #0x4]               @ [sp+0x4]
mov r0, r12                     @ r0
mov r1 ,r4                      @ r1
mov r3, r2                      @ r3
ldr r2, =SegTitleY
ldr r2, [r2]                    @ r2
bl opinfoview2_DrawChar
ldrh r0, [r5, #0x2a]
cmp r0 ,r6
bne L1
    ldr r0, =0x3001D50
    mov r2, r8
    ldrb r2, [r2, #0x0]
    lsl r1 ,r2 ,#0x2
    add r1 ,r1, r0
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r0 ,r5
    ldr r3, =Break6CLoop
    bl GOTO_R3
L1:
ldrh r0, [r5, #0x2a]
add r0, #0x8
strh r0, [r5, #0x2a]
add sp, #0xc
pop {r3}
mov r8, r3
pop {r4,r5,r6,r7}
pop {r0}
bx r0
GOTO_R3:
bx r3
