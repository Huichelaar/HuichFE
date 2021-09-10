@ ScrollBG Procvars:
@   +0x2A: byte, bits:
@     0: Horizontal direction. 0 means left, 1 means right.
@     1: Vertical direction. 0 means up, 1 means down.
@     2: Horizontal scroll.
@     3: Vertical scroll.
@     4-7: Scroll BG0-BG3.
@   +0x2B: byte, ScrollSpeed.
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Scroll every ScrollSpeed frames
ldr   r4, =GetGameClock
bl    GOTO_R4
mov   r1, #0x2B
ldrb  r1, [r5, r1]
cmp   r1, #0x0
bne   L1
 mov    r1, #0x1
L1:
swi   #0x6                      @ mod
cmp   r1, #0x0
bne   Return

  
  @ Scroll
  ldr   r4, =gpDISPCNTbuffer
  add   r4, #0x1C
  mov   r0, #0x2A
  ldrb  r5, [r5, r0]
  mov   r6, #0x10
  mov   r7, #0x0
  
  mov   r1, #0x1
  mov   r0, #0x1
  tst   r0, r5
  bne   L2
    sub   r1, #0x2        
  L2:
  
  mov   r2, #0x1
  mov   r0, #0x2
  tst   r0, r5
  bne   Loop
    sub   r2, #0x2
  
  Loop:
    tst   r6, r5
    beq   L3
      
      mov   r0, #0x4
      tst   r0, r5
      beq   L4
      
        @ Horizontal scroll
        ldrb  r0, [r4]
        add   r0, r1
        strb  r0, [r4]
        
      L4:
      mov   r0, #0x8
      tst   r0, r5
      beq   L3
    
        @ Vertical scroll
        ldrb  r0, [r4, #0x2]
        add   r0, r2
        strb  r0, [r4, #0x2]
    
    L3:
    lsl   r6, #0x1
    add   r4, #0x4
    add   r7, #0x1
    cmp   r7, #0x4
    blt   Loop


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
