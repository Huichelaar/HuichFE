@ Creates sliding mural background proc.
.thumb

push  {r4-r7,r14}


@ Mural Background
ldr   r0, =Procs_StatScreen
ldr   r4, =Find6C
bl    GOTO_R4
cmp   r0, #0x0
beq   Return
  mov   r1, r0
  ldr   r0, =Procs_ScrollMural
  ldr   r4, =New6C
  bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
