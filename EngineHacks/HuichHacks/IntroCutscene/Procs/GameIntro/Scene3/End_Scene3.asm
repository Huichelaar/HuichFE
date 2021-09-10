@ Prepare LCDIO & other stuff
.thumb

push  {r4-r7,r14}
sub   sp, #0x4


@ Display BG1, BG3, OBJ, Clear windows
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x1A
strb  r0, [r4, #0x1]
mov   r0, #0x0
str   r0, [r4, #0x2C]
str   r0, [r4, #0x30]
str   r0, [r4, #0x34]


@ BG1 & BG3 Priorities
mov   r0, #0x1
ldrb  r1, [r4, #0x10]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x10]

mov   r0, #0x0
ldrb  r1, [r4, #0x18]
lsr   r1, #0x2
lsl   r1, #0x2
orr   r1, r0
strb  r1, [r4, #0x18]


@ Change Screenblocks
ldr   r4, =SetBackgroundMapDataOffset
mov   r6, #0xC
mov   r7, #0x0

Loop:
  mov   r0, r7
  lsl   r1, r6, #0xB
  bl    GOTO_R4
  add   r6, #0x1
  add   r7, #0x1
  cmp   r7, #0x4
  blt   Loop


@ Clear first palette
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =palette_buffer
ldr   r2, =0x1000008
swi   #0xC                          @ CpuFastSet


mov   r0, #0xF
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
