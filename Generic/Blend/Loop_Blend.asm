@ Blends 1st & 2nd targets.
@ Procvars:
@   +0x29: signed byte, value to add to 1st targets every loop iteration.
@   +0x2A: signed byte, value to add to 2nd targets every loop iteration.
@   +0x2B: byte, the amount of frames per blend update.
@   +0x2C: short, BLDCNT
@   +0x2E: byte, initial 1st targets value.
@   +0x2F: byte, initial 2nd targets value.
@   +0x30: byte, timer. increased every frame. End proc if this is equal to limit.
@   +0x31: byte, limit. End proc if this is equal to timer.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Update timer
mov   r1, #0x30
ldrb  r0, [r5, r1]
add   r2, r0, #0x1
strb  r2, [r5, r1]
mov   r1, #0x31
ldrb  r1, [r5, r1]
cmp   r0, r1
blt   L1

  @ Reached the end, break loop
  mov   r0, r5
  ldr   r4, =Break6CLoop
  bl    GOTO_R4
  b     Return

L1:
mov   r1, #0x2B
ldrb  r1, [r5, r1]
swi   #0x6                        @ mod
cmp   r1, #0x0
bne   Return

  
  @ Update blend
  ldr   r4, =gpDISPCNTbuffer
  mov   r0, #0x29
  ldsb  r0, [r5, r0]
  mov   r1, #0x44
  ldrb  r2, [r4, r1]
  add   r2, r0
  strb  r2, [r4, r1]
  mov   r0, #0x2A
  ldsb  r0, [r5, r0]
  mov   r1, #0x45
  ldrb  r2, [r4, r1]
  add   r2, r0
  strb  r2, [r4, r1]


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
