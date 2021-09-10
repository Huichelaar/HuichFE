@ Mimics 0x0804F459, but hard-codes Y-coordinate to make FortMenu2HelpBox placement work.
@ Also gets different HelpText IDs based on fort and MenuMode.
.thumb

push  {r4-r6, r14}
mov   r5, r0
mov   r6, r1

ldr   r0, [r5, #0x14]
ldr   r0, [r0, #0x1C]           @ Aunt/Uncle is Proc_DrawFortMenu2
mov   r1, #0x29
ldrb  r1, [r0, r1]              @ MenuMode, indicates whether gather, upgrade, etc.
mov   r2, #0x2A
ldrb  r0, [r2, r0]              @ Top fort
mov   r2, #0x61
ldrb  r4, [r5, r2]
lsr   r2, r4, #0x1
add   r0, r2                    @ Selected Fort
mov   r2, #0x5
mul   r2, r0
ldr   r3, =FortRAM
lsl   r3, #0x5
lsr   r3, #0x5
add   r3, r2                    @ RAM Fort
cmp   r1, #0x0
beq   Gather
cmp   r1, #0x1
beq   Upgrade
b     Change


Gather:
  ldrb  r1, [r3, #0x1]
  lsr   r1, #0x6              @ Fort level
  cmp   r1, #0x2
  ble   L4
    mov   r1, #0x2
  L4:
  ldr   r2, =FortsTable
  lsl   r0, #0x5
  add   r2, r0
  ldrh  r2, [r2, #0x6]
  add   r2, r1
  b     Draw


Upgrade:
  ldrb  r1, [r3]
  ldr   r2, =AbilityTable
  ldrb  r1, [r2, r1]
  ldr   r2, =UpgradeEnemyHelp
  lsl   r2, #0x10
  lsr   r2, #0x10
  cmp   r1, #0x0
  beq   Draw
    ldrb  r1, [r3, #0x1]
    lsr   r1, #0x6              @ Fort level
    ldr   r2, =UpgradeMaxHelp
    lsl   r2, #0x10
    lsr   r2, #0x10
    cmp   r1, #0x3
    beq   Draw
      ldr   r2, =UpgradeToMaxHelp
      lsl   r2, #0x10
      lsr   r2, #0x10
      cmp   r1, #0x2
      beq   Draw
        ldr   r2, =FortsTable
        lsl   r0, #0x5
        add   r2, r0
        add   r1, #0x2
        ldrb  r1, [r2, r1]
        ldr   r2, =UpgradeMat0Help
        lsl   r2, #0x10
        lsr   r2, #0x10
        add   r2, r1
        b     Draw


Change:
  ldrb  r1, [r3]
  ldr   r2, =AbilityTable
  ldrb  r1, [r2, r1]
  ldr   r2, =Ability0Text
  lsl   r2, #0x10
  lsr   r2, #0x10
  lsl   r1, #0x2
  add   r2, r1
  add   r2, #0x2
  

Draw:
mov   r0, #0x2A
ldsh  r0, [r6, r0]
lsl   r0 ,#0x3                @ X-Coordinate

@ We hard-code the Y-coordinate here.
cmp   r4, #0x0
bne   L1
  mov   r1, #0x48
  b     L3
  L1:
  cmp   r4, #0x2
  bne   L2
    mov   r1, #0x18
    b     L3
    L2:
      mov   r1, #0x38
L3:
ldr   r4, =0x08088de1
bl    GOTO_R4

pop   {r4-r6}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
