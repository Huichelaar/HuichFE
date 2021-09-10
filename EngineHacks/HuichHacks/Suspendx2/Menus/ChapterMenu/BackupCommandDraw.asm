@ Mostly mimic 0x22678, "Guide" draw routine, but a bit different
.thumb

push  {r4-r7, r14}
mov   r5, r0
mov   r6, r1


@ Don't display if Usability returned #0x3
mov   r0, #0x3D
ldrb  r0, [r6, r0]
cmp   r0, #0x3
beq   Return

  @ Green if no backup exists yet
  mov   r0, #0xE
  lsl   r0, #0x18
  add   r0, #0xD4
  ldrb  r0, [r0]
  mov   r1, #0x4
  cmp   r0, #0xFF
  beq   Green
  
mov   r1, #0x0
Green:
mov   r0, #0x34
add   r0, r6
mov   r7, r0
ldr   r4, =Text_SetColorId
bl    GOTO_R4


@ Draw the name
ldr   r0, [r6, #0x30]
ldrh  r0, [r0, #0x4]
ldr   r4, =GetStringFromIndex
bl    GOTO_R4
mov   r1, r0
mov   r0, r7
ldr   r4, =Text_AppendString
bl    GOTO_R4
mov   r0, #0x64
ldrb  r0, [r5, r0]
lsl   r0, #0x1C
lsr   r0, #0x1E
ldr   r4, =BG_GetMapBuffer
bl    GOTO_R4
mov   r1, r0
mov   r2, #0x2C
ldsh  r0, [r6, r2]
lsl   r0, #0x5
mov   r3, #0x2A
ldsh  r2, [r6, r3]
add   r0, r2
lsl   r0, #0x1
add   r1, r0
mov   r0, r7
ldr   r4, =Text_Draw
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
