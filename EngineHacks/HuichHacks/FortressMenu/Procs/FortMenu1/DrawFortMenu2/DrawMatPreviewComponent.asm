@ Draws a preview component (material icon, digits1, rightarrow, digits2). Arguments:
@   r0: Screenblock buffer to begin drawing to
@   r1: Material TileID
@   r2: Digits1
@   r3: Value to add to Digits1 to get Digits2
.thumb

push  {r4-r7, r14}
mov   r4, r0
mov   r5, r1
mov   r6, r2
mov   r7, r3


@ Draw Material Icon
mov   r2, #0x2
lsl   r2, #0xC
mov   r5, #0x0
mov   r12, r5

Loop:
  add   r3, r2, r1
  strh  r3, [r0]
  add   r0, #0x2
  add   r1, #0x1
  add   r5, #0x1
  cmp   r5, #0x1
  ble   Loop
    mov   r5, #0x0
    add   r0, #0x3C
    mov   r3, #0x1
    add   r12, r3
    cmp   r12, r3
    ble   Loop


@ Draw Digits1
mov   r5, #0x2                    @ ColourID, Blue
mov   r0, #0x3E
lsl   r0, #0x4
add   r0, #0x7
cmp   r6, r0
blt   L1
  @ Max value
  mov   r5, #0x4                  @ ColourID, Glowing Green
L1:
mov   r2, r6
cmp   r6, #0xFF
bne   L4
  @0xFF is reserved so we draw 0xFE and 0x5 instead
  mov   r0, r4
  add   r0, #0x8
  mov   r1, r5
  mov   r2, #0xFE
  ldr   r3, =DrawDecNumber
  mov   r12, r3
  bl    GOTO_R12
  mov   r2, #0x5
L4:
mov   r0, r4
add   r0, #0x8
mov   r1, r5
ldr   r3, =DrawDecNumber
mov   r12, r3
bl    GOTO_R12


@ Draw Digits2
mov   r5, #0x2                    @ ColourID, Blue
add   r6, r7
mov   r0, #0x3E
lsl   r0, #0x4
add   r0, #0x7
cmp   r6, r0
blt   L2
  @ Max value
  mov   r6, r0
  mov   r5, #0x4                  @ ColourID, Glowing Green
  b     L3
L2:
cmp   r6, #0x0
bge   L3
  @ Negative number
  neg   r6, r6
  mov   r0, r4
  add   r0, #0xC
  mov   r1, #0x1
  mov   r5, r1                      @ ColourID, Grey
  mov   r2, #0x14                   @ Minus char ID
  ldr   r3, =DrawSpecialUiChar
  mov   r12, r3
  bl    GOTO_R12
L3:
mov   r2, r6
cmp   r6, #0xFF
bne   L5
  @0xFF is reserved so we draw 0xFE and 0x5 instead
  mov   r0, r4
  add   r0, #0x10
  mov   r1, r5
  mov   r2, #0xFE
  ldr   r3, =DrawDecNumber
  mov   r12, r3
  bl    GOTO_R12
  mov   r2, #0x5
L5:
mov   r0, r4
add   r0, #0x10
mov   r1, r5
ldr   r3, =DrawDecNumber
mov   r12, r3
bl    GOTO_R12


@ Draw Rightarrow
mov   r0, r4
add   r0, #0xA
mov   r1, r5
mov   r2, #0x26                   @ Rightarrow char ID
ldr   r3, =DrawSpecialUiChar
mov   r12, r3
bl    GOTO_R12

pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R12:
bx    r12
