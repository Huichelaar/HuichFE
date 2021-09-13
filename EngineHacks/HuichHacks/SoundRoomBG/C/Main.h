#ifndef SONGBG_H
#define SONGBG_H
#include "gbafeext.h"


struct SBG_SongBGStruct {
  
  const void* BGTiles;
  const u16* BGPalette;
  struct SBG_SongBGStruct* next;
  
};

struct SBG_SongBGList {
  
  const u32 songID;
  struct SBG_SongBGStruct* songBGStruct;
  
};
extern struct SBG_SongBGList SBG_songBGList[];
struct SBG_SongBGStruct* SBG_DetermineSongBGStruct(u32 songID);

struct SBG_ProcStateMain {
  
	/* 00 */ PROC_HEADER;
  /* 2C */ u32 currentSongID;
  /* 30 */ u32 nextSongID;
  /* 34 */ struct SBG_SongBGStruct* currentSongBGStruct;
  /* 38 */ struct SBG_SongBGStruct* nextSongBGStruct;
  
};
extern const ProcInstruction SBG_Main_Proc[];
void SBG_waitForSongSwitch(struct SBG_ProcStateMain* proc);


struct SBG_ProcStateChangeSongBG {
  
	/* 00 */ PROC_HEADER;
  /* 29 */ u8 fadeIn;         // true: fade in, false: fade out.
  /* 2A */ u16 timer;
  /* 2C */ struct SBG_SongBGStruct* songBGStruct;
  
};
extern const ProcInstruction SBG_ChangeSongBG_Proc[];
void SBG_InitChangeSongBG(struct SBG_ProcStateChangeSongBG* proc);
void SBG_fadePals(struct SBG_ProcStateChangeSongBG* proc);
void SBG_DrawBG(struct SBG_ProcStateChangeSongBG* proc);
void SBG_SetupNextBG(struct SBG_ProcStateChangeSongBG* proc);


extern const ProcInstruction Procs_ScrollMural[];

#endif // SONGBG_H