.thumb

push  {r4-r6, r14}
mov   r4, r0
sub   sp, #0x4

@ Set video mode to 0 (BG0, BG1, BG2, BG3 text mode)
ldr   r2, =gpDISPCNTbuffer                  @ DISPCNT
ldrh  r1, [r2]
mov   r0, #0x8
neg   r0, r0
and   r1, r0                                @ Video mode 0

@ Enable BG2 only if palette != 0
bl    GetBGPalette
mov   r5, r0
cmp   r5, #0x0
beq   Continue
  mov   r5, #0x4
Continue:

@ Display BG0, BG1, BG2, OBJ
ldr   r2, =gpDISPCNTbuffer                  @ DISPCNT
ldrh  r1, [r2]
mov   r0, #0x1F
lsl   r0, #0x8
mvn   r0, r0
and   r1, r0                                @ Clear Displaybits
mov   r0, #0x13                             @ Enable BG0, BG1 & OBJ...
orr   r0, r5                                @ and BG2, if there are active gems
lsl   r0, #0x8
orr   r1, r0
strh  r1, [r2]

@ Init Fade-in, set screen to black
mov   r0, #0xE1
mov   r1, #0x4C                             @ +0x4C byte reserved for fading-in
strb  r0, [r4, r1]
ldr   r6, =FadeInOutByte
strb  r0, [r6]
mov   r0, #0x1
mov   r1, #0x4D                             @ +0x4D byte reserved, don't move to seg2 until unset
strb  r0, [r4, r1]

@ BG0 Horizontal & Vertical offset
bl    GetGemCount
mov   r3, #0x0
cmp   r0, #0x0
beq   L1
  mov   r3, #0x8                            @ BG0VOFS, move title up a little if there are gems
L1:
ldr   r2, =gpDISPCNTbuffer 
mov   r1, #0x0
strh  r1, [r2, #0x1C]                       @ BG0HOFS, reset
strh  r3, [r2, #0x1E]                       @ BG0VOFS, move title up a little

@ BG2 Horizontal & Vertical offset
mov   r1, #0x0
strh  r1, [r2, #0x24]                       @ BG2HOFS, reset
mov   r1, #0xC8
strh  r1, [r2, #0x26]                       @ BG2VOFS, move titleBG down

@ BG0, set mosaic
ldrb  r1, [r2, #0xC]
mov   r0, #0x40
orr   r1, r0
strb  r1, [r2, #0xC]                        @ Enable BG0 mosaic
mov   r0, #0xF0
mov   r3, #0x38
strh  r0, [r2, r3]                          @ Set mosaic effect to 0xF vertical

@ Setup window0 to not display BG2
mov   r0, #0x20
ldrb  r1, [r2, #0x1]
orr   r1, r0
strb  r1, [r2, #0x1]
mov   r0, #0xF0
strh  r0, [r2, #0x2C]
mov   r0, #0x9F
strh  r0, [r2, #0x30]
mov   r0, #0x3B
strh  r0, [r2, #0x34]
mov   r0, #0x3F
strh  r0, [r2, #0x36]

@ init Alphabld
mov   r0, #0x1
mov   r1, #0x0                              @ 1st target is invisible
mov   r2, #0x10                             @ 2nd target is completely visible
mov   r3, #0x0
ldr   r5, =SetSpecialColourEffectsParam
bl    GOTO_R5

@ Set BG0 as blend target 1
mov   r6, #0x0
str   r6, [sp]
mov   r0, #0x1
mov   r1, #0x0
mov   r2, #0x0
mov   r3, #0x0
ldr   r5, =SetBLDCNT1stTargets
bl    GOTO_R5

@ Set BG1, BG2 as blend target 2
mov   r6, #0x0
str   r6, [sp]
mov   r0, #0x0
mov   r1, #0x1
mov   r2, #0x1
mov   r3, #0x0
ldr   r5, =SetBLDCNT2ndTargets
bl    GOTO_R5

@ Set BG0, BG1, BG2, BG3 priorities to 0, 3, 1, 3
ldr   r2, =gpDISPCNTbuffer
@ Set BG0 priority to 0
ldrb  r3, [r2, #0xC]                        @ BG0CNT
mov   r1, #0x4
neg   r1, r1
mov   r0, r1
and   r0, r3
mov   r3, #0x0
orr   r0, r3                                @ priority 0
strb  r0, [r2, #0xC]  

@ Set BG1 priority to 3
ldrb  r3, [r2, #0x10]                       @ BG1CNT
mov   r0, r1
and   r0, r3
mov   r3, #0x3
orr   r0, r3                                @ priority 3
strb  r0, [r2, #0x10]

@ Set BG2 priority to 1
ldrb  r0, [r2, #0x14]                       @ BG2CNT
and   r0, r1
mov   r1, #0x1
orr   r0, r1                                @ priority 1
strb  r0, [r2, #0x14]

@ Set BG3 priority to 3
ldrb  r0, [r2, #0x18]                       @ BG3CNT
mov   r1, #0x3
orr   r0, r1                                @ priority 3
strb  r0, [r2, #0x18]

@ Set BG0 to use Tiles0.
mov   r1, #0x0                              @ Use Tiles0
mov   r0, #0x0
ldr   r5, =SetBackgroundTileDataOffset
bl    GOTO_R5

@ Set BG0 screen size to 256x256
ldrb  r1, [r2, #0xD]
mov   r0, #0x3F
and   r1, r0
strb  r1, [r2, #0xD]

@ Set BG1 screen size to 256x256
ldrb  r1, [r2, #0x11]
and   r1, r0
strb  r1, [r2, #0x11]

@ Set BG2 screen size to 256x256
ldrb  r1, [r2, #0x15]
and   r1, r0
strb  r1, [r2, #0x15]

add   sp, #0x4
pop   {r4-r6}
pop   {r0}
bx    r0
GOTO_R5:
bx    r5
