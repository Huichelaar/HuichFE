@ Called by SuspendDebuffs/asm/Debuffs/NewInitializer.
@ Calculate loaded unit's level.
@ Scale properly if autolevel is set.
@ Args:
@   r0: Loaded unit's state byte (level<<3 | faction << 1 | autolevel flag)
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
lsr   r0, #0x3
add   r0, r1

bx    r14
