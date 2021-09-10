.thumb

push  {r4-r7, r14}
mov   r5, r1
mov   r6, r2
sub   sp, #0x4


@ Overwritten by hook (playtime window)
mov   r0, #0x80
lsl   r0, r0, #0x6
str   r0, [sp]
mov   r0, #0xD
ldr   r4, =RegisterObject
bl    GOTO_R4


@ Check if we should draw
ldr   r0, =Procs_SaveMenu
ldr   r4, =Find6C
bl    GOTO_R4
mov   r7, r0
cmp   r7, #0x0
beq   Return

  mov   r2, #0x42
  ldrh  r1, [r7, r2]
  cmp   r1, #0x1
  bne   Return                      @ We're not in resume chapter mode, don't draw
  mov   r2, #0x41
  ldrb  r1, [r7, r2]
  cmp   r1, #0xFF
  beq   Return                      @ 0xFF is reserved, means we don't have backups.


@ Draw backupbox
mov   r0, #0x2A
lsl   r0, #0x8
mov   r1, #0xD8
add   r0, r1
str   r0, [sp]
mov   r1, r5
sub   r1, #0x38
sub   r2, r6, #0x1
ldr   r3, =OAMREGS_64x32
mov   r0, #0xD
ldr   r4, =RegisterObject
bl    GOTO_R4


@ Draw backupcount digits
mov   r2, #0x41
ldrb  r1, [r7, r2]
cmp   r1, #0xA
blt   L1

  @ Number has 2 digits, draw most significant one
  mov   r0, r1
  mov   r1, #0xA
  swi   #0x6                      @ div
  mov   r7, r1                    @ remainder
  mov   r2, #0x70
  lsl   r2, #0x8
  add   r0, r2
  str   r0, [sp]
  mov   r1, #0x79
  add   r2, r6, #0x6
  ldr   r3, =OAMREGS_Digits
  mov   r0, #0xD
  ldr   r4, =RegisterObject
  bl    GOTO_R4
  mov   r1, r7

@ Draw digit
L1:
mov   r0, #0x70
lsl   r0, #0x8
add   r0, r1
str   r0, [sp]
mov   r1, #0x81
add   r2, r6, #0x6
ldr   r3, =OAMREGS_Digits
mov   r0, #0xD
ldr   r4, =RegisterObject
bl    GOTO_R4

Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
