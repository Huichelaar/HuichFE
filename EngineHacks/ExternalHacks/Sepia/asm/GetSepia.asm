@ Written by Tequila. Modified to apply filter conditionally.
@ https://feuniverse.us/t/funky-color-stuff/3763
@ r = r*101/256 + g*197/256 + b*97/512.
@ g = r*179/512 + g*176/256 + b*11/64.
@ b = b*35/128 + g*137/256 + b*17/128.
.thumb

GetSepia:
push	{r4-r7,r14}


lsl		r4,r0,#27
lsr		r4,#27			@red
lsl		r5,r0,#22
lsr		r5,#27			@green
lsl		r6,r0,#17
lsr		r6,#27			@blue
mov		r7,#0			@new number
@new red
mov		r0,#101
mul		r0,r4
lsr		r0,#8
mov		r1,#197
mul		r1,r5
lsr		r1,#8
add		r0,r1
mov		r1,#97
mul		r1,r6
lsr		r1,#9
add		r0,r1		@red done
cmp		r0,#31
ble		Label1
mov		r0,#31
Label1:
mov		r7,r0
@new blue
mov		r0,#179
mul		r0,r4
lsr		r0,#9
mov		r1,#176
mul		r1,r5
lsr		r1,#8
add		r0,r1
mov		r1,#11
mul		r1,r6
lsr		r1,#6
add		r0,r1
cmp		r0,#31
ble		Label2
mov		r0,#31
Label2:
lsl		r0,#5
orr		r7,r0			@blue done
@new green
mov		r0,#35
mul		r0,r4
lsr		r0,#7
mov		r1,#137
mul		r1,r5
lsr		r1,#8
add		r0,r1
mov		r1,#17
mul		r1,r6
lsr		r1,#7
add		r0,r1
cmp		r0,#31
ble		Label3
mov		r0,#31
Label3:
lsl		r0,#10
orr		r0,r7			@new color


pop		{r4-r7}
pop		{r1}
bx		r1
