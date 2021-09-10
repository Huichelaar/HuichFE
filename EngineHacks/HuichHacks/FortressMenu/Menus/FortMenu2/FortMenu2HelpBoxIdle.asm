@ Mostly mimics 0x0804F4A0, Menu_HelpBoxIdle, but returns menu Proc code pointer to FortMenu2Idle.
@ Also checks whether we're scrolling in order to update helpbox.
.thumb

push {r4,r5,r6,lr}   @ Menu_HelpBoxIdle
sub sp, #0x8
mov r5 ,r0
bl FortMenu2Directions
add r6, sp, #0x4
mov r0 ,r5
mov r1, sp
mov r2 ,r6
ldr r4, =0x0804f401   @ Menu_GetCursorGfxCurrentPosition
bl  GOTO_R4
mov r0 ,r5
mov r1, sp
mov r2 ,r6
ldr r4, =0x0804f6a5   @ Menu_UpdateMovingCursorGfxPosition
bl  GOTO_R4
ldr r0,[sp, #0x0]
ldr r1,[sp, #0x4]
ldr r4, =0x0804e79d   @ UpdateHandCursor
bl  GOTO_R4
ldr r0, =0x0858791C @ (KeyStatusBuffer Pointer )
ldr r0, [r0, #0x0] @ pointer:0858791C -> 02024CC0 (KeyStatusBuffer@KeyStatusBuffer.FirstTickDelay )
ldrh r1, [r0, #0x8] @ pointer:02024CC8 (KeyStatusBuffer@KeyStatusBuffer.NewPresses: 1 For Press, 0 Otherwise)
mov r0, #0x81
lsl r0 ,r0 ,#0x1
and r0 ,r1
cmp r0, #0x0
beq L1
    ldr r4, =0x08089019   @ Procs HelpTextBubble CallASM
    bl GOTO_R4
    ldr r1, =Proc_FortMenu2Idle
    mov r0 ,r5
    ldr r4, =0x08002f5d   @ Goto6CPointer
    bl GOTO_R4
    b L2
L1:

@ Check to see if helpbox needs to be updated
mov r3 ,r5
add r3, #0x61
mov r1 ,r5
add r1, #0x62
ldrb r0, [r3, #0x0]
ldrb r1, [r1, #0x0]
cmp r0 ,r1
bne L3                    @ Check if command has changed
ldr r1, [r5, #0x14]
ldr r1, [r1, #0x1C]
ldr r1, [r1, #0x18]
cmp r1, #0x0
beq L2                    @ Check if we have a nephew
ldr r2, [r1]
ldr r3, =Proc_BGScroller  @ Check if we're scrolling, BGScroller would be our nephew
cmp r2, r3
bne L2
mov r2, #0x29
ldrb r1, [r1, r2]
cmp r1, #0x1              @ Check if scroller is about to finish
bne L2

L3:
    ldr r2, [r5, #0x30]
    mov r1 ,r0
    lsl r1 ,r1 ,#0x2
    mov r0 ,r5
    add r0, #0x34
    add r0 ,r0, r1
    ldr r1, [r0, #0x0]
    ldr r2, [r2, #0x20]
    mov r0 ,r5
    mov r4, r2
    bl GOTO_R4
L2:
add sp, #0x8
pop {r4,r5,r6}
pop {r0}
bx r0
GOTO_R4:
bx r4
