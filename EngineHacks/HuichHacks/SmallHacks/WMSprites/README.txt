INSTALL
  This is the version of WMSprites used in my own hack. I (should have) released a standalone version at some 
  point. I'd recommend grabbing that one and customizing it to your own needs.


CUSTOMIZE
  The one thing to customize is of course which nodes are or are not paralogues. You can do this by changing 
  the values of the "Paralogue" column in "Tables/WorldMap/Nodes.csv". The other columns won't be used by the 
  initial setup I made, so don't worry about their data. Feel free to add more rows, but be aware that vanilla 
  only has 28 nodes, and a number of loops have hardcoded this limit, so I wouldn't try to go beyond that if 
  you don't know what you're doing.
  
  Once you're happy with the setup, make sure to assemble the tables (by pressing AssembleTables.bat) before 
  using EA!
  

WHATITDO?
  In the world map, vanilla only draws a red flag over the most recently set destination node, but this will 
  draw flags over any node that has been set as destination. Moreover, nodes that have been set as paralogues 
  will wave a green flag instead of a red flag, when they're set as (a) destination.


FUTURE EXPANSIONS
  I may add some other routines to draw other sprites on the world map some time in the future, if I can make 
  use of it. For now, there's some commented lines in "ASM/DrawSprites.asm" indicating where I'd call these 
  routines.


CONCLUDING
  Today's the 12th of April 2021. This was fun to make, and only took me about 2 days. That moment when you 
  realize something that, out of ignorance, seemed complicated to mess with, but is actually quite 
  straightforward. Always gets me giddy.


CREDITS
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
- HyperGammaSpaces' notes on the WM struct at 03005280.
- Snek (Snakey1), TableManager.
- Huichelaar, c'est moi.