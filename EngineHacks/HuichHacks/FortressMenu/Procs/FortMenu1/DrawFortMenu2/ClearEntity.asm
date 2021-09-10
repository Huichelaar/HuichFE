@ Clear Entity Tiles. Arguments:
@   r0 = [0,7], ID indicating which tiles should be cleared.
.thumb

push  {r4, r14}


lsl   r0, #0x8
ldr   r1, =gpBG2MapBuffer
add   r1, r0
mov   r0, #0x0

mov   r2, #0x0                  @ Iterator 1
mov   r3, #0x0                  @ Iterator 2
Loop:
  strh  r0, [r1]
  add   r1, #0x2
  add   r2, #0x1
  cmp   r2, #0x13
  ble   Loop
    add   r1, #0x18
    mov   r2, #0x0
    add   r3, #0x1
    cmp   r3, #0x3
    ble   Loop


pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
