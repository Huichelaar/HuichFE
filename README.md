# FE8 Romhack

[Fire Emblem Universe topic](TODO)

## What is this?

This hack, title still pending, can be applied to an FE8U (Fire Emblem Sacred Stones, region: North America) ROM to get a different story and new features, using the same basic engine.

This hack, title still pending, uses FE8's Skill System buildfile as its base. I'm using whatever version was newest on January 12th 2021. https://github.com/FireEmblemUniverse/SkillSystem_FE8

## Installation

There are two methods. One simple, and one less simple. Following either should end up in a new `.gba` file being created, which contains the ROMhack in playable state.

### Method 1
Use a UPS file patcher, such as [NUPS](https://www.romhacking.net/utilities/606/) or [FEBuilderGBA](https://github.com/FEBuilderGBA/FEBuilderGBA) to apply `Project.ups` to your FE8U ROM.

### Method 2
1. Get the latest version of [Event Assembler](https://feuniverse.us/t/event-assembler/1749) and put it in the extracted folder. This part could cause issues because it seems the `FILL` command isn't necessarily in the newest version of EA.
2. Get a clean FE8U ROM, name it "FE8_clean.gba" and put it in the extracted folder.
3. Run MAKE HACK_full or MAKE HACK_quick, whichever you desire.

## Some features

TBA, but you can browse `ImplementationDetails.txt`.

## Bugs

If you find any bugs/glitches, you can let me know on the [FEU Discourse](https://feuniverse.us/u/Huichelaar/) or [Github](https://github.com/Huichelaar). I haven't looked into how the whole issue tracker on github works but you could try posting something there.

I'll write any known and yet unfixed bugs here:
  - Nothing atm.

## Sharing is caring
If you want to grab and use hacks implemented in C, note that I'm using a modified version of [FE-Clib](https://github.com/Huichelaar/FE-CLib). Some names are different, some custom variables are added, etc.

## Credits

Can be found in `CREDITS.md`.
