@ Mimics 0x80B2FD1, but custom Y.
.thumb

push  {r4-r5, r14}
sub   sp, #0x8
mov   r4, r0


add   r0, #0x2C
ldrb  r0, [r0]                      @ r0
mov   r2, #0x2E
ldsh  r1, [r4, r2]                  @ r1
mov   r3, #0x80
lsl   r3, #0x1                      @ r3
str   r3, [sp]                      @ [sp]
mov   r5, #0x0
str   r5, [sp, #0x4]                @ [sp+0x4]
ldr   r2, =SegTitleY
ldr   r2, [r2]                      @ r2
bl    opinfoview2_DrawChar
strh  r5, [r4, #0x2A]


add   sp, #0x8
pop   {r4-r5}
pop   {r0}
bx    r0
