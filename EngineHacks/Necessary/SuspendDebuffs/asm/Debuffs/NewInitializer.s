@ Modified to scale loaded units.
.thumb 

push  {r14}
ldr   r0, =DebuffTable
lsl   r0, #0x5
lsr   r0, #0x5
ldrb  r1, [r5, #0xB]                @ Deployment number.
lsl   r1, #0x3                      @ *8.
add   r0, r1
mov   r1, #0x0
str   r1, [r0]                      @ Clear out the first eight bytes.
str   r1, [r0, #0x4]

@ Code that we replaced to jump here.
ldrb  r0, [r6, #0x3]                @ Level, faction, autolevel flag.
bl    SCU_CalcLoadedUnitLevel       @ Scale unit.
strb  r0, [r5, #0x8]
mov   r1, r5
add   r1, #0x10                     @ Hidden statuses (e.g. Afa's drops).
mov   r2, r5
pop   {r0}
bx    r0
