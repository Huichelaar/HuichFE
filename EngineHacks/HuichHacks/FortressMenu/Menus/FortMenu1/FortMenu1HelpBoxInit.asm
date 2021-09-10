@ Mimics Menu_HelpBoxInit, 0x0804F474, but loads the textbox in 0x06010800 instead.
.thumb

push {r4,r5,lr}
mov r5 ,r0
mov r1, #0x1
neg r1 ,r1
mov r0, #0x0
bl NewLoadDialogueBoxGfx
ldr r2, [r5, #0x30]
mov r0 ,r5
add r0, #0x61
ldrb r1, [r0, #0x0]
lsl r1 ,r1 ,#0x2
sub r0, #0x2d
add r0 ,r0, r1
ldr r1, [r0, #0x0]
ldr r2, [r2, #0x20]
mov r0 ,r5
mov r4, r2
bl  GOTO_R4
pop {r4,r5}
pop {r0}
bx r0

NewLoadDialogueBoxGfx:
push {r4,r5,r6,r7,lr}
mov r4, r8
push {r4}

mov r5 ,r0
mov r6 ,r1
cmp r5, #0x0
bne L1
    ldr r5, =0x6010800
L1:
cmp r6, #0x0
bge L2
    mov r6, #0x5
L2:
mov r0, #0xF
mov r8, r0
and r0 ,r6
mov r6 ,r0
add r6, #0x10
ldr r0, =0x08A0285C @ (Compressed Data0xA0285C )
mov r2, #0xd8
lsl r2 ,r2 ,#0x2
add r1 ,r5, r2
ldr r4, =0x08012f51   @ UnLZ77Decompress
bl GOTO_R4
ldr r0, =0x08A02884 @ (Compressed Data0xA02884 )
mov r2, #0xec
lsl r2 ,r2 ,#0x3
add r1 ,r5, r2
ldr r4, =0x08012f51   @ UnLZ77Decompress
bl GOTO_R4
ldr r0, =0x08A028AC @ (Compressed Data0xA028AC )
mov r2, #0xb6
lsl r2 ,r2 ,#0x4
add r1 ,r5, r2
ldr r4, =0x08012f51   @ UnLZ77Decompress
bl GOTO_R4
ldr r0, =0x08A02914 @ (Compressed Data0xA02914 )
mov r2, #0xf6
lsl r2 ,r2 ,#0x4
add r1 ,r5, r2
ldr r4, =0x08012f51   @ UnLZ77Decompress
bl GOTO_R4
ldr r0, =0x08A02980 @ (Compressed Data0xA02980 )
mov r2, #0x9b
lsl r2 ,r2 ,#0x5
add r1 ,r5, r2
ldr r4, =0x08012f51   @ UnLZ77Decompress
bl GOTO_R4
ldr r7, =0x0203E794 @ (When viewing character list, help functions, armories )
mov r0 ,r7
mov r1 ,r5
mov r2 ,r6
ldr r4, =0x0800459d   @ InitSomeOtherGraphicsRelatedStruct
bl GOTO_R4
mov r0 ,r7
add r0, #0x18
ldr r4, =0x080045d9   @ Text_Init3
bl GOTO_R4
mov r0 ,r7
add r0, #0x20
ldr r4, =0x080045d9   @ Text_Init3
bl GOTO_R4
mov r0 ,r7
add r0, #0x28
ldr r4, =0x080045d9   @ Text_Init3
bl GOTO_R4
mov r0, #0x0
ldr r4, =0x08003d39   @ SetFont
bl GOTO_R4
ldr r0, =0x0859EF40 @ (systemmenu_badstatus_palette )
lsl r1 ,r6 ,#0x5
mov r2, #0x20
ldr r4, =0x08000db9   @ CopyToPaletteBuffer
bl GOTO_R4
lsl r0 ,r5 ,#0x11
lsr r0 ,r0 ,#0x16
mov r1, r8
and r6 ,r1
lsl r1 ,r6 ,#0xc
add r0 ,r0, r1
strh r0, [r7, #0x30]

pop {r4}
mov r8, r4
pop {r4,r5,r6,r7}
pop {r0}
bx r0
GOTO_R4:
bx    r4
