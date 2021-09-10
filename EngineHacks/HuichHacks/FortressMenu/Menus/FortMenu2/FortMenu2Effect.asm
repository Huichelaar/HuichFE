@ Executed when any FortMenu2 command is selected.
.thumb

push  {r14}

ldr   r1, [r0, #0x14]
ldr   r1, [r1, #0x1C]         @ Aunt/Uncle is Proc_DrawFortMenu2
mov   r2, #0x29
ldrb  r3, [r1, r2]            @ MenuMode, indicates whether gather, upgrade, etc.

cmp   r3, #0x0
beq   Gather
cmp   r3, #0x1
beq   Upgrade
cmp   r3, #0x2
beq   Change
b     Change2

Gather:
bl    EffectGather
b     Return

Upgrade:
bl    EffectUpgrade
b     Return

Change:
bl    SelectChange
b     Return

Change2:
mov   r3, #0x2
strb  r3, [r1, r2]
mov   r0, r1
bl    DeselectChange
mov   r0, #0x4


Return:
pop   {r1}
bx    r1
