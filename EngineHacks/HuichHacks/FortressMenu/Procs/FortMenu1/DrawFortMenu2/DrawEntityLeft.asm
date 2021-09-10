@ Draws a FortMenu2 item. Arguments:
@   r0 = pointer to 16 contiguous shorts holding start tile indices, each representing a string.
@   r1 = [0,7], ID indicating which tiles should be overwritten.
@   r2 = ID indicating which fort should be drawn for.
@   r3 = Procstate
.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
mov   r7, r11
push  {r4-r7}
mov   r8, r0
mov   r9, r1
mov   r10, r2
mov   r11, r3
sub   sp, #0x8


@ Calculate which fort to overwrite
mov   r0, r9
mov   r1, #0x4
ldr   r4, =_umodsi3
bl    GOTO_R4
mov   r5, r0


@ Grab unit's RAM address
mov   r0, r10
mov   r1, #0x5
mul   r0, r1
ldr   r1, =FortRAM
lsl   r1, #0x5
lsr   r1, #0x5
add   r0, r1

ldrb  r1, [r0]
mov   r7, #0x0
cmp   r1, #0x0
beq   L1                        @ Empty fort

sub   r1, #0x1
lsl   r2, r1, #0x5
lsl   r3, r1, #0x4
add   r2, r3
lsl   r3, r1, #0x2
add   r2, r3                    @ This is r1 multiplied by 0x34 (size of ROM unit struct)
ldr   r3, =unit_address
add   r7, r2, r3                @ Unit's ROM address


@ Draw MiniMug
L1:
mov   r0, r10
mov   r1, r5
mov   r2, r9
mov   r3, r7
bl    DrawMiniMug


@ Draw 'Fortmaster''s Affinity icon
mov   r0, #0x0
cmp   r7, #0x0
beq   L5
  ldrb  r0, [r7, #0x9]          @ Unit Affinity
L5:
mov   r1, r9
lsl   r1, #0x1
bl    DrawAffinity


@ 'Fortmaster' name
@ Prepare text struct
lsl   r0, r5, #0x2
mov   r1, r8
ldrh  r0, [r0, r1]              @ Unit name's tile index
mov   r2, sp
str   r0, [r2]
mov   r0, #0x6                  @ Hard-coded text tile width. Decrease this if you thin the menu.
str   r0, [r2, #0x4]
mov   r0, sp
ldr   r4, =Text_Clear
bl    GOTO_R4


mov   r6, #0x0                  @ String colour
cmp   r7, #0x0
bne   L2
ldr   r0, =0x76B                @ Text "Empty"
mov   r6, #0x4
b     L3
L2:
  ldrb  r0, [r7, #0x4]          @ UnitID
  ldr   r1, =AbilityTable
  ldrb  r0, [r0, r1]
  cmp   r0, #0x0
  bne   L4
    mov   r6, #0x1
  L4:
  ldrh  r0, [r7]                @ Unit's name textID short
L3:
ldr   r4, =GetStringFromIndex
bl    GOTO_R4
ldr   r4, =FilterSomeTextFromStandardBuffer
bl    GOTO_R4
mov   r3, r0

mov   r0, sp
mov   r1, #0x0
mov   r2, r6
ldr   r4, =Text_InsertString
bl    GOTO_R4

@ Draw text
mov   r0, sp
ldr   r1, =gpBG2MapBuffer
mov   r2, r9
lsl   r2, #0x8
add   r2, #0xC
add   r1, r2
ldr   r4, =Text_Draw
bl    GOTO_R4


@ Fort name
mov   r0, #0x29
add   r0, r11
ldrb  r0, [r0]
cmp   r0, #0x3
beq   Return                    @ Don't draw fortname in mode 0x3

  @ Prepare text struct
  lsl   r0, r5, #0x2
  add   r0, #0x2
  mov   r1, r8
  ldrh  r0, [r0, r1]              @ Pointer to Fort name's tile index
  mov   r2, sp
  str   r0, [r2]
  mov   r0, #0x6                  @ Hard-coded text tile width. Decrease this if you thin the menu.
  str   r0, [r2, #0x4]
  mov   r0, sp
  ldr   r4, =Text_Clear
  bl    GOTO_R4

  mov   r0, r10
  lsl   r0, #0x5
  add   r0, #0x4
  ldr   r1, =FortsTable
  ldrh  r0, [r1, r0]
  ldr   r4, =GetStringFromIndex
  bl    GOTO_R4
  ldr   r4, =FilterSomeTextFromStandardBuffer
  bl    GOTO_R4
  mov   r3, r0
  mov   r0, sp
  mov   r1, #0x0
  mov   r2, #0x3
  and   r2, r6
  ldr   r4, =Text_InsertString
  bl    GOTO_R4

  @ Draw text
  mov   r0, sp
  ldr   r1, =gpBG2MapBuffer
  mov   r2, r9
  lsl   r2, #0x8
  add   r2, #0x8C
  add   r1, r2
  ldr   r4, =Text_Draw
  bl    GOTO_R4
  
  @ Draw Affinity
  mov   r0, r10
  lsl   r0, #0x5
  add   r0, #0x15
  ldr   r1, =FortsTable
  ldrb  r0, [r1, r0]                              @ Fort Affinity
  mov   r1, r9
  lsl   r1, #0x1
  add   r1, #0x1
  bl    DrawAffinity


Return:
add   sp, #0x8
pop   {r4-r7}
mov   r11, r7
mov   r10, r6
mov   r9, r5
mov   r8, r4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
