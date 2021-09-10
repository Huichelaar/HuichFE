@ Fade-in stats. Procvars:
@   +0x29, byte, Timer.
@   +0x2A, byte, fade-in bitfield. Indicates which BLDA values to use for which stat.
.thumb

push  {r4-r7, r14}


@ Init procvars.
mov   r1, #0x0
mov   r2, #0x29
strb  r1, [r0, r2]
@mov   r1, #0x0
mov   r2, #0x2A
strb  r1, [r0, r2]


@ Init window 0 & 1.
ldr   r0, =gpDISPCNTbuffer
ldrb  r1, [r0, #0x1]
mov   r2, #0x64
orr   r1, r2
strb  r1, [r0, #0x1]
ldr   r1, =0x50781048
str   r1, [r0, #0x2C]
ldr   r1, =0x50905050
str   r1, [r0, #0x30]
ldr   r1, =0x3F3F1B1F
str   r1, [r0, #0x34]


@ Init BLDCNT
@ldr   r0, =gpDISPCNTbuffer
ldr   r1, =0x1B44
strh  r1, [r0, #0x3C]


@ Set BLDA buffer vars to 0
ldr   r1, =BLDARAM
ldr   r1, [r1]
ldr   r2, =0x10001000
str   r2, [r1]
str   r2, [r1, #0x4]
strh  r2, [r1, #0x8]

@ Set BLDA vars to current BLDA
@ldr   r0, =gpDISPCNTbuffer
mov   r2, #0x44
ldrh  r2, [r0, r2]
strh  r2, [r1, #0xA]
strh  r2, [r1, #0xC]
strh  r2, [r1, #0xE]
strh  r2, [r1, #0x10]
strh  r2, [r1, #0x12]


@ Check if HBlankInterrupt is on
@ldr   r0, =gpDISPCNTbuffer
ldrb  r0, [r0, #0x4]
mov   r1, #0x10
tst   r0, r1
bne   L1

  @ Set HBlankInterruptHandler
  ldr   r0, =HBlankFadeInStats+0x1
  ldr   r4, =SetPrimaryHBlankHandler
  bl    GOTO_R4
L1:


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
