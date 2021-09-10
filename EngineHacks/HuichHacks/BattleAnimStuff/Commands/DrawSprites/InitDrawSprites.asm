@ Prepare some values for initialization.
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Set spell effect bool.
@ This allows loops in main AIS framedata
@ even when target HP is not changing.
ldr   r0, =gBoolSpellFxActive
mov   r1, #0x1
str   r1, [r0]


@ Time until next phase.
@ Initialized to 1.
mov   r0, #0x1
strh  r0, [r5, #0x2A]


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
