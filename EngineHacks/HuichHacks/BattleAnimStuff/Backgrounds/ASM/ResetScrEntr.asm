@ Put screen base blocks back to 12-15.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4


@ Move char base block back to 2
mov   r0, #0x3
ldr   r1, =0x8000
ldr   r4, =SetBackgroundTileDataOffset
bl    GOTO_R4

@ Put screen base blocks back to 12-15.
mov   r5, #0x0
ldr   r6, =0x6000
ldr   r7, =0x800
ldr   r4, =SetBackgroundMapDataOffset


@ Copy screen entries to their new location
ldr   r2, =0x6000000
ldr   r0, =0xE000
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


@ Set BG3 to 16-colour mode
ldr   r0, =gpDISPCNTbuffer
ldrb  r1, [r0, #0x18]
mov   r2, #0x80
bic   r1, r2
strb  r1, [r0, #0x18]


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
