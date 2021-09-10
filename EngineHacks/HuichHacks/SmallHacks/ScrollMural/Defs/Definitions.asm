@ Definitions

@ Functions
.global EnableBackgroundSyncById
.type   EnableBackgroundSyncById, function
.set    EnableBackgroundSyncById, 0x08001FBD

.global EnableBackgroundSyncByMask
.type   EnableBackgroundSyncByMask, function
.set    EnableBackgroundSyncByMask, 0x08001FAD

.global GetGameClock
.type   GetGameClock, function
.set    GetGameClock, 0x08000D29

.global Find6C
.type   Find6C, function
.set    Find6C, 0x08002E9D

.global Goto6CLabel
.type   Goto6CLabel, function
.set    Goto6CLabel, 0x08002F25

.global DeleteEach6C
.type   DeleteEach6C, function
.set    DeleteEach6C, 0x08003079


@ RAM locations
.global gpDISPCNTbuffer
.set    gpDISPCNTbuffer, 0x03003080

.global gpBG0MapBuffer
.set    gpBG0MapBuffer, 0x02022CA8

.global gpBG1MapBuffer
.set    gpBG1MapBuffer, 0x020234A8

.global gpBG2MapBuffer
.set    gpBG2MapBuffer, 0x02023CA8

.global gpBG3MapBuffer
.set    gpBG3MapBuffer, 0x020244A8

.global StatScreenStruct
.set    StatScreenStruct, 0x02003BFC


@ Procs
.global Procs_BG3HSlide
.set    Procs_BG3HSlide, 0x08A006E4
