@ Loops through whirlpool palettes every three frames.
.thumb

push  {r4-r7,r14}
mov   r5, r0


ldrh  r6, [r5, #0x2A]

mov   r0, #0x0
cmp   r6, #0x0
beq   L1
  add   r0, #0x1
  cmp   r6, #0x3
  beq   L1
    add   r0, #0x1
    cmp   r6, #0x6
    beq   L1
      add   r0, #0x1
      cmp   r6, #0x9
      beq   L1
        add   r0, #0x1
        cmp   r6, #0xC
        beq   L1
          add   r0, #0x1
          cmp   r6, #0xF
          beq   L1
            b   L2
L1:
lsl   r1, r0, #0x8
ldr   r0, =WhirlpoolPalettes
add   r0, r1
mov   r1, #0x0
mov   r2, #0xE0
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4

L2:
add   r6, #0x1
cmp   r6, #0x12
blt   L3
  mov   r6, #0x0
L3:
strh  r6, [r5, #0x2A]


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
