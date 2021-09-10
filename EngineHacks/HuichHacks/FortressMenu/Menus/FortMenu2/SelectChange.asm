@ Executed when any FortMenu2 command is selected
@ after FortMenu1's "Change" command was selected. Arguments:
@   r0 = FortMenu2 proc pointer
@   r1 = DrawFortMenu2 proc pointer
.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r5, r0
mov   r6, r1

mov   r0, #0x61
ldrb  r0, [r5, r0]                  @ Current command index
mov   r1, #0x2A
ldrb  r1, [r6, r1]                  @ Top fort
lsr   r0, #0x1
add   r0, r1                        @ Selected fort
mov   r2, #0x50
strb  r0, [r6, r2]

mov   r1, #0x5
mov   r2, r0
mul   r2, r1
ldr   r1, =FortRAM
lsl   r1, #0x5
lsr   r1, #0x5
ldrb  r7, [r1, r2]                  @ Fort's Fortmaster
ldr   r2, =AbilityTable
ldrb  r1, [r2, r7]
cmp   r1, #0x0
bne   L6

  @ Unit isn't controllable
  mov   r0, #0x6C
  bl    PlaySFX
  mov   r0, #0x0
  b     Return
L6:

mov   r1, #0x29
mov   r2, #0x3
strb  r2, [r6, r1]                  @ Set mode to Change2
ldr   r1, =gpDISPCNTbuffer
ldrh  r1, [r1, #0x26]               @ BG2VOFS
mov   r2, #0x52
strh  r1, [r6, r2]                  @ Store current BG2VOFS
mov   r2, #0x54
strb  r7, [r6, r2]                  @ Store Fort's current Fortmaster

mov   r1, #0x8
ldr   r4, =_umodsi3
bl    GOTO_R4
mov   r1, #0x51
strb  r0, [r6, r1]                  @ TileID [0-7]

mov   r1, r7
mov   r7, r0
mov   r0, r1
cmp   r0, #0x0
beq   L5                            @ There is no Fortmaster
ldr   r4, =GetUnitByCharId
bl    GOTO_R4
L5:
mov   r1, #0x4C
str   r0, [r6, r1]                  @ Store unit struct in DrawFortMenu2 proc

@ Copy Fortname from BG2 to BG0
ldr   r1, =gpBG2MapBuffer
lsl   r7, #0x8
add   r7, #0x88
add   r6, r7, r1

mov   r0, #0x61
ldrb  r1, [r5, r0]                  @ Current command index
add   r1, #0x1
lsl   r1, #0x2
add   r1, #0x34
ldr   r1, [r5, r1]
mov   r0, #0x2C
ldsh  r2, [r1, r0]                  @ Command Y tile
sub   r2, #0x1
lsl   r2, #0x6
mov   r0, #0x2A
ldsh  r1, [r1, r0]                  @ Command X tile
add   r1, #0x4
lsl   r1, #0x1
add   r1, r2
ldr   r2, =gpBG0MapBuffer
add   r7, r1, r2

mov   r0, r6
mov   r1, r7
mov   r2, #0x8
ldr   r4, =CpuSet
bl    GOTO_R4
mov   r2, #0x40
add   r0, r6, r2
add   r1, r7, r2
mov   r2, #0x8
ldr   r4, =CpuSet
bl    GOTO_R4


@ Clear Fortname from BG0
mov   r7, #0x0
Loop:
  mov   r0, #0x0
  str   r0, [sp]
  mov   r0, sp
  mov   r1, r6
  mov   r2, #0x1
  lsl   r2, #0x18
  add   r2, #0x8
  ldr   r4, =CpuSet
  bl    GOTO_R4
  mov   r2, #0x40
  add   r6, r2
  add   r7, #0x1
  cmp   r7, #0x1
  ble   Loop


@ Change window0 dimensions
ldr   r0, =gpDISPCNTbuffer          @ DISPCNT
add   r0, #0x30                     @ WIN0V
mov   r1, #0x61
ldrb  r1, [r5, r1]                  @ Current command index
lsr   r1, #0x1
ldrb  r2, [r0]                      @ WIN0 Y2, bottom
add   r4, #0x1
ldrb  r3, [r0, #0x1]                @ WIN0 Y1, top

cmp   r1, #0x0
beq   L1
cmp   r1, #0x1
beq   L2
b     L3

L1:
sub   r2, #0x40
b     L4
L2:
sub   r2, #0x20
add   r3, #0x20
b     L4
L3:
add   r3, #0x40
L4:
strb  r2, [r0]
strb  r3, [r0, #0x1]


mov   r0, #0x2
ldr   r4, =EnableBackgroundSyncById 
bl    GOTO_R4
mov   r0, #0x0
ldr   r4, =EnableBackgroundSyncById 
bl    GOTO_R4


mov   r0, #0x4
Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
