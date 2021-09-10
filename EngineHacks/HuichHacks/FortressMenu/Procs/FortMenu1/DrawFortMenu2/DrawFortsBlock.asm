@ Sets up FortMenu2 Screenblock.
.thumb

push  {r4, r14}

@ Load "Materials" & "Forts" menu tiles
ldr   r0, =MenuUITiles
ldr   r1, =0x6000000
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4


@ Load "Materials" & "Forts" menu TSA
ldr   r0, =MenuUITSA
ldr   r1, =gGenericBuffer
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

ldr   r0, =gpBG1MapBuffer+0x10
mov   r2, #0x0
ldr   r1, =gGenericBuffer
ldr   r4, =FillTileRect
bl    GOTO_R4


mov   r0, #0x1
ldr   r4, =EnableBackgroundSyncById 
bl    GOTO_R4


pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
