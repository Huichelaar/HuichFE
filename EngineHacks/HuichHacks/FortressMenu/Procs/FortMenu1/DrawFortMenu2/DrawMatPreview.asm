@ Draws the material preview indicating how much of which materials
@ will be left after an action is taken. Arguments:
@   r0: ProcState pointer
.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
mov   r7, r11
push  {r4-r7}
sub   sp, #0x4
mov   r5, r0

@ Prepare vars
mov   r0, #0x29
ldrb  r4, [r5, r0]
cmp   r4, #0x2
bge   Return                      @ Don't draw if mode 2 or 3

mov   r2, #0x2A
ldrb  r2, [r5, r2]
mov   r3, #0x56
ldrb  r3, [r5, r3]
lsr   r3, #0x1
add   r6, r2, r3                  @ Fort index
lsl   r3, r6, #0x5
ldr   r1, =FortsTable
add   r7, r1, r3                  @ FortsTable index
ldr   r0, =gpBG0MapBuffer
mov   r9, r0                      @ BG0 buffer
mov   r0, #0x0
mov   r10, r0                     @ Loop iterator

cmp   r4, #0x0
beq   DrawMatGather
  b     DrawMatUpgrade


DrawMatGather:
mov   r0, r6
mov   r1, #0x4
ldr   r4, =_umodsi3
bl    GOTO_R4
lsl   r0, #0x4
mov   r1, #0x38
lsl   r1, #0x4
add   r0, r1
mov   r11, r0

mov   r0, r6
bl    GetFortMatCount
str   r0, [sp]

Loop:
  mov   r0, r10
  mov   r8, r11
  lsl   r2, r0, #0x2
  add   r8, r2
  
  add   pc, r2
  lsl   r0, #0x0                    @ Nop. Need to pad.
  mov   r4, #0x52
  b     L1
  mov   r4, #0x68
  b     L1
  mov   r4, #0xD2
  b     L1
  mov   r4, #0xE8
  L1:
  
  ldrb  r0, [r7, r0]
  bl    GetMatCount
  mov   r2, r0
  mov   r1, r8

  mov   r0, r10
  mov   r3, sp
  ldrb  r3, [r3, r0]
  mov   r0, r9
  add   r0, r4
  
  bl    DrawMatPreviewComponent
  
  mov   r0, r10
  add   r0, #0x1
  mov   r10, r0
  cmp   r0, #0x3
  ble   Loop
b     Return


DrawMatUpgrade:
ldr   r1, =FortRAM
lsl   r1, #0x5
lsr   r1, #0x5
mov   r0, #0x5
mul   r0, r6
add   r0, r1
ldrb  r1, [r0]
mov   r11, r0                         @ RAM fort
ldr   r2, =AbilityTable
ldrb  r2, [r2, r1]
cmp   r2, #0x0
beq   Return                          @ Don't draw for Enemy-controlled forts
ldrb  r1, [r0, #0x1]
lsr   r1, #0x6
cmp   r1, #0x3
bge   Return                          @ Don't draw for max-level fort

Loop2:

  @ Material TileID
  mov   r0, r6
  mov   r1, #0x4
  swi   #0x6                            @ Returns mod
  mov   r0, #0x38
  lsl   r0, #0x4
  lsl   r1, #0x4
  add   r0, r1
  mov   r1, r10
  lsl   r1, #0x2
  add   r4, r0, r1                      @ TileID

  @ Calc required Material count
  mov   r0, r6
  mov   r1, r10
  bl    GetFortUpgradeMatCount
  neg   r0, r0
  mov   r8, r0

  @ Calc digits1
  mov   r0, r11
  ldrb  r0, [r0, #0x1]
  lsr   r0, #0x6                      @ Fort level
  lsl   r0, #0x2
  mov   r1, r7
  add   r1, #0x8
  add   r0, r1
  mov   r1, r10
  lsl   r1, #0x1
  ldrb  r0, [r0, r1]                  @ base required Material ID
  bl    GetMatCount
  mov   r2, r0

  @ Screenblock buffer
  mov   r0, r10
  mov   r1, #0x16
  mul   r0, r1
  mov   r1, r9
  add   r1, #0x92
  add   r0, r1
  
  mov   r1, r4
  mov   r3, r8
  bl    DrawMatPreviewComponent
  mov   r0, #0x1
  add   r10, r0
  cmp   r10, r0
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
