@ Pause dramatically during prep screen init, before fade-in.
@ Except if we've paused once already; Then don't.
.thumb

push  {r4-r7, r14}
mov   r5, r0


ldr   r0, =Procs_ResetPause
ldr   r4, =Find6C
bl    GOTO_R4
cmp   r0, #0x0
beq   L1

  @ Already paused once, end.
  mov   r0, r5
  ldr   r4, =Delete6C
  bl    GOTO_R4
  b     Return
L1:


@ Haven't paused yet. Start proc which
@ ends as soon as prepscreen ends.
@ Don't pause as long as this proc exists.
ldr   r0, =Procs_ResetPause
mov   r1, #0x3
ldr   r4, =New6C
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
