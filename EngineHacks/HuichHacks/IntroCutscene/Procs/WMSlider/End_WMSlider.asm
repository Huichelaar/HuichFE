@ Procstate vars. Format: <location>: <size>, <range>, <description>.
@   +0x29: byte, [0, 31], Timer.
@   +0x2A: byte, [0, 240], PrevX.
@   +0x2B: byte, [0, 160], PrevY.
@   +0x2C: byte, [0, 4], Transition index. Indicates which transition we're doing.
@   +0x2D: byte, [0, 1], indicates which background we're sliding.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ End proc if transitions finished
mov   r0, #0x2C
ldrb  r6, [r5, r0]
cmp   r6, #0x2
blt   L1
  ldr   r0, =WMSlideEnd
  str   r0, [r5, #0x4]
  b     Return
L1:
add   r6, #0x1
strb  r6, [r5, r0]
ldr   r0, =WMScreenEntries
ldrb  r6, [r0, r6]


@ Move GemCharEntries
sub   r7, r6, #0x1
lsl   r0, r7, #0xB
ldr   r1, =0x6000000
add   r1, r0
ldr   r0, =0x6012000
ldr   r2, =0x200
swi   #0xC                            @ CpuFastSet


@ Change GemScreenEntries
mov   r0, #0xF
and   r7, r0
ldr   r0, =gpBG2MapBuffer
ldr   r1, =gGenericBuffer
lsl   r2, r7, #0x6
ldr   r4, =FillTileRect
bl    GOTO_R4
ldr   r0, =gpBG3MapBuffer
ldr   r1, =gGenericBuffer
mov   r2, #0x40
add   r2, r7
lsl   r2, #0x6
bl    GOTO_R4


@ Change BG2 & BG3 Char Blocks
mov   r0, #0x2D
ldrb  r7, [r5, r0]
lsl   r1, r7, #0xF
mov   r0, #0x2
ldr   r4, =SetBackgroundTileDataOffset
bl    GOTO_R4
lsl   r1, r7, #0xF
mov   r0, #0x3
bl    GOTO_R4


@ Change Screenblocks
ldr   r4, =SetBackgroundMapDataOffset
mov   r7, #0x0

Loop:
  mov   r0, r7
  lsl   r1, r6, #0xB
  bl    GOTO_R4
  add   r6, #0x1
  add   r7, #0x1
  cmp   r7, #0x4
  blt   Loop


mov   r0, #0xF
ldr   r4, =EnableBackgroundSyncByMask
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
