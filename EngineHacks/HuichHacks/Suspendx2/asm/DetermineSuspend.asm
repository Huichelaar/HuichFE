@ Determine action based on "Bkup" or "Susp" press.
@ Hooked at 0xA9340. 'Args':
@   r0: 'Mode' bitfield (Resume, Restart, etc.)
@   r1: Selected option. 0 if no option open, 1 if left, 2 if right.
@       0 is handled elsewhere and should be impossible here.
@   r5: SaveMenu proc+0x42
@ We leave r0, r1 and r5 intact when we return!
.thumb


@ Check if Resume.
cmp   r0, #0x1
beq   L1
  @ Not in Resume mode, exit.
  ldr   r3, =0x80A9349
  bx    r3
L1:


@ Check if "Bkup" or "Susp" has been pressed.
cmp   r1, #0x1
bne   L2
  @ "Bkup" pressed, decrement UNDO.
  @ This will load Backup suspend.
  sub   r2, r5, #0x1
  ldrb  r3, [r2]
  sub   r3, #0x1
  strb  r3, [r2]
L2:
ldr   r3, =0x80A93B1
bx    r3
