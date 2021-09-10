@ Hooked at 0x763A0. Draws Battle BG
@ during Overworld/prep promotion.
.thumb

push  {r4, r14}


ldr   r0, =CurrentBattleBG
mov   r1, #0x0
ldsh  r0, [r0, r1]
ldr   r4, =DrawBattleBG_Low
bl    GOTO_R4
bl    MoveScrEntr
bl    DrawBattleBG


pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
