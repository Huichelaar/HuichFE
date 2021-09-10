@ Definitions

@ Functions
.global SetBackgroundTileDataOffset
.type   SetBackgroundTileDataOffset, function
.set    SetBackgroundTileDataOffset, 0x8000FDD

.global SetBackgroundMapDataOffset
.type   SetBackgroundMapDataOffset, function
.set    SetBackgroundMapDataOffset, 0x8001005

.global UnLZ77Decompress
.type   UnLZ77Decompress, function
.set    UnLZ77Decompress, 0x8012F51

.global CopyToPaletteBuffer
.type   CopyToPaletteBuffer, function
.set    CopyToPaletteBuffer, 0x8000DB9

.global Break6CLoop
.type   Break6CLoop, function
.set    Break6CLoop, 0x8002E95

.global New6C
.type   New6C, function
.set    New6C, 0x8002C7D

.global NewBlocking6C
.type   NewBlocking6C, function
.set    NewBlocking6C, 0x8002CE1

.global Delete6C
.type   Delete6C, function
.set    Delete6C, 0x8002D6D

.global EnablePaletteSync
.type   EnablePaletteSync, function
.set    EnablePaletteSync, 0x8001F95

.global LoadChapterMapGfx
.type   LoadChapterMapGfx, function
.set    LoadChapterMapGfx, 0x801990D

.global FadeInPalette
.type   FadeInPalette, function
.set    FadeInPalette, 0x80712B1

.global GetBattleAnimArenaFlag
.type   GetBattleAnimArenaFlag, function
.set    GetBattleAnimArenaFlag, 0x805B029

.global SetPrimaryHBlankHandler
.type   SetPrimaryHBlankHandler, function
.set    SetPrimaryHBlankHandler, 0x8001DD9

.global EnableBackgroundSyncById
.type   EnableBackgroundSyncById, function
.set    EnableBackgroundSyncById, 0x8001FBD

.global EnableBackgroundSyncByMask
.type   EnableBackgroundSyncByMask, function
.set    EnableBackgroundSyncByMask, 0x8001FAD

.global DrawBattleBG_Low
.type   DrawBattleBG_Low, function
.set    DrawBattleBG_Low, 0x8075AB5

.global SetSomethingSpellFxToTrue
.type   SetSomethingSpellFxToTrue, function
.set    SetSomethingSpellFxToTrue, 0x8055161

.global ClearBG1Setup
.type   ClearBG1Setup, function
.set    ClearBG1Setup, 0x8055179

.global GetSomeAISRelatedIndexMaybe
.type   GetSomeAISRelatedIndexMaybe, function
.set    GetSomeAISRelatedIndexMaybe, 0x805A311

.global GetSomeBoolean
.type   GetSomeBoolean, function
.set    GetSomeBoolean, 0x805A185

.global PrepLanceOBJ
.type   PrepLanceOBJ, function
.set    PrepLanceOBJ, 0x805C88D

.global StoreSpellTilesOBJ,
.type   StoreSpellTilesOBJ, function
.set    StoreSpellTilesOBJ, 0x80557D9

.global StoreSpellTilesBG,
.type   StoreSpellTilesBG, function
.set    StoreSpellTilesBG, 0x805581D

.global StoreSpellPaletteOBJ,
.type   StoreSpellPaletteOBJ, function
.set    StoreSpellPaletteOBJ, 0x8055801

.global StoreSpellPaletteBG,
.type   StoreSpellPaletteBG, function
.set    StoreSpellPaletteBG, 0x8055845

.global GetAISSubjectID
.type   GetAISSubjectID, function
.set    GetAISSubjectID, 0x805A16D

.global getTargetAIS_void_int_a1
.type   getTargetAIS_void_int_a1, function
.set    getTargetAIS_void_int_a1, 0x805A2B5

.global MoveBattleCameraOnto
.type   MoveBattleCameraOnto, function
.set    MoveBattleCameraOnto, 0x80533D1

.global ThisMakesTheHPInSpellAnimGoAway
.type   ThisMakesTheHPInSpellAnimGoAway, function
.set    ThisMakesTheHPInSpellAnimGoAway, 0x8055279

.global StartEfxCriticalEffect
.type   StartEfxCriticalEffect, function
.set    StartEfxCriticalEffect, 0x806C71D

.global SetSomethingSpellFxToFalse
.type   SetSomethingSpellFxToFalse, function
.set    SetSomethingSpellFxToFalse, 0x805516D

.global AIS_Free
.type   AIS_Free, function
.set    AIS_Free, 0x8005005

.global PrepAIS
.type   PrepAIS, function
.set    PrepAIS, 0x8055555

.global SomeSFERoutine
.type   SomeSFERoutine, function
.set    SomeSFERoutine, 0x80729A5


@ RAM locations
.global gpDISPCNTbuffer
.set    gpDISPCNTbuffer, 0x3003080

.global gpBG0MapBuffer
.set    gpBG0MapBuffer, 0x2022CA8

.global gpBG1MapBuffer
.set    gpBG1MapBuffer, 0x20234A8

.global gpBG2MapBuffer
.set    gpBG2MapBuffer, 0x2023CA8

.global gpBG3MapBuffer
.set    gpBG3MapBuffer, 0x20244A8

.global palette_buffer
.set    palette_buffer, 0x20228A8

.global ChapterData
.set    ChapterData, 0x202BCF0

.global KeyStatusBuffer
.set    KeyStatusBuffer, 0x2024CC0

.global CurrentBattleBG
.set    CurrentBattleBG, 0x203E0FE

.global BattleInitialHit
.set    BattleInitialHit, 0x203E100

.global AnimDistance
.set    AnimDistance, 0x203E120

.global SomeBGBuffer
.set    SomeBGBuffer, 0x20145C8

.global gSomeSubAnim6CCounter
.set    gSomeSubAnim6CCounter, 0x201774C

.global RangeVal,
.set    RangeVal, 0x203A4D6


@ Other locations
.global REG_VCOUNT
.set    REG_VCOUNT, 0x4000006


@ Procs
.global Procs_efxTeyari
.set    Procs_efxTeyari, 0x85D5128

.global Procs_efxTeonoSE
.set    Procs_efxTeonoSE, 0x85D50D8
