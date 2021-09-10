@ Calculates & returns required materials to upgrade fort. Arguments:
@   r0 = fort index
@   r1 = 0 if required material 1, 1 if required material 2
@ Returns:
@   r0 = Modified required material based on fort exp
.thumb

push  {r4-r7, r14}
mov   r4, r0
mov   r5, r1


mov   r1, #0x5
mul   r0, r1
ldr   r1, =FortRAM
lsl   r1, #0x5
lsr   r1, #0x5
add   r0, r1
ldrb  r1, [r0, #0x1]
lsr   r0, r1, #0x6                    @ Fort level
lsl   r1, #0x1A
lsr   r3, r1, #0x1A                   @ Fort exp

ldr   r1, =FortsTable
lsl   r2, r4, #0x5
mov   r4, r3                          @ Fort exp
add   r1, r2
add   r1, #0x8
lsl   r0, #0x2
add   r0, r1
lsl   r1, r5, #0x1
add   r0, r1
ldrb  r1, [r0, #0x1]                  @ Base required Material for upgrade
mov   r5, r1

@ Calculate modified required Material for upgrade
mov   r0, #0x32
cmp   r1, #0x0
bne   L1
  mov   r1, #0x1                      @ only get here if required material is 0 (don't do that pls)
L1:
swi   #0x6                            @ total exp / material count
cmp   r1, #0x0                        @ r1 holds tot.exp % matcount, if r1 =/= 0, we have a remainder
beq   L2
  add   r0, #0x1                      @ Round up
L2:
cmp   r0, #0x0
bne   L3
  mov   r0, #0x1                      @ We should never get here, but just in case
L3:
mov   r1, r0
mov   r0, r4
swi   #0x6                            @ current exp / (total exp / material count)
sub   r0, r5, r0


pop   {r4-r7}
pop   {r1}
bx    r1
