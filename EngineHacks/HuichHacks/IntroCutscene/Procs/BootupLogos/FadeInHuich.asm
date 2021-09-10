@ Mimics 0xCC13C, but uses a different palette,
@ and decompresses the new logo for BG1.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r5, r0


@ Timer
ldr   r6, [r5, #0x30]
cmp   r6, #0x0
bne   L1

  @ First run, decompress image.
  ldr   r0, =HuichelaarScreenTiles
  ldr   r1, =0x6004A00
  ldr   r4, =UnLZ77Decompress
  bl    GOTO_R4

L1:
add   r6, #0x2
str   r6, [r5, #0x30]


@ FadeIn Palette
ldr   r0, =HuichelaarScreenPalette
mov   r1, #0x1E
str   r1, [sp]
mov   r1, #0x0
mov   r2, #0x10
mov   r3, r6
ldr   r4, =FadePalette
bl    GOTO_R4


cmp   r6, #0x1D
ble   L2

  @ Time's up
  mov   r0, #0x1E             @ New timer.
  str   r0, [r5, #0x34]
  mov   r0, r5
  ldr   r4, =Break6CLoop
  bl    GOTO_R4

L2:
mov   r0, r5
ldr   r4, =SkipLogosCheck
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
