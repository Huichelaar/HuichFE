@ Clear Chapter's Fortmaster from Fort
.thumb


ldr   r0, =ChapterData
ldrb  r0, [r0, #0xE]
sub   r0, #0x1
cmp   r0, #0x0
bge   L1
  mov   r0, #0x0
L1:
mov   r1, #0x5
mul   r0, r1
ldr   r1, =FortsMatsData
mov   r2, #0x0
strb  r2, [r1, r0]


bx    r14
