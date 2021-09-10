@ Draw Battle BG.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4


@ Set BG3 to 256-colour mode
ldr   r0, =gpDISPCNTbuffer
ldrb  r1, [r0, #0x18]
mov   r2, #0x80
orr   r1, r2
strb  r1, [r0, #0x18]


@ BattleBG struct.
ldr   r0, =CurrentBattleBG
mov   r1, #0x0
ldsh  r0, [r0, r1]
lsl   r1, r0, #0x3
lsl   r0, #0x2
add   r0, r1
ldr   r1, =BattleBGTable
add   r5, r0, r1


@ Clear this tile to
@ fill empty space.
ldr   r1, =0x60046C0
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r2, =0x1000010
swi   #0xC                        @ CpuFastSet

@ Clear this colour to
@ fill empty space.
mov   r0, #0x0
ldr   r1, =palette_buffer
strh  r0, [r1]


@ Load tiles.
ldr   r0, [r5]
ldr   r1, =0x6004700
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4


@ Clear screen entries.
ldr   r0, =0x11B011B
str   r0, [sp]
mov   r0, sp
ldr   r1, =gpBG3MapBuffer
ldr   r2, =0x1000200
swi   #0xC                        @ CpuFastSet


@ Prepare upper screen entries.
ldr   r0, =0x120
ldr   r1, =AnimDistance
ldrb  r1, [r1]
cmp   r1, #0x0
beq   L1                          @ Melee means camera starts right
  ldr   r1, =BattleInitialHit
  ldrh  r1, [r1]
  cmp   r1, #0x0
  bne   L1                        @ Camera starts on aggressor
    sub   r0, #0x4
L1:
bl    DrawUpperBG3


mov   r0, #0x3
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
