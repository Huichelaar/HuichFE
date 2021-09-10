@ 0x80B2A14 again, but I changed the vanilla one.
@ This one is to be used by opinfoview2.
.thumb

push {r4,r5,r6,r7,lr}
mov r7, r10
mov r6, r9
mov r5, r8
push {r5,r6,r7}
sub sp, #0x10
mov r8, r1
str r2,[sp, #0x4]
ldr r1,[sp, #0x30]
ldr r2,[sp, #0x34]
lsl r0 ,r0 ,#0x18
lsr r0 ,r0 ,#0x18
mov r9, r0
lsl r3 ,r3 ,#0x10
lsr r3 ,r3 ,#0x10
mov r10, r3
lsl r1 ,r1 ,#0x10
lsr r1 ,r1 ,#0x10
str r1,[sp, #0x8]
lsl r2 ,r2 ,#0x18
lsr r2 ,r2 ,#0x18
str r2,[sp, #0xc]
mov r4, #0x1
ldr r2, =palette_buffer
mov r0, #0x80
lsl r0 ,r0 ,#0x1
ldr r1, =0x21E
add r5 ,r2, r1
ldr r3,[sp, #0xc]
add r0 ,r3, r0
mov r3, r9
lsl r1 ,r3 ,#0x5
lsl r0 ,r0 ,#0x1
add r0 ,r0, r2
add r3 ,r0, #0x2
ldr r0, =0x222
add r1 ,r1, r0
add r1 ,r1, r2
L3:
  ldr r2,[sp, #0xc]
  add r0 ,r4, r2
  cmp r0, #0xf
  ble L1
      ldrh r0, [r5, #0x0]
      b L2
  L1:
  ldrh r0, [r3, #0x0]
  L2:
  strh r0, [r1, #0x0]
  mov r7, r9
  add r7, #0x1
  add r1, #0x2
  add r3, #0x2
  add r4, #0x1
  cmp r4, #0xf
  ble L3
ldr r3, =EnablePaletteSync
bl GOTO_R3
ldr r3,[sp, #0x8]
cmp r3, #0x8
bls Return
    mov r0, r10
    cmp r0, #0x7
    bhi L4
        mov r1, #0x8
        mov r10, r1
    L4:
    ldr r4, =SinTable
    ldr r2, =CosTable
    mov r3, #0x0
    ldsh r0, [r2, r3]
    lsl r0 ,r0 ,#0x4
    mov r1, r10
    swi #0x6        @ Div
    mov r6 ,r0
    lsl r6 ,r6 ,#0x10
    asr r6 ,r6 ,#0x10
    mov r1, #0x0
    ldsh r0, [r4, r1]
    neg r0 ,r0
    lsl r0 ,r0 ,#0x4
    ldr r1,[sp, #0x8]
    swi #0x6        @ Div
    mov r5 ,r0
    lsl r5 ,r5 ,#0x10
    asr r5 ,r5 ,#0x10
    mov r2, #0x0
    ldsh r0, [r4, r2]
    lsl r0 ,r0 ,#0x4
    mov r1, r10
    swi #0x6        @ Div
    mov r4 ,r0
    lsl r4 ,r4 ,#0x10
    asr r4 ,r4 ,#0x10
    ldr r3, =CosTable
    mov r1, #0x0
    ldsh r0, [r3, r1]
    lsl r0 ,r0 ,#0x4
    ldr r1,[sp, #0x8]
    swi #0x6        @ Div
    lsl r0 ,r0 ,#0x10
    asr r0 ,r0 ,#0x10
    str r0,[sp, #0x0]
    mov r0, r9
    mov r1 ,r6
    mov r2 ,r5
    mov r3 ,r4
    ldr r4, =WriteOAMRotScaleData
    bl GOTO_R4
    ldr r2,[sp, #0xc]
    cmp r2, #0x0
    beq L5
        ldr r0, =0x1FF
        mov r3, r8
        and r3 ,r0
        mov r8, r3
        mov r2, r9
        lsl r1 ,r2 ,#0x9
        add r1, r8
        ldr r3,[sp, #0x4]
        and r3 ,r0
        str r3,[sp, #0x4]
        ldr r3, =0x8A2EF48        @ OAMData
        lsl r0 ,r2 ,#0x1
        mov r2, #0xf
        and r7 ,r2
        lsl r2 ,r7 ,#0xc
        add r0 ,r0, r2
        mov r2, #0x80
        lsl r2 ,r2 ,#0x4
        add r0 ,r0, r2
        str r0,[sp, #0x0]
        mov r0, #0x4
        ldr r2,[sp, #0x4]
        ldr r4, =RegisterObject
        bl GOTO_R4
        b Return
    L5:
    ldr r0, =0x1FF
    mov r3, r8
    and r3 ,r0
    mov r8, r3
    mov r2, r9
    lsl r1 ,r2 ,#0x9
    add r1, r8
    ldr r3,[sp, #0x4]
    and r3 ,r0
    str r3,[sp, #0x4]
    ldr r3, =0x8A2EF48        @ OAMData
    lsl r0 ,r2 ,#0x1
    mov r2, #0xf
    and r7 ,r2
    lsl r2 ,r7 ,#0xc
    add r0 ,r0, r2
    mov r2, #0x80
    lsl r2 ,r2 ,#0x3
    add r0 ,r0, r2
    str r0,[sp, #0x0]
    mov r0, #0x4
    ldr r2,[sp, #0x4]
    ldr r4, =RegisterObject
    bl GOTO_R4
Return:
add sp, #0x10
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
