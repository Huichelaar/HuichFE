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


@ Prep tiles
ldr   r0, =gpBG2MapBuffer
mov   r1, r8
lsl   r1, #0x8
add   r0, r1
mov   r8, r0


@ Draw LV and E chars
add   r0, #0x98
mov   r1, #0x3
mov   r2, #0x24
ldr   r4, =DrawSpecialUiChar
bl    GOTO_R4
mov   r0, r8
add   r0, #0x9A
mov   r1, #0x3
mov   r2, #0x25
ldr   r4, =DrawSpecialUiChar
bl    GOTO_R4
mov   r0, r8
add   r0, #0xA2
mov   r1, #0x3
mov   r2, #0x1D
ldr   r4, =DrawSpecialUiChar
bl    GOTO_R4


@ Prepare vars
mov   r1, r9
ldr   r2, =FortRAM
lsl   r2, #0x5
lsr   r2, #0x5
mov   r3, #0x5
mul   r1, r3
add   r1, r2
ldrb  r0, [r1]
ldr   r2, =AbilityTable
ldrb  r7, [r2, r0]                      @ Unit ability, 0 if enemy
ldrb  r1, [r1, #0x1]
lsr   r5, r1, #0x6                      @ Fort level
lsl   r1, #0x1A
lsr   r1, #0x1A
mov   r6, r1                            @ Fort Exp


@ Draw Fort level
mov   r0, r8
add   r0, #0x9E
mov   r1, #0x2
cmp   r5, #0x2
ble   L1
  mov   r1, #0x4                        @ Green
L1:
cmp   r7, #0x0
bne   L2
  mov   r1, #0x1                        @ Grey, prioritised over green.
L2:
add   r2, r5, #0x1
ldr   r4, =DrawDecNumber
bl    GOTO_R4


@ Draw Fort exp
mov   r0, r8
add   r0, #0xA6
mov   r1, #0x2
mov   r2, r6
cmp   r5, #0x2
bgt   L3
cmp   r7, #0x0
bne   L4
L3:
  mov   r1, #0x1                        @ Grey
  mov   r2, #0xFF                       @ --
L4:
ldr   r4, =DrawDecNumber
bl    GOTO_R4


@ Draw Materials required to upgrade
cmp   r5, #0x2
bgt   L5
cmp   r7, #0x0
bne   L6

L5:
  @ Fort is max lvl or its FortMaster is an enemy
  mov   r5, #0x1A
  mov   r6, #0x0

  Loop:
    mov   r0, r8
    add   r0, r5
    mov   r1, #0x1                        @ Grey
    mov   r2, #0xFF                       @ --
    ldr   r4, =DrawDecNumber
    bl    GOTO_R4
    add   r5, #0x4
    add   r6, #0x1
    cmp   r6, #0x3
    ble   Loop
  b Return
L6:

mov   r1, r9
ldr   r0, =FortsTable
lsl   r2, r1, #0x5
add   r0, r2
add   r0, #0x8
lsl   r2, r5, #0x2
add   r5, r0, r2                          @ Upgrade Materials
ldr   r0, =MaterialsGfx
mov   r11, r0
mov   r7, #0x0

Loop2:

  @ Put MaterialIcon into VRAM
  lsl   r0, r7, #0x1
  ldrb  r0, [r5, r0]
  lsl   r0, #0x7
  add   r0, r11                           @ Pointer to material image
  mov   r1, r10
  lsl   r1, #0x9
  ldr   r2, =0x6007000
  add   r1, r2
  lsl   r2, r7, #0x7
  add   r1, r2
  mov   r2, #0x20
  swi   #0xC                              @ CpuFastSet
  
  @ Draw MaterialIcon
  mov   r0, r8
  add   r0, #0x18
  lsl   r1, r7, #0x3
  add   r0, r1  
  mov   r1, #0x2
  lsl   r1, #0xC
  mov   r2, r10
  lsl   r2, #0x4
  add   r1, r2
  mov   r2, #0x38
  lsl   r2, #0x4
  add   r1, r2
  lsl   r2, r7, #0x2
  add   r1, r2
  
  mov   r2, #0x0
  Loop3:
    strh  r1, [r0]
    add   r1, #0x1
    add   r0, #0x2
    add   r2, #0x1
    cmp   r2, #0x2
    bne   L7
      add   r0, #0x3C
    L7:
    cmp   r2, #0x3
    ble   Loop3
    
  @ Calc & draw required Material count
  mov   r0, r9
  mov   r1, r7
  bl    GetFortUpgradeMatCount
  
  mov   r2, r0
  mov   r0, r8
  add   r0, #0x1E
  lsl   r1, r7, #0x3
  add   r0, r1
  mov   r1, #0x2                          @ Blue
  ldr   r4, =DrawDecNumber
  bl    GOTO_R4
  
  add   r7, #0x1
  cmp   r7, #0x1
  ble   Loop2


Return:
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
