@ Fade-in stats. Procvars:
@   +0x29, byte, Timer.
@   +0x2A, byte, fade-in bitfield. Used to determine window dimensions.
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Flush buffer.
ldr   r4, =BLDARAM
ldr   r4, [r4]
mov   r1, #0x0
Loop:
  ldrh  r0, [r4]
  strh  r0, [r4, #0xA]
  add   r4, #0x2
  add   r1, #0x1
  cmp   r1, #0x5
  blt   Loop


@ Timer.
mov   r0, #0x29
ldrb  r6, [r5, r0]
add   r1, r6, #0x1
strb  r1, [r5, r0]
cmp   r6, #0x15
blt   L1

  mov   r0, r5
  ldr   r4, =Break6CLoop
  bl    GOTO_R4
  b     Return

L1:


@ Update ClassLevel BLDA
ldr   r4, =BLDARAM
ldr   r4, [r4]
ldrb  r0, [r4, #0x8]
ldrb  r1, [r4, #0x9]
cmp   r0, #0x10
beq   L8
  add   r0, #0x2
  sub   r1, #0x2
  strb  r0, [r4, #0x8]
  strb  r1, [r4, #0x9]
L8:


@ Enable next BLDA var
@ every two frames.
lsr   r0, r6, #0x1
mov   r1, #0x3
and   r0, r1
mov   r1, #0x1
lsl   r1, r0
mov   r0, #0x2A
ldrb  r7, [r5, r0]
orr   r7, r1


@ Change BLDA for enabled vars.
@ldr   r4, =BLDARAM
@ldr   r4, [r4]
mov   r6, r7
mov   r2, #0x0

Loop2:
  lsr   r6, #0x1
  bcc   L2
  
    @ Increase EVA, decrease EVB.
    ldrb  r0, [r4]
    ldrb  r1, [r4, #0x1]
    add   r0, #0x2
    sub   r1, #0x2
    cmp   r0, #0x10
    blt   L3
      
      
      @ Expand window 0.
      mov   r1, #0x0
      ldr   r3, =gpDISPCNTbuffer
      add   r3, #0x30
      ldrb  r0, [r3]
      cmp   r0, #0x90
      bge   L4
        mov   r1, #0x1
        add   r0, #0x10
        strb  r0, [r3]
      L4:
      
      @ Shrink window 1.
      ldrb  r0, [r3, #0x3]
      cmp   r0, #0x90
      bge   L5
        mov   r1, #0x1
        add   r0, #0x10
        strb  r0, [r3, #0x3]
      L5:
      
      @ BLDA maxed, set to default.
      @ Set to other default if windows
      @ didn't expand.
      cmp   r1, #0x0
      beq   L6
        mov   r0, #0x0
        mov   r1, #0x10
        b     L7
      L6:
        mov   r0, #0x10
        mov   r1, #0x0
      L7:
      
      @ Disable BLDA.
      mov   r3, #0x1
      lsl   r3, r2
      eor   r7, r3
    
    L3:
    strb  r0, [r4]
    strb  r1, [r4, #0x1]
  
  L2:
  add   r4, #0x2
  add   r2, #0x1
  cmp   r2, #0x4
  blt   Loop2


mov   r0, #0x2A
strb  r7, [r5, r0]


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
