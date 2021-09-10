@ Sets up these variables FortMenu2:
@ Proc +0x29 byte hold ID [0-3] indicating which things to draw.
@ Proc +0x2A byte holds top fort in menu. Add #0x2 to get bottom DISPLAYED fort.
@ Proc +0x2B byte = 0 if we don't scroll, 1 if we scroll up, otherwise scroll down.
@ Proc +0x2C to +0x4B, 16 contiguous shorts holding start tile indices, each representing a string.
@ The next vars are used when having selected a fort after selecting "Change", when +0x29 == 0x3
@   Proc +0x4C, word, pointer to unit struct. Not initialized here.
@   Proc +0x50, byte, indicates fort we're hovering over. Not initialized here.
@   Proc +0x51, byte holds ID [0-7] indicating which tiles current fort occupies. Not initialized here.
@   Proc +0x52, short holding BG2 VOFS at the time fort was selected. Not initialized here.
@   Proc +0x54, byte holding unit ID of fort we're hovering over. Not initialized here.
@   Proc +0x55, +0x56, bytes holding previous command and current command's indices respectively.
@   If these two differ, the material block will be re-drawn.
.thumb

push  {r4-r7, r14}
mov   r4, r8
push  {r4}
sub   sp, #0x8
mov   r5, r0
mov   r2, #0x0
mov   r1, #0x29
strb  r2, [r0, r1]
add   r1, #0x1
strb  r2, [r0, r1]
add   r1, #0x1
strb  r2, [r0, r1]
mov   r1, #0x55
strb  r2, [r0, r1]
add   r1, #0x1
strb  r2, [r0, r1]


@ Allocate space in fontstruct for text
mov   r1, #0x6
mov   r4, #0x6
mov   r5, #0x2C
add   r5, r0
ldr   r0, =TextParams
ldr   r6, [r0]
ldrh  r6, [r6, #0x12]
mov   r7, #0x0
ldr   r0, =Text_Init
mov   r8, r0

Loop:
  strh  r6, [r5]
  mov   r0, sp
  bl    GOTO_R8
  add   r5, #0x2
  add   r6, r4                                @ 6 tiles for the first 8 text structs.
  lsr   r0, r7, #0x3
  lsl   r0, #0x2
  add   r6, r0                                @ 8 tiles for the last 8 text structs.
  add   r7, #0x1
  lsr   r0, r7, #0x3
  lsl   r0, #0x2
  add   r1, r0, r4
  cmp   r7, #0xF
  ble   Loop

add   sp, #0x8
pop   {r4}
mov   r8, r4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R8:
bx    r8
