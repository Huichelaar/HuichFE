.thumb

push  {r4, r14}
ldr   r1, =Proc_FortMenu2HelpText
ldr   r4, =Goto6CPointer
bl    GOTO_R4
pop   {r4}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
