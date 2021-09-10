@ Procvars:
@   +0x29: byte, Gem index indicating which vars to use.
@   +0x2B: byte, Gemsprite's Attribute 0, Mos+OM+GM. Set to 0x8, OBJwindow.
@   +0x2C: word, Pointer to OAM data
@   +0x30: 6 gemstructs:
@     +0x0, word, trajectory table.
@     +0x4, short, table index.
@     +0x6, byte, time left until this gem appears.
@     +0x7, byte, [0-6] is colour, don't draw if [0-6] are unset. MSB, bool, if set, stationary ended.
@   +0x60: short, OAM2 TID, Initialized to 0x100.
@   +0x62: byte, bool: 0 means end when completing trajectory, otherwise start from beginning. Set to 0.
@   +0x63: byte, bool: 0 means don't shine, otherwise shine. Set to 0.
@   +0x64: byte, timer. Used to determine which shine cell to display.
@   +0x66: short, Gem timer, once zero, break loop. Initialized to 0xE0.
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Initialize gem trajectory vars
mov   r1, #0x29
mov   r2, #0x5
strb  r2, [r5, r1]                        @ Index indicating which vars to use
mov   r1, #0x66
mov   r2, #0xE0
strh  r2, [r5, r1]                        @ Gem timer, once zero, break loop
mov   r1, #0x2B
mov   r2, #0x8
strb  r2, [r5, r1]                        @ Gemsprite's Mos+OM+GM
mov   r1, #0x2C
ldr   r2, =OAM_64x64
str   r2, [r5, r1]                        @ OAM data
mov   r1, #0x60
ldr   r2, =0x100
strh  r2, [r5, r1]                        @ OAM2 TID
mov   r1, #0x62
mov   r2, #0x0
strb  r2, [r5, r1]                        @ End upon trajectory completion.
mov   r1, #0x63
mov   r2, #0x0                            @ Don't shine.
strb  r2, [r5, r1]


mov   r0, #0x20                           @ GemMask
mov   r3, #0x0                            @ Loop iterator
mov   r1, #0x30                           @ Var-index
mov   r4, #0x1                            @ Colour indicator
ldr   r7, =StationaryTrajectoryTable      @ Table to use for gem trajectory

LoopVars:
  str   r7, [r5, r1]                      @ Table
  add   r1, #0x4
  mov   r2, #0x0
  strh  r2, [r5, r1]                      @ Table index
  add   r1, #0x3
  mov   r2, r4
  and   r2, r0
  strb  r2, [r5, r1]                      @ Colour, don't draw if bits 0-6 are unset. MSB is flag for end
  sub   r1, #0x1
  mov   r2, #0x0
  strb  r2, [r5, r1]                      @ Time until start
  add   r1, #0x2
  lsl   r4, #0x1
  add   r7, #0x10
  add   r3, #0x1
  cmp   r3, #0x6
  blt   LoopVars


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
