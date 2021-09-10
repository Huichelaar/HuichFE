@ Blends BG0 in & out. Procvars:
@   +0x29: byte, Timer.
.thumb

push  {r4-r7,r14}
mov   r5, r0


ldr   r4, =GetGameClock
bl    GOTO_R4
mov   r1, #0x3
tst   r1, r0
bne   Return


  @ Update timer.
  mov   r0, #0x29
  ldrb  r6, [r5, r0]
  add   r1, r6, #0x1
  cmp   r1, #0x27
  blt   L1
    mov   r1, #0x0
  L1:
  strb  r1, [r5, r0]

  
  @ Blend moon
  ldr   r0, =MoonBlendTable
  ldrb  r0, [r0, r6]
  ldr   r4, =gpDISPCNTbuffer
  mov   r2, #0x44
  strb  r0, [r4, r2]
  

Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
