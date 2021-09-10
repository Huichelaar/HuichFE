@ Mimic 0x22CF0, but use gambit item.
.thumb

push  {r4, r14}


ldr   r0, =ActiveUnit
ldr   r0, [r0]
bl    GAM_GetGambit
mov   r4, r0

ldr   r1, =ActionData
mov   r0, #0x9
strb  r0, [r1, #0x12]

mov   r0, r4
bl    NewWeaponSelectAlt

@ Same as 0x59D3F8, but 
ldr   r0, =GambitTSRL

@ Return
ldr   r1, =0x8022D17
bx    r1
GOTO_R5:
bx    r5


@ Mimic New_Weapon_Select,
@ but use gambit item.
NewWeaponSelectAlt:
push  {r4-r5, r14}
mov   r4, r0


ldr   r5, =ClearBG0BG1
bl    GOTO_R5

ldr   r0, =ActiveUnit
ldr   r0, [r0]
mov   r1, r4
ldr   r5, =MakeTargetListForWeapon
bl    GOTO_R5


pop   {r4-r5}
pop   {r0}
bx    r0
