@ Run as case 9 in SetupBattleWeaponData's
@ switch statement at 0x2A778.
.thumb


@ Set equipped item slot to -1.
mov   r2, #0x51
mov   r1, #0xFF
strb  r1, [r5, r2]

@ Return gambit.
mov   r0, r5
bl    GAM_GetGambit

@ Add an extra charge to prevent
@ weapon broke message.
ldr   r1, =0x100
add   r0, r1


@ Return
ldr   r1, =0x802A7BD
bx    r1
