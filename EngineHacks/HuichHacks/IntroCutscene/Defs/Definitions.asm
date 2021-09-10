@ Definitions

@ Functions
.global PushToSecondaryOAM
.type   PushToSecondaryOAM, function
.set    PushToSecondaryOAM, 0x08002BB9

.global SetBackgroundTileDataOffset
.type   SetBackgroundTileDataOffset, function
.set    SetBackgroundTileDataOffset, 0x08000FDD

.global SetBackgroundMapDataOffset
.type   SetBackgroundMapDataOffset, function
.set    SetBackgroundMapDataOffset, 0x08001005

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

.global BLDCNT1stTargets
.type   BLDCNT1stTargets, function
.set    BLDCNT1stTargets, 0x08001ED1

.global BLDCNT2ndTargets
.type   BLDCNT2ndTargets, function
.set    BLDCNT2ndTargets, 0x08001F0D

.global Find6C
.type   Find6C, function
.set    Find6C, 0x08002E9D

.global New6C
.type   New6C, function
.set    New6C, 0x08002C7D

.global NewBlocking6C
.type   NewBlocking6C, function
.set    NewBlocking6C, 0x08002CE1

.global Break6CLoop
.type   Break6CLoop, function
.set    Break6CLoop, 0x08002E95

.global Delete6C
.type   Delete6C, function
.set    Delete6C, 0x08002D6D

.global GetGameClock
.type   GetGameClock, function
.set    GetGameClock, 0x08000D29

.global EnablePaletteSync
.type   EnablePaletteSync, function
.set    EnablePaletteSync, 0x08001F95

.global Goto6CLabel
.type   Goto6CLabel, function
.set    Goto6CLabel, 0x08002F25

.global NextRN_N
.type   NextRN_N, function
.set    NextRN_N, 0x08000C81

.global SetNextGameActionId
.type   SetNextGameActionId, function
.set    SetNextGameActionId, 0x08009F51

.global FillTileRect
.type   FillTileRect, function
.set    FillTileRect, 0x080D74A1

.global SetPrimaryHBlankHandler
.type   SetPrimaryHBlankHandler, function
.set    SetPrimaryHBlankHandler, 0x08001DD9

@.global ClearPrimaryHBlankHandler
@.type   ClearPrimaryHBlankHandler, function
@.set    ClearPrimaryHBlankHandler, 0x08008B25

.global Switch_BGM
.type   Switch_BGM, function
.set    Switch_BGM, 0x080024E5

.global AcquirePlayingBGM
.type   AcquirePlayingBGM, function
.set    AcquirePlayingBGM, 0x08002259

.global SetupBackgrounds
.type   SetupBackgrounds, function
.set    SetupBackgrounds, 0x08001B59

.global FadePalette
.type   FadePalette, function
.set    FadePalette, 0x080CBEF9

.global SkipLogosCheck
.type   SkipLogosCheck, function
.set    SkipLogosCheck, 0x080CBDD9


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

.global FadeInOutByte
.set    FadeInOutByte, 0x030030E8

.global palette_buffer
.set    palette_buffer, 0x020228A8

.global gGenericBuffer
.set    gGenericBuffer, 0x02020188

.global whole_OAM_buffer
.set    whole_OAM_buffer, 0x03003140

.global SinTable
.set    SinTable, 0x080D751C

.global CosTable
.set    CosTable, 0x080D759C

.global WMPaletteRAM
.set    WMPaletteRAM, 0x020087A0


@ Other locations
.global REG_VCOUNT
.set    REG_VCOUNT, 0x04000006


@ ROM locations, I'm assuming these aren't repointed. So make changes if you have repointed these!
.global OAM_64x32
.set    OAM_64x32, 0x08590F94

.global OAM_64x64
.set    OAM_64x64, 0x08590F5C


@ Procs
.global Procs_FadeOutBlack_Alt
.set    Procs_FadeOutBlack_Alt, 0x0859A0A4


@ Graphics
.global WMTiles
.set    WMTiles, 0x08A83364

.global WMPalette
.set    WMPalette, 0x08A95FE4

.global EyesTiles
.set    EyesTiles, 0x08AF2654

.global EyesPalette
.set    EyesPalette, 0x08AF310C

.global PressStartPal
.set    PressStartPal, 0x08AADB68
