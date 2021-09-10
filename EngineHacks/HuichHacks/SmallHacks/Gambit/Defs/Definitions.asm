@ Definitions

@ Functions
.global Text_Clear
.type   Text_Clear, function
.set    Text_Clear, 0x08003DC9

.global Find6C
.type   Find6C, function
.set    Find6C, 0x08002E9D

.global GetUnitStruct
.type   GetUnitStruct, function
.set    GetUnitStruct, 0x08019431

.global GetItemAttributes
.type   GetItemAttributes, function
.set    GetItemAttributes, 0x801756D

.global ClearMapWith
.type   ClearMapWith, function
.set    ClearMapWith, 0x80197E5

.global FillRangeByRangeMask
.type   FillRangeByRangeMask, function
.set    FillRangeByRangeMask, 0x801B461

.global DisplayMoveRangeGraphics
.type   DisplayMoveRangeGraphics, function
.set    DisplayMoveRangeGraphics, 0x801DA99

.global HideMoveRangeGraphics
.type   HideMoveRangeGraphics, function
.set    HideMoveRangeGraphics, 0x801DACD

.global MakeUIWindowTileMap_BG0BG1
.type   MakeUIWindowTileMap_BG0BG1, function
.set    MakeUIWindowTileMap_BG0BG1, 0x804E369

.global ClearBG0BG1
.type   ClearBG0BG1, function
.set    ClearBG0BG1, 0x804E885

.global MakeTargetListForWeapon
.type   MakeTargetListForWeapon, function
.set    MakeTargetListForWeapon, 0x80251B5

.global CanUnitUseWeapon
.type   CanUnitUseWeapon, function
.set    CanUnitUseWeapon, 0x8016751

.global GetTargetListSize
.type   GetTargetListSize, function
.set    GetTargetListSize, 0x804FD29

.global GetFacingDirection
.type   GetFacingDirection, function
.set    GetFacingDirection, 0x807B9B9

.global MapAddInRange
.type   MapAddInRange, function
.set    MapAddInRange, 0x801AABD

.global ForEachUnitInRange
.type   ForEachUnitInRange, function
.set    ForEachUnitInRange, 0x8024EAD

.global DrawItemHelp
.type   DrawItemHelp, function
.set    DrawItemHelp, 0x8088E61


@ RAM locations
.global gpBG0MapBuffer
.set    gpBG0MapBuffer, 0x02022CA8

.global gpBG1MapBuffer
.set    gpBG1MapBuffer, 0x020234A8

.global gpBG2MapBuffer
.set    gpBG2MapBuffer, 0x02023CA8

.global gpBG3MapBuffer
.set    gpBG3MapBuffer, 0x020244A8

.global ActiveUnit
.set    ActiveUnit, 0x3004E50

.global gMapMovement
.set    gMapMovement, 0x202E4E0

.global gMapRange
.set    gMapRange, 0x202E4E4

.global GameState
.set    GameState, 0x202BCB0

.global ActionData
.set    ActionData, 0x203A958

.global BattleStats
.set    BattleStats, 0x203A4D4

.global RightBattleStruct
.set    RightBattleStruct, 0x203A4EC

.global LeftBattleStruct
.set    LeftBattleStruct, 0x203A56C

.global InitialHitUnit
.set    InitialHitUnit, 0x203E100

.global ActorTargetOrder
.set    ActorTargetOrder, 0x203E108

.global gpCurrentRound
.set    gpCurrentRound, 0x203A608

.global gpSubjectMap
.set    gpSubjectMap, 0x30049A0

.global gMapSize
.set    gMapSize, 0x202E4D4


@ Procs
.global Procs_MenuItemPanel
.set    Procs_MenuItemPanel, 0x859AE88

.global Procs_MoveLimitView
.set    Procs_MoveLimitView, 0x859AD50
