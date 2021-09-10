@ FE7U 0x80AF368, but custom Y.
.thumb

push {r4,r5,r6,r7,lr}
mov r7, r10
mov r6, r9
mov r5, r8
push {r5,r6,r7}
sub sp, #0x18
mov r7 ,r0
mov r0, #0x2C
add r0 ,r0, r7
mov r9, r0
ldrb r1, [r0, #0x0]
str r1,[sp, #0xc]
cmp r1, #0x0
bne L1
    ldr r3, =SinTable
    mov r2, #0xa0
    lsl r2 ,r2 ,#0x1
    add r0 ,r3, r2
    mov r1, #0x0
    ldsh r4, [r0, r1]
    asr r4 ,r4 ,#0x6
    mov r10, r4
    mov r0 ,r3
    add r0, #0xc0
    mov r2, #0x0
    ldsh r0, [r0, r2]
    lsl r5 ,r0 ,#0x1
    add r5 ,r5, r0
    asr r5 ,r5 ,#0x9
    ldrh r0, [r7, #0x2a]
    mov r2, #0xc0
    sub r2 ,r2, r0
    mov r1, #0xff
    and r2 ,r1
    mov r1 ,r2
    add r1, #0x40
    lsl r1 ,r1 ,#0x1
    add r1 ,r1, r3
    mov r4, #0x0
    ldsh r1, [r1, r4]
    asr r6 ,r1 ,#0x6
    lsl r2 ,r2 ,#0x1
    add r2 ,r2, r3
    mov r1, #0x0
    ldsh r2, [r2, r1]
    lsl r1 ,r2 ,#0x1
    add r1 ,r1, r2
    asr r3 ,r1 ,#0x9
    lsl r0 ,r0 ,#0x8
    mov r1, #0x60
    str r3,[sp, #0x14]
    ldr r3, =__divsi3
    bl  GOTO_R3
    mov r2, #0x80
    lsl r2 ,r2 ,#0x2
    mov r1 ,r2
    sub r1 ,r1, r0
    lsl r1 ,r1 ,#0x10
    lsr r1 ,r1 ,#0x10
    ldrh r4, [r7, #0x2c]
    mov r8, r4
    mov r0, r9
    ldrb r0, [r0, #0x0]
    mov r9, r0
    mov r2, #0x2E
    ldsh r4, [r7, r2]
    add r4 ,r4, r6
    mov r0, r10
    sub r4 ,r4, r0
    ldr r0, =0x1FF
    and r4 ,r0
    ldr r3, =SegTitleY
    ldr r3, [r3]
    sub r5, r3
    ldr r3,[sp, #0x14]
    sub r5 ,r3, r5
    and r5 ,r0
    mov r6, r1
    str r1,[sp]                                     @ [sp]
    ldrh r0, [r7, #0x2a]
    mov r1, #0xc
    ldr r3, =__divsi3
    bl  GOTO_R3
    mov r1, #0x8
    sub r1 ,r1, r0
    lsl r1 ,r1 ,#0x18
    lsr r1 ,r1 ,#0x18
    str r1,[sp, #0x4]                               @ [sp+0x4]
    mov r0, r8                                      @ r0
    mov r1 ,r4                                      @ r1
    mov r2 ,r5                                      @ r2
    mov r3, r6                                      @ r3
    bl opinfoview2_DrawChar
    ldrh r0, [r7, #0x2a]
    add r0, #0x4
    strh r0, [r7, #0x2a]
    lsl r0 ,r0 ,#0x10
    lsr r0 ,r0 ,#0x10
    cmp r0, #0x60
    bne Return
        mov r1, sp
        ldrh r1, [r1, #0xc]
        strh r1, [r7, #0x2a]
        mov r0 ,r7
        ldr r3, =Break6CLoop
        bl  GOTO_R3
        b Return
    L1:
    ldrh r1, [r7, #0x2a]
    mov r0 ,r1
    mov r2 ,r1
    asr r4 ,r0 ,#0x4
    mov r0, #0x10
    sub r6 ,r0, r4
    mov r3 ,r6
    ldrh r5, [r7, #0x2c]
    mov r2, r9
    mov r6, r1
    mov r2, #0x2E
    ldsh r0, [r7, r2]
    sub r1 ,r0, r3                                  @ r1
    ldr r0, =SegTitleY
    ldr r0, [r0]
    sub r2 ,r0, r3                                  @ r2
    mov r3, r6                                      @ r3
    mov r0, #0x80
    lsl r0, #0x1
    mov r8, r0
    str r0,[sp]                                     @ [sp]
    mov r0, #0x10
    sub r0 ,r0, r4
    lsl r0 ,r0 ,#0x18
    lsr r0 ,r0 ,#0x18
    str r0,[sp, #0x4]                               @ [sp+0x4]
    mov r0 ,r5                                      @ r0
    bl opinfoview2_DrawChar
    ldrh r0, [r7, #0x2a]
    add r0, #0x10
    strh r0, [r7, #0x2a]
    lsl r0 ,r0 ,#0x10
    lsr r0 ,r0 ,#0x10
    cmp r0, r8
    bne Return
        mov r0, #0x0
        strh r0, [r7, #0x2a]
        mov r0 ,r7
        ldr r3, =Break6CLoop
        bl  GOTO_R3
Return:
add sp, #0x18
pop {r3,r4,r5}
mov r8, r3
mov r9, r4
mov r10, r5
pop {r4,r5,r6,r7}
pop {r0}
bx r0
GOTO_R3:
bx r3
GOTO_R4:
bx r4
