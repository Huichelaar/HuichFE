@ Definitions

@ Functions
.global UnLZ77Decompress
.type   UnLZ77Decompress, function
.set    UnLZ77Decompress, 0x08012F51

.global CpuFastSet
.type   CpuFastSet, function
.set    CpuFastSet, 0x080D1675

.global Find6C
.type   Find6C, function
.set    Find6C, 0x08002E9D

.global RegisterObject
.type   RegisterObject, function
.set    RegisterObject, 0x08005429

.global LoadSuspendedGame
.type   LoadSuspendedGame, function
.set    LoadSuspendedGame, 0x080A5C15

.global SaveSuspendedGame
.type   SaveSuspendedGame, function
.set    SaveSuspendedGame, 0x080A5A49

.global SaveMetadata_Load
.type   SaveMetadata_Load, function
.set    SaveMetadata_Load, 0x080A2EF9

.global CallEventEngine
.type   CallEventEngine, function
.set    CallEventEngine, 0x0800D07D

.global GetStringFromIndex
.type   GetStringFromIndex, function
.set    GetStringFromIndex, 0x0800A241

.global Text_SetColorId
.type   Text_SetColorId, function
.set    Text_SetColorId, 0x08003E61

.global Text_AppendString
.type   Text_AppendString, function
.set    Text_AppendString, 0x08004005

.global Text_Draw
.type   Text_Draw, function
.set    Text_Draw, 0x08003E71

.global BG_GetMapBuffer
.type   BG_GetMapBuffer, function
.set    BG_GetMapBuffer, 0x08001C4D


@ RAM locations
.global ChapterData
.set    ChapterData, 0x0202BCF0

.global KeyStatusBuffer
.set    KeyStatusBuffer, 0x02024CC0


@ ROM locations, I'm assuming these aren't repointed. So make changes if you have repointed these!
.global OAMREGS_Digits
.set    OAMREGS_Digits, 0x08A205F6

.global OAMREGS_64x32
.set    OAMREGS_64x32, 0x08590F94


@ Procs
.global Procs_SaveMenu
.set    Procs_SaveMenu, 0x08A200B8
