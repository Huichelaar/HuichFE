This directory contains ASM (and some C stuff) that could be used by multiple different engine hacks.

SINUSOID
  The sinusoid uses a table of word-sized entries. The format is as follows:

  Location, length, meaning
  +00       BYTE    Phase
  +01       BYTE    1/Frequency
  +02       BYTE    Amplitude multiplier
  +03       BYTE    Amplitude divisor

  All members are unsigned. "1/Frequency" instead of just "Frequency" because I think I inverted frequency; 
  Increasing the value makes it take longer before the sinusoid repeats. Each frame, the table iterator is
  incremented until it's reset to a previous point or ends. There's more details in
  Sinusoid/Loop_Sinusoid.asm.


BLENDWINDOWS
  Goes through a table of 0x8 sized entries. Format:

  Location, length, meaning
  +00       SHORT   WIN0H
  +01       SHORT   WIN1H
  +02       SHORT   WIN0V
  +03       SHORT   WIN1V

  Each entry details which window dimensions to use. Procs_BlendWindows will enable window 0 and window with 
  these dimensions and will use the parameters given to it by its parent (WININ, WINOUT, Procs_Blend param, 
  time per entry) to start a blocking Procs_Blend child. Once the Procs_Blend child ends, ProcsBlend_Windows 
  will grab the next entry's dimensions and repeat, after waiting time-per-entry amount of frames. if entry is 
  all zeroes, terminate.
  
  There's an unused example implementation in
  EngineHacks/HuichHacks/SmallHacks/BattleAnimChanges/LevelUp/Unused/FadeInStats.asm.