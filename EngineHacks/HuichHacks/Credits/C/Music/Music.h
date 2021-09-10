#ifndef CREDITS_MUSIC_TITLE_H
#define CREDITS_MUSIC_TITLE_H


struct CRE_MusicStruct {
  
  /* 00 */ u16 songID;
  /* 02 */ u16 playTime;
  
};
extern const struct CRE_MusicStruct musicStruct[];

struct CRE_ProcStateMusic {
  
	/* 00 */ PROC_HEADER;
  /* 29 */ u8 index;
  /* 2C */ const struct CRE_MusicStruct* musicStruct;
  /* 30 */ struct MusicPlayerInfo* musicPlayer;
  
};
extern const struct ProcInstruction CRE_music_Proc[];
void CRE_musicDestructor();
void CRE_musicInit(struct CRE_ProcStateMusic* proc);
void CRE_musicLoop(struct CRE_ProcStateMusic* proc);

#endif // CREDITS_MUSIC_TITLE_H