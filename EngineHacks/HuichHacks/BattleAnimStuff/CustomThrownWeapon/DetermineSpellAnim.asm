@ Determine which spell anim should be used
@ if weapon uses SpellAnimID 3 (javelin) or 1 (handaxe).
@ Also incorporates Kao's Spell Loader:
@ https://feuniverse.us/t/fe8u-fe7u-spell-loader/3284
@
@ Args:
@   r0: Item's Spelleffect struct.
@   r1: Attacker's classID.
.thumb

ldrh  r2, [r0, #0x4]                          @ Get melee anim.
ldr   r3, =SeparateMeleeRangedSpells
ldrb  r3, [r3]
cmp   r3, #0x0
beq   L1

  @ Separate spells for melee and ranged active.
  ldrh  r0, [r0, #0x6]                        @ Get ranged anim.
  cmp   r0, #0x0
  beq   L1

    @ Now check if ranged.
    ldr   r3, =RangeVal
    ldrb  r3, [r3]
    cmp   r3, #0x1                            @ If entry was 1, return.
    beq   L1
    
      mov   r2, r0                            @ If range was melee, return.

L1:
cmp   r2, #0x3
beq   Lance
  cmp   r2, #0x1
  beq   Axe
    ldr   r0, =0x8058196          @ Vanilla nothing-changed address.
    mov   r15, r0

Lance:
ldr   r0, =LanceAnimTable
b     L2
  Axe:
  ldr   r0, =AxeAnimTable
L2:

lsl   r1, #0x2
ldr   r0, [r0, r1]
mov   r15, r0
