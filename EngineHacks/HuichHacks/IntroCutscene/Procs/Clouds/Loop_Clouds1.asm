@ Blend BG0 & BG1. Procvars:
@   +0x29: byte, Timer.
.thumb

push  {r4-r7,r14}
mov   r5, r0


ldr   r4, =GetGameClock
bl    GOTO_R4
mov   r1, #0x3
tst   r1, r0
bne   Return


  @ Blend
  ldr   r4, =gpDISPCNTbuffer
  mov   r0, #0x45
  ldrb  r1, [r4, r0]
  cmp   r1, #0x10
  bge   BreakLoop
    
    add   r1, #0x1
    strb  r1, [r4, r0]
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
