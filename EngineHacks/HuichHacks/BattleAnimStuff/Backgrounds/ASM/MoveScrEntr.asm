@ Move screen base blocks to 28-31.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4


@ Move char base block to 0
mov   r0, #0x3
mov   r1, #0x0
ldr   r4, =SetBackgroundTileDataOffset
bl    GOTO_R4

@ Move screen base blocks to 28-31.
mov   r5, #0x0
ldr   r6, =0xE000
ldr   r7, =0x800
ldr   r4, =SetBackgroundMapDataOffset


@ Copy screen entries to their new location
ldr   r2, =0x6000000
ldr   r0, =0x6000
orr   r0, r2
mov   r1, r6
orr   r1, r2
mov   r2, r7
swi   #0xC                    @ CpuFastSet

Loop:
  mov   r0, r5
  mov   r1, r6
  bl    GOTO_R4
  add   r6, r7
  add   r5, #0x1
  cmp   r5, #0x3
  ble   Loop


@ Clear BG3 Screen entries
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =gpBG3MapBuffer
ldr   r2, =0x1000200
swi   #0xC                    @ CpuFastSet


mov   r0, #0x3
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
