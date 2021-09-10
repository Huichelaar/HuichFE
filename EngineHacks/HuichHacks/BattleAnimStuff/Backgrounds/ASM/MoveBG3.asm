@ Slide BG3 when moving camera
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Let vanilla shift BG during arena
ldr   r4, =GetBattleAnimArenaFlag
bl    GOTO_R4
cmp   r0, #0x0
bne   Return


  @ BG3Hofs
  neg   r0, r5
  mov   r1, #0x7
  and   r0, r1
  mov   r2, #0x8
  sub   r0, r2, r0
  and   r0, r1
  ldr   r1, =gpDISPCNTbuffer
  strh  r0, [r1, #0x28]


  @ BG3 Screen entries
  neg   r0, r5
  add   r0, #0x7                  @ Round up to multiple of 8.
  mov   r1, #0x38
  and   r1, r0
  lsr   r1, #0x3
  ldr   r0, =0x120
  sub   r0, r1
  bl    DrawUpperBG3


mov   r0, #0x3
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
