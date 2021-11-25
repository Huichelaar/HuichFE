@ Called by SuspendDebuffs/asm/Debuffs/NewInitializer.
@ Calculate loaded unit's level.
@ Scale properly if autolevel is set.
@ Args:
@   r0: Loaded unit's state byte (level<<3 | faction << 1 | autolevel flag).
@ Returns:
@   Loaded unit's absolute level.
.thumb


ldr   r1, =PlayerLevelRAM
lsl   r1, #0x5
lsr   r1, #0x5
ldrb  r1, [r1]
mov   r2, #0x1
and   r2, r0
mul   r1, r2
lsl   r0, #0x18         @ 5-bit level value is now signed,
asr   r0, #0x1B         @ meaning relative level can only be in [-16, 15].
add   r0, r1

@ Ensure absolute level is in [1, T3ClassLvCap].
@ Assumption: T3 level cap is >= T2 level cap >= T1 level cap.
ldr   r1, =FirstUNITCommand
lsl   r1, #5
lsr   r1, #5
ldr   r1, [r0]
add   r1, #0x28
ldrb  r1, [r1, #0x1]  @ T3 class.
ldr   r2, =Class_Level_Cap_TableLABEL
ldrb  r1, [r2, r1]
cmp   r0, #0
bgt   L1
  mov   r0, #1        @ Level too low. Set to 1.
  b     Return
L1:
cmp   r0, r1
ble   Return
  mov   r0, r1        @ Level too high. Set to T3ClassLvCap.

Return:
bx    r14
