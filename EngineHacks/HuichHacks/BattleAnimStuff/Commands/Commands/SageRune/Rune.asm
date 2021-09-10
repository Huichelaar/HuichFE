@ Mimics 0x6D080. Used by both regular and crit sage rune.
.thumb

push  {r4-r7, r14}
mov   r4, r8
push  {r4}
mov   r6, r0
mov   r7, r1
mov   r8, r2
ldr   r0, =0x201774C
ldr   r5, [r0]
cmp   r5, #0x0
bne   Return

  ldr   r3, =ClearBG1Setup
  bl    GOTO_R3
  
  ldr   r0, =Procs_efxMagfcast
  mov   r1, #0x3
  ldr   r3, =New6C
  bl    GOTO_R3
  
  mov   r4, r0
  str   r6, [r4, #0x5C]
  strh  r5, [r4, #0x2C]
  mov   r0, r6
  ldr   r3, =GetAISSubjectID
  bl    GOTO_R3
  ldr   r1, =0x203E182
  lsl   r0, #0x1
  ldrh  r0, [r1, r0]
  sub   r0, #0x6A
  lsl   r0, #0x10
  asr   r0, #0x10
  cmp   r0, #0x2A
  bhi   L1
  
    @ Mantle stuff?
    cmp   r0, #0x0
    beq   L2
      cmp   r0, #0x1
      beq   L2
        cmp   r0, #0x2A
        beq   L2
          b     L1
  
  L1:
  add   r7, #0x2
  L2:
  ldr   r0, [r4, #0x5C]
  mov   r1, r7
  mov   r2, r8
  bl    L3


Return:
pop   {r4}
mov   r8, r4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R3:
bx    r3


@ Mimics 0x6D1B4. Used by both regular and crit sage rune.
L3:
push  {r4-r7, r14}
mov   r6, r0
mov   r5, r1
mov   r7, r2
ldr   r1, =0x201774C
ldr   r0, [r1]
add   r0, #0x1
str   r0, [r1]
ldr   r0, =Procs_efxMagfcastBG
mov   r1, #0x3
ldr   r3, =New6C
bl    GOTO_R3
mov   r4, r0
str   r6, [r4, #0x5C]
mov   r0, #0x0
strh  r0, [r4, #0x2C]
str   r0, [r4, #0x44]

cmp   r5, #0x1
beq   L5
  cmp   r5, #0x1
  bcc   L4
    cmp   r5, #0x2
    beq   L6
      cmp   r5, #0x3
      beq   L8
        b     L9

L4:
ldr   r0, =0x80DF386
str   r0, [r4, #0x48]
ldr   r0, =0x85D8FC4
b     L7

L5:
ldr   r0, =0x80DF39C
str   r0, [r4, #0x48]
ldr   r0, =0x85D8FC4
b     L7

L6:
ldr   r0, =0x80DF3A2
str   r0, [r4, #0x48]
ldr   r0, =0x85D8FDC

L7:
str   r0, [r4, #0x4C]
str   r0, [r4, #0x50]
b     L9

L8:
ldr   r0, =0x80DF3C4
str   r0, [r4, #0x48]
ldr   r0, =0x85D8FDC
str   r0, [r4, #0x4C]
str   r0, [r4, #0x50]
ldrb  r0, [r6, #0x14]
add   r0, r6
ldrb  r1, [r0, #0x14]
mov   r0, r6
ldr   r3, =Command85
bl    GOTO_R3

L9:
ldr   r0, =0x85EE4F8
mov   r1, #0x80
lsl   r1, #0x6
ldr   r3, =StoreSpellTilesBG
bl    GOTO_R3
mov   r0, r7
mov   r1, #0x20
ldr   r3, =StoreSpellPaletteBG
bl    GOTO_R3
ldr   r3, =Magical_anime_with_frames_and_TSA_images
bl    GOTO_R3

ldr   r0, =0x203E120
mov   r1, #0x0
ldsh  r0, [r0, r1]
cmp   r0, #0x0
beq   Return3

  ldr   r0, [r4, #0x5C]
  ldr   r3, =GetAISSubjectID
  bl    GOTO_R3
  cmp   r0, #0x0
  bne   L10
  
    mov   r0, #0x1
    mov   r1, #0x18
    mov   r2, #0x0
    ldr   r3, =BGSetPosition
    bl    GOTO_R3
    b     Return3

L10:
mov   r0, #0x1
mov   r1, #0xE8
mov   r2, #0x0
ldr   r3, =BGSetPosition
bl    GOTO_R3


Return3:
pop   {r4-r7}
pop   {r0}
bx    r0
