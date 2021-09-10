@ Mostly mimics 0x0804EC98 and 0x0804ECB0, but creates a slightly different menu.

.thumb

push {lr}

sub sp, #0xc
mov r3, #0x0
str r3,[sp, #0x0]
str r3,[sp, #0x4]
str r2,[sp, #0x8]
mov r2, #0x1
bl  NewFortMenu2
add sp, #0xc

pop {r1}
bx r1

NewFortMenu2:
push {r4,r5,r6,r7,lr}
mov r7, r11
mov r6, r10
mov r5, r9
mov r4, r8
push {r4,r5,r6,r7}
sub sp, #0x30

mov r8, r0
mov r10, r1
str r2,[sp, #0x0]
str r3,[sp, #0x4]
ldr r4,[sp, #0x5C]
lsl r0 ,r1 ,#0x18
asr r0 ,r0 ,#0x18
add r0, #0x1
str r0,[sp, #0xc]
lsl r0 ,r1 ,#0x10
asr r0 ,r0 ,#0x18
add r0, #0x1
mov r9, r0
ldr r1,[sp, #0x54]
lsl r0 ,r1 ,#0x10
lsr r0 ,r0 ,#0x10
mov r1, #0x0
mov r2, #0x0

mov r11, r4
ldr r4, =0x0800148d   @ BG_SetPosition
bl  GOTO_R4
mov r4, r11

ldr r2,[sp, #0x0]
lsl r0 ,r2 ,#0x10
lsr r0 ,r0 ,#0x10
mov r1, #0x0
mov r2, #0x0

mov r11, r4
ldr r4, =0x0800148d   @ BG_SetPosition
bl  GOTO_R4
mov r4, r11

ldr r0, =ChapterData
add r0, #0x41
ldrb r0, [r0, #0x0]   @ pointer:0202BD31 (ChapterData@gChapterData.Option2)
lsl r0 ,r0 ,#0x1e
cmp r0, #0x0
blt L4ED04
    mov r0, #0x68
    
    mov r11, r4
    ldr r4, =0x080d01fd   @ m4aSongNumStart r0=music id:SOUND
    bl  GOTO_R4
    mov r4, r11
L4ED04:
cmp r4, #0x0
beq L4ED24
    ldr r0, =Proc_FortMenu2
    mov r1 ,r4
    
    mov r11, r4
    ldr r4, =0x08002ce1   @ NewBlocking6C
    bl  GOTO_R4
    mov r4, r11
    
    mov r5 ,r0
    mov r1 ,r5
    add r1, #0x63
    mov r0, #0x0
    b L4ED38
    nop
@ LDRDATA
@ POINTER Procs Menu
L4ED24:

mov r11, r4
ldr r4, =0x08015361   @ AddSkipThread2
bl  GOTO_R4
mov r4, r11

ldr r0, =Proc_FortMenu2
mov r1, #0x3

mov r11, r4
ldr r4, =0x08002c7d   @ New6C
bl  GOTO_R4
mov r4, r11

mov r5 ,r0
mov r1 ,r5
add r1, #0x63
mov r0, #0x1
L4ED38:
strb r0, [r1, #0x0]
mov r1, r10
asr r0 ,r1 ,#0x18
str r0,[sp, #0x2c]
cmp r0, #0x0
bge L4ED50
    mov r2 ,r5
    add r2, #0x63
    ldrb r1, [r2, #0x0]   @ pointer:085B6533 -> 04F53100
    mov r0, #0x8
    orr r0 ,r1
    strb r0, [r2, #0x0]
L4ED50:
mov r7, #0x0
mov r2, #0x0
str r2,[sp, #0x8]
mov r0, r8
ldr r1, [r0, #0x8]
ldr r0, [r1, #0xc]
mov r2, r10
lsl r2 ,r2 ,#0x10
str r2,[sp, #0x28]
mov r2 ,r5
add r2, #0x60
str r2,[sp, #0x10]
add r2, #0x1
str r2,[sp, #0x14]
add r2, #0x1
str r2,[sp, #0x18]
add r2, #0x2
str r2,[sp, #0x1c]
add r2, #0x2
str r2,[sp, #0x20]
add r2, #0x2
str r2,[sp, #0x24]
cmp r0, #0x0
beq L4EE12
    mov r6, #0x0
    L4ED82:
    add r0 ,r1, r6
    mov r1 ,r7
    
    mov r11, r4
    ldr r4, =0x0804f7ad   @ GetOverriddenMenuCommandUsability
    bl  GOTO_R4
    mov r4, r11
    
    lsl r0 ,r0 ,#0x18
    lsr r4 ,r0 ,#0x18
    cmp r4, #0x0
    bne L4EDA4
        mov r1, r8
        ldr r0, [r1, #0x8]
        add r0 ,r6, r0
        ldr r2, [r0, #0xc]
        mov r1 ,r7
        
        mov r11, r4
        ldr r4, =0x080d18c9   @ _call_via_r2
        bl  GOTO_R4
        mov r4, r11
        
        lsl r0 ,r0 ,#0x18
        lsr r4 ,r0 ,#0x18
    L4EDA4:
    cmp r4, #0x3
    beq L4EE02
        ldr r0, =0x085B6510   @ Procs MenuCommand
        mov r1 ,r5
        
        mov r11, r4
        ldr r4, =0x08002c7d   @ New6C
        bl  GOTO_R4
        mov r4, r11
        
        mov r2 ,r0
        ldr r0,[sp, #0x8]
        lsl r1 ,r0 ,#0x2
        mov r0 ,r5
        add r0, #0x34
        add r0 ,r0, r1
        str r2, [r0, #0x0]
        ldr r1,[sp, #0x8]
        add r1, #0x1
        str r1,[sp, #0x8]
        mov r1, r8
        ldr r0, [r1, #0x8]
        add r0 ,r0, r6
        str r0, [r2, #0x30]
        mov r0 ,r2
        add r0, #0x3c
        strb r7, [r0, #0x0]
        add r0, #0x1
        strb r4, [r0, #0x0]
        mov r0, sp
        ldrh r0, [r0, #0xc]
        strh r0, [r2, #0x2a]
        mov r1, r9
        strh r1, [r2, #0x2c]
        
        @ Don't draw or allocate text!
        mov r0, #0x63
        ldrb r1, [r5, r0]
        mov r2, #0x8
        orr r1, r2
        strb r1, [r5, r0]
        mov r0, #0x2
        add r9, r0
    L4EE02:
    add r6, #0x24
    add r7, #0x1
    mov r2, r8
    ldr r1, [r2, #0x8]
    add r0 ,r6, r1
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    bne L4ED82
L4EE12:
mov r0, r8
str r0, [r5, #0x30]
mov r1, r10
str r1, [r5, #0x2c]
mov r3, #0x0
mov r2, sp
ldrb r0, [r2, #0x8]
ldr r2,[sp, #0x10]
strb r0, [r2, #0x0]
ldr r1,[sp, #0x14]
strb r3, [r1, #0x0]
mov r0, #0xff
ldr r2,[sp, #0x18]
strb r0, [r2, #0x0]
ldr r0,[sp, #0x28]
asr r1 ,r0 ,#0x18
ldr r2,[sp, #0x2c]
add r0 ,r1, r2
cmp r0, r9
bge L4EE46
    sub r0 ,r1, #0x1
    mov r1, r9
    sub r0 ,r1, r0
    mov r1 ,r5
    add r1, #0x2f
    strb r0, [r1, #0x0]
L4EE46:
mov r2, #0x3
ldr r0,[sp, #0x0]
and r0 ,r2
str r0,[sp, #0x0]
ldr r0,[sp, #0x1c]
ldrb r1, [r0, #0x0]
mov r0, #0x4
neg r0 ,r0
and r0 ,r1
ldr r1,[sp, #0x0]
orr r0 ,r1
ldr r1,[sp, #0x1c]
strb r0, [r1, #0x0]
mov r0, sp
ldrh r1, [r0, #0x4]
ldr r0,[sp, #0x20]
strh r1, [r0, #0x0]
ldr r0,[sp, #0x54]
and r0 ,r2
lsl r2 ,r0 ,#0x2
ldr r0,[sp, #0x1c]
ldrb r1, [r0, #0x0]
mov r0, #0xd
neg r0 ,r0
and r0 ,r1
orr r0 ,r2
ldr r1,[sp, #0x1c]
strb r0, [r1, #0x0]
ldr r0,[sp, #0x58]
ldr r2,[sp, #0x24]
strh r0, [r2, #0x0]
ldr r0, =0x0858791C   @ KeyStatusBuffer Pointer
ldr r0, [r0, #0x0]    @ pointer:0858791C -> 02024CC0 (KeyStatusBuffer@KeyStatusBuffer.FirstTickDelay )
strh r3, [r0, #0x8]   @ KeyStatusBuffer@KeyStatusBuffer.NewPresses:  1 For Press, 0 Otherwise

@ Draw blue hover thing, this is normally drawn by function in menudef+0xC,
@ but we set that to 0, to avoid drawing over the FortMenuBlock drawn externally.
mov r0, r5
mov r1, #0x0
mov r2, #0x1
bl  FortMenu2DrawHoverThing
mov r0 ,r5

add sp, #0x30
pop {r3,r4,r5,r6}
mov r8, r3
mov r9, r4
mov r10, r5
mov r11, r6
pop {r4,r5,r6,r7}
pop {r1}
bx r1
GOTO_R4:
bx r4
