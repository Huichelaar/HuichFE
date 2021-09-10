@ Scroll WM & update WMTiles.
@ Also blend.
@ Procstate vars. Format: <location>: <size>, <range>, <description>.
@   +0x29: byte, [0, 31], Timer.
@   +0x2A: byte, [0, 240], PrevX.
@   +0x2B: byte, [0, 160], PrevY.
@   +0x2C: byte, [0, 4], Transition index. Indicates which transition we're doing.
@   +0x2D: byte, [0, 1], indicates which background we're sliding.
.thumb

push  {r4-r7,r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
mov   r7, r11
push  {r4-r7}
mov   r5, r0


@ Timer
mov   r0, #0x29
ldrb  r4, [r5, r0]
add   r4, #0x1
strb  r4, [r5, r0]
cmp   r4, #0x20
ble   L1

  @ Break Loop if we completed slide trajectory.
  mov   r0, r5
  ldr   r4, =Break6CLoop
  bl    GOTO_R4
  b     Return
L1:


@ Blend
mov   r0, r5
bl    WMSliderBlend


@ Update BG1 or BG0 HOFS & VOFS
mov   r0, #0x2C
ldrb  r0, [r5, r0]
lsl   r0, #0x6
ldr   r1, =WMSlideTable
add   r0, r1
sub   r4, #0x1
lsl   r4, #0x1
ldrb  r6, [r0, r4]                    @ CurX
add   r4, #0x1
ldrb  r7, [r0, r4]                    @ CurY

mov   r1, #0x2D
ldrb  r4, [r5, r1]                    @ Current BG
lsl   r1, r4, #0x2
add   r1, #0x1C
ldr   r0, =gpDISPCNTbuffer
add   r0, r1
strb  r6, [r0]
strb  r7, [r0, #0x2]


@ Update PrevX & PrevY
mov   r0, #0x2A
ldrb  r2, [r5, r0]
strb  r6, [r5, r0]
mov   r0, #0x2B
ldrb  r3, [r5, r0]
strb  r7, [r5, r0]
lsr   r2, #0x3
lsr   r3, #0x3
lsr   r6, #0x3
lsr   r7, #0x3
cmp   r2, r6
bne   L2
  cmp   r3, r7
  bne   L2
    b Return


@ Update BG1 or BG0 Tiles
L2:
lsl   r0, r7, #0xB
lsl   r1, r7, #0x7
sub   r0, r1
lsl   r1, r6, #0x5
add   r0, r1
ldr   r1, =WMTiles
add   r0, r1
mov   r8, r0                          @ WMTile Offset
lsl   r0, r7, #0x5
add   r0, r6
lsl   r0, #0x5
ldr   r1, =0x6000000
lsl   r2, r4, #0xF
add   r1, r2
add   r0, r1
mov   r9, r0                          @ Char entries Offset
mov   r0, #0x0
mov   r10, r0                         @ Iterator

Loop:
  mov   r0, r8
  mov   r1, r9
  mov   r2, #0x20
  sub   r2, r6
  cmp   r2, #0x20
  blt   L10
    mov   r2, #0x1F
  L10:
  mov   r5, r2
  lsl   r2, #0x3
  swi   #0xC                          @ CpuFastSet
  
  mov   r2, #0x1F
  sub   r2, r5
  cmp   r2, #0x0
  ble   L4
    
    lsl   r0, r5, #0x5
    add   r0, r8
    mov   r1, r9
    lsr   r1, #0xA
    lsl   r1, #0xA
    lsl   r2, #0x3
    swi   #0xC                        @ CpuFastSet
    
  L4:
  ldr   r0, =0x780
  add   r8, r0
  ldr   r0, =0x400
  add   r0, r9
  ldr   r1, =0x6008000
  lsl   r2, r4, #0xF
  add   r1, r2
  cmp   r0, r1
  blt   L5
    ldr   r1, =0x8000
    sub   r0, r1
  L5:
  mov   r9, r0
  mov   r0, #0x1
  add   r10, r0
  mov   r0, #0x15
  cmp   r10, r0
  blt   Loop


@ Screen entries
lsl   r0, r7, #0x6
ldr   r1, =gpBG0MapBuffer
lsl   r2, r4, #0xB
add   r1, r2
add   r0, r1
mov   r8, r0                          @ Screen entries Y offset
lsl   r0, r6, #0x1
mov   r9, r0                          @ Screen entries X offset
lsl   r0, r7, #0x5
ldr   r1, =WMPaletteRAM
add   r0, r1
mov   r10, r0                         @ Palette Map offset
mov   r0, #0x0
mov   r11, r0                         @ X Iterator
mov   r12, r0                         @ Y Iterator

  Loop2:
  
    @ Palette
    mov   r0, r11
    add   r0, r6
    mov   r2, #0x1
    and   r2, r0
    lsr   r0, #0x1
    mov   r1, r10
    ldrb  r0, [r1, r0]
    cmp   r2, #0x0
    bne   L6
      lsl   r0, #0x1C
      lsr   r0, #0x18
    L6:
    lsr   r0, #0x4
    add   r0, #0x7                      @ Palette
    
    @ Screen entry
    lsl   r0, #0xC
    lsl   r1, r7, #0x5
    mov   r2, r9
    lsr   r2, #0x1
    add   r1, r2
    mov   r2, r12
    lsl   r2, #0x5
    add   r1, r2
    ldr   r2, =0x400
    cmp   r1, r2
    blt   L9
      sub   r1, r2
    L9:
    add   r0, r1
    mov   r1, r8
    add   r1, r9
    strh  r0, [r1]
    
    @ Next iteration
    mov   r0, r9
    add   r0, #0x2
    cmp   r0, #0x40
    blt   L7
      mov   r0, #0x0
    L7:
    mov   r9, r0
    mov   r0, #0x1
    add   r11, r0
    mov   r0, #0x20
    cmp   r11, r0
    blt   Loop2
    
  mov   r0, r8
  add   r0, #0x40
  ldr   r1, =gpBG1MapBuffer
  lsl   r2, r4, #0xB
  add   r1, r2
  cmp   r0, r1
  blt   L8
    ldr   r0, =gpBG0MapBuffer
    add   r0, r2
  L8:
  mov   r8, r0
  mov   r0, r9
  mov   r1, #0x3F
  and   r0, r1
  mov   r9, r0
  mov   r0, #0x20
  add   r10, r0
  mov   r0, #0x0
  mov   r11, r0
  mov   r0, #0x1
  add   r12, r0
  mov   r0, #0x20
  cmp   r12, r0
  blt   Loop2


mov   r0, r4
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


Return:
pop   {r4-r7}
mov   r8, r4
mov   r9, r5
mov   r10, r6
mov   r11, r7
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
