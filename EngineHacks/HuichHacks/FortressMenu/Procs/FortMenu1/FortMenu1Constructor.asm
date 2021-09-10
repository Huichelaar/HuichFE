@ Prepares the backgrounds.
@ Also sets extraRAMBitfield.dontBufferMinimug.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4

@ Set extraRAMBitfield.dontBufferMinimug
@ We're loading multiple minimugs in a frame,
@ so naive buffering doesn't work.
ldr   r0, =extraRAMBitfield
lsl   r0, #0x5
lsr   r0, #0x5
ldrb  r1, [r0]
mov   r2, #0x2
orr   r1, r2
strb  r1, [r0]


@ Move the ScreenBlocks to a more favourable position
ldr   r6, =LocScreenBlockBG0
ldr   r5, =gpDISPCNTbuffer
add   r5, #0xD                          @ BG0CNT
mov   r7, #0x1C                         @ ScreenBlock, also loop iterator because registerscarcity
mov   r0, #0x6
lsl   r0, #0x18
mov   r1, #0x8
lsl   r1, #0x8
mov   r2, #0xE0
lsl   r2, #0x8

Loop:
  add   r3, r0, r2
  str   r3, [r6]                          @ Update LocScreenBlockBGX
  ldrb  r3, [r5]
  lsr   r3, #0x5                          @ Not any registers left for a mask, so I'll just shift 'em off
  lsl   r3, #0x5
  add   r3, r7
  strb  r3, [r5]                          @ Update Screen Base Block in BGXCNT
  add   r5, #0x4
  add   r7, #0x1
  add   r6, #0x4
  add   r2, r1
  cmp   r7, #0x1F
  ble   Loop

@ Set video mode to 0
ldr   r2, =gpDISPCNTbuffer                  @ DISPCNT
ldrh  r1, [r2]
mov   r0, #0x8
neg   r0, r0
and   r1, r0                                @ Video mode 0


@ Display BG0, BG1, BG2, BG3, OBJ
mov   r0, #0x1F
lsl   r0, #0x8
mvn   r0, r0
and   r1, r0                                @ Clear Displaybits
mov   r0, #0x1F                             @ Enable BG0, BG1, BG2, BG3 & OBJ
lsl   r0, #0x8
orr   r1, r0
strh  r1, [r2]


@ Clear BG0, BG1, BG2, BG3
ldr   r0, =gpBG0MapBuffer
mov   r1, #0x0
ldr   r5, =BG_Fill
bl    GOTO_R5

ldr   r0, =gpBG1MapBuffer
mov   r1, #0x0
ldr   r5, =BG_Fill
bl    GOTO_R5

ldr   r0, =gpBG2MapBuffer
mov   r1, #0x0
ldr   r5, =BG_Fill
bl    GOTO_R5

ldr   r0, =gpBG3MapBuffer
mov   r1, #0x0
ldr   r5, =BG_Fill
bl    GOTO_R5

mov   r0, #0xF
ldr   r5, =EnableBackgroundSyncByMask
bl    GOTO_R5

@ Clear colour effects
mov   r0, #0x0
mov   r1, #0x0
mov   r2, #0x0
mov   r3, #0x0
ldr   r5, =SetSpecialColourEffectsParam
bl    GOTO_R5


@ Set Window 0 for BG2
ldr   r2, =gpDISPCNTbuffer                  @ DISPCNT
ldrb  r0, [r2, #0x1]
mov   r1, #0x20
orr   r0, r1
strb  r0, [r2, #0x1]                        @ Enable Window 0
add   r2, #0x2C
mov   r0, #0xE8                             @ Horizontal...
mov   r1, #0x48                             @ ... Dimensions
strb  r0, [r2]
strb  r1, [r2, #0x1]
mov   r0, #0x98                             @ Vertical...
mov   r1, #0x38                             @ ... Dimensions
strb  r0, [r2, #0x4]
strb  r1, [r2, #0x5]
mov   r0, #0x3F                             @ Enable all BGs within window
mov   r1, #0x3B                             @ Disable BG 2 outside window
strb  r0, [r2, #0x8]
strb  r1, [r2, #0xA]


@ Set BG0, BG1, BG2 to use tiles1, BG3 to use tiles2
mov   r1, #0x0
mov   r0, #0x0
ldr   r5, =SetBackgroundTileDataOffset
bl    GOTO_R5
mov   r1, #0x0
mov   r0, #0x1
ldr   r5, =SetBackgroundTileDataOffset
bl    GOTO_R5
mov   r1, #0x0
mov   r0, #0x2
ldr   r5, =SetBackgroundTileDataOffset
bl    GOTO_R5
mov   r1, #0x80
lsl   r1, r1, #0x8                          @ Use Tiles2
mov   r0, #0x3
ldr   r5, =SetBackgroundTileDataOffset
bl    GOTO_R5


@ Reset VOFS & HOFS for BG0, BG1, BG2, BG3
ldr   r2, =gpDISPCNTbuffer
mov   r0, #0x0
mov   r1, #0x1C
mov   r3, #0x2A

OFSLoop:
  strb  r0, [r2, r1]
  add   r1, #0x2
  cmp   r1, r3
  ble   OFSLoop

@ Set BG2's HOFS & VOFS
mov   r0, #0x2
mov   r1, #0xB8
mov   r2, #0xC8
ldr   r5, =BGSetPosition
bl    GOTO_R5


@ Set BG0, BG1, BG2, BG3 priorities to 0, 2, 0, 3
ldr   r2, =gpDISPCNTbuffer
@ Set BG0 priority to 0
ldrb  r3, [r2, #0xC]                        @ BG0CNT
mov   r1, #0x3
mvn   r1, r1
mov   r0, r1
and   r0, r3                                @ priority 0
strb  r0, [r2, #0xC]  

@ Set BG1 priority to 2
ldrb  r3, [r2, #0x10]                       @ BG1CNT
mov   r0, r1
and   r0, r3
mov   r3, #0x2
orr   r0, r3                                @ priority 2
strb  r0, [r2, #0x10]

@ Set BG2 priority to 0
ldrb  r0, [r2, #0x14]                       @ BG2CNT
and   r0, r1                                @ priority 0
strb  r0, [r2, #0x14]

@ Set BG3 priority to 3
ldrb  r0, [r2, #0x18]                       @ BG3CNT
mov   r1, #0x3
orr   r0, r1                                @ priority 3
strb  r0, [r2, #0x18]


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R5:
bx    r5
