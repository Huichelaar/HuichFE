INSTALL
  Install by using Event Assembler to apply "Suspendx2.event" to an FE8U ROM, or include 
  "Suspendx2.event" in your buildfile. There's a few quirks to keep in mind:
  
    - If you're already using a text buildfile, remove the #include "Text/Install Text Data.event" from 
    "Suspendx2.event" and instead #include "Text/Suspend/Suspend.event" in your text buildfile.
    
    - This hack uses Extended Modular Save. If you're already using EMS, here's what to do:
      - Remove the #include "ExpandedModularSave/ExModularSave.event" from "Suspendx2.event", instead 
      copy:
        - The #includes under "//CUSTOM", lines 105-107,
        - DeclSaveChunk(0, 0, ResetBackupCounter+0x1, ResetBackupCounter+0x1), line 153,
      in "ExpandedModularSave/ExModularSave.event" to your ExModularSave.event file.
      - Also copy the "ExpandedModularSave/Custom" directory and place it in your ExpandedModularSave 
      directory.
      - Make sure to leave SRAM byte 0xD4 reserved.
      - Copy or re-organize the sizes of the save and suspend chunks to match. Keep in mind gamechunk 3 
      overlaps with gamechunk 2 as we're not using game save 3.
      - Make sure the DebuffTableSize is 0x590 or the suspend saves could become too big.
    Alternatively, feel free to use the EMS setup I made and adapt what you have to it instead.
    
    - I've defined DebuffTable & DebuffTableSize in "Suspendx2.event." They're both inside include 
    guards, but may as well mention it to be safe. If you're already defining these, it won't hurt to
    remove their definitions from "Suspendx2.event." However, I reduced the DebufftableSize to 0x590.
    This should be sufficient for all player units, ally units and up to 50 enemies, unless the
    Debufftable is used for something else or has been expanded since 5th of Jan 2021.
    
    - If you want to debug stuff, comment out the { and } in "Suspendx2.event" to disable the scope. 
    This will allow new labels to appear in the sym file. There's also the "Debug" definition. Defining 
    this will turn the "Guide" command that appears in the menu during chapters into a 
    win-chapter-button.
    
    - I had to sacrifice game save 3 in order to make enough room for a second suspend save. This save 
    should be unavailable. If you somehow manage to do something with it anyways, please let me know. 
    I'll try to fix it best I can.


WHATITDO?
  This is my attempt at replicating a sort of Mila's Turnwheel/Divine Pulse in FEGBA. It is admittedly 
  more limited.
  
  You can create a backup suspend save at any time during a chapter, unless there's a tutorial. Press 
  "Backup" in the chaptermenu and you'll be offered the option to create a backup save. If you don't 
  have a backup save yet, the command will be glowing green. If you choose "Yes" a backup of your 
  current progress in the chapter will be made. If you already had a backup save, it will be overwritten.
  
  To return to your backup save, go back to the main menu (by suspending or resetting the game), pick "Resume 
  Chapter" and you should be presented with an option to either load your backup save "Bkup" or the suspend 
  save, "Susp". If this option isn't presented to you, it's either because you don't have a backup save (they 
  are cleared on regular saves, just like suspend saves), you ran out of "UNDO"s (more on that later), or 
  there's a bug. In that last case, let me know, so I can fix it.
  
  Regarding "UNDO". The "UNDO" window is displayed when you pick "Resume Chapter" and a backup save exists. 
  The number in this window indicates how many more times you're allowed to return to this backup. When this 
  counter hits 0, you won't be able to return to your backup save. The "Backup" command will not appear 
  anymore either. Reset the counter by loading or saving a regular game save and subsequently making another 
  backupsave.
  
  Of course, regular suspend is still available. The game automatically saves after every action you 
  take. If you return to a backupsave this save will also overwrite the regular suspend save (resuming 
  a suspend/backup save also counts as an action), so feel free to turn off the game after returning to 
  a backupsave.
  
  So, like the Turnwheel, but with only one moment (of your choosing) you can go back to.
  
  Creating backups is free, but returning to them can only be done a finite amount of times, 
  before the player needs to save or load a game save to reset the counter. If you don't save in 
  between chapters, the backup save will still be available, but the counter won't reset (nice try!)
  
  
CUSTOMIZATION
  There's one variable, "UndoCount". Change the value this holds in "Suspendx2.event" to whatever many 
  times you wish to allow the player to return to a backup.
  
  By default, there will be a backup command in the chaptermenu, right below suspend. If this makes 
  the menu too cluttered, uncomment the #define OverwriteSuspend in "Suspendx2.event." This will 
  remove the backup command from the chaptermenu. Instead, you can create a backup save by pressing 
  suspend and declining the offer to return to the main menu.
  
  
CONCLUDING
  January 6th 2021. So, this only took me five days to implement. I'm pleased as punch with that speed, 
  because most ASM projects I undertake take me three weeks to a month. ExpandedModularSave has been a 
  lifesaver in this regard; Without it, this would've taken way longer.
  
  July 25th 2021. Now you can choose which suspended save you wish to use by picking an option, instead of 
  pressing A or L, as that's too cryptic for some people apparently. I was dreading the idea of figuring out 
  how to implement this in a proc as huge as the savemenu, but fortunately it wasn't too complicated.


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
  - ExModularSave made by StanH_, Colorz.
  - FEBuilder by 7743. I used this for documentation. https://github.com/FEBuilderGBA/FEBuilderGBA
  - StanDOC by StanH_.
  - Teq Doq by Tequila.
  - Assuming I didn't miss anything, the rest should go to me, Huichelaar.
  Tell me if I've missed anyone, I'll make sure to add them to the credits.