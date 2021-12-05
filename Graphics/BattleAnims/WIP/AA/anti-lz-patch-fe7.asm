.thumb
.org 0
@hook via BL at 54104 (for combat)
@another one at 54cb6 (for mode select) OH and AGAIN at 54b2e
@is there a third for promotion??

push {lr}
mov r2,#0x80
lsl r2, #0x18
tst r0,r2 @test if highest bit set
beq Normal

mvn r2,r2
and r0,r2 @wipe the highest bit of r0
mov r3,r0 @save pointer
ldr r0,[r6,#0xc] @section data
add r0, #0x2c @end of section data
ldr r0,[r0] @bytes to copy
lsr r0,#5
lsl r0,#3 @multiple of 8 words, rounded down 
mov r2,r0
mov r0,r3 @get the params in order
ldr r3, =0x80bfa0d
bl goto_r3 @write the fast part
@now r0 is last location and r1 is last destination, time to memcpy
mov r3, #0
mvn r3, r3 @r3 is now 0xFFFFFFFF
LoopStart:
ldmia r0!, {r2} @loads word from r0
cmp r2,r3
beq End
stmia r1!, {r2} @store to r1
b LoopStart

Normal:
ldr r3,=0x80bfa29 @uncompress
bl goto_r3

End:
pop {r3}
goto_r3:
bx r3
