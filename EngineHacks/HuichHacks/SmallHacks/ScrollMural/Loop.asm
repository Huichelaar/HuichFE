@ Loop.
@ Arguments:
@   r0: MuralEntry struct index.
@ Procvars:
@   +0x29, byte, Screen entry counter.
@   +0x2A, short, timer.
@   +0x2C, short, [0x0, 0x580], TileIndex where MuralTiles will be put.
@   +0x2E, byte, Char entry counter.
@   +0x2F, byte, Palette slot.
.thumb

push  {r4-r7, r14}
mov   r5, r0


ldr   r4, =GetGameClock
bl    GOTO_R4
mov   r1, #0x3
swi   #0x6                            @ mod
cmp   r1, #0x0
bne   Return                          @ Every three frames.


@ Update timer.
ldrh  r6, [r5, #0x2A]
sub   r0, r6, #0x1
cmp   r6, #0x0
bgt   L1
  ldr   r0, =0x2CF
L1:
strh  r0, [r5, #0x2A]
sub   r6, r0, #0x7


@ Update Char entry counter.
mov   r0, #0x2E
ldrb  r7, [r5, r0]
mov   r2, #0x7
and   r2, r6
cmp   r2, #0x0
bne   L2
  sub   r7, #0x1
  cmp   r7, #0x0
  bge   L3
    mov   r7, #0x14
  L3:
  strb  r7, [r5, r0]

  @ Update Char entries.
  lsl   r0, r6, #0x7
  lsl   r1, r6, #0x3
  sub   r0, r1                        @ Multiply row by 960
  ldr   r1, =MuralTiles
  add   r0, r1                        @ Source

  ldrh  r1, [r5, #0x2C]
  lsl   r1, #0x5
  lsl   r2, r7, #0xA
  lsl   r3, r7, #0x6
  sub   r2, r3                        @ Multiply by 960
  add   r1, r2
  ldr   r2, =0x6000000
  add   r1, r2                        @ Destination

  mov   r2, #0xF0                     @ Size in words
  swi   #0xC                          @ CpuFastSet


  @ Update Screen entry counter.
  mov   r0, #0x29
  ldrb  r1, [r5, r0]
  sub   r1, #0x1
  cmp   r1, #0x0
  bge   L4
    mov   r1, #0x1F
  L4:
  strb  r1, [r5, r0]


  @ Update Screen entries.
  ldr   r0, =gpBG3MapBuffer
  lsl   r1, #0x6
  add   r0, r1

  ldrh  r1, [r5, #0x2C]
  lsl   r2, r7, #0x5
  lsl   r3, r7, #0x1
  sub   r2, r3
  add   r1, r2
  lsl   r1, #0x16
  lsr   r1, #0x16
  
  mov   r2, #0x2F
  ldrb  r2, [r5, r2]
  lsl   r2, #0xC
  orr   r1, r2
  
  mov   r3, #0x0

  Loop:
    strh  r1, [r0, r3]
    add   r1, #0x1
    add   r3, #0x2
    cmp   r3, #0x3C
    blt   Loop


L2:
@ Scroll
ldr   r0, =gpDISPCNTbuffer
mov   r1, #0x2A
ldrb  r2, [r0, r1]
sub   r2, #0x1
strb  r2, [r0, r1]


mov   r0, #0x3
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
