# FE8 Romhack 

[FEUniverse topic](https://feuniverse.us/t/wip-subtitle/13793)

## What is this?

This hack, title still pending, can be applied to an FE8U (Fire Emblem Sacred Stones, region: North America) ROM to get a different story and new features, using the same basic engine.

This hack, title still pending, uses FE8's SkillSystem buildfile as its base. I'm using whatever version was newest on January 12th 2021. https://github.com/FireEmblemUniverse/SkillSystem_FE8

## Installation

There are two methods. One simple, and one less simple. Following either should end up in a new `.gba` file being created, which contains the ROMhack in playable state.

### Method 1
Use a UPS file patcher, such as [NUPS](https://www.romhacking.net/utilities/606/) or [FEBuilderGBA](https://github.com/FEBuilderGBA/FEBuilderGBA) to apply `Project.ups` to your FE8U ROM.

### Method 2
1. Get the latest version of [Event Assembler](https://feuniverse.us/t/event-assembler/1749) and put it in the extracted folder. This part could cause issues because it seems the `FILL` command isn't necessarily in the newest version of EA.
2. Get a clean FE8U ROM, name it "FE8_clean.gba" and put it in the extracted folder.
3. Run `MAKE HACK_full.cmd`.

## Some Features & Changes

There's some more technical details in `ImplementationDetails.txt`. Granted some text is repeated there.
  - Backup SuspendSave: The game autosaves after every action you take, however you can make a backup save which you can return to a limited amount of times. Whilst autosave won't overwrite your backupsave, you can freely overwrite your backup save whenever. Your backupsave will be deleted if you save in-between chapters.
  
  - Press select while hovering on an enemy unit to display that unit's danger radius. Press select again to hide their danger radius. Press select anywhere on the map to either display every enemy unit's danger radius, or, if any danger radius is active, hide every enemy unit's danger radius. Mind, having too many danger radii active at once might slow down the game. Danger Radius is cleared when resetting the game or when player phase ends.

  - A few [Lights Out](https://en.wikipedia.org/wiki/Lights_Out_(game)) puzzles. Only the first one you'll run into is mandatory.

  - Custom game intro and chapter intro. Those things you'll probably skip most of the time, but they're there.
  
  - A sound room that will display images of the source of the currently playing MIDI.
  
  - Not a feature, but worth mentioning: Unless a rescue staff is used, units can no longer rescue other units.

  - Level does not reset upon promotion. Tier 1 units can promote between level 10 through 14. A tier 1 unit cannot gain exp if their level is 14. Tier 2 units can reach a maximum level of 24.
  
  - SkillSystem, so skills are a thing. Player units will each have a personal skill. Some classes have a class-specific skill. Player units will unlock their class-level up skill at level 5 and every 10 levels from then on. Generic enemies won't have any skills.
  
  - StrMagSplit: POW's gone; Strength and Magic are separate stats.
  
  - Player units' growths = character growths + class bonus growths. Generic enemies will use class growths. Mind, class bonus growths =/= class growths. Lower class tiers will have lower class bonus growths, so the sooner you promote a unit, the sooner they can take advantage of the greater class bonus growths.
  
  - RNGRandomizer: RNG sequence is iterated every frame. This should make it a bit harder to RNG abuse. Still using 2RN though.
  
  - There's still numerous other features either planned, WIP or implemented but unavailable at the moment.

## Bugs

If you find any bugs/glitches, you can let me know on the [FEU Discourse](https://feuniverse.us/u/Huichelaar/) or [Github](https://github.com/Huichelaar/HuichFE). I haven't looked into how the whole issue tracker on github works but you could try posting something there.

I'll write any known and yet unfixed bugs here:
  - In-game credits seem to get stuck sometimes. You can avoid this by skipping the credits (press start). I 'fixed' this by solving an issue where unallocated data was being read, but apparently there's still something that can cause it, as it happened to me once. If you run into this issue, please tell me step-by-step how to reproduce the issue, because I haven't managed to reproduce it yet. The in-game credits are still WIP, and not every credit is in yet.

## Sharing is caring
If you want to grab and use hacks implemented in C, note that I'm using a modified version of [FE-Clib](https://github.com/Huichelaar/FE-CLib). Some names are different, some custom variables are added, etc.

## Credits

Can be found in `CREDITS.md`.
