@ Changes the textsprite tiles & palettes.
@ Also draws the textsprites.
.thumb

push  {r4-r7,r14}
mov   r5, r0
mov   r7, #0x0                          @ 0 means don't update textsprite. Otherwise update to value.

@ Text time
mov   r0, #0x29
ldrb  r4, [r5, r0]
lsl   r4, #0x1
ldr   r0, =TextTime
ldrh  r4, [r0, r4]

@ Timer, Fade in or out palettes.
ldrh  r6, [r5, #0x2A]
add   r6, #0x1

@ Skip the long compare list in most cases
cmp   r6, #0xC
ble   L1
  cmp   r6, r4
  blt   R
    mov   r0, r4
    add   r0, #0x10
    cmp   r6, r0
    bgt   R

L1:
cmp   r6, #0x2
beq   P1
  cmp   r6, #0x4
  beq   P2
    cmp   r6, #0x6
    beq   P3
      cmp   r6, #0x8
      beq   P4
        cmp   r6, #0xA
        beq   P5
          cmp   r6, #0xC
          beq   P6
            cmp   r6, r4
            beq   P5
              add   r0, r4, #0x2
              cmp   r6, r0
              beq   P4
                add   r0, #0x2
                cmp   r6, r0
                beq   P3
                  add   r0, #0x2
                  cmp   r6, r0
                  beq   P2
                    add   r0, #0x2
                    cmp   r6, r0
                    beq   P1
                      add   r0, #0x2
                      cmp   r6, r0
                      beq   P0
                        b     R
P0:
mov   r0, #0x0
b     P
  P1:
  mov   r0, #0x20
  b     P
    P2:
    mov   r0, #0x40
    b     P
      P3:
      mov   r0, #0x60
      b     P
        P4:
        mov   r0, #0x80
        b     P
          P5:
          mov   r0, #0xA0
          b     P
            P6:
            mov   r0, #0xC0
P:
ldr   r1, =TextPalettes
add   r0, r1
ldr   r1, =0x200                          @ Overwrite OBJ palette 0
mov   r2, #0x20                           @ Load 1 palette (1 short per colour)
ldr   r3, =CopyToPaletteBuffer
bl    GOTO_R3

@ Timer, Reset.
R:
add   r4, #0x3C                           @ One second after fade-out started
cmp   r6, r4
blt   L2

  @ Reset Timer & draw next textline
  mov   r6, #0x0                          @ Reset
  mov   r0, #0x29
  ldrb  r1, [r5, r0]
  add   r1, #0x1
  strb  r1, [r5, r0]
  mov   r7, r1                            @ Update textsprite
  
L2:
strh  r6, [r5, #0x2A]


@ End Loop if next textsprite is >11
cmp   r7, #0xB
bgt   BreakLoop

  cmp   r7, #0x0
  beq   D
  
    @ Decompress next textline
    lsl   r0, r7, #0x2
    ldr   r1, =TextLine
    ldr   r0, [r1, r0]
    ldr   r1, =0x6010000
    ldr   r4, =UnLZ77Decompress
    bl    GOTO_R4

  @ Draw Textsprite
  D:
  mov   r0, #0x29
  ldrb  r0, [r5, r0]
  mov   r1, #0x0
  cmp   r0, #0xA
  blt   L3
    @ Last two sprites are drawn in the centre.
    mov   r1, #0xB0
  L3:
  mov   r0, #0x0
  ldr   r2, =TextOAM
  mov   r3, #0x0
  ldr   r4, =PushToSecondaryOAM
  bl    GOTO_R4
  b     Return


@ We've gone through all textlines, end loop.
BreakLoop:
mov   r0, r5
ldr   r4, =Break6CLoop
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
GOTO_R3:
bx    r3

TextTime:
.short  0xB4
.short  0xA5
.short  0x98
.short  0xA5
.short  0xF0
.short  0x78
.short  0xF0
.short  0x104
.short  0x104
.short  0xFA
.short  0xB4
.short  0xD2
