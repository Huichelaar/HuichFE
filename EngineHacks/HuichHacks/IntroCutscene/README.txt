INSTALL
  Install by using Event Assembler to apply "IntroCutscene.event" to an FE8U ROM, or include 
  "IntroCutscene.event" in your buildfile.


WHATITDO?
  So this here is my attempt at creating a custom game intro & titlescreen. I made this specifically for my 
  own project, so I'd rather nobody uses this stuff to directly copy my game intro. There are certain procs, 
  like FadeBG, Blend, Sinusoid, etc. that you can re-use if you'd like though. And I technically don't own 
  any of the assets I used either, so... yeah. If you do end up using any or most of this, just try to make 
  what you're using it for (be it a cutscene, a spell animation, w/e) look different from my cutscene please. 
  I'd appreciate it.


CUSTOMIZATION
  There's one variable that can be changed, which is SinusoidRAM. This variable is in 
  "Project/ASM/ASM.event." The sinusoid effect uses an 8-bit control bitmap, 1 bit for BG0 horizontal, BG0 
  vertical, BG1 horizontal, etc. We repurpose 0x3003F48 to hold this bitmap. [0x3003F4C, 0x300408C) will hold 
  values for each scanline's offset (0xA0 * 2). Every BG (and both their HOFS & VOFS) use the same values. 
  Should [0x3003F48, 0x300408C) be used for something else, just change SinusoidRAM's value to somewhere else 
  that has 0x144 free bytes.


WARNING
  I'll just repeat this here for a global reader: (IW)RAM [0x3003F48, 0x300408C) is reserved. See 
  CUSTOMIZATION if you wish to change this.
  
  The music will sync with the visuals best on GBA hardware. I decompress a bunch of stuff, so what's 
  happening on screen tends to trail behind when comparing hardware to emulators. I took this into account 
  when syncing what happens on screen up with the audio, so things may feel weird on emulators.


IMPLEMENTATION, some details in no particular order

  SINUSOID
  The sinusoid uses a table of word-sized entries. The format is as follows:
  
  Location, length, meaning
  +00       BYTE    Phase
  +01       BYTE    1/Frequency
  +02       BYTE    Amplitude multipler
  +03       SHORT   Amplitude divisor
  
  "1/Frequency" instead of just "Frequency" because I think I inverted frequency. Increasing the value makes 
  it take longer before the sinusoid repeats. Each frame, the table iterator is incremented until it's reset 
  to a previous point or ends. There's more details in Loop_Sinusoid.
  
  
  GEMS
  I repurposed the gems from a previous implementation of the chapter intro. Gems are affine sprites. Where 
  and how they're drawn is determined by their trajectory table. This table is made up of entries the size of 
  8 bytes following this format:

  Location, length, meaning
  +00       SHORT   X-coordinate
  +02       SHORT   Y-coordinate
  +04       SHORT   Rotation angle (MSByte is integer part LSByte is fractional part)
  +06       SHORT   Scaling factor (or 1 divided by, I guess. Values 0x0-0xff enlarge, >=0x100 reduce.)
                    Used for both horizontal and vertical scaling.

  The first entry of any trajectory table is ignored, sorry. The tables have one two-word 0x0 entry to 
  indicate their end, so that one's reserved. Specifically, only the first word is checked, so don't pick X = 
  Y = 0.
  
  The Circle trajectory has 440 entries. This was done on purpose because 440 is a multiple of 5. Allowing me 
  to section the circle into 5 pieces, each having a starting point for a gem. The next two sentences 
  probably only make sense to me, sorry. The first starting point is at (119 1). X correction: 31, Y 
  correction: 23.
  
  There's also a table, ShineFrame, determining which cell of the gem to display. This allows the gems to 
  display this shine animation.
  
  
  WORLD MAP SLIDE
  There's two World map sliders. They both use a different table to determine the trajectory of the slide. 
  The tables use short-sized entries of this format:
  
  Location, length, meaning
  +00       BYTE    BG X Coordinate
  +01       BYTE    BG Y Coordinate
  
  The difference between two consecutive X or Y coordinates should be no bigger than 8. This is because world 
  map tiles are updated immediately whereas HOFS&VOFS & screen entries get updated on VBlank. As a result I 
  can only prepare 1 offscreen column of tiles in advance as 31 out of 32 can be displayed on the screen at 
  one time. Break this rule and garbage tiles will creep on screen.
  
  
  SMALL DETAILS
  Some small details:
  
    - During the first world map slide segment we use an OBJWindow, allowing for two 'separate' alphablends 
    to happen. One blending the two gem colours, another blending the two world maps. I also move screen 
    entries (and gem char entries) to ensure there's room to display both world maps at the same time when 
    blending.
    
    - The textsprites for the monologue were made in MSpaint textboxes. IIRC, I selected Monotype Corsiva as 
    font and chose size 10, whilst making sure the letter colour is white, and the background is black. Next, 
    I put the image of text in Aseprite and reduced their saturation to 0 to get an entirely black & white 
    text. Finally, saved it as png, opened it in Usenti to ensure the colours' RGB values are in GBA ranges, 
    and saved again.
    
    - The whirlpool in scene5 uses a table to determine which palettes to pick. This allows for the whirlpool 
    to 'slow down' & also 'go in the opposite direction.'
  
    - The DTS (DrawTextSprites) proc receives an argument when it's initialized. This argument indicates at 
    which text entry DTS should start. Each text entry is displayed for a certain amount of time determined 
    by the table at the bottom of Loop_DTS.
    
    - Already mentioned this, but aside from Sinusoid, there's a few other procs I made for achieving generic 
    purposes of certain graphical effects such as scrolling a background, alphablending and fading in or out 
    using BLDY. I moved these to "Project/ASM/ASM.event" as they're generic enough to be potentially useful 
    in other contexts.


CREDITS

  Code stuffs:
    - EA credits, copied from EA. Idk who first person is referring to.
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
    - FEBuilder by 7743. I used this for documentation. https://github.com/FEBuilderGBA/FEBuilderGBA
    - StanDOC by StanH_.
    - Teq Doq by Tequila.
    
  Graphics:
    - Capcom for the Judge and Shoda & TSP184 for ripping it from Phoenix Wright: Ace Attorney: Justice for All.
    - Square Enix for the Gems/Crystals and Ryan914 for ripping them from Final Fantasy (Dawn of Souls).
    - HAL Laboratory for the moon and Jackster for ripping it from Kirby: Nightmare in Dream Land.
    - HAL Laboratory for the whirlpool which I ripped from Kirby & The Amazing Mirror.
    - Planet Interactive for the clouds which I ripped from Planet Monsters.
    - Patricia Saunders for the Monotype Corsiva font.
    - Intelligent Systems for the Monster eyes which I simply re-used from vanilla FE8U. The FE logo is 
    modified from FE8U's. The world map is a splice of FE8U's world map. "Press START" is from FE8U, also 
    slightly modified.
    - Realtime Associates for the Subtitle card and Mr. C for ripping it from Charlie Blasts Territory.
    - Konami for the Subtitle font and SMITHYGCN for ripping it from Castlevania Chronicles.

  Assuming I didn't miss anything, the rest should go to me, Huichelaar.
  Tell me if I've missed anyone, I'll make sure to add them to the credits.


CONCLUDING
Some useless, but sentimental words I like to write at the end of these things.

I liked making this. I feel like I'm learning more about GBA LCDIO stuff. I've learnt what HBlank & VBlank 
are, and how I can make the screen do fancy things by manipulating LCDIO on HBlank. Getting the sinusoid to 
work was very satisfying. As was getting the world map slide to work. It's also the first time I've used an 
OBJ window. As I finish writing this it's the 3rd of April 2021. I created the initial IntroCutscene 
directory on February 23rd. It's taken a month and a week and I'm ready for a different project now.

1/7/2021. Changed the bootuplogos. They're faster, can be immediately skipped, and include some new logos.