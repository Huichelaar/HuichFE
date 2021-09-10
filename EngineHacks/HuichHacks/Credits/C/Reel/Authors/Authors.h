#ifndef CREDITS_AUTHORS_H
#define CREDITS_AUTHORS_H


struct CRE_ProcStateAuthors {
  
  /* 00 */ PROC_HEADER;
  /* 29 */ u8 iterator;
  /* 2A */ u16 timer;
  /* 2C */ const void** authorArray;
  /* 30 */ struct CRE_ProcStateAuthor* authorProc0;
  /* 34 */ struct CRE_ProcStateAuthor* authorProc1;
  /* 38 */ struct CRE_ProcStateAuthor* authorProc2;
  
};
extern const struct ProcInstruction CRE_authors_Proc[];
void CRE_authorsInit(struct CRE_ProcStateAuthors* proc);
int CRE_createAuthChild(u16 childID, struct CRE_ProcStateAuthors* proc);
int CRE_blockWhenDone(struct CRE_ProcStateAuthors* proc);
void CRE_blendOutAuth(struct CRE_ProcStateAuthors* proc);

struct CRE_ProcStateAuthor {
  
  /* 00 */ PROC_HEADER;
  /* 29 */ u8 timer;
  /* 2A */ u16 OAM0;
  /* 2C */ u16 OAM1;
  /* 2E */ u16 OAM2;
  /* 30 */ u8 node;
  
};
extern const struct ProcInstruction CRE_author_Proc[];
void CRE_moveAuth(struct CRE_ProcStateAuthor* proc);
void CRE_drawAuth(struct CRE_ProcStateAuthor* proc);


// Graphics
extern const u16 authorPalette[16];
extern const void* authorOAM;

#endif // CREDITS_AUTHORS_H