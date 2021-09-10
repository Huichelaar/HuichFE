.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
mov   r7, r11
push  {r4-r7}
sub   sp, #0x8

ldr   r0, =FortCount
lsl   r0, #0x5
lsr   r0, #0x5
mov   r8, r0
ldr   r0, =AbilityTable
mov   r9, r0
ldr   r0, =FortsTable
mov   r11, r0
ldr   r4, =FortRAM
lsl   r4, #0x5
lsr   r4, #0x5
mov   r6, #0x0

Loop:
  
  @ Don't increase produce for empty forts or enemy controlled forts
  ldrb  r0, [r4]
  cmp   r0, #0x0
  beq   L4
  mov   r1, r9
  ldrb  r0, [r1, r0]
  cmp   r0, #0x0
  beq   L4

    @ Roll RN FortLevel times
    ldrb  r0, [r4, #0x1]
    lsr   r0, #0x6
    mov   r10, r0
    mov   r5, #0x0
    mov   r7, #0x0
    
    Loop3:
      mov   r0, #0xF
      ldr   r3, =NextRN_N
      bl    GOTO_R3
      cmp   r0, r7
      ble   L2
        mov   r7, r0
      L2:
      add   r5, #0x1
      cmp   r5, r10
      ble   Loop3
    
    lsl   r1, r6, #0x5
    add   r1, r11
    ldrb  r1, [r1, #0x14]
    lsl   r1, #0x6
    ldr   r0, =ProduceTable
    add   r1, r0
    lsl   r2, r7, #0x2
    ldr   r1, [r1, r2]
    mov   r7, sp
    str   r1, [r7, #0x4]
    mov   r0, r6
    bl    GetFortMatCount
    str   r0, [r7]
    
    @ Increase Fort material count
    mov   r5, r10
    add   r5, #0x1
    cmp   r5, #0x3
    ble   L3
      mov   r5, #0x3
    L3:
    add   r2, r7, #0x4
    mov   r3, #0x0
    Loop2:
      ldrb  r0, [r7, r3]
      ldrb  r1, [r2, r3]
      add   r0, r1
      cmp   r0, #0x32
      ble   L1
        mov   r0, #0x32
      L1:
      strb  r0, [r7, r3]
      add   r3, #0x1
      cmp   r3, r5
      ble   Loop2
    
    mov   r0, r6
    ldr   r1, [r7]
    bl    SetFortMatCount
  L4:
  add   r4, #0x5
  add   r6, #0x1
  cmp   r6, r8
  blt   Loop


add   sp, #0x8
pop   {r4-r7}
mov   r8, r4
mov   r9, r5
mov   r10, r6
mov   r11, r7
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R3:
bx    r3
