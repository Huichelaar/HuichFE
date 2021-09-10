@ Draws a FortMenu2 item. Arguments:
@   r0 = pointer to 16 contiguous shorts holding start tile indices, each representing a string. (not used).
@   r1 = [0,7], ID indicating which tiles should be overwritten.
@   r2 = ID indicating which fort should be drawn for.
.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
mov   r7, r11
push  {r4-r7}
mov   r8, r1
mov   r9, r2
sub   sp, #0x4

@ Calculate which fort to overwrite
mov   r0, r8
mov   r1, #0x4
ldr   r4, =_umodsi3
bl    GOTO_R4
mov   r10, r0

@ Grab Material Counts
mov   r0, r9
bl    GetFortMatCount
str   r0, [sp]
  

@ Draw digits or dashes
ldr   r0, =gpBG2MapBuffer
mov   r1, r8
lsl   r1, #0x8
add   r1, #0x1E
add   r0, r1
mov   r5, r0
mov   r6, sp
ldr   r0, =FortRAM
lsl   r0, #0x5
lsr   r0, #0x5
mov   r1, r9
mov   r2, #0x5
mul   r1, r2
add   r0, r1
mov   r11, r0

mov   r7, #0x0
Loop:
  mov   r3, r11
  ldrb  r0, [r3]                    @ FortMaster UnitID
  ldr   r2, =AbilityTable
  ldrb  r3, [r2, r0]
  
  @ Check if FortMaster is enemy
  mov   r0, r5
  mov   r1, #0x1
  mov   r2, #0xFF
  cmp   r3, #0x0
  beq   L1                          @ FortMaster is Enemy, draw dashes
  
    @ Check if Material is unlocked
    mov   r3, r11
    ldrb  r3, [r3, #0x1]
    lsr   r3, #0x6                    @ Fort Level
    add   r3, #0x2
    cmp   r7, r3
    bge   L1                          @ Material not unlocked at this FortLevel yet
    
      mov   r1, #0x2                  @ Blue
      ldrb  r2, [r6, r7]              @ Digits for Material
      cmp   r2, #0x32
      blt   L1
        mov   r1, #0x4                @ Green
  L1:
  ldr   r4, =DrawDecNumber
  bl    GOTO_R4
  add   r5, #0x8
  add   r7, #0x1
  cmp   r7, #0x2
  bne   L2
    add   r5, #0x70
  L2:
  cmp   r7, #0x3
  ble   Loop

@ Put icon in VRAM
mov   r0, r9
lsl   r0, #0x5
ldr   r7, =FortsTable
add   r7, r0

ldr   r4, =MaterialsGfx
mov   r5, #0x0
ldr   r3, =0x6000000
mov   r2, r10
add   r2, #0x38
lsl   r2, #0x9
add   r3, r2
mov   r11, r3

Loop2:
  ldrb  r0, [r7, r5]
  lsl   r0, #0x7
  add   r0, r4                      @ Pointer to material image
  lsl   r1, r5, #0x7
  add   r1, r11
  mov   r2, #0x20                   @ Wordcount, item icon is 128 bytes.
  swi   #0xC                        @ CpuFastSet
  
  add   r5, #0x1
  cmp   r5, #0x3
  ble   Loop2


@ Draw icons
mov   r0, #0x38
add   r0, r10
lsl   r0, #0x4
mov   r1, #0x2
lsl   r1, #0xC
add   r0, r1
ldr   r1, =gpBG2MapBuffer
mov   r2, r8
lsl   r2, #0x8
add   r1, r2
add   r1, #0x18

mov   r3, #0x0                      @ Iterator 1
mov   r4, #0x0                      @ Iterator 2
mov   r5, #0x0                      @ Iterator 3
mov   r6, #0x0                      @ Iterator 4
Loop3:
  strh  r0, [r1]
  add   r1, #0x2
  add   r0, #0x1
  add   r3, #0x1
  cmp   r3, #0x1
  ble   Loop3
    add   r1, #0x3C
    mov   r3, #0x0
    add   r4, #0x1
    cmp   r4, #0x1
    ble   Loop3
      sub   r1, #0x78
      mov   r3, #0x0
      mov   r4, #0x0
      add   r5, #0x1
      cmp   r5, #0x1
      ble   Loop3
        add   r1, #0x70
        mov   r3, #0x0
        mov   r4, #0x0
        mov   r5, #0x0
        add   r6, #0x1
        cmp   r6, #0x1
        ble   Loop3


add   sp, #0x4
pop   {r4-r7}
mov   r11, r7
mov   r10, r6
mov   r9, r5
mov   r8, r4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
