@ Replaces 0x73E18. Instead of scrolling in
@ the panel, we're fading in the panel.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r5, r0


@ Disable BG2
ldr   r0, =gpDISPCNTbuffer
ldrb  r1, [r0, #0x1]
mov   r2, #0xFB
and   r1, r2
strb  r1, [r0, #0x1]


@ Start blend
ldr   r0, =Procs_Blend
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
ldr   r1, =0x1942
strh  r1, [r0, #0x2C]
mov   r1, #0x0
mov   r2, #0x2E
strb  r1, [r0, r2]
mov   r1, #0x10
mov   r2, #0x2F
strb  r1, [r0, r2]
mov   r1, #0x1
mov   r2, #0x29
strb  r1, [r0, r2]
mov   r1, #0xFF
mov   r2, #0x2A
strb  r1, [r0, r2]
mov   r1, #0x1
mov   r2, #0x2B
strb  r1, [r0, r2]
mov   r1, #0x10
mov   r2, #0x31
strb  r1, [r0, r2]


@ Start sinusoid
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
mov   r0, #0x4
ldr   r1, =SinusoidRAM
ldr   r1, [r1]
ldrb  r2, [r1]
orr   r2, r0
strb  r2, [r1]

@ Set Sinusoid Procvars
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
mov   r1, #0x14
str   r1, [r0, #0x34]
ldr   r1, =SinusoidStatPanelTable
str   r1, [r0, #0x38]

@ Check if HBlankInterrupt is on
ldr   r0, =gpDISPCNTbuffer
ldrb  r0, [r0, #0x4]
mov   r1, #0x10
tst   r0, r1
bne   L1

  @ Set HBlankInterruptHandler
  ldr   r0, =HBlankScrollBG+0x1
  ldr   r4, =SetPrimaryHBlankHandler
  bl    GOTO_R4
L1:


@ Update BG0, 1 and 2.
mov   r0, #0x7
ldr   r4, =EnableBackgroundSyncByMask
bl    GOTO_R4
ldr   r4, =EnablePaletteSync
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
