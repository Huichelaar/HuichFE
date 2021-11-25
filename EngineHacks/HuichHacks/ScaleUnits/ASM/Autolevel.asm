@ Change the Unit's class when level reaches
@ the next class tier threshold. We do this,
@ so autolevel uses the correct class bonus growths.
.thumb


@ Replaces AutolevelUnit, 0x18120
@ Args:
@   r0: *RAM Unit struct.
@   r1: *UNIT command buffer entry.
.global SCU_Autolevel
.type   SCU_Autolevel, function
SCU_Autolevel:
push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
push  {r4-r5}
sub   sp, #0x4
mov   r4, r0
mov   r5, r1

@ TODO



pop   {r4-r5}
mov   r8, r4
mov   r9, r5
pop   {r4-r7}
pop   {r0}
bx    r0


@ Replaces AutolevelRealistic, 0x18160
@ Args:
@   r0: *RAM Unit struct.
.global SCU_AutolevelRealistic
.type   SCU_AutolevelRealistic, function
SCU_AutolevelRealistic:
push  {r4-r7, r14}
mov   r4, r8
push  {r4}
sub   sp, #0x80             @ RAM Unit battle struct.
mov   r8, r0
ldr   r0, =FirstUNITCommand
lsl   r0, #5
lsr   r0, #5
ldr   r4, [r0]
mov   r5, sp

@ Copying vanilla.
mov   r1, sp
add   r1, #0x6E
mov   r0, #0x0
strb  r0, [r1]              @ Set "Exp after battle" to 0.
mov   r0, #0x8
mov   r3, r8
ldsb  r0, [r3, r0]
ldr   r1, [r3]
mov   r2, #0xB
ldsb  r1, [r1, r2]          @ ROM Unit struct Lv.
sub   r0, r1
lsl   r0, #0x10
lsr   r6, r0, #0x10
asr   r1, r0, #0x10         @ Levels remaining until target level.
cmp   r1, #0x0
beq   Return                @ If level == ROM Unit struct Lv.: Return.
  ldrb  r0, [r3, #0x8]
  sub   r0, r6
  strb  r0, [r3, #0x8]      @ Current level before autolevelling.
  cmp   r1, #0x0
  ble   Return              @ If level <= ROM Unit struct Lv.: Return.

@ Custom. Set class to match level.
ldr   r1, =ClassPromoLevelTableLABEL
ldrb  r2, [r4, #0x1]
ldrb  r2, [r1, r2]
cmp   r0, r2
blt   L1                    @ Branch if Current level < level at which class can promote.
  add   r4, #0x14
  ldrb  r2, [r4, #0x1]      @ T2 class.
  ldrb  r2, [r1, r2]
  cmp   r0, r2
  blt   L1                  @ Branch if Current level < level at which next class can promote.
    add   r4, #0x14         @ T3 class.
L1:
ldrb  r0, [r4, #0x1]
lsl   r1, r0, #0x2
lsl   r0, #0x4
add   r0, r1
lsl   r1, #0x4
add   r0, r1
ldr   r1, =ClassTableLABEL
add   r0, r1              @ Current tier class address.
str   r0, [r3, #0x4]

Loop:
  mov   r0, r8
  mov   r1, r4
  bl    SCU_PromoteUnitIfNecessary
  mov   r4, r0
  
  @ Vanilla.
  L3:
  mov   r0, sp
  mov   r1, r8
  ldr   r7, =InitBattleUnit
  bl    GOTO_R7
  ldrb  r0, [r5, #0x9]
  add   r0, #0x64
  strb  r0, [r5, #0x9]      @ Exp := 100.
  mov   r0, sp
  ldr   r7, =CheckBattleUnitLevelUp
  bl    GOTO_R7
  mov   r0, r8
  mov   r1, sp
  ldr   r7, =UpdateUnitFromBattle
  bl    GOTO_R7
  lsl   r0, r6, #0x10
  ldr   r1, =0xFFFF0000
  add   r0, r1              @ Some convoluted way to decrement.
  lsr   r6, r0, #0x10
  cmp   r0, #0x0
  bgt   Loop

Return:
add   sp, #0x80
pop   {r4}
mov   r8, r4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R7:
bx    r7


@ Promote autolevelled unit if promotion
@ is possible at level. Args:
@   r0: *UNIT buffer entry.
@   r1: *RAM Unit struct.
@ Returns:
@   r0: *UNIT buffer entry. Incremented if unit promoted.
SCU_PromoteUnitIfNecessary:
push  {r4-r5, r14}
mov   r4, r0
mov   r5, r1

ldr   r0, [r5, #0x4]
ldrb  r0, [r0, #0x4]
ldr   r1, =ClassPromoLevelTableLABEL
ldrb  r0, [r0, r1]
cmp   r0, #0x0
beq   Return2           @ Class can't promote.
  ldrb  r1, [r5, #0x8]
  cmp   r1, r0
  blt   Return2         @ Class can't promote yet.
    add   r4, #0x14
    ldrb  r0, [r4, #0x1]
    lsl   r1, r0, #0x2
    lsl   r0, #0x4
    add   r0, r1
    lsl   r1, #0x4
    add   r0, r1
    ldr   r1, =ClassTableLABEL
    add   r0, r1
    str   r0, [r5, #0x4]
    mov   r0, r5
    bl    SCU_AutoPromote
    mov   r0, r4
    mov   r1, r5
    bl    SCU_PromoteUnitIfNecessary    @ Check if unit can immediately promote again.

Return2:
mov   r0, r4
pop   {r4-r5}
pop   {r1}
bx    r1


@ Promote autolevelled unit. Add promotion gains,
@ and ensure stats remain under cap. Args:
@   r0: *RAM Unit struct.
SCU_AutoPromote:
push  {r4-r7, r14}

@ Increase HP, POW, SKL, SPD, DEF, RES.
ldr   r1, [r0, #0x4]
mov   r4, r0
add   r4, #0x13
mov   r5, r1
add   r5, #0x22
mov   r6, r1
add   r6, #0x13
mov   r7, #0x0
Loop2:
  ldrb  r2, [r5, r7]        @ Stat Promotion increase.
  ldrb  r3, [r4, r7]        @ RAM Unit's stat.
  add   r2, r3
  ldrb  r3, [r6, r7]        @ Class' max stat.
  cmp   r2, r3
  ble   L5
    mov   r2, r3
  L5:
  strb  r2, [r4, r7]
  add   r7, #0x1
  cmp   r7, #0x6
  blt   Loop2

@ Increase MGC.
ldrb  r2, [r1, #0x4]
lsl   r2, #0x2
ldr   r3, =MagClassTableLABEL
add   r4, r3, r2
ldrb  r2, [r3, #0x3]      @ Magic Promotion increase.
mov   r5, #0x3A
ldrb  r3, [r0, r5]        @ RAM Unit's magic.
add   r2, r3
ldrb  r3, [r4, #0x2]      @ Class' max magic.
cmp   r2, r3
ble   L6
  mov   r2, r3
L6:
strb  r2, [r0, r5]

@ Copy current HP to Max HP.
ldrb  r3, [r0, #0x13]     @ Unit's current HP.
strb  r3, [r0, #0x12]     @ Unit's total HP.

pop   {r4-r7}
pop   {r0}
bx    r0
