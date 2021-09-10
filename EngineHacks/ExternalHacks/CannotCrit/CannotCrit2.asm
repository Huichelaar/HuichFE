@ Ensure Compute Crit leaves battle crit at 0
@ even when dodge is <0. Hooked at 0x2ACA0
@   r0: defender's dodge address.
@   r1: attacker's crit. Turns into battle crit.
@   r2: attacker battlestruct.
@   r3: unused.
@   r4: unused.
@   r5: unused.
@   r6: defender battlestruct.
.thumb


mov   r3, #0x0
ldsh  r0, [r0, r3]
sub   r1, r0                        @ Battle crit.

@ Check if item can crit.
mov   r3, #0x4A
ldrh  r3, [r2, r3]
lsl   r3, #0x18
lsr   r4, r3, #0x13
lsr   r3, #0x16
add   r3, r4
add   r3, #0x18
ldr   r4, =ItemTable
ldrb  r3, [r4, r3]                  @ Item crit.
cmp   r3, #0xFF
bne   L1

  @ item can't crit.
  mov   r1, #0x0                    @ Battle crit.


@ vanilla stuff overwritten by hook.
L1:
mov   r5, r2
add   r5, #0x6A
mov   r4, #0x0
strh  r1, [r5]
bx    r14
