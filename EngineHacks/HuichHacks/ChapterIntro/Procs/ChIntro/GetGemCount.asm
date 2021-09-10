@ Returns number of gems active.
.thumb

ldr   r0, =ChapterData
ldrb  r0, [r0, #0xE]
ldr   r1, =ActiveGemsTable                @ Table indexed by ChapterID
ldrb  r0, [r1, r0]

bx    r14
