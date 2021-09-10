@ Hook at 0x2A260. If equipped item slot is 9,
@ call SetupWeaponData without equipping item.
.thumb


ldr   r0, =ActionData
ldrb  r0, [r0, #0x12]
cmp   r0, #0x9
bne   L1

  mov   r1, r0
  ldr   r0, =RightBattleStruct
  ldr   r2, =0x802A283
  bx    r2


@ Vanilla
L1:
ldr   r0, =BattleStats
ldrh  r1, [r0]
mov   r0, #0x8
and   r0, r1


@ Return
ldr   r1, =0x802A269
bx    r1
