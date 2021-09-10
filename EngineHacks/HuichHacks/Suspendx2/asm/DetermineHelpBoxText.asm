@ If mode 0x1, Resume, use different helpbox text
@ than vanilla mode 0x2, Restart, or mode 0x10, NewGame.
@ Hooked at 0xA8934. Args:
@   r0: SaveMenu proc +0x3E.
.thumb

push  {r4-r5, r14}
mov   r5, r0

ldrb  r0, [r5, #0x4]          @ proc +0x42: Resume, Restart, etc. bitfield.
ldr   r2, =0x882
mov   r1, #0x12
tst   r0, r1
bne   L1
  ldr   r2, =BackupLoadQuestion
  lsl   r2, #0x10
  lsr   r2, #0x10
L1:


@ Vanilla overwritten stuff
mov   r0, #0x30
mov   r1, #0x30
ldr   r4, =0x8088F69
bl    GOTO_R4
mov   r0, #0x1
strb  r0, [r5]


pop   {r4-r5}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
