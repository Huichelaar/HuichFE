@ Definitions

@ Functions

.global StartMenu,
.type		StartMenu, function
.set    StartMenu, 0x0804EBE5

@.global FadeInExists
@.type   FadeInExists, function
@.set    FadeInExists, 0x080AE2A1

@.global FadeOutExists
@.type   FadeOutExists, function
@.set    FadeOutExists, 0x080AE2B9

@.global NewFadeIn
@.type   NewFadeIn, function
@.set    NewFadeIn, 0x080AE2D1

@.global NewFadeOut
@.type   NewFadeOut, function
@.set    NewFadeOut, 0x080AE2F5

.global PushToSecondaryOAM
.type   PushToSecondaryOAM, function
.set    PushToSecondaryOAM, 0x08002BB9

.global SetBackgroundTileDataOffset
.type   SetBackgroundTileDataOffset, function
.set    SetBackgroundTileDataOffset, 0x08000FDD

@.global SetBLDCNT1stTargets
@.type   SetBLDCNT1stTargets, function
@.set    SetBLDCNT1stTargets, 0x08001ED1

@.global SetBLDCNT2ndTargets
@.type   SetBLDCNT2ndTargets, function
@.set    SetBLDCNT2ndTargets, 0x08001F0D

@.global Font_InitForUIDefault
@.type   Font_InitForUIDefault, function
@.set    Font_InitForUIDefault, 0x08003C95

@.global LoadNewUIGraphics
@.type   LoadNewUIGraphics, function
@.set    LoadNewUIGraphics, 0x0804EB69

@.global ResetIconGraphics_
@.type   ResetIconGraphics_, function
@.set    ResetIconGraphics_, 0x08003579

@.global LoadIconPalettes
@.type   LoadIconPalettes, function
@.set    LoadIconPalettes, 0x080035BD

@.global GetItemIconId
@.type   GetItemIconId, function
@.set    GetItemIconId, 0x08017701

@.global DrawIcon
@.type   DrawIcon, function
@.set    DrawIcon, 0x080036BD

@.global LoadObjUIGfx
@.type   LoadObjUIGfx, function
@.set    LoadObjUIGfx, 0x08015681

@.global PrepGreyMenu
@.type   PrepGreyMenu, function
@.set    PrepGreyMenu, 0x08098C8D

@.global MinimugWriter
@.type   MinimugWriter, function
@.set    MinimugWriter, 0x08005925

.global Text_Init
.type   Text_Init, function
.set    Text_Init, 0x08003D5D

@.global Text_Clear
@.type   Text_Clear, function
@.set    Text_Clear, 0x08003DC9

@.global Text_SetParameters
@.type   Text_SetParameters, function
@.set    Text_SetParameters, 0x08003E69

@.global Text_AppendString
@.type   Text_AppendString, function
@.set    Text_AppendString, 0x08004005

.global Text_Draw
.type   Text_Draw, function
.set    Text_Draw, 0x08003E71

.global Text_InsertString
.type   Text_InsertString, function
.set    Text_InsertString, 0x08004481

@.global DrawTextInLine
@.type   DrawTextInLine, function
@.set    DrawTextInLine, 0x0800443D

.global GetStringFromIndex
.type   GetStringFromIndex, function
.set    GetStringFromIndex, 0x0800A241

.global FilterSomeTextFromStandardBuffer
.type   FilterSomeTextFromStandardBuffer, function
.set    FilterSomeTextFromStandardBuffer, 0x0800A3B9

@.global DrawDecNumber
@.type   DrawDecNumber, function
@.set    DrawDecNumber, 0x08004B95

@.global DrawSpecialUiChar
@.type   DrawSpecialUiChar, function
@.set    DrawSpecialUiChar, 0x08004B0D

@.global GetPartyGoldAmount
@.type   GetPartyGoldAmount, function
@.set    GetPartyGoldAmount, 0x08024DE9

@.global NewMenu_BG0BG1
@.type   NewMenu_BG0BG1, function
@.set    NewMenu_BG0BG1, 0x0804EC99

@.global EndMenu
@.type   EndMenu, function
@.set    EndMenu, 0x0804EEA9

@.global Menu_DrawHoverThing
@.type   Menu_DrawHoverThing, function
@.set    Menu_DrawHoverThing, 0x0804F0E1

.global UnLZ77Decompress
.type   UnLZ77Decompress, function
.set    UnLZ77Decompress, 0x08012F51

.global EnableBackgroundSyncById
.type   EnableBackgroundSyncById, function
.set    EnableBackgroundSyncById, 0x08001FBD

.global EnableBackgroundSyncByMask
.type   EnableBackgroundSyncByMask, function
.set    EnableBackgroundSyncByMask, 0x08001FAD

.global CopyToPaletteBuffer
.type   CopyToPaletteBuffer, function
.set    CopyToPaletteBuffer, 0x08000DB9

.global SetSpecialColourEffectsParam
.type   SetSpecialColourEffectsParam, function
.set    SetSpecialColourEffectsParam, 0x08001EA1

.global SetDefaultColourEffects
.type   SetDefaultColourEffects, function
.set    SetDefaultColourEffects, 0x08001F81

.global New6C
.type   New6C, function
.set    New6C, 0x08002C7D

.global NewBlocking6C
.type   NewBlocking6C, function
.set    NewBlocking6C, 0x08002CE1

.global Break6CLoop
.type   Break6CLoop, function
.set    Break6CLoop, 0x08002E95

@.global BGSetPosition
@.type   BGSetPosition, function
@.set    BGSetPosition, 0x0800148D

.global GetGameClock
.type   GetGameClock, function
.set    GetGameClock, 0x08000D29

@.global _umodsi3
@.type   _umodsi3, function
@.set    _umodsi3, 0x080D1B4D

@.global Mod
@.type   Mod, function
@.set    Mod, 0x080D1685

@.global Div
@.type   Div, function
@.set    Div, 0x080D167D

.global CpuFastSet
.type   CpuFastSet, function
.set    CpuFastSet, 0x080D1675

.global CpuSet
.type   CpuSet, function
.set    CpuSet, 0x080D1679

.global EnablePaletteSync
.type   EnablePaletteSync, function
.set    EnablePaletteSync, 0x08001F95

.global m4aSongNumStart
.type   m4aSongNumStart, function
.set    m4aSongNumStart, 0x080D01FD

.global Switch_BGM
.type   Switch_BGM, function
.set    Switch_BGM, 0x080024E5

@.global SoundStuff1
@.type   SoundStuff1, function
@.set    SoundStuff1, 0x0800231D

@.global SoundStuff2
@.type   SoundStuff2, function
@.set    SoundStuff2, 0x080023E1

@.global BgAffineSet
@.type   BgAffineSet, function
@.set    BgAffineSet, 0x080D1671

@.global ObjAffineSet
@.type   ObjAffineSet, function
@.set    ObjAffineSet, 0x080D16A1

.global WriteOAMRotScaleData
.type   WriteOAMRotScaleData, function
.set    WriteOAMRotScaleData, 0x080021B1

@.global Find6C
@.type   Find6C, function
@.set    Find6C, 0x08002E9D

@.global Goto6CLabel
@.type   Goto6CLabel, function
@.set    Goto6CLabel, 0x08002F25

@.global Goto6CPointer
@.type   Goto6CPointer, function
@.set    Goto6CPointer, 0x08002F5D

@.global NextRN_N
@.type   NextRN_N, function
@.set    NextRN_N, 0x08000C81

.global BG_Fill
.type   BG_Fill, function
.set    BG_Fill, 0x08001221

@.global MMS_GetGfx
@.type   MMS_GetGfx, function
@.set    MMS_GetGfx, 0x080BAC1D

.global RegisterObject
.type   RegisterObject, function
.set    RegisterObject, 0x08005429

.global SRAMTransfer_WithCheck
.type   SRAMTransfer_WithCheck, function
.set    SRAMTransfer_WithCheck, 0x080D184D

@.global GetUnitStruct
@.type   GetUnitStruct, function
@.set    GetUnitStruct, 0x08019431

.global ClearUnits
.type   ClearUnits, function
.set    ClearUnits, 0x080177C5

.global ClearConvoyItems
.type   ClearConvoyItems, function
.set    ClearConvoyItems, 0x08031509

.global ClearGlobalTriggerState
.type   ClearGlobalTriggerState, function
.set    ClearGlobalTriggerState, 0x08083D19

@.global ComputeExpFromBattle
@.type   ComputeExpFromBattle, function
@.set    ComputeExpFromBattle, 0x0802C535

.global GetUnitByCharId
.type   GetUnitByCharId, function
.set    GetUnitByCharId, 0x0801829D

.global GetUnitStructFromEventParameter
.type   GetUnitStructFromEventParameter, function
.set    GetUnitStructFromEventParameter, 0x0800BC51

.global __divsi3
.type   __divsi3, function
.set    __divsi3, 0x80D18FD

.global opinfoview_DrawChar
.type   opinfoview_DrawChar, function
.set    opinfoview_DrawChar, 0x80B2A15

.global opinfoview_Loop1
.type   opinfoview_Loop1, function
.set    opinfoview_Loop1, 0x80B2F75


@ RAM locations
.global Slot0,
.set		Slot0, 0x030004B8

.global Slot2,
.set		Slot2, 0x030004C0

@.global gSomeWMEventRelatedStruct
@.set    gSomeWMEventRelatedStruct, 0x03005280

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

.global FadeInOutByte
.set    FadeInOutByte, 0x030030E8

.global palette_buffer
.set    palette_buffer, 0x020228A8

.global ChapterData
.set    ChapterData, 0x0202BCF0

@.global VRAMaddress
@.set    VRAMaddress, 0x06010000

.global gGenericBuffer
.set    gGenericBuffer, 0x02020188

@.global whole_OAM_buffer
@.set    whole_OAM_buffer, 0x03003140

.global SinTable
.set    SinTable, 0x080D751C

.global CosTable
.set    CosTable, 0x080D759C

@.global gUnitArray
@.set    gUnitArray, 0x0202BE4C

.global LocScreenBlockBG0
.set    LocScreenBlockBG0, 0x02024CA8

.global LocScreenBlockBG1
.set    LocScreenBlockBG1, 0x02024CAC

.global LocScreenBlockBG2
.set    LocScreenBlockBG2, 0x02024CB0

.global LocScreenBlockBG3
.set    LocScreenBlockBG3, 0x02024CB4

@.global TextParams
@.set    TextParams, 0x02028E70

.global KeyStatusBuffer
.set    KeyStatusBuffer, 0x02024CC0

.global FortsMatsData
.set    FortsMatsData, 0x03003B48

.global PuzzleWeaponFlags
.set    PuzzleWeaponFlags, 0x03003BFE

.global gpReadSramFast
.set    gpReadSramFast, 0x030067A0


@ Other locations
.global REG_VCOUNT
.set    REG_VCOUNT, 0x04000006


@ ROM locations, I'm assuming these aren't repointed. So make changes if you have repointed these!
@.global unit_address
@.set    unit_address, 0x08803D64

@.global icon_pointer
@.set    icon_pointer, 0x080036B4

@.global OAMREGS_Count_1
@.set    OAMREGS_Count_1, 0x08590F7C

.global ItemPalette
.set    ItemPalette, 0x085996F4


@ Procs
@.global Procs_BG3HSlide
@.set    Procs_BG3HSlide, 0x08A006E4


@ Graphics
@.global ReliefBG
@.set    ReliefBG, 0x08B12DB4

@.global ReliefPal
@.set    ReliefPal, 0x08B175CC

@.global Arrows
@.set    Arrows, 0x08A1C704

@.global ArrowsPalette
@.set    ArrowsPalette, 0x08A1A084

@.global BattlePlateaus
@.set    BattlePlateaus, 0x08EE0008

@.global PirateSheet
@.set    PirateSheet, 0x08DB7C20

@.global FundsBlock
@.set    FundsBlock, 0x08A1B1FC

@.global FundsPalette
@.set    FundsPalette, 0x08A1B638
