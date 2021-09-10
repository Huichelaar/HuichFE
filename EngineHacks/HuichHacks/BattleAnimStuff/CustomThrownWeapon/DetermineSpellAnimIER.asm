@ Determine which spell anim should be used
@ if weapon uses SpellAnimID 3 (javelin) or 1 (handaxe).
@ Args:
@   r0: SpellAnimID.
@   r1: Attacker's classID.
@   r2: SpellAnimID (copy of r0), will also return the determinedSpellAnimID.
.thumb

cmp   r2, #0x3
beq   Lance
  cmp   r2, #0x1
  beq   Axe
    ldr   r0, =0x8058196          @ Vanilla nothing-changed address.
    mov   r15, r0

Lance:
ldr   r0, =LanceAnimTable
b     L1
  Axe:
  ldr   r0, =AxeAnimTable
L1:

lsl   r1, #0x2
ldr   r0, [r0, r1]
mov   r15, r0
