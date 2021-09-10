@ Sinusoid when gem disappears into moon.
@ Sinusoid procvars:
@   +0x29: byte, Bool. 0 means end sinusoid when limit is reached. Loop otherwise.
@   +0x2C: word, Iterator.
@   +0x30: word, Id of entry to loop back to when reaching tablesize.
@   +0x34: word, Number of entries in the sinusoid parameters table.
@   +0x38: word, Pointer to Sinusoid Parameters table.
.thumb

push  {r4-r7,r14}
sub   sp, #0x4
mov   r5, r0


@ Clear Sinusoid RAM space.
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =SinusoidRAM
ldr   r1, [r1]
add   r1, #0x4
ldr   r2, =0x1000050
swi   #0xC                          @ CpuFastSet


@ Set SinusoidCNT
mov   r0, #0x1
ldr   r1, =SinusoidRAM
ldr   r1, [r1]
ldrb  r2, [r1]
orr   r2, r0
strb  r2, [r1]


@ Set Procvars
ldr   r0, =Procs_Sinusoid
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
mov   r2, #0x29
mov   r1, #0x0
strb  r1, [r0, r2]
mov   r1, #0x0
str   r1, [r0, #0x2C]
mov   r1, #0x0
str   r1, [r0, #0x30]
mov   r1, #0x40
str   r1, [r0, #0x34]
ldr   r1, =SinusoidMoonGemTable
str   r1, [r0, #0x38]


@ Check if HBlankInterrupt is on
ldr   r0, =gpDISPCNTbuffer
ldrb  r0, [r0, #0x4]
mov   r1, #0x10
tst   r0, r1
bne   Return

  @ Set HBlankInterruptHandler
  ldr   r0, =HBlankScrollBG+0x1
  ldr   r4, =SetPrimaryHBlankHandler
  bl    GOTO_R4


Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
