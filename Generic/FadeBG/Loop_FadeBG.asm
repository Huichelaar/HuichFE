@ Procvars:
@   +0x29: byte, FadeSpeed. Increase/Decrease BLDY by 1 every FadeSpeed frames.
@   +0x2A: byte, Fade in (0) or out (1) bool.
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Fade in every FadeSpeed frames
ldr   r4, =GetGameClock
bl    GOTO_R4
mov   r1, #0x29
ldrb  r1, [r5, r1]
cmp   r1, #0x0
bne   L1
 mov    r1, #0x1
L1:
swi   #0x6                      @ mod
cmp   r1, #0x0
bne   Return

  @ End loop if faded in/out fully.
  ldr   r0, =gpDISPCNTbuffer
  mov   r1, #0x46
  add   r0, r1
  ldrb  r1, [r0]
  
  mov   r2, #0x2A
  ldrb  r2, [r5, r2]
  mov   r3, #0x1
  mov   r4, #0x10
  cmp   r2, #0x0
  bne   L2
    sub   r3, #0x2
    mov   r4, #0x0
  L2:
  cmp   r1, r4
  beq   BreakLoop

    @ Fade in/out
    add   r1, r3
    strb  r1, [r0]
    b     Return

  BreakLoop:
  mov   r0, r5
  ldr   r4, =Break6CLoop
  bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
