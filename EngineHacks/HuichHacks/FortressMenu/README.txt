This README is a copy of Fortresses'.

INSTALL
  Custom build for my project. No instructions for installing here.


WHATITDO?
  Heya, this here is a thing I made which installs fortresses, forts, for short. These forts can do two 
  things for the player. First, they produce materials which can be used to upgrade these forts (I'm 
  also planning on building a crafting system which can use these materials to craft items). Second, 
  the forts can provide bonuses based on the (player) unit in charge of the fort. The only bonus I've 
  implemented so far is an exp boost, but I'm planning on making more. More details regarding how stuff 
  is implemented below.
  
  There's a lot here, so I probably forgot to detail something. Ask me if anything's unclear. Also try 
  pressing R in the fort menu, accesible via the world map (if the relevant flag is set), for some more 
  info.


IMPLEMENTATION
  The default settings are pretty useless, so I'll go into how everything works here, so you can set 
  t(h)ings. There are 22 forts and 27 materials. These both have a ROM struct and a RAM 
  struct.

  RAM STRUCTS
    The RAM structs are saved during regular save and suspend save. Each fort takes up 5 bytes in RAM 
    and each material takes up 10 bits in RAM.
    
      - The RAM Material struct only consists of 10 bits holding how 
      much of that material a player has. This value should not exceed 999 or it won't be displayed 
      correctly. Because it's 10 bits, these are not all at byte-aligned offsets.
      
      - The RAM Fort struct consists of:
      
        - +0x0, byte holding the unitID of the fortmaster, the unit in charge of this fort. 0 Indicates 
        the fort is empty, and the player can assign a fortmaster to it. Enemy fortmasters will be
        cleared if their respective chapters are cleared.
        
        - +0x1, lvl and exp byte. Top two MSBs hold the level of the fort, the 6 LSBs hold the exp. A 
        level up happens when exp reaches 50, unless fort level is already 4. Exp increases whenever a 
        chapter ends, if the fort is controlled by a player unit and the fort is not at the max level 
        (which is 4). A random number between FortExpGainLower and FortExpGainUpper is generated to be 
        added to the current exp. These two variables can be found "Fortresses.event." I recommend 
        ensuring FortExpGainUpper >= FortExpGainLower. A fort can not level up more than once per 
        chapter end. However, if the player has enough of the required materials they can level up the 
        fort manually, as many times as they want (until max level) in between chapters.
        
        - +0x2, three bytes which hold how much of each material a fort has produced/gathered. Each of 
        the fort's four materials gets 6 bits. After a chapter ends, forts controlled by player units 
        will produce materials. A fort can't hold more than 50 of the same material, excess materials 
        are discarded.
    
    Right now, forts use up 0x6E bytes of RAM and materials use up 0x22 bytes of RAM, for a total of 
    0x90 bytes. If you add more forts or materials, make sure to change the definitions in 
    "Fortresses.event" and ensure offsets and sizes in EMS line up, in order to save things properly. 
    I'm storing forts and materials in 0x03003B48 which only has 0xBC free bytes. Apparently its 
    untested whether this space is not actually used by vanilla, so err, yeah. I didn't run into any 
    issues w.r.t. this yet.
      
  ROM STRUCTS & TABLES
    There's two ROM structs:
        
      - FortStruct, in "Project2/Tables/Forts/Forts.csv", consists of:
        - +0x0, four bytes, each byte representing a material, MatID, which this fort produces.
        - +0x4, short, Name, textID used when displaying the fort's name.
        - +0x6, short, textID referring to the help text displayed when this fort is hovered over. 
        TextID+1 and textID+2 can also be used depending on fort level (different unlocked produce),
        so make sure these three textIDs remain contiguous.
        - +0x8, three words, each of these words correspond to a level interval (1 to 2, 2 to 3 and 3 
        to 4). Each of these words consist of:
          - +0x0 MatID, W
          - +0x1 X
          - +0x2 MatID, Y
          - +0x3 Z
        When a fort is at level A it needs X' amount of material W and Z' amount of material Y to get to 
        level A+1. Where X' = current fort exp / (50 / X), anologous for Z'. set X and Z to at least 1, 
        at most 99, although I'd recommend to set it no higher than 50, otherwise X' or Z' could come 
        out weird. Also, make sure W =/= Y, or the calculation will be off, and things will break.
        - +0x14, byte, this is a ProduceStruct index.
        - +0x15, byte, the fort's affinity.
        - +0x18-0x1F, 11 bytes of 0-padding.
        
      - ProduceStruct, in "Project2/Tables/Forts/Produce.csv", these are used by FortStructs. These
      consist of 16 words each consisting of four bytes. These bytes correspond to the four materials
      a fort can produce. At chapter end, a number is generated from [0-15], this value will determine
      which of the 16 words in this struct will determine how much of each material a fort is going to 
      produce. The higher the level of the fort, the more numbers will be generated from [0-15]. The
      highest resulting number will be picked, so you will probably want to make sure the order of the
      words reflects greater spoils as the index increases. Also note that at level 1 a fort can only
      produce more of the first and second materials. LV2 unlocks material 3 and LV3 unlocks material 4.
      
      There's also a few standalone tables:
      
        - "EMS/Custom/InitFortMatSettings.dmp", this one holds the initial settings for the RAM fort 
        & material structs.
        
        - "Project2/Tables/Forts/AffinityMatchupBonus.csv" This affects how much the fortmaster's
        ability is boosted. The affinities of the fort and fortmaster are matched in this table. The
        bonus value can be either 0 (negative), 1 (neutral) or 2 (positive). The table should be
        kept symmetric.
        
        - "Project2/Tables/Character/Ability.nmm", indexed by unitID (charID). Indicates which ability
        a unit has. 0x1 is reserved for unit 0 and is used to display a fort can be assigned a unit.
        0x0 is also reserved and indicates, if the unit is a player unit, that the unit can not be
        assigned to a fort or, if the unit is an enemy unit, that the unit is an enemy. Right now, the
        only other value is 0x2 which indicates the exp bonus ability.
        
        - "Project2/Tables/Forts/AbilityBonus.csv", entries in this table are 8 bytes long. The first
        6 bytes indicate the boost multiplier, which of these is used is calculated by this formula:
        valuebyte = Max(0, AffinityMatchupBonus + fort level - 2), where AffinityMatchupBonus is as 
        defined above and fort level is a value between [0-3]. Byte 8 is used to determine which symbol 
        should be displayed next to the multiplier (%, +, etc.). Byte 7 indicates if this symbol should
        be drawn left (if 0) or right (if 1) of the multiplier.

  TEXT
    There's a few things to keep in mind when changing text.
      - "Text/FortMaterial/Forts.event" consists of two parts:
        - The first part contains these:
          Fortname,
          3 helptexts. Which is used depends on fort lvl, so keep these three contiguous.
        - The second part contains helptext indexed by materialID, so keep these entries contiguous.
      
      - "Text/FortMaterial/Abilities.event" consists of entries made up of:
        - Ability text upper line
        - Ability text lower line
        - Ability helptext
        - padding
      The order of the entries is not relevant but keep the components contiguous.
      
  FORTMASTERS
    Units put in charge of a fort have their disappear bits set (RAM Unit struct+0xC|0x4010000). I
    did this to prevent people from using fortmasters during a chapter. When you remove a fortmaster
    from a fort, these bits are unset, bringing the unit back to your party.


MENU
  There is a menu for managing forts. Open the worldmap menu when hovering over the player avatar and 
  there should be a "Manage Forts" button if the relevant flag is set. Press this to open the fortmenu.
  
  The fortmenu consists of three blocks (and a little fancy-schmancy animation to stare at). Top left 
  contains the initial menu. Bottom right contains the forts. Top right is a preview window displaying 
  how much of relevant materials you'll have after undertaking an action.
  
  There's three options in the top left menu here:
    - Gather. Pick a fort and press A to gather the materials that the fort has produced so far. You 
    won't be able to gather more than 999 of a material.
    - Upgrade. Pick a fort and press A to spend materials to increase that fort's level.
    - Assign. Select a fort by pressing A on it. Then scroll through different units and press A to 
    confirm that unit will be this fort's fortmaster. Pressing B instead will put the previous 
    fortmaster in charge again. You will also be able to leave the fort without a fortmaster.

  Pressing R will also display some helptext.


CONCLUDING
 So it's all still very WIP. I just wanted to have something out by the new year (2021). 't Would also 
 help if people wanted to play around with it and maybe find bugs or other weirdness. I learnt some 
 real fun things, like how to work with menus, how to use EMS, how to set up compound objects.
 
 7/5/2021 edit: added one more fort and one more material, flax. Instead of using class tier to boost
 ability effect, forts now have affinities. How well a fortmaster's affinity matches with the fort's
 will determine the boost. We also clear a fort's fortmaster when its chapter is cleared.
 
 15/7/2021 edit: I decided to just concatenate material RAM with fort RAM, instead of having the two grow to each other. This should make it easier to use repurpose unused RAM space, as it's no longer caught in between two things of yet undetermined length. I also made materials take up 10 bits each instead of 16, as the 6 MSBs would simply go unused seeing how materials only go up to 999.


CREDITS
  - EA credits:
    -Nintenlord for making this.
    -Kate/Klo/whatever for writing FE6 CHAR support
    -Everyone who submitted event codes for this, especially
     Fire Blazer and flyingace24.
    -markyjoe1990 for FE7 event template.
    -Mariobro3828 for FE7 world map definition values and
     for making the EAstdlib Macro and Command List.txt.
    -Arch for making code I can use to debug this app, 
     for his tutorials and his FE6 template.
    -Ryrumeli for telling me the ASM routine that handles
     the events in FE8.
    -Omni for reporting errors with FE6 disassembly script.
    -Camtech075/Cam/Kam for making FE8 template.
    -Everyone who uses this and/or reports bugs and/or gives
     feedback.
  - Text Processor made by circleseverywhere, StanH_.
  - The tree being chopped down in the fort menu was made by Obsidian Daddy.
  - The other assets displayed in that animation (pirate, plateau) are in vanilla FE8, so credit goes 
  to IS for that. I Frankenstein'd the "MATERIALS" and "FORTS" displayed in the fortmenu from vanilla 
  FE8 menu UI, so credit goes to IS for that too.
  - The material icons in order of appearance in "Graphics/Materials.png":
    - Coal          from Bomberman Jetters Densetsu no Bomberman, ripped by Garamonde.
    - Copper        from Bomberman Jetters Densetsu no Bomberman, ripped by Garamonde.
    - Lime          from Bomberman Jetters Densetsu no Bomberman, ripped by Garamonde.
    - Iron          from Bomberman Jetters Densetsu no Bomberman, ripped by Garamonde.
    - Wood          made by kb.
    - Magic wood    simple recolour I made of an icon by kb.
    - Spice         from Minecraft, ripped by WizToad.
    - Gunpowder     from Minecraft, ripped by WizToad.
    - Hemp          made by Zarg.
    - Belladonna    made by Beansy.
    - Laurel        from Minecraft, ripped by WizToad.
    - Topaz         made by GabrielKnight.
    - Ruby          made by GabrielKnight.
    - Emerald       made by GabrielKnight.
    - Diamond       made by GabrielKnight.
    - Milk          from Fire Emblem Fates, ripped by Henrai.
    - Cabbage       from Fire Emblem Fates, ripped by Henrai.
    - Grape         from Fire Emblem Fates, ripped by Henrai.
    - Fish          from Fire Emblem Fates, ripped by Henrai.
    - Wheat         from Fire Emblem Fates, ripped by Henrai.
    - Meat          from Boktai 3 / Shin Bokura no Taiyou, ripped by Greiga Master.
    - Down          from Radiant Historia, ripped by redblueyellow.
    - Hide          from Radiant Historia, ripped by redblueyellow.
    - Wool          from Radiant Historia, ripped by redblueyellow.
    - Oil           made by GabrielKnight.
    - Rune          from Radiant Historia, ripped by redblueyellow.
    - Flax          made by GabrielKnight.
  - ExModularSave made by StanH_, Colorz.
  - Klokinator came up with the idea to assign affinities to forts and to enhance the effectiveness
  of abilities for the right affinity matchups between fort and fortmaster.
  - Assuming I didn't miss anything, the rest should go to me, Huichelaar.
  Tell me if I've missed anyone, I'll make sure to add them to the credits.