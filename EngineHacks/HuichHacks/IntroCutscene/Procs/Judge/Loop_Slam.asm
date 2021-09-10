@ Scroll & update Slam BG0
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Timer
ldrh  r6, [r5, #0x2A]
add   r0, r6, #0x1
strh  r0, [r5, #0x2A]


@ Scroll BG0
ldr   r0, =gpDISPCNTbuffer
ldrb  r1, [r0, #0x1E]
sub   r1, #0x20
strb  r1, [r0, #0x1E]


@ Update Slam Tiles
mov   r0, r6
mov   r1, #0x8
swi   #0x6                          @ mod

mov   r2, #0x7
sub   r2, r1
lsl   r2, #0x8
cmp   r6, #0xC
bge   L2
  @ Fill Mapbuffer
  lsl   r1, r6, #0x6
  mov   r7, #0x1
  b     L3
L2:
  @ Clear Mapbuffer
  ldr   r1, =0x2FF
  mov   r7, #0x0
L3:

ldr   r0, =gpBG0MapBuffer
add   r0, r2
mov   r2, #0x0
mov   r3, #0x0

Loop:
  strh  r1, [r0]
  add   r0, #0x2
  add   r1, r7
  add   r2, #0x1
  cmp   r2, #0x10
  blt   L1
    add   r0, #0x20
    mov   r2, #0x0
    add   r3, #0x1
  L1:
  cmp   r3, #0x4
  blt   Loop


mov   r0, #0x0
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


cmp   r6, #0x11
blt   Return

  @ Reset Timer & Break Loop
  mov   r0, #0x0
  strh  r0, [r5, #0x2A]
  mov   r0, r5
  ldr   r4, =Break6CLoop
  bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
