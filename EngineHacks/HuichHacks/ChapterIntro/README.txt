QUICK NOTES
  This version is specialized to be used with my project. I don't think there's a simple way of slapping it 
  onto a different or clean ROM. You'll have to move some stuff around.

  ChapterIntro assumes that ClassID fits in one byte, which should be the case in vanilla FE8U.
  IDK if people ever want to have over 255 classes but if they do, the moving map sprites in the chapter
  intro screen may be broken.
  

IMPLEMENTATION DETAILS

  TABLES


    ACTIVEGEMS
    This table's size is 256 bytes and consists of single byte entries each of which holds a value between zero 
    and six indicating the amount of gems to draw. The table takes chapterID (0x0202BCF0 +0xE) as an index, so 
    make sure you don't have more than 256 chapters.
    
    If having active gems be determined by ROM data is too rigid for you, you can change how
    ChapterIntro/Procs/ChIntro/GetGemCount.asm operates.
    
    BGPALETTE
    This table's size is 256 bytes and consists of single byte entries each of which holds an ID indicating 
    which palette to use for the relief background. There's only 64 palettes, so don't store any value greater 
    than 0x3F in these entries. Each palette is only a small hueshift (only a 64th of 360) different from the 
    previous, so you may not always notice the difference, although all colours under the rainbow should be 
    supported. The table takes chapterID (0x0202BCF0 +0xE) as an index, so make sure you don't have more than 
    256 chapters.
    

  GRAPHICS
  Init_Gem assumes the gem palettes are contiguous to one another when loading in the palettes, so please 
  keep them that way.

  BG2 is disabled during Intro Segment 1 if there are no active gems. This means no fancy pokémon VS style 
  bar behind the chapter title. To enable this even when no gems are active, modify
  ChapterIntro/Procs/ChIntro/Init_Seg1.asm.

  The mapsprites that are shown are taken from living units loaded in the UnitStruct (over at 
  0x0202BE4C). The more living units are loaded in here, the more mapsprites will appear during the 
  chapter intro, and the longer it will take for the intro to finish. I made it this way in order to show 
  off all the units. Up to 32 units will be displayed. Of course the chapter intro can be skipped at any 
  time by the same means as the vanilla chapter intro screen can. If you wish to change what 
  part of unit struct determines whether a unit should or should not be displayed you only need to 
  change Procs/ChIntro/DrawUnitCheck.asm accordingly.


  MUSIC
  So I'm using 2 songs, ChapterIntro0 & ChapterIntro1. ChapterIntro0 is played when there're no gems. Otherwise ChapterIntro1 is played. They use SongIDs 0x318 & 0x319. If you're using these IDs for something else, alter them in Music/music installer.event.

  If you want to alter the songs, their original midis (created by moi, so I very much understand you'd 
  wish to change them) can be found in Music/songs. After saving the midi, just drag the .mid file over to 
  MAKE SONG.cmd and it should generate (The intermediate .s file and) the relevant .event file.


  DEBUGGING
  I've put curly brackets around ChapterIntro.event to avoid definitions clashing. This also means that 
  debugging in No$GBA can become harder as labels won't be generated into a .sym file. Just remove the 
  brackets to get the labels back.
  
  There's also a functionality that changes the effect of the "Guide" button. This button is part of the menu 
  that you can open by pressing A on an empty square on a map. If you "#define Debug", the "Guide" button will
  make you win the current chapter. Doesn't seem to work on Ephraim chapter 10, Turning Traitor. Maybe to do 
  with it being a survive chapter.


CREDITS
Credits to:

  Agro/Brendor for the 16 Tracks/12 Sounds Fix.
  Alusq for the amazing music installer template they made.
  
  Square Enix for the Gems/Crystals and Ryan914 for ripping them from Final Fantasy (Dawn of Souls).
  Konami for the Mist and SMITHYGCN for ripping it from Castlevania Harmony of Dissonance.
  Konami for the Relief and Urathros for submitting it to Spriters Resource. Idk who ripped it, but it's 
  used in Yu-Gi-Oh!: Reshef of Destruction.
  Game Freak for the TitleBG and DRAGOON for ripping it from Pokémon Platinum Version.
  
  Huichelaar, that's me. Idk if it's rude putting yourself on a credit list, but I did make the thing.
  
Also a massive thank you to the people over at the FEU's discord #spell-academy channel who have:
  - helped me understand how thumb works.
  - made tutorials regarding inserting assembly, creating processes, using Lyn, reducing buildtime, etc.
  - referred me to great resources such as GBATek and tonc.
  

FINALLY
Discovering how backgrounds and sprites can be prepared and all the effects (mosaic, alpha blending, 
affine transformations, etc.) that can be applied to them has been a lot of fun. At first, assembly could 
be quite a headache to me, as it all seemed very alien. Knowing what each instruction does is one thing, 
figuring out why these instructions are used the way they are was something else entirely. However, 
despite still having a long way to go, I feel a lot more comfortable with assembly now. Hopefully I'll get 
to work on plenty more ASM projects!

EDIT: Apparently the above paragraph was written on the 8th of November 2020. I've decided to start keeping 
track of dates now. This paragraph was written February 22nd 2021. I've made a bunch of changes (a number of 
which small and probably needless). Most importantly, I've buffered the moving map sprites. It turned out that 
decompressing a bunch of assets every few frames puts a big strain on the GBA (or something at least), leading 
to a very laggy screen. Now that I'm pre-preparing the sprites, I've had to reduce the amount of moving map 
sprites from 52 to 32. Technically there's room for more if multiple units use the same moving map sprites, but 
I didn't (yet) take advantage of that.

EDIT2: February 23rd 2021. Changed some more stuff. Basically got rid of a bunch of stuff. This version is to be used in my project. Gems no longer do fancy rotation & transformation stuff. Will speed up the chapter intro screen. I'll just repurpose the fancy affine stuff for the game intro cutscene.