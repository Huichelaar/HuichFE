@ Scroll BGs on HBlank
.thumb

push  {r4-r7,r14}


ldr   r0, =REG_VCOUNT
ldrh  r4, [r0]
add   r4, #0x1
cmp   r4, #0xE4                   @ There're only 228 scanlines.
bne   L1
  mov   r4, #0x0
L1:
cmp   r4, #0x9F                   @ There're only 160 visible scanlines.
bhi   Return

  @ Scroll BGs
  ldr   r2, =0x4000010
  lsl   r4, #0x1
  ldr   r0, =SinusoidRAM
  ldr   r6, [r0]
  add   r0, r6, #0x4
  ldrh  r4, [r0, r4]
  ldr   r5, =gpDISPCNTbuffer
  add   r5, #0x1C
  ldrb  r6, [r6]
  mov   r7, #0x1
  
  Loop:
    tst   r6, r7
    beq   L2
      ldrh  r0, [r5]
      add   r1, r4, r0
      strh  r1, [r2]
    L2:
    add   r2, #0x2
    add   r5, #0x2
    lsl   r7, #0x1
    cmp   r7, #0x80
    ble   Loop
    

Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
