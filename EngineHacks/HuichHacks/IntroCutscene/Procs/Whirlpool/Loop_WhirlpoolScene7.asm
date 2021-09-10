@ Loops through whirlpool palettes every three frames.
@ Shifts hue every 32 frames.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Update timer.
ldrh  r6, [r5, #0x2A]
add   r0, r6, #0x1
cmp   r0, #0x12
blt   L2
  mov   r0, #0x0
L2:
strh  r0, [r5, #0x2A]


mov   r0, #0x5
cmp   r6, #0x3
blt   L1
  sub   r0, #0x1
  cmp   r6, #0x6
  blt   L1
    sub   r0, #0x1
    cmp   r6, #0x9
    blt   L1
      sub   r0, #0x1
      cmp   r6, #0xC
      blt   L1
        sub   r0, #0x1
        cmp   r6, #0xF
        blt   L1
          sub   r0, #0x1

L1:
lsl   r0, #0x8
ldr   r1, =WhirlpoolPalettes@+0x5E0
add   r0, r1
mov   r1, #0x0
mov   r2, #0xE0
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
