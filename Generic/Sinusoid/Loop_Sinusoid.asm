@ Applies the sinusoid effect.
@ Note: I think I got frequency backwards. Increasing frequency in
@ this implementation makes it take longer before the sinusoid repeats.
@ Sinusoid procvars:
@   +0x29: byte, Bool. 0 means end sinusoid when limit is reached. Loop otherwise.
@   +0x2C: word, Iterator.
@   +0x30: word, Id of entry to loop back to when reaching tablesize.
@   +0x34: word, Number of entries in the sinusoid parameters table.
@   +0x38: word, Pointer to Sinusoid Parameters table.
.thumb

push  {r4-r7,r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
mov   r7, r11
push  {r4-r7}
mov   r5, r0


@ Timer
ldr   r0, [r5, #0x2C]
add   r1, r0, #0x1
ldr   r2, [r5, #0x34]
cmp   r1, r2
blt   L1
  mov   r1, #0x29
  ldrb  r1, [r5, r1]
  cmp   r1, #0x0
  bne   L2
  
    @ Don't loop; We're finished.
    mov   r0, r5
    ldr   r4, =Break6CLoop
    bl    GOTO_R4
    b     Return
    
  L2:
  ldr   r1, [r5, #0x30]
L1:
str   r1, [r5, #0x2C]
ldr   r6, =SinusoidRAM
ldr   r6, [r6]
add   r6, #0x4
ldr   r1, [r5, #0x38]
lsl   r0, #0x2
add   r5, r1, r0


@ HOFS mapper, we set r8 to 0x100.
@ I commented out how I came to this number, because
@ the calculation will return the same value.
@ldr   r0, =0x2000
@mov   r1, #0x20
@swi   #0x6                              @ div
@cmp   r1, #0x0                          @ r1 holds mod. If r1 =/= 0, we have a remainder
@beq   L2
@  add   r0, #0x1                        @ Round up
@L2:
@cmp   r0, #0x0
@bne   L3
@  mov   r0, #0x1                        @ We should never get here, but just in case
@L3:
ldr   r0, =0x100
mov   r8, r0


@ Frequency mapper
ldr   r0, =0x100                        @ Sintable entries
ldrb  r1, [r5, #0x1]                    @ Frequency
cmp   r1, #0x0
bne   L4
  mov r1, #0x1                          @ If frequency is 0, we change it to 1.
L4:
swi   #0x6
mov   r9, r0


@ Loop
ldr   r4, =SinTable
mov   r7, #0x0

Loop:
  
  @ Phase
  ldrb  r0, [r5]
  add   r0, r7
  
  @ Frequency
  ldrb  r1, [r5, #0x1]
  cmp   r1, #0x0
  bne   L5
    mov r1, #0x1                        @ If frequency is 0, we change it to 1.
  L5:
  swi   #0x6
  
  @ Map frequency to [0-255]
  mov   r0, r9
  mul   r0, r1
  lsl   r0, #0x1
  ldsh  r0, [r4, r0]
  
  @ Amplitude
  ldrb  r1, [r5, #0x2]
  mul   r0, r1
  ldrb  r1, [r5, #0x3]
  cmp   r1, #0x0
  bne   L6
    mov   r1, #0x1
  L6:
  swi   #0x6
  
  mov   r1, r8
  swi   #0x6                              @ Map [-0x1000, 0x1000] to [-0x10, 0x10]
  lsl   r2, r7, #0x1
  strh  r0, [r6, r2]
  add   r7, #0x1
  cmp   r7, #0xA0
  blt   Loop


Return:
pop   {r4-r7}
mov   r8, r4
mov   r9, r5
mov   r10, r6
mov   r11, r7
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
