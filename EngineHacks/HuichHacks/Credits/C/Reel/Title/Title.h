#ifndef CREDITS_TITLE_H
#define CREDITS_TITLE_H


struct CRE_ProcStateTitle {
  
	/* 00 */ PROC_HEADER;
  /* 2A */ u16 timer;
  /* 2C */ s16 stringX;         // used by Procs__opinfoview children.
	/* 2E */ u16 textID;
  /* 30 */ u8 strlen;
  
};
extern const struct ProcInstruction CRE_title_Proc[];
void CRE_titleInit(struct CRE_ProcStateTitle* proc);
void CRE_titleDrawChars(struct CRE_ProcStateTitle* proc);
void CRE_titleRemoveChars(struct CRE_ProcStateTitle* proc);

#endif // CREDITS_TITLE_H