@ Mostly mimics 0x0804F164, Menu_Idle, but calls a custom direction handler
.thumb

push {r4,r5,r6,r7,lr}   @ Menu_Idle
sub sp, #0x8
mov r5 ,r0
add r0, #0x63
ldrb r1, [r0, #0x0]
mov r0, #0x40
and r0 ,r1
cmp r0, #0x0
beq L4F18A
    add r2, sp, #0x4
    mov r0 ,r5
    mov r1, sp
    ldr r4, =0x0804f401   @ Menu_GetCursorGfxCurrentPosition
    bl GOTO_R4
    ldr r0,[sp, #0x0]
    ldr r1,[sp, #0x4]
    ldr r4, =0x0804e849
    bl GOTO_R4
    b L4F286
L4F18A:
mov r0, #0x80
and r0 ,r1
cmp r0, #0x0
beq L4F19A
    mov r0 ,r5
    ldr r4, =0x0804eea9   @ EndMenu
    bl GOTO_R4
    b L4F286
L4F19A:
mov r0 ,r5

bl FortMenu2Directions  @ Custom input direction handler

mov r0 ,r5
ldr r4, =0x0804f375   @ Menu_HandleSelectInputs
bl GOTO_R4
mov r6 ,r0
mov r0, #0x2
and r0 ,r6
cmp r0, #0x0
beq L4F1B6
    mov r0 ,r5
    ldr r4, =0x0804eea9   @ EndMenu
    bl GOTO_R4
L4F1B6:
mov r0, #0x4
and r0 ,r6
cmp r0, #0x0
beq L4F1D0
    ldr r0, [pc, #0xd0] @ pointer:0804F290 -> 0202BCF0 (ChapterData@gChapterData.Clock )
    add r0, #0x41
    ldrb r0, [r0, #0x0] @ pointer:0202BD31 (ChapterData@gChapterData.Option2)
    lsl r0 ,r0 ,#0x1e
    cmp r0, #0x0
    blt L4F1D0
        mov r0, #0x6a
        ldr r4, =0x080d01fd   @ m4aSongNumStart r0=music id:SOUND
        bl GOTO_R4
L4F1D0:
mov r0, #0x8
and r0 ,r6
cmp r0, #0x0
beq L4F1EA
    ldr r0, [pc, #0xb4] @ pointer:0804F290 -> 0202BCF0 (ChapterData@gChapterData.Clock )
    add r0, #0x41
    ldrb r0, [r0, #0x0] @ pointer:0202BD31 (ChapterData@gChapterData.Option2)
    lsl r0 ,r0 ,#0x1e
    cmp r0, #0x0
    blt L4F1EA
        mov r0, #0x6b
        ldr r4, =0x080d01fd   @ m4aSongNumStart r0=music id:SOUND
        bl GOTO_R4
L4F1EA:
mov r0, #0x10
and r0 ,r6
cmp r0, #0x0
beq L4F22E
    mov r7 ,r5
    add r7, #0x64
    ldrb r0, [r7, #0x0]
    lsl r0 ,r0 ,#0x1c
    lsr r0 ,r0 ,#0x1e
    ldr r4, =0x08001c4d   @ BG_GetMapBuffer
    bl GOTO_R4
    mov r1, #0x0
    ldr r4, =0x08001221   @ BG_Fill
    bl GOTO_R4
    ldrb r0, [r7, #0x0]
    lsl r0 ,r0 ,#0x1e
    lsr r0 ,r0 ,#0x1e
    ldr r4, =0x08001c4d   @ BG_GetMapBuffer
    bl GOTO_R4
    mov r1, #0x0
    ldr r4, =0x08001221   @ BG_Fill
    bl GOTO_R4
    ldrb r3, [r7, #0x0]
    lsl r1 ,r3 ,#0x1e
    lsr r1 ,r1 ,#0x1e
    mov r2, #0x1
    mov r0 ,r2
    lsl r0 ,r1
    lsl r3 ,r3 ,#0x1c
    lsr r3 ,r3 ,#0x1e
    lsl r2 ,r3
    add r0 ,r0, r2
    ldr r4, =0x08001fad   @ BG_EnableSyncByMask
    bl GOTO_R4
L4F22E:
mov r7, #0x20
mov r0 ,r6
and r0 ,r7
cmp r0, #0x0
beq L4F23E
    mov r0, #0x0
    ldr r4, =0x08005759   @ DeleteFaceByIndex
    bl GOTO_R4
L4F23E:
mov r0, #0x80
and r0 ,r6
cmp r0, #0x0
beq L4F252
    mov r2 ,r5
    add r2, #0x63
    ldrb r1, [r2, #0x0]
    mov r0, #0x80
    orr r0 ,r1
    strb r0, [r2, #0x0]
L4F252:
mov r0, #0x1
and r0 ,r6
cmp r0, #0x0
bne L4F286
    mov r0 ,r5
    add r0, #0x63
    ldrb r1, [r0, #0x0]
    mov r0 ,r7
    and r0 ,r1
    cmp r0, #0x0
    bne L4F286
        add r7, sp, #0x4
        mov r0 ,r5
        mov r1, sp
        mov r2 ,r7
        ldr r4, =0x0804f401   @ Menu_GetCursorGfxCurrentPosition
        bl GOTO_R4
        mov r0 ,r5
        mov r1, sp
        mov r2 ,r7
        ldr r4, =0x0804f6a5   @ Menu_UpdateMovingCursorGfxPosition
        bl GOTO_R4
        ldr r0,[sp, #0x0]
        ldr r1,[sp, #0x4]
        ldr r4, =0x0804e79d   @ UpdateHandCursor
        bl GOTO_R4
L4F286:
add sp, #0x8
pop {r4,r5,r6,r7}
pop {r0}
bx r0
GOTO_R4:
bx r4
