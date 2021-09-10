@ Mimics 0x5BF0A.
.thumb

push  {r4-r7, r14}
mov   r5, r0


ldr   r6, =SetSomethingSpellFxToTrue
bl    GOTO_R6
ldr   r6, =ClearBG1Setup
bl    GOTO_R6
ldr   r0, =Procs_BHA
mov   r1, #0x3
ldr   r6, =New6C
bl    GOTO_R6
mov   r4, r0

str   r5, [r4, #0x5C]
mov   r0, #0x0
strh  r0, [r4, #0x2C]
mov   r0, r5
ldr   r6, =GetSomeAISRelatedIndexMaybe
bl    GOTO_R6
lsl   r0, #0x10
asr   r0, #0x10
ldr   r6, =GetSomeBoolean
bl    GOTO_R6
add   r4, #0x29
strb  r0, [r4]


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R6:
bx    r6
