@ Mimics 0xCC1A2, but uses a different palette.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r5, r0


@ Timer
ldr   r6, [r5, #0x30]
add   r6, #0x2
str   r6, [r5, #0x30]


@ FadeOut Palette
ldr   r0, =HuichelaarScreenPalette
mov   r1, #0x28
sub   r3, r1, r6
str   r1, [sp]
mov   r1, #0x0
mov   r2, #0x10
ldr   r4, =FadePalette
bl    GOTO_R4


cmp   r6, #0x27
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
