@ Called every frame when +0x29 is 0x3. Updates the FortMenu2 tiles when necessary.
@ Draws the same fort but with different Fortmasters. Arguments:
@   r0 = Procstate
@   r1 = 1 if we scroll up, otherwise scroll down.
.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
mov   r7, r11
push  {r4-r7}
mov   r5, r0


@ Setup scroll direction
mov   r0, #0x51
ldrb  r4, [r5, r0]                    @ TileID
ldr   r6, =gUnitArray                 @ Limit1
mov   r0, #0x48
sub   r2, r6, r0
mov   r8, r2
lsl   r2, r0, #0x6
lsl   r0, #0x1
sub   r2, r0
add   r6, r2                          @ Limit2
mov   r9, r6

mov   r2, #0x0
mov   r3, #0x0
mov   r7, #0x0
cmp   r1, #0x1                        @ Scroll direction
beq   L1

  @ Scroll down
  mov   r1, r8                        @ Flip limits
  mov   r8, r9
  mov   r9, r1
  
  mov   r2, #0x2
  mov   r3, #0x90
  mov   r7, #0x20
  
L1:
sub   r2, #0x1
sub   r3, #0x48
sub   r7, #0x10
add   r4, r2

cmp   r4, #0x0
bge   L2
add   r4, #0x8
L2:
cmp   r4, #0x7
ble   L3
sub   r4, #0x8
L3:
mov   r0, #0x51
strb  r4, [r5, r0]
mov   r11, r4


@ Calculate next unit to be fortmaster
mov   r0, #0x4C
ldr   r0, [r5, r0]

cmp   r0, #0x0
beq   L6
  ldr   r1, [r0, #0xC]
  ldr   r2, =0x4010000            @ Mimic REVEAL, 0x1033A
  mvn   r2, r2
  and   r1, r2
  str   r1, [r0, #0xC]            @ Reappear previous unit.
L6:

ldr   r1, =FortCount
lsl   r1, #0x5
lsr   r1, #0x5
mov   r2, #0x5
mul   r1, r2
mov   r10, r1
cmp   r0, #0x0
bne   Loop

mov   r0, r9
sub   r0, r3

Loop:
  add   r0, r3
  cmp   r0, r8
  beq   L4
  ldr   r2, [r0]
  cmp   r2, #0x0
  beq   Loop
  ldrb  r2, [r2, #0x4]
  
  ldr   r4, =FortRAM
  lsl   r4, #0x5
  lsr   r4, #0x5
  mov   r1, #0x0
  Loop2:
    ldrb  r6, [r4, r1]
    cmp   r6, r2
    beq   Loop                      @ If player unit is already Fortmaster, can't be in charge of fort.
    add   r1, #0x5
    cmp   r1, r10
    blt   Loop2
  
  ldr   r1, =AbilityTable
  ldrb  r1, [r1, r2]
  cmp   r1, #0x0
  beq   Loop                        @ If player unit doesn't have ability, can't be in charge of fort.
  ldr   r1, [r0, #0xC]
  ldr   r4, =0x4010004              @ Mimic REMU, 0x1032E and Dead.
  tst   r1, r4
  bne   Loop                        @ If player unit is dead or REMU'd, can't be in charge of fort.
  
b     L5
L4:
mov   r0, #0x0
mov   r2, r0
L5:
mov   r1, #0x4C
str   r0, [r5, r1]

cmp   r0, #0x0
beq   L7
  ldr   r1, [r0, #0xC]
  ldr   r3, =0x4010000              @ Mimic REMU, 0x1032E
  orr   r1, r3
  str   r1, [r0, #0xC]              @ Disappear/REMU current unit.
L7:


@ Put unit in charge of fort
mov   r0, #0x50
ldrb  r0, [r5, r0]
mov   r1, #0x5
mul   r0, r1
ldr   r1, =FortRAM
lsl   r1, #0x5
lsr   r1, #0x5
strb  r2, [r1, r0]


@ Redraw
mov   r0, r11
bl    ClearEntity
mov   r0, r5
add   r0, #0x2C
mov   r2, #0x51
ldrb  r1, [r5, r2]
mov   r2, #0x50
ldrb  r2, [r5, r2]
mov   r3, r5
bl    DrawEntityLeft
mov   r0, r5
add   r0, #0x2C
mov   r2, #0x51
ldrb  r1, [r5, r2]
mov   r2, #0x50
ldrb  r2, [r5, r2]
bl    DrawEntityRightChange


mov   r0, #0x2
ldr   r4, =EnableBackgroundSyncById 
bl    GOTO_R4
ldr   r4, =EnablePaletteSync
bl    GOTO_R4

mov   r0, r7
pop   {r4-r7}
mov   r11, r7
mov   r10, r6
mov   r9, r5
mov   r8, r4
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
