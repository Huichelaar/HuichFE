@ Put Minimug in VRAM and draw it. Arguments:
@   r0 = ID indicating which fort should be drawn for.
@   r1 = ID indicating which fort to overwrite
@   r2 = [0,7], ID indicating which tiles should be overwritten.
@   r3 = unit's ROM address or 0 if empty,
.thumb

push  {r4-r7, r14}
mov   r5, r1
mov   r6, r2
mov   r7, r3


@ Put Minimug in VRAM
cmp   r7, #0x0
bne   L3
mov   r0, #0xAB                 @ Empty, draw the horsecart
b     L2

L3:
ldrb  r0, [r7, #0x8]
cmp   r0, #0x0
beq   L1
mov   r0, #0x1                  @ Generic Minimug
b     L2
L1:
ldrh  r0, [r7, #0x6]            @ Personal Minimug
L2:

mov   r1, #0x3C
add   r1, r5
lsl   r1, #0x4                  @ VRAM Tiles
mov   r7, r1
mov   r2, r5
add   r2, #0xB                  @ Paletteslot
ldr   r4, =MinimugWriter
bl    GOTO_R4


@ Draw Minimug
L4:
mov   r2, r5
add   r2, #0xB
lsl   r2, #0xC                  @ Palette
mov   r1, #0x40
lsl   r1, #0x4                  @ Horizontal flip
add   r2, r1
add   r2, r7
ldr   r1, =gpBG2MapBuffer
mov   r3, r6
lsl   r3, #0x8
add   r1, r3

mov   r3, #0x3                  @ Iterator 1
mov   r4, #0x0                  @ Iterator 2
Loop:
  add   r0, r2, r3
  strh  r0, [r1]
  add   r1, #0x2
  sub   r3, #0x1
  cmp   r3, #0x0
  bge   Loop
    mov   r3, #0x3
    add   r2, #0x4
    add   r1, #0x38
    add   r4, #0x1
    cmp   r4, #0x3
    ble   Loop


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
