@ Draws a FortMenu2 item. Arguments:
@   r0 = pointer to 16 contiguous shorts holding start tile indices, each representing a string.
@   r1 = [0,7], ID indicating which tiles should be overwritten.
@   r2 = ID indicating which fort should be drawn for.
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
sub   sp, #0x8


@ Calculate which fort to overwrite
mov   r0, r9
mov   r1, #0x4
ldr   r4, =_umodsi3
bl    GOTO_R4
mov   r5, r0

ldr   r0, =FortRAM
lsl   r0, #0x5
lsr   r0, #0x5
mov   r1, r10
mov   r2, #0x5
mul   r1, r2
ldrb  r6, [r0, r1]              @ Unit ID

@ Draw Fortmaster's ability
mov   r7, #0x0
Loop:
  @ Prepare text struct
  lsl   r0, r5, #0x2
  add   r0, #0x10
  lsl   r1, r7, #0x1
  add   r0, r1  
  mov   r1, r8
  ldrh  r0, [r0, r1]              @ Pointer to 'Fortmaster's ability's tile index
  mov   r2, sp
  str   r0, [r2]
  mov   r0, #0x8                  @ Hard-coded text tile width. Decrease this if you thin the menu.
  str   r0, [r2, #0x4]
  mov   r0, sp
  ldr   r4, =Text_Clear
  bl    GOTO_R4

  @ Determine colour of text
  mov   r2, #0x0                  @ Text Colour ID
  ldr   r1, =AbilityTable
  ldrb  r1, [r1, r6]
  cmp   r1, #0x0
  bne   L3
    mov   r2, #0x1
    b     L4
  L3:
  cmp   r1, #0x1
  bne   L4
    mov   r2, #0x4
  L4:
  mov   r11, r2
  
  lsl   r1, #0x2
  ldr   r0, =Ability0Text
  lsl   r0, #0x10
  lsr   r0, #0x10
  add   r0, r1
  add   r0, r7
  ldr   r4, =GetStringFromIndex
  bl    GOTO_R4
  ldr   r4, =FilterSomeTextFromStandardBuffer
  bl    GOTO_R4
  mov   r3, r0
  mov   r0, sp
  mov   r1, #0x0
  mov   r2, r11
  ldr   r4, =Text_InsertString
  bl    GOTO_R4

  @ Draw text
  mov   r0, sp
  ldr   r1, =gpBG2MapBuffer
  mov   r2, r9
  lsl   r2, #0x8
  add   r2, #0x18
  add   r1, r2
  lsl   r2, r7, #0x7
  add   r1, r2
  ldr   r4, =Text_Draw
  bl    GOTO_R4
  
  add   r7, #0x1
  cmp   r7, #0x1
  ble   Loop


@ Draw bonus
ldr   r1, =AbilityTable
ldrb  r1, [r1, r6]
cmp   r1, #0x0
beq   Return                      @ Fortmaster is not ally/controllable, has no ability.
cmp   r6, #0x0
beq   Return                      @ No assigned Fortmaster, no bonus.

ldr   r0, =AbilityBonusTable
lsl   r2, r1, #0x3
add   r0, r2
mov   r7, r0
ldrb  r2, [r7, #0x6]              @ Determine whether digits or special char goes first
cmp   r2, #0x0
bne   L1
mov   r4, #0x0
mov   r5, #0x4
b     L2
L1:
mov   r4, #0x4
mov   r5, #0x2
L2:

mov   r0, r10
bl    GetBonusLv
mov   r6, r0
mov   r1, #0x2                  @ ColourID...
cmp   r6, #0x5
blt   L5
  mov   r1, #0x4                @ ...is green if bonus is max
L5:
mov   r8, r1

ldr   r0, =gpBG2MapBuffer
mov   r1, r9
lsl   r1, #0x8
add   r1, #0xA2
add   r0, r1
add   r0, r4
mov   r1, r8
ldrb  r2, [r7, #0x7]            @ Special symbol
ldr   r4, =DrawSpecialUiChar
bl    GOTO_R4

ldr   r0, =gpBG2MapBuffer
mov   r1, r9
lsl   r1, #0x8
add   r1, #0xA2
add   r0, r1
add   r0, r5
mov   r1, r8
ldrb  r2, [r7, r6]              @ Digits
ldr   r4, =DrawDecNumber
bl    GOTO_R4


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
