@ Draws a FortMenu2 item. Arguments:
@   r0 and r0+0x2 hold pointers to start tile indices for two strings.
@   r1 = [0,7], ID indicating which tiles should be overwritten.
@   r2 = ID indicating which fort should be drawn.
@   r3 = [0-3], value indicating which right-items to draw.
.thumb

push  {r14}

cmp   r3, #0x0
beq   Gather
cmp   r3, #0x1
beq   Upgrade
b     Change

Gather:
bl    DrawEntityRightGather
b     Return

Upgrade:
bl    DrawEntityRightUpgrade
b     Return

Change:
bl    DrawEntityRightChange

Return:
pop   {r0}
bx    r0
