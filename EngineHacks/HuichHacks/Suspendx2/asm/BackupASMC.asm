@ Mostly mimics 0x5B5D5C, but saves in suspend2 (save4),
@ and resets backupcounter if it was 0xFF (unused) before.
.thumb

push  {r4, r14}
ldr   r1, =0x0203A958
mov   r0, #0x0
strb  r0, [r1, #0x16]
mov   r0, #0x4
ldr   r4, =SaveSuspendedGame
bl    GOTO_R4

mov   r0, #0xE
lsl   r0, #0x18
add   r0, #0xD4
ldrb  r1, [r0]
cmp   r1, #0xFF
bne   Return

  @ Set backupcounter
  ldr   r1, =UndoCount
  ldr   r1, [r1]
  lsl   r1, #0x18
  lsr   r1, #0x18
  strb  r1, [r0]

Return:
pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
