@ Updates the blue & orange whirlpool palettes.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Timer
ldrh  r7, [r5, #0x2A]
ldr   r1, =WhirlpoolScene5Table
ldrb  r6, [r7, r1]
add   r7, #0x1
strh  r7, [r5, #0x2A]


@ Update palettes
lsl   r6, #0x8
ldr   r1, =WhirlpoolPalettes
add   r0, r6, r1
mov   r1, #0x0
mov   r2, #0xE0
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4
ldr   r0, =WhirlpoolPalettes+0x5E0
add   r0, r6
mov   r1, #0xE0
mov   r2, #0xE0
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
