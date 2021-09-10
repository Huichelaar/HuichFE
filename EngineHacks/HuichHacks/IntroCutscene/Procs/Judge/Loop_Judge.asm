@ Scroll Judge & update Judge tiles
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Timer
ldrh  r4, [r5, #0x2A]
add   r4, #0x1
strh  r4, [r5, #0x2A]


@ Change Judge Tiles
L1:
mov   r0, #0x29
ldrb  r1, [r5, r0]
lsr   r2, r4, #0x6
cmp   r2, #0x4
bge   BreakLoop
  cmp   r2, r1
  beq   Return

    @ Store new JudgeTiles ID, and decompress Judge Tiles
    strb  r2, [r5, r0]
    ldr   r0, =Judge
    lsl   r1, r2, #0x2
    ldr   r0, [r0, r1]
    ldr   r1, =0x6008000
    ldr   r4, =UnLZ77Decompress
    bl    GOTO_R4
    b     Return


@ Reset Timer & Break Loop after 256 frames
BreakLoop:
mov   r0, #0x0
strh  r0, [r5, #0x2A]
mov   r0, r5
ldr   r4, =Break6CLoop
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
