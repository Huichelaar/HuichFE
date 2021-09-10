@ Creates item help box. Mimics 0x24588.
@   command index 0-4: Grab item from inventory.
@   command index 5:   Grab gambit. No gambit? Grab receiving item.
@   command index >5:  Grab receiving item.
@ Args:
@   r0: Menu proc. (Unused).
@   r1: command proc.
.thumb

push  {r4-r7, r14}
mov   r5, r0
mov   r6, r1


mov   r0, #0x3C
ldsb  r7, [r6, r0]
cmp   r7, #0x5
beq   Gambit
cmp   r7, #0x5
bgt   ReceivingItem
  
  @ Inventory Item
  ldr   r0, =ActiveUnit
  ldr   r0, [r0]
  lsl   r1, r7, #0x1
  add   r1, #0x1E
  ldrh  r2, [r0, r1]              @ Item
  b     DrawItem
  
  
  Gambit:
  ldr   r0, =ActiveUnit
  ldr   r0, [r0]
  bl    GAM_GetGambit
  mov   r2, r0
  cmp   r2, #0x0
  bne   DrawItem                  @ If unit doesn't have gambit
                                  @ use ReceivingItem instead.
  
  ReceivingItem:
  ldr   r0, =GameState
  add   r0, #0x2C
  ldrh  r2, [r0]


DrawItem:
mov   r0, #0x2A
mov   r1, #0x2C
ldsh  r0, [r6, r0]
ldsh  r1, [r6, r1]
lsl   r0, #0x3                  @ X
lsl   r1, #0x3                  @ Y
ldr   r4, =DrawItemHelp
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
