@ Mimics Menu_DrawHoverThing, but draws hover
@ in two lines to accomodate FortMenu2's bigger menu-items.
.thumb

push {r4-r7,lr}
mov r4, r8
mov r5, r9
push {r4-r5}
sub sp, #0x4

mov r12, r0
mov r3 ,r1
lsl r2 ,r2 ,#0x18
lsr r4 ,r2 ,#0x18
add r0, #0x63
ldrb r1, [r0, #0x0]
mov r0, #0x10
and r0 ,r1
cmp r0, #0x0
bne Return
    mov r0, r12
    add r0, #0x2c
    ldrb r0, [r0, #0x0]
    lsl r0 ,r0 ,#0x18
    asr r0 ,r0 ,#0x18
    add r5 ,r0, #0x1
    lsl r1 ,r3 ,#0x2
    mov r0, r12
    add r0, #0x34
    add r0 ,r0, r1
    ldr r0, [r0, #0x0]
    mov r1, #0x2c
    ldsh r3, [r0, r1]
    sub r3, #0x1
    mov r0, r12
    add r0, #0x2e
    ldrb r0, [r0, #0x0]
    lsl r0 ,r0 ,#0x18
    asr r0 ,r0 ,#0x18
    sub r2 ,r0, #0x2
    lsl r0 ,r4 ,#0x18
    asr r0 ,r0 ,#0x18
    cmp r0, #0x0
    beq Remove
        cmp r0, #0x1
        bne Return
        
            @ Draw
            mov r0, r12
            add r0, #0x64
            ldrb r0, [r0, #0x0]
            lsl r0 ,r0 ,#0x1e
            lsr r0 ,r0 ,#0x1e
            mov r1, r12
            add r1, #0x66
            ldrh r1, [r1, #0x0]
            str r2,[sp, #0x0]
            mov r9, r2
            mov r2 ,r5
            mov r6, r0
            mov r7, r1
            mov r8, r3
            ldr r4, =0x0804e98d   @ Draws little highlight thing for menus r0=BG Index to draw on  r1=Unknown r2=(Tile)x r3=(Tile)y [sp:0]=Width
            bl GOTO_R4
            mov r2, r9
            str r2,[sp, #0x0]
            mov r2, r5
            mov r0, r6
            mov r1, r7
            mov r3, r8
            add r3, #0x2
            ldr r4, =0x0804e98d   @ Draws little highlight thing for menus r0=BG Index to draw on  r1=Unknown r2=(Tile)x r3=(Tile)y [sp:0]=Width
            bl GOTO_R4
            b Return
            
        Remove:
        mov r0, r12
        add r0, #0x64
        ldrb r0, [r0, #0x0]
        lsl r0 ,r0 ,#0x1e
        lsr r0 ,r0 ,#0x1e
        mov r1, r12
        add r1, #0x66
        ldrh r1, [r1, #0x0]
        str r2,[sp, #0x0]
        mov r9, r2
        mov r2 ,r5
        mov r6, r0
        mov r7, r1
        mov r8, r3
        ldr r4, =0x0804ea09   @ Removes little highlight thing for menus r0=BG Index to draw on r1=Unknown r2=(Tile)x r3=(Tile)y [sp:0]=Width
        bl GOTO_R4
        mov r2, r9
        str r2,[sp, #0x0]
        mov r2, r5
        mov r0, r6
        mov r1, r7
        mov r3, r8
        add r3, #0x2
        ldr r4, =0x0804ea09   @ Removes little highlight thing for menus r0=BG Index to draw on r1=Unknown r2=(Tile)x r3=(Tile)y [sp:0]=Width
        bl GOTO_R4

Return:
add sp, #0x4
pop {r4-r5}
mov r8, r4
mov r9, r5
pop {r4-r7}
pop {r0}
bx r0
GOTO_R4:
bx r4
