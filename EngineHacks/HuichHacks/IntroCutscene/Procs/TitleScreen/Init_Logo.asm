@ Draws FELogo.
.thumb

push  {r4-r7,r14}
sub   sp, #0x4
mov   r5, r0


@ LCDIO
@ Enable BG0, BG1, OBJ
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x13
strb  r0, [r4, #0x1]

@ BG1 Priority
@mov   r0, #0x0
ldrb  r1, [r4, #0x10]
lsr   r1, #0x2
lsl   r1, #0x2
@orr   r1, r0
strb  r1, [r4, #0x10]

@ Reset BG1 HOFS & VOFS
mov   r0, #0x0
str   r0, [r4, #0x20]


@ Prepare Logo
ldr   r0, =FELogoTiles
ldr   r1, =0x6005000
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

ldr   r0, =FELogoPalette
ldr   r1, =0x160
mov   r2, #0x20
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4

ldr   r0, =0xB29EB29E
str   r0, [sp]
mov   r0, sp
ldr   r1, =gpBG1MapBuffer
ldr   r2, =0x1000200
swi   #0xC                                @ CpuFastSet

ldr   r0, =gpBG1MapBuffer+0x180
ldr   r1, =0xB280
ldr   r2, =0xB300

Loop:
  strh  r1, [r0]
  add   r0, #0x2
  add   r1, #0x1
  cmp   r1, r2
  blt   Loop


mov   r0, #0x1
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


@ Check whether we should skip titlescreen buildup
mov   r0, #0x29
ldrb  r0, [r5, r0]
lsl   r0, #0x18
asr   r0, #0x18
cmp   r0, #0x0
beq   Return

  @ Set; We build up the titlescreen.
  @ Prepare Sinusoid
  @ Clear Sinusoid BG1 RAM space.
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
  mov   r1, #0x20
  str   r1, [r0, #0x34]
  ldr   r1, =SinusoidFELogoTable
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


  @ Prepare Blend
  ldr   r0, =Procs_Blend
  mov   r1, r5
  ldr   r4, =New6C
  bl    GOTO_R4
  ldr   r1, =0x1142
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
  mov   r1, #0x2
  mov   r2, #0x2B
  strb  r1, [r0, r2]
  mov   r1, #0x20
  mov   r2, #0x31
  strb  r1, [r0, r2]
  
  
  @ Switch to titlescreen BGM
  ldr   r4, =AcquirePlayingBGM
  bl    GOTO_R4
  cmp   r0, #0x43
  beq   Return

    mov   r0, #0x2                        @ SongID
    mov   r1, #0x0                        @ Fadeout & Fadein rate?
    mov   r2, #0x0                        @ No idea
    ldr   r4, =Switch_BGM
    bl    GOTO_R4


Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
