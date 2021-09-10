@ Definitions

@ Functions
.global New6C
.type   New6C, function
.set    New6C, 0x8002C7D

.global NewBlocking6C
.type   NewBlocking6C, function
.set    NewBlocking6C, 0x8002CE1

.global Break6CLoop
.type   Break6CLoop, function
.set    Break6CLoop, 0x8002E95

.global Find6C
.type   Find6C, function
.set    Find6C, 0x8002E9D

.global Sound_SongTransition
.type   Sound_SongTransition, function
.set    Sound_SongTransition, 0x80029E9


@ RAM locations
.global gpDISPCNTbuffer
.set    gpDISPCNTbuffer, 0x3003080

.global KeyStatusBuffer
.set    KeyStatusBuffer, 0x2024CC0
