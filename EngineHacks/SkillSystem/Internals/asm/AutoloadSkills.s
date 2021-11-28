@ Huichelaar edit: Now goes through GetInitialSkillList three times.
@ Once for every class the unit could be loaded as.
.thumb

AutoloadSkills:
@ Arguments: r0 = Unit
@ Returns:   r0 = Unit (for convenience)
push  {r4-r7, lr}
mov   r4, r8
mov   r5, r9
push  {r4-r5}
sub   sp, #0x10
mov   r4, r0                    @ var r4 = unit
mov   r5, sp                    @ var r5 = output buffer.

@ Store unit's original class & level for later.
ldr   r0, =FirstUNITCommand
lsl   r0, #5
lsr   r0, #5
ldr   r6, [r0]
ldrb  r0, [r4, #0x8]
mov   r8, r0                      @ Unit's original level.

@ 'Pseudocode' loop plan:
@ it = 0
@ LOOP
@ set class to r6+0x1
@ if (AutoPromoLevel[class] == 0)
@   maxLv = Classcap[class]
@ else
@   maxLv = AutoPromoLevel[class]
@ set level to min(origLv, maxLv)
@ get skills.
@ IT:
@ add 0x14 to r6
@ if it++ >= 3 jump to END
@   if origLv < maxLv, jump to END
@     if unit->class == r6->class, jump to IT
@       Jump to LOOP
@ END:
mov   r7, #0                      @ Loop iterator.
ldrb  r0, [r6, #0x1]              @ ClassID.
Loop:
  mov   r2, r0
  mov   r1, #0x54
  mul   r0, r1
  ldr   r1, =ClassTableLABEL
  add   r0, r1
  str   r0, [r4, #0x4]            @ This also sets class back to original in last iteration.
  
  ldr   r0, =ClassPromoLevelTableLABEL
  ldrb  r0, [r0, r2]
  cmp   r0, #0
  bne   L1
    ldr   r0, =Class_Level_Cap_TableLABEL
    ldrb  r0, [r0, r2]
  L1:
  mov   r9, r0                   @ r9 = maxLv.
  cmp   r8, r0
  bge   L2
    mov   r0, r8
  L2:
  strb  r0, [r4, #0x8]            @ This also sets level back to original in last iteration.
  
  ldr   r3, =GetInitialSkillList+1
  mov   r0, r4                    @ arg r0 = Unit
  mov   r1, r5                    @ arg r1 = output buffer
  bl    BXR3
  @ implied                       @ ret r0 = output buffer

  @ Move output buffer cursor to terminator.
  Loop2:
    ldrb  r0, [r5]
    cmp   r0, #0
    beq   Loop2End
      add   r5, #1
      b     Loop2
  Loop2End:
  
  Continue:
  add   r6, #0x14
  add   r7, #1
  cmp   r7, #3
  bge   LoopEnd
    ldrb  r0, [r4, #0x8]
    cmp   r8, r9
    blt   LoopEnd
      ldrb  r0, [r6, #0x1]
      ldr   r1, [r4, #0x4]
      ldrb  r1, [r1, #0x4]
      cmp   r0, r1
      beq   Continue
        b     Loop
LoopEnd:


@ Add skills.
mov   r1, sp                      @ arg r1 = skill list
mov   r0, r4                      @ arg r0 = unit
bl    AddSkills

@ implied                         @ ret r0 = unit
add   sp, #0x10                   @ free allocated space
pop   {r4-r5}
mov   r8, r4
mov   r9, r5
pop   {r4-r7}
pop   {r1}
bx    r1

AddSkills:
	@ Arguments: r0 = Unit, r1 = null terminated skill list
	@ Returns:   r0 = Unit (because I can)

	push {r0, r4, lr} @ note: [sp] = Unit

	mov r4, r1 @ var r4 = skill list iterator

AddSkills.lop:
	ldrb r1, [r4]

	cmp r1, #0
	beq AddSkills.end @ end if reached list end

	ldr r3, =SkillAdder+1

	ldr r0, [sp] @ arg r0 = unit
	@ implied    @ arg r1 = skill id

	bl BXR3

	add r4, #1

	b AddSkills.lop

AddSkills.end:
	pop {r0, r4} @ note: r0 = Unit

	pop {r3}
BXR3:
	bx r3

	.pool
	.align
