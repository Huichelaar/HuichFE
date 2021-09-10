@ Buffers minimug tiles. Hooked at 0x5968.
.thumb

push  {r4-r6, r14}

@ Don't buffer Minimug if extraRAMBitfield bit 1 is set.
ldr   r0, =extraRAMBitfield
lsl   r0, #0x5
lsr   r0, #0x5
ldrb  r0, [r0]
mov   r1, #0x2
tst   r0, r1
bne   L1

  @ We're using non-scratch registers set by callee.
  ldr   r0, [r4, #0x4]
  ldr   r6, =MMP_Buffer
  lsl   r6, #0x5
  lsr   r6, #0x5
  mov   r1, r6
  ldr   r4, =UnLZ77Decompress
  bl    GOTO_R4

  mov   r0, r6
  lsl   r1, r5, #0x5
  ldr   r2, =0x6000000
  add   r1, r2
  ldr   r2, =0x200
  ldr   r4, =RegisterTileGraphics
  bl    GOTO_R4
  b     Return

L1:
ldr   r0, [r4, #0x4]
lsl   r1, r5, #0x5
ldr   r2, =0x6000000
add   r1, r2
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

Return:
pop   {r4-r6}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
