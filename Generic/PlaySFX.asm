@ Check if SFX option is ON before calling m4aSongNumStart.
@   r0: SongID
.thumb

push  {r4, r14}

ldr   r1, =ChapterData
add   r1, #0x41
ldrb  r1, [r1]
mov   r2, #0x2
and   r1, r2
cmp   r1, #0x0
bne   Return

  ldr   r4, =m4aSongNumStart
  bl    GOTO_R4
  
Return:
mov   r0, #0x1
pop   {r4}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
