@ Initialize.
@ Arguments:
@   r0: MuralEntry struct index.
@ Procvars:
@   +0x29, byte, Screen entry counter.
@   +0x2A, short, timer.
@   +0x2C, short, [0x0, 0x580], TileIndex where MuralTiles will be put.
@   +0x2E, byte, Char entry counter.
@   +0x2F, byte, Palette slot.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r5, r0


ldr   r4, =Find6C

ldr   r0, =0x8A009D8          @ StatScreen.
bl    GOTO_R4
cmp   r0, #0x0
bne   L1
  ldr   r0, =0x8A1829C        @ Preparations.
  bl    GOTO_R4
  mov   r6, #0x3
  cmp   r0, #0x0
  bne   L2
    ldr   r0, =0x8A21338      @ SoundRoom.
    bl    GOTO_R4
    mov   r6, #0x4
    cmp   r0, #0x0
    bne   L2
      ldr   r0, =0x8B1271C    @ Promotion split.
      bl    GOTO_R4
      mov   r6, #0x5
      cmp   r0, #0x0
      bne   L2
        mov   r6, #0x6
        b     L2              @ Everything else.

L1:
@ StatScreen, Unit Allegiance.
ldr   r0, =StatScreenStruct
ldr   r0, [r0, #0xC]
ldrb  r0, [r0, #0xB]
lsr   r6, r0, #0x6

L2:
@ Grab MuralEntry.
ldr   r0, =SCMU_MuralEntries
lsl   r6, #0x3
add   r6, r0                  @ MuralEntry struct.


@ Init procvars.
mov   r0, #0x0
mov   r1, #0x29
strb  r0, [r5, r1]
strh  r0, [r5, #0x2A]
strh  r0, [r5, #0x2E]
ldrh  r0, [r6]
strh  r0, [r5, #0x2C]
ldrb  r0, [r6, #0x2]          @ PaletteSlot.
mov   r1, #0x2F
strb  r0, [r5, r1]


@ Filter palette.
ldr   r0, =MuralPalette
str   r0, [sp]
ldrb  r0, [r6, #0x2]          @ PaletteSlot.
lsl   r0, #0x5
mov   r1, #0x3
ldsb  r1, [r6, r1]            @ FilterR.
mov   r2, #0x4
ldsb  r2, [r6, r2]            @ FilterG.
mov   r3, #0x5
ldsb  r3, [r6, r3]            @ FilterB.
bl    FilterPalette


@ Prepare tiles.
ldr   r0, =0x6000000
ldrh  r1, [r6]
lsl   r1, #0x5
add   r1, r0
ldr   r0, =MuralTiles
ldr   r2, =0x12C0
swi   #0xC                    @ CpuFastSet.


@ Reset BG3VOFS.
ldr   r0, =gpDISPCNTbuffer
mov   r1, #0x0
strh  r1, [r0, #0x2A]


@ Prepare Screen Entries.
ldr   r0, =gpBG3MapBuffer
ldrb  r1, [r6, #0x2]
lsl   r1, #0xC
ldrh  r2, [r6]
lsl   r2, #0x16
lsr   r2, #0x16
add   r1, r2

mov   r2, #0x0
mov   r3, #0x0

Loop:
  strh  r1, [r0, r2]
  add   r1, #0x1
  add   r2, #0x2
  cmp   r2, #0x3C
  blt   Loop
    add   r0, #0x40
    mov   r2, #0x0
    add   r3, #0x1
    cmp   r3, #0x14
    blt   Loop


mov   r0, #0x3
ldr   r4, =EnableBackgroundSyncById
bl    GOTO_R4


mov   r0, #0x1
add   sp, #0x4
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
