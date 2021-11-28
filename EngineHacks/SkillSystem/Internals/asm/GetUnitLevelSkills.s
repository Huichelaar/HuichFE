
.thumb

.equ ChapterData, 0x202BCF0

lClassLevelUpTable = EALiterals+0x00
lCharLevelUpTable  = EALiterals+0x04

GetUnitLevelSkills:
@ Arguments: r0 = Unit, r1 = level from, r2 = level to, r3 = output buffer
@ Returns:   r0 = output buffer (for convenience)

@ Given a Unit (or Battle Unit) and a level range, gets what skills that unit would learn within that range.
@ Skills are stored in a null-termnated list of address given in r3.

@ Used for, Skill learning on level, Skill learning on unit loading, and Skill learning on promotion.

@ Skill learning on unit loading gives range [0, level], and cares for all returned skills.
@ Skill learning on level up gives range [old level, new level] and only cares for the first returned skill.
@ Skill learning on promotion gives range [0, 1] and only cares for the first returned skill.

@ This is an improvement over the skill system before march 2019, where each case was handled separately.
@ As it makes it easier to hack in (or out) methods of defining level-up skills.

@ Huichelaar edits:
@   - Class level up skills will not be learned by unitIDs > 0x3F.
@   - Top three level bits no longer represent options.

push  {r4-r7}
mov   r7, r0                  @ var r7 = unit.
mov   r5, r3                  @ var r5 = output. For returning it later.
mov   r6, r3                  @ var r6 = output. Will be iterated on.


check_char_skill:
@ Checking char skill list.
ldr   r3, [r7, #0x0]          @ r3 = unit character.
ldr   r4, lCharLevelUpTable
ldrb  r3, [r3, #0x4]          @ r3 = unit character id.
lsl   r3, #2
ldr   r4, [r4, r3]            @ var r4 = class level up skill list it.
cmp   r4, #0
beq   end_char_skill          @ if no class skill list, then no class skill learned.

lop_char_skill:
	ldrb  r3, [r4]
	cmp   r3, #0
	beq   end_char_skill        @ level 0 <=> end of list.
    cmp   r3, r1
    ble   continue_char_skill
      cmp   r3, r2
      ble   yes_char_skill    @ level is between from (excluded) and to (included).
	
  continue_char_skill:
	add   r4, #2
	b     lop_char_skill

  yes_char_skill:
	ldrb  r3, [r4, #1]          @ get skill id
	strb  r3, [r6]              @ add it to the list
	add   r6, #1                @ increment output iterator
	b     continue_char_skill
end_char_skill:


@ Checking class skill list.
ldr   r4, lClassLevelUpTable
ldr   r3, [r7, #0x4]          @ r3 = unit class.
ldrb  r3, [r3, #0x4]          @ r3 = unit class id.
lsl   r3, #2
ldr   r4, [r4, r3]            @ r4 = class level up skill list.
cmp   r4, #0
beq   end_class_skill         @ if no class skill list, then no class skill learned.
  @ Huichelaar edit: class level up skills
  @ will not be learned by units > 0x3F.
  ldr   r0, [r7]              @ r0 = unit char.
  ldrb  r0, [r0, #0x4]        @ r0 = unit char id.
  cmp   r0, #0x3F
  bgt   end_class_skill       @ if no BWL/generic, then no class skill learned.

lop_class_skill:
	ldrb  r3, [r4]
	cmp   r3, #0
	beq   end_class_skill       @ level 0 <=> end of list.
    cmp   r3, r1
    ble   continue_class_skill
      cmp   r3, r2
      ble   yes_class_skill   @ level is between from (excluded) and to (included)

  continue_class_skill:
	add   r4, #2
	b     lop_class_skill

  yes_class_skill:
	ldrb  r3, [r4, #1]          @ get skill id
	strb  r3, [r6]              @ add it to the list
	add   r6, #1                @ increment output iterator
	b continue_class_skill
end_class_skill:

mov   r0, #0                  @ terminate list
strb  r0, [r6]
mov   r0, r5                  @ return output buffer in r0
pop   {r4-r7}
bx    lr

.pool
.align

EALiterals:
@ POIN ClassLevelUpTable
@ POIN CharLevelUpTable
