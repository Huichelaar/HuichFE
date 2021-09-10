@ Give bonus exp for expboosting fort abilities
.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
push  {r4-r6}

cmp   r0, #0x0
beq   Return
  mov   r8, r0                      @ Base exp
  ldr   r0, =FortCount
  lsl   r0, #0x5
  lsr   r0, #0x5
  mov   r9, r0                      @ FortCount
  ldr   r0, =AbilityTable
  mov   r10, r0
  ldr   r4, =AbilityBonusTable
  add   r4, #0x10
  ldr   r5, =FortRAM
  lsl   r5, #0x5
  lsr   r5, #0x5
  mov   r6, #0x0
  mov   r7, #0x0
  Loop:
    ldrb  r0, [r5]
    mov   r1, r10
    ldrb  r1, [r1, r0]
    cmp   r1, #0x2
    bne   L1
      mov   r0, r7
      bl    GetBonusLv
      ldrb  r0, [r4, r0]
      add   r6, r0                @ Bonus percentage
    L1:
    add   r5, #0x5
    add   r7, #0x1
    cmp   r7, r9
    blt   Loop
    
  mov   r0, r8
  mul   r0, r6
  mov   r1, #0x64
  swi   #0x6                      @ div
  mov   r1, r8
  add   r0, r1                    @ Boosted exp
  cmp   r0, #0x64
  ble   Return
    mov   r0, #0x64
    
Return:
pop   {r4-r6}
mov   r10, r6
mov   r9, r5
mov   r8, r4
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
