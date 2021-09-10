#ifndef CREDITS_SEGMENT_TITLE_H
#define CREDITS_SEGMENT_TITLE_H


struct CRE_ProcStateSegTitle {
  
	/* 00 */ PROC_HEADER;
  /* 2A */ u16 timer;
  /* 2C */ s16 titleX;          // used by Procs__opinfoview children.
  /* 2E */ s16 subtitleX;
	/* 30 */ u16 titleTextID;
  /* 32 */ u16 subtitleTextID;
  /* 34 */ u8 titleLen;
  /* 35 */ u8 subtitleLen;
  /* 38 */ const u16* palette;
  /* 3C */ struct CRE_ProcStateSegSubtitle* procSegSubtitle;
  
};
extern const struct ProcInstruction CRE_segTitle_Proc[];
void CRE_segTitleInit(struct CRE_ProcStateSegTitle* proc);
void CRE_segTitleDrawFirstChar(struct CRE_ProcStateSegTitle* proc);
void CRE_segTitleDrawChars(struct CRE_ProcStateSegTitle* proc);
void CRE_segSubtitleInit(struct CRE_ProcStateSegTitle* proc);
void CRE_segSubtitleEnd(struct CRE_ProcStateSegTitle* proc);
void CRE_segTitleRemoveChars(struct CRE_ProcStateSegTitle* proc);


struct CRE_ProcStateSegSubtitle {
  
	/* 00 */ PROC_HEADER;
  /* 29 */ u8 strlen;
  /* 2A */ u8 timer;
  /* 2C */ s16 stringX;
  
};
extern const struct ProcInstruction CRE_segSubtitle_Proc[];
void CRE_LoopBar(struct CRE_ProcStateSegSubtitle* proc);
void CRE_LoopBarBlend(struct CRE_ProcStateSegSubtitle* proc);
void CRE_segSubtitleDrawChars(struct CRE_ProcStateSegSubtitle* proc);
void CRE_segSubtitleDrawChars2(struct CRE_ProcStateSegSubtitle* proc);

#endif // CREDITS_SEGMENT_TITLE_H