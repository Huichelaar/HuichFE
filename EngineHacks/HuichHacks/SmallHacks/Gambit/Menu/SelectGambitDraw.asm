@ Mimic 0x22D34, but use gambit item.
.thumb

push  {r4-r6, r14}
mov   r5, r1


ldr   r0, =ActiveUnit
ldr   r0, [r0]
bl    GAM_GetGambit
mov   r4, r0


@ Original draw routine,
@ 0x22D34, handles the rest.
mov   r0, #0x1
ldr   r3, =0x8022D53
bx    r3
