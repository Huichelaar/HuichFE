Stuff that isn't mentioned here is stuff that comes with the FE8U ROM, stuff I made, or other stuff I've forgotten to acknowledge. In the latter case, please tell me if you notice anything is missing.

# SkillSystem

The buildfile I started with is the [SkillSystem's](https://github.com/FireEmblemUniverse/SkillSystem_FE8).
SkillSystem credits from 12/01/2021 (day/month/year).
Note: This list is incomplete and insufficiently organized.

## Skill contributors

- Tequila
- Rossendale
- StanH
- Leonarth
- 2WB
- Teraspark
- Darrman
- SD9k
- Kao
- blademaster
- Snakey1
- Zeta
- Kirb
- Sme
- Ganzap

## Other

- 7743: various bugfixes
- RobertFPY, Pikmin1211, and Snakey1: Str/Mag Split Finalization

## Icons

- Monkeybard, Black Mage
- Blaze: Stances
- vlak: Drives
- Pikmin1211: Miscellaneous
- 2WB: Miscellaneous
- Zaim: Indoor March
- Reds: Quick Riposte

## Special thanks

Special thanks go to:
  - Circleseverywhere, for creating and releasing the original system.
  - Crazycolorz5, for debuffs, freeze and Dragon's Veins.
  - Primefusion, for the test map.
  - Kirb, for implementing the Str/Mag split into FE8 based off Tequila's original FE7 version.


# ASMC

  - 7743 for the SendAllTransporter, SilentGiveItem and SilentGiveGold patches.

# Tools

## [Event Assembler](https://feuniverse.us/t/event-assembler/1749)

These credits were probably written by Nintenlord. Credits to
  - Nintenlord for making this.
  - Kate/Klo/whatever for writing FE6 CHAR support
  - Everyone who submitted event codes for this, especially
    Fire Blazer and flyingace24.
  - markyjoe1990 for FE7 event template.
  - Mariobro3828 for FE7 world map definition values and
    for making the EAstdlib Macro and Command List.txt.
  - Arch for making code I can use to debug this app, 
    for his tutorials and his FE6 template.
  - Ryrumeli for telling me the ASM routine that handles
    the events in FE8.
  - Omni for reporting errors with FE6 disassembly script.
  - Camtech075/Cam/Kam for making FE8 template.
  - Everyone who uses this and/or reports bugs and/or gives
    feedback.
    
With additional credits to:
  - Vennobennu/Venno, for identifying many FE8 codes, and
    making many of the codes that deal with the world map.
  - Gryz, for aiding a ton in all the AI research done on
    FE7, which was a boon in developing the new AI model.
  - Circleseverywhere, for inspiring some of the design
    decisions in revamping EA. Also checking my work, and
    making several macros.
  - Camdar/CT075 and Zahlman, for inspiring a UNIX-like
    design for #incext.

## Other tools

- Nightmare modules taken from [feshrine](http://www.feshrine.net/hacking/nightmare.php) and FEU's [SkillSystem](https://github.com/FireEmblemUniverse/SkillSystem_FE8) buildfile:
  - ChapterDefinitions by SpyroDi, Nintenlord.
  - MapEvents & MapCutsceneEvents by Vennobennu.
  - BattlePalettes by flyingace24.
  - Characters by SpyroDi.
  - BossQuotes by flyingace24.
  - DeathQuotes by flyingace24.
  - EscapeQuotes by Sme.
  - SupportConvos by Icy Toast.
  - CharLevelUpSkills by circleseverywhere.
  - ClassLevelUpSkills by circleseverywhere.
  - PersonalSkills by circleseverywhere.
  - PaletteAssociations & PaletteAssociations2 by Zeld and Zephyr.
  - Classes by SpyroDi.
  - ClassLevelCaps by Sme.
  - ModularEXPClasses by Snakey1.
  - MovingMapSprites by Nintenlord.
  - StandingMapSprites by Nintenlord.
  - WalkingSounds by Circleseverywhere.
  - IER nightmare modules by Teraspark.
  - PromotionItems by Teraspark.
  - StaffAITable by Teraspark.
  - ItemEffectTable by Circleseverywhere.
  - Items by SpyroDi.
  - ItemTargetTable by Circleseverywhere.
  - ItemUsabilityTable by Circleseverywhere.
  - SpellAssociationTable by Zeld, Nintenlord and Vennobennu.
  - ModularPrebattleSkills by Vesly.
  - WorldMapNodes by jjl2357 and Vennobennu.
  - WorldMapRoads by Vennobennu.
- 7743 for [FEBuilderGBA](https://github.com/FEBuilderGBA/FEBuilderGBA), which provides a lot of documentation, a graphics editor, a means to insert battle animations intuitively as well as an LZ77 compressor and decompressor.
- Alusq for [Advanced Music Installer](https://feuniverse.us/t/advanced-music-installer/6450).
- Bregalad for [GBAMusRiper](http://www.romhacking.net/utilities/881/).
- cearn/Jasper Vijn for [usenti](https://www.coranac.com/projects/usenti/).
- Circleseverywhere for
  - [Animation Assembler](https://feuniverse.us/t/fe7-8-animation-assembler-convert-feditor-format-for-insertion-with-ea/1880).
  - [S2EA](https://feuniverse.us/t/insert-music-using-event-assembler/1832).
  - [textprocess](https://feuniverse.us/t/text-processor-for-use-with-ea-v10-1-updated-to-v2-1/1776).
  - [TMX2EA](https://feuniverse.us/t/tmx2ea-v2-0-released-insert-tiled-maps-using-event-assembler/1830).
- Crazycolorz5 for
  - [ColorzCore](https://feuniverse.us/t/colorzcore/3970).
  - EAstdlib.
  - [ParseFile](https://feuniverse.us/t/v2-0-v0-3-another-text-parser-by-crazycolorz5/1641).
  - [Png2Dmp](https://feuniverse.us/t/v1-0-png2dmp-by-crazycolorz5/1764).
  - [Portrait Formatter](https://feuniverse.us/t/v1-1-portrait-formatter-by-crazycolorz5/1713).
- David Capello for [Aseprite](https://www.aseprite.org/).
- Don Ho for [Notepad++](https://notepad-plus-plus.org/).
- Endrift/Vicki Pfau for [mGBA](https://mgba.io/).
- ipatix/Michael Panzlaff for [midi2agb](https://github.com/ipatix/midi2agb).
- Kawa and DJ ßouché for [Sappy](https://github.com/Touched/Sappy).
- kuzu for [Sekaiju](https://openmidiproject.osdn.jp/Sekaiju_en.html).
- kxu, PokemonHacker, denopqrihg for [VBArr](https://github.com/TASVideos/vba-rerecording).
- Maël Hörz for [HxD](https://mh-nexus.de/en/hxd/).
- magical/Andrew Ekstedt for [compress.exe](https://github.com/magical/nlzss).
- Microsoft for [MSPaint](https://support.microsoft.com/en-us/windows/get-microsoft-paint-a6b9578c-ed1c-5b09-0699-4ed8115f9aa9).
- Mike, loveemu and Sound Test: 774 for [VGMTrans](https://github.com/vgmtrans/vgmtrans).
- Nintenlord for
  - EAstdlib.
  - [Event Assembler](https://feuniverse.us/t/event-assembler/1749), as detailed previously.
- Nocash/Martin Korth for [No$gba debugger](https://problemkaputt.de/gba.htm).
- Olivier Lapicque for [OpenMPT](https://openmpt.org/).
- Snakey1 for
  - [Table Manager](https://feuniverse.us/t/snakes-pit-of-asm-and-other-stuff/3627/78).
  - [tmx2tsa](https://feuniverse.us/t/snakes-pit-of-asm-and-other-stuff/3627/84).
- StanH for
  - EAstdlib.
  - [Lyn](https://feuniverse.us/t/ea-asm-tool-lyn-elf2ea-if-you-will/2986).
  - [Proc tree lua script](https://github.com/StanHash/GBAFE-LuaUtilities).
- The Document Foundation for [LibreOfficeCalc](https://www.libreoffice.org/discover/calc/).
- Thorbjørn Lindeijer and [many other contributors](https://www.openhub.net/p/tiled-qt/contributors/summary) for [Tiled](https://www.mapeditor.org/).

# Documentation

- All the documentation in the Unified FE Hacking [dropbox](https://www.dropbox.com/sh/zymc1h221nnxpm9/AAAruCnsQf574gY_Yi7s1KP0a?dl=0). Check out the [DOC INDEX](https://www.dropbox.com/sh/3m004vettv9g3og/AACVcOCwSb6EaaOzFFXe1feKa/Stan/_Notes?dl=0&preview=DOC+INDEX.txt&subfolder_nav_tracking=1). Thanks to Tequila, StanH, Hextator, Crazycolorz5, Teraspark & Zane for all the documentation they've submitted to this.
- Some more of StanH's documentation on [Github](https://github.com/StanHash/DOC).
- FEU Documentation.
  - [AI documentation](https://feuniverse.us/t/fe7-the-official-ai-documentation-thread/348) and the [FE8 equivalent](https://feuniverse.us/t/fe8-the-official-ai-documentation-thread/483). Thanks to Crazycolorz5, Tequila, Vennobennu/Venno and Arch.
  - [Primefusion's mapping tutorial](https://feuniverse.us/t/archived-primefusions-mapping-tutorial/7868/1).
  - [Nintenlord's Inserting maps and map changes with Tiled tutorial](https://feuniverse.us/t/inserting-maps-and-map-changes-with-tiled/106).
  - [Zoramine's Mountains guide](https://feuniverse.us/t/zoramines-bucket-of-many-random-things/6123/84).
  - [Darrman's Ins and Outs of Text Editing tutorial](https://feuniverse.us/t/the-ins-and-outs-of-text-editing/6820/1).
  - [EID/Flag/Event ID Glossary](https://feuniverse.us/t/fe8-eid-flag-event-id-glossary/4815). Thanks to feels, Arch, Snakey1, Sme, P33rl355, Zane, StanH, 7743, 
  - [Sme's Skill System, and You tutorial](https://feuniverse.us/t/the-skill-system-and-you-maximizing-your-usage-of-fe8s-most-prolific-bundle-of-wizardry/8232).
  - [Sme's EA Eventing Guide](https://feuniverse.us/t/fe8-ea-eventing-guide/7080).
  - [Tequila's Assembly for dummies by dummies tutorial](https://feuniverse.us/t/gbafe-assembly-for-dummies-by-dummies/3563).
  - [StanH's Procs documentation](https://feuniverse.us/t/guide-doc-asm-procs-or-6cs-coroutines-threads-fibers-funky-structs-whatever/3352/1).
- [Tonc](https://www.coranac.com/tonc/text/toc.htm) by cearn/Jasper Vijn.
- [GBATEK](http://problemkaputt.de/gbatek.htm) by Nocash/Martin Korth.
- [ARM Thumb Reference](https://re-eject.gbadev.org/files/thumbref.pdf) by re-Eject.

# Music

Songs used:
- Fire Emblem Fates by Intelligent Systems.
  - Desire Below. Composed by Hiroki Morishita, arranged by Libera. I added some extra instruments to the MIDI.
- Fire Emblem The Sacred Stones by Intelligent Systems.
  - The entire OST is in the ROM this is a patch to.
- Others.
  - Knock sfx. Smethlyn gave this one to me.
- Pokémon Black (and White) by Game Freak.
  - SEQ_BGM_DIVING.
- Runescape by Jagex. Pretty sure all of these were composed and arranged by Ian Taylor.
  - Principality.
- Yu-Gi-Oh Reshef of Destruction by Konami.
  - song008.
  - song023.
  - sfx 54, 55, 57, 58.
  - A hybrid of song381 and song382.
  - song410, and a modified version that skips the intro.
  - song500.
- Yu-Gi-Oh The Sacred Cards by Konami.
  - song027.
  - song033.

# Graphics

## Battle animations

- Supplier by JonoTheRed, Huichelaar.
- MercenaryM by SALVAGED.
- MercenaryF by SALVAGED, JeyTheCount.
- Cleric by Flasuban, Eldritch Abomination.
- Priest by Flasuban, Eldritch Abomination.
- HatlessMageM by GabrielKnight. Not in use atm.
- SoldierM by Alusq.
- SoldierF by Alusq, Maiser6, JeyTheCount.
- FighterF by Black Mage.
- ArcherM by Flasuban, DerTheVaporeon.
- ArcherF by Flasuban, DerTheVaporeon.
- CavalierM by SALVAGED.
- CavalierF by Pikmin1211, Maiser6, SALVAGED.
- WyvernKnight by St Jack.
- Knight by FPZero.
- PegasusKnight by Flasuban.

## Portraits

- SSHX~28 by SSHX.
- GenericPretsel~Cosimo by GenericPretsel.
- Nickt~Vette by Nickt
- Huichelaar~Splice1_1 by Huichelaar
- Capibarainspace~2 by Capibarainspace
- Zmr~2 by Zmr
- DragonLuca~2 by DragonLuca
- AmBrosiac~Brava by AmBrosiac
- AmBrosiac~Faustosilva by AmBrosiac

## Class Cards

- Supplier by N426.
- Summoner by Orihara_Saki.
- MercenaryF by L95.
- Cleric by flasuban.
- MonkF by RobertFPY.
- MonkM by RobertFPY, Blademaster.
- -HatlessMageM by RobertFPY. Unused atm.
- MageF by Unknown.
- ShamanF by Unknown.
- SoldierF by Intelligent Systems, flasuban.
- FighterF by Jj09, HyperGammaSpaces.
- ArcherM by DerTheVaporeon.
- ArcherF by DerTheVaporeon.
- MyrmidonF by L95.
- CavalierF by RobertFPY, Pikmin.
- CavalierM by RobertFPY.
- WyvernKnight by IS, MeatOfJustice, Pikmin, flasuban.

## Map Sprites

- Supplier by N426.
- MercenaryF by Agro.
- Priest by flasuban.
- Cleric by flasuban.
- MonkF by Teraspark.
- -HatlessMageM by Pikmin1211. Unused atm.
- ShamanF by Intelligent Systems.
- SoldierF by Rexacuse, Peerless, Alusq, WarPath.
- SoldierM by Rexacuse, Peerless, Alusq.
- FighterF by Alusq.
- FighterM by Alusq.
- ArcherM by DerTheVaporeon.
- ArcherF by DerTheVaporeon.
- CavalierM by SALVAGED.
- CavalierF by SALVAGED, Pikmin.
- WyvernKnight by IS, ArcaneEli, Blood, Yikes!

## Items

- Pouakai by GabrielKnight.
- Moehau by GabrielKnight.
- Mahuika by GabrielKnight.
- Whakatau by GabrielKnight.
- Maero by GabrielKnight.
- Tangaroa by GabrielKnight.
- Manaia by GabrielKnight.
- Rehua by GabrielKnight.
- Gambit (skeleton) by Intelligent Systems. The skulls are from Fire Emblem: The Sacred Stones' bonewalker animations.
- Concoction by 2WB.

## Materials

- Coal from Bomberman Jetters Densetsu no Bomberman by Hudson Soft, ripped by Garamonde.
- Copper from Bomberman Jetters Densetsu no Bomberman by Hudson Soft, ripped by Garamonde.
- Lime from Bomberman Jetters Densetsu no Bomberman by Hudson Soft, ripped by Garamonde.
- Iron from Bomberman Jetters Densetsu no Bomberman by Hudson Soft, ripped by Garamonde.
- Wood made by kb.
- Magic wood is a simple recolour I made of the wood icon by kb.
- Spice from Minecraft by Mojang Studios, ripped by WizToad.
- Gunpowder from Minecraft by Mojang Studios, ripped by WizToad.
- Hemp made by Zarg.
- Belladonna made by Beansy.
- Laurel from Minecraft by Mojang Studios, ripped by WizToad.
- Topaz made by GabrielKnight.
- Ruby made by GabrielKnight.
- Emerald made by GabrielKnight.
- Diamond made by GabrielKnight.
- Milk from Fire Emblem Fates by Intelligent Systems, ripped by Henrai.
- Cabbage from Fire Emblem Fates by Intelligent Systems, ripped by Henrai.
- Grape from Fire Emblem Fates by Intelligent Systems, ripped by Henrai.
- Fish from Fire Emblem Fates by Intelligent Systems, ripped by Henrai.
- Wheat from Fire Emblem Fates by Intelligent Systems, ripped by Henrai.
- Meat from Boktai 3 / Shin Bokura no Taiyou by Konami, ripped by Greiga Master.
- Down from Radiant Historia by Atlus & Headlock, ripped by redblueyellow.
- Hide from Radiant Historia by Atlus & Headlock, ripped by redblueyellow.
- Wool from Radiant Historia by Atlus & Headlock, ripped by redblueyellow.
- Oil made by GabrielKnight.
- Rune from Radiant Historia by Atlus & Headlock, ripped by redblueyellow.
- Flax made by GabrielKnight.

## Tilesets

- FF5Cave from Final Fantasy 5 by Square. WAve prepared the tileset for FEGBA.
- Fields1 & Fields2 by:
  - ZoramineFae.
  - For tileset animation, Flasuban contributed a redux of the standard water flow, as he broke it in the first place with his Thracia water.
  - Cheers to Peer for constantly telling me (ZoramineFae) that the mansion looked too dark.
  - Two of the palettes in this batch, the Sunset and Nighttime ones, are almost completely ripped from two of JellyUnicorn’s fantastic palettes.
- Village by N426, ZoramineFae and Venno.

## Other

- Battle Backgrounds are all from Fire Emblem New Mystery of the Emblem by Intelligent Systems, ripped by Previous. The Placeholder BG is using Monotype Corsiva font by Patricia Saunders.
- The chapter introduction animation uses several assets.
  - The crystals are from Final Fantasy (Dawn of Souls) by Square Enix, ripped by Ryan914
  - The relief is from Yu-Gi-Oh!: Reshef of Destruction by Konami, submitted to the spriters resource by Urathros.
  - The Title background is modified from Pokémon Platinum Version by Game Freak, ripped by DRAGOON.
- The Cave conversation background is from Fire Emblem 6 by Intelligent Systems. I'm using a more greenish blue palette.
- The game intro uses several assets.
  - The FEU logo is a simple downsize of the one made by Fatih.
  - The picture right after is one I made of something I designed and built with Lego. I sometimes use it as avatar for forums & the like.
  - The font of the text is Monotype Corsiva by Patricia Saunders.
  - The Judge is from Phoenix Wright: Ace Attorney: Justice for All by Capcom, ripped by Shoda & revised by TSP184.
  - The crystals are the same ones as in the chapter introduction.
  - I ripped the whirlpool background from Kirby & The Amazing Mirror by HAL Laboratory.
  - I made the world map by splicing together parts of Magvel from Fire Emblem: The Sacred Stones by Intelligent Systems.
  - The moon is from Kirby: Nightmare in Dream Land by HAL Laboratory, ripped by Jackster.
  - I ripped the clouds from Planet Monsters by Planet Interactive.
  - The title is modified from Fire Emblem: The Sacred Stones by Intelligent Systems.
  - The subtitle card is from Charlie Blasts Territory by Realtime Associates, ripped by Mr. C.
  - The subtitle font is modified from Castlevania Chronicles by Konami, ripped by SMITHYGCN.
- Status Screen assets.
  - The portraitbox is modified from Fire Emblem (7)'s by Intelligent Systems.
  - The moving map sprite plateau is from Fire Emblem (7) by Intelligent Systems.
  - I made the page background and the equipment box graphics.
- The background used by the StatScreen, on the prep screen, when checking status, etc. is modified from Fire Emblem: The Sacred Stones by Intelligent Systems.
- The new UI buttons were made by GabrielKnight. I made 32x16 "Start" & "Select" variants based on these.
- The puzzle background was taken from Yu-Gi-Oh!: Reshef of Destruction by Konami, submitted to the spriters resource by Urathros. The cursor and sound effects are also from Yu-Gi-Oh!: Reshef of Destruction. The 32x32 weapon icons and arrows used by the tutorial diagram were made by GabrielKnight.
- Fortresses.
  - The tree being chopped down in the fort menu was made by Obsidian Daddy.
  - The other assets displayed in that animation (pirate, plateau) are in vanilla FE8, so credit goes 
  to Intelligent Systems for that. I Frankenstein'd the "MATERIALS" and "FORTS" displayed in the fortmenu from vanilla FE8 menu UI, so credit goes to Intelligent Systems for that too.
- In-game credits.
  - The font and palettes used by the title cards were taken and modified from FE7U by Intelligent Systems.
  - I'm also using Intelligent Systems' FE8U's classreel font and palette in between the title cards.
  - Authornames were written in Monotype Corsiva which is a font by Patricia Saunders.
  - The mode7 fields map is using a subset of the Revamped Fields tileset and was designed by Retrogamer.

# Hacks

- [Cannot Crit](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/master/EngineHacks/ExternalHacks/CannotCrit) by Sme.
- [ChangeTileName](https://github.com/FEBuilderGBA/FEBuilderGBA/tree/master/FEBuilderGBA/bin/Debug/config/patch2/FE8U/ChangeTileName) by 7743.
- [battle_changer](https://github.com/aera-ngmansion/FE8/tree/master/battle_changer) by aera. I used 7743's FEBuilder patch to figure out where to insert stuff in FE8U.
- [ContinueBattleBGM](https://github.com/FEBuilderGBA/FEBuilderGBA/tree/c83c13930d7c5e5ef104faa6f8346d0edd63776e/FEBuilderGBA/bin/Debug/config/patch2/FE8U/ContinueBattleBGM) by 7743.
- [Escape-Arrive](https://feuniverse.us/t/smes-asm-and-miscellany/4445) by Sme. Not in use atm.
- [New_CHAI](https://feuniverse.us/t/teqs-minor-assembly-shenanigans/1655/105) by Tequila.
- [Text Engine Rework](https://feuniverse.us/t/teqs-minor-assembly-shenanigans/1655/118) by Tequila.
- [Freeze](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/master/EngineHacks/ExternalHacks/Freeze) by Crazycolorz5.
- [Gendered Text](https://feuniverse.us/t/snakes-pit-of-asm-and-other-stuff/3627/79) by Snakey1.
- [Modular Exp](https://feuniverse.us/t/snakes-pit-of-asm-and-other-stuff/3627/21) by Snakey1.
- [Narrow Font](https://feuniverse.us/t/scraizas-crazy-asm/5624/2) by Scraiza. Not in use atm.
- [Portrait Selection](https://feuniverse.us/t/snakes-pit-of-asm-and-other-stuff/3627/17) by Snakey1.
- [Proper Range Getters](https://github.com/StanHash/FE8UASMHax/tree/master/ProperRangeGetters). by Stan. Not in use atm.
- [Raid](https://feuniverse.us/t/snakes-pit-of-asm-and-other-stuff/3627/2) by Snakey1.
- [Reaver Split](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/master/EngineHacks/ExternalHacks/ReaverSplit) by Crazycolorz5 and Sme. Not in use atm.
- [Skip Difficulty](https://feuniverse.us/t/fe8-skip-the-difficulty-selection-defaulting-to-a-set-one/2927) by StanH.
- [Status Weapons](https://feuniverse.us/t/smes-asm-and-miscellany/4445) by Sme.
- [Strength/Magic Split](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/master/EngineHacks/ExternalHacks/StrMagSplit) by Tequila, Kirb, RobertFPY, Pikmin1211, and Snakey.
- [Trap Rework](https://feuniverse.us/t/smes-asm-and-miscellany/4445) by Sme.
- [Unlock Chest](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/master/EngineHacks/ExternalHacks/UnlockChest) by Gamma and incorporated by Snek. Not in use atm.
- [Weapon Lock Array](https://feuniverse.us/t/fe7-fe8-array-based-weapon-lock-system/197) by Vennobennu and rewritten by Sme. Not in use atm.
- [CalcLoops](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/master/EngineHacks/Necessary/CalcLoops) by multiple people.
  - CanUnitDoubleCalcLoop by Sme.
  - EXPCalcLoop by Snek.
  - HPRestorationCalcLoop by Sme.
  - MugLoadingCalcLoop by Snek.
  - PostActionCalcLoop by Snek.
  - PreBattleCalcLoop by Circleseverywhere.
  - SkillActivationChanceCalcLoop by Sme.
  - WeaponUsabilityCalcLoop by Sme.
  - WTACalcLoop by Snek.
- Durability Based Items by Pikmin1211 and Sme.
- [Expanded Modular Save](https://feuniverse.us/t/fe8u-stans-asm-stuff/2376/21) by StanH and Crazycolorz5.
- [Icon Rework](https://github.com/StanHash/FE8UASMHax/tree/master/IconDisplayRedone) by StanH.
- [Item Effect Revamp](https://feuniverse.us/t/a-teraspark-of-assembly/1789/2) by Teraspark.
- [Staff Range Fix](https://feuniverse.us/t/teqs-minor-assembly-shenanigans/1655/10) by Tequila, Lord Reyson and Teraspark.
- [Modular Stat Screen](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/master/EngineHacks/Necessary/ModularStatScreen) by circleseverywhere with additions by Tequila, and probably more people too.
- [Modular Stat Getters](https://feuniverse.us/t/fe8u-stans-asm-stuff/2376) by StanH.
- [Negative Stat Boosts](https://feuniverse.us/t/fe8-negative-stat-boost-display-fix/1715/3) by Circleseverywhere.
- [Popup Rework](https://github.com/StanHash/FE-CHAX/tree/4352edfb96595e1b1932ee3930a005638084ae26/Wizardry/CPopupRework) by Stan.
- [Suspend Debuffs](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/master/EngineHacks/Necessary/SuspendDebuffs) by CrazyColorz5, with additions by circleseverywhere and Kirb.
- [Unit Action Rework](https://feuniverse.us/t/fe8u-stans-asm-stuff/2376/14) by StanH.
- [UnitMenu](https://feuniverse.us/t/assembly-is-sexciting/1654/12) by Crazycolorz5.
- [Fix Weapon Rank](https://github.com/FireEmblemUniverse/SkillSystem_FE8/blob/master/EngineHacks/Necessary/FixWpnRnk.event) by Stan.
- [StaffStatusDuration](https://discord.com/channels/144670830150811649/235253973588639747/856378055911407636) by Sme.
- [Battle Stats With Anims Off](https://feuniverse.us/t/teqs-minor-assembly-shenanigans/1655/51) by Tequila.
- [Casual Mode](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/master/EngineHacks/QualityOfLife/CasualMode) by circleseverywhere.
- [Contemporary Talk Support](https://feuniverse.us/t/contemporary-fe-style-talk-and-support-commands/912/13) by circleseverywhere.
- [Display Weapon Rank on Level Up](https://feuniverse.us/t/teqs-minor-assembly-shenanigans/1655/62) by Tequila and rewritten for PopupRework by Stan.
- [Event Add Traps](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/4b5edd28ef8a528181442c0d1b6f61543dcbec2b/EngineHacks/QualityOfLife/EventAddTraps) by circleseverywhere.
- [Event Rescue](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/4b5edd28ef8a528181442c0d1b6f61543dcbec2b/EngineHacks/QualityOfLife/EventRescue) by circleseverywhere.
- [Event Send to Convoy](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/4b5edd28ef8a528181442c0d1b6f61543dcbec2b/EngineHacks/QualityOfLife/EventSendToConvoy) by circleseverywhere.
- [Event Writer](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/4b5edd28ef8a528181442c0d1b6f61543dcbec2b/EngineHacks/QualityOfLife/EventWriter) by circleseverywhere.
- [Extended Item Icon](https://github.com/FEBuilderGBA/FEBuilderGBA/blob/c83c13930d7c5e5ef104faa6f8346d0edd63776e/FEBuilderGBA/bin/Debug/config/patch2/FE8U/SYSTEM/PATCH_SYSTEM_Extended%20to%20item%20icon%200xFE.txt) by aera.
- [HP Bars](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/4b5edd28ef8a528181442c0d1b6f61543dcbec2b/EngineHacks/QualityOfLife/HpBars) by circleseverywhere, with additions by Tequila.
- [Sound Mixer](https://feuniverse.us/t/improved-sound-mixer-by-ipatix/1107/15) by ipatix, ported to EA and FE8 by circleseverywhere.
- [Movement Arrow Hack](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/4b5edd28ef8a528181442c0d1b6f61543dcbec2b/EngineHacks/QualityOfLife/MovementArrowHack) by circleseverywhere.
- [Negative Wt/Crit Display](https://github.com/FireEmblemUniverse/SkillSystem_FE8/tree/4b5edd28ef8a528181442c0d1b6f61543dcbec2b/EngineHacks/QualityOfLife/NegativeWStatDisplay) by circleseverywhere, rewritten by stan.
- [RNG Randomizer](https://feuniverse.us/t/gba-rng-randomizer/3175) by TR143.
- [Chapter Titles as Text](https://feuniverse.us/t/fe8-chapter-titles-as-text/2065) by circleseverywhere.
- [Character and Chapter-specific battle themes](https://feuniverse.us/t/character-and-chapter-specific-battle-themes-hack/46/30) by Camdar, ported to FE8 by circleseverywhere. Not in use atm.
- [Prologue Supply](https://github.com/FireEmblemUniverse/SkillSystem_FE8/blob/4b5edd28ef8a528181442c0d1b6f61543dcbec2b/EngineHacks/QualityOfLife/PrologueSupply.event) by circleseverywhere.
- [Remove Link Arena (& Map & Transfer options)](https://github.com/FEBuilderGBA/FEBuilderGBA/blob/c83c13930d7c5e5ef104faa6f8346d0edd63776e/FEBuilderGBA/bin/Debug/config/patch2/FE8U/EXTRAMENU/PATCH_SYSTEM_Extra%20Network%20Arena%20removed.txt) by aera.
- [16 tracks/12 sounds patch](https://feuniverse.us/t/fe7-fe8-16-tracks-12-sounds-patch/895) by Brendor and Agro.
- [Fix Weak Promoted Enemies](https://feuniverse.us/t/fe7-fe8-difficulty-stat-changes/1295/4) by Gryz.
- [Hold A to speed up movement](https://feuniverse.us/t/unit-movement-speed/920) by Gryz.
- [Skip H&S Screen](https://feuniverse.us/t/fe7-8-skip-the-intro-cutscene/1225/18) by circleseverywhere.
- [Autocursor Fix](https://feuniverse.us/t/vennos-small-asm-hacks-and-notes/269/66) by Vennobennu.
- [Pierce Fix](https://feuniverse.us/t/pierce-fix/699) by Brendor.
- [Enemy Control Glitch Fix](https://feuniverse.us/t/enemy-control-glitch-fixes/1621) by Brendor.
- [Mode Coefficient EXP Fix](https://feuniverse.us/t/exp-formula-mode-coefficient-fix/27/2) by Vennobennu.
- [Fix proc names not being cleared](https://github.com/FireEmblemUniverse/SkillSystem_FE8/blob/master/EngineHacks/_FE8EssentialFixes.event#L121) by Stan.
- [Fix CAM1/CAMERA2 going out of bounds](https://github.com/FireEmblemUniverse/SkillSystem_FE8/blob/master/EngineHacks/_FE8EssentialFixes.event#L125) by Stan.
- [Don't draw portrait on item select menu if unit is generic](https://github.com/FireEmblemUniverse/SkillSystem_FE8/blob/master/EngineHacks/_FE8EssentialFixes.event#L131) by hypergammaspaces.
- [AI heatmap caching/optimization](https://feuniverse.us/t/hypergammaspaces-assorted-asm/4085/8) by hypergammaspaces.
- [Avoid No$gba crashing when decompressing something it shouldn't](https://github.com/FireEmblemUniverse/SkillSystem_FE8/blob/master/EngineHacks/_FE8EssentialFixes.event#L140) by Tequila.
- [Anti-Huffman Patch](https://feuniverse.us/t/fe7-fe8-anti-huffman-patch-ea-style/1703) by Hextator and Nintenlord.
- [Animation C01 hack](https://github.com/FireEmblemUniverse/SkillSystem_FE8/blob/master/EngineHacks/_FE8EssentialFixes.event#L174) by Hextator.
- [Animation C48 hack](https://github.com/FireEmblemUniverse/SkillSystem_FE8/blob/master/EngineHacks/_FE8EssentialFixes.event#L182) by Hextator.
- [Slayer and Effectiveness Rework](https://feuniverse.us/t/teqs-minor-assembly-shenanigans/1655/6) by Tequila, Vennobennu and Crazycolorz.
- The puzzle introduced in the prologue is an implementation of [Lights Out](https://en.wikipedia.org/wiki/Lights_Out_(game)) by Tiger Electronics. I also made use of [Simon Tatham's Flip](https://www.chiark.greenend.org.uk/~sgtatham/puzzles/js/flip.html) to play around and setup some initial puzzle settings.
- [Mode7](https://github.com/StanHash/FE-CHAX/tree/master/Wizardry/M7) by StanH.