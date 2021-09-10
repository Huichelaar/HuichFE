#ifndef MOSAIC_H
#define MOSAIC_H

struct ProcStateMosaic {
  
  /* 00 */ PROC_HEADER;
  /* 29 */ u8 updateFrame;       // The amount of frames per mosaic update.
  /* 2A */ u16 mosInit;          // initial mosaic value.
  /* 2C */ u8 mosBGHIncr;        // add this to BG Mosaic H-Size.
  /* 2D */ u8 mosBGVIncr;        // add this to BG Mosaic V-Size.
  /* 2E */ u8 mosOBJHIncr;       // add this to OBJ Mosaic H-Size.
  /* 2F */ u8 mosOBJVIncr;       // add this to OBJ Mosaic V-Size.
  /* 30 */ u8 timer;             // Increased every frame. End proc if this is equal to limit.
  /* 31 */ u8 limit;             // End proc if this is equal to timer.
  
};
extern const struct ProcInstruction Procs_Mosaic[];
void mosaicInit(struct ProcStateMosaic* proc);
void mosaicLoop(struct ProcStateMosaic* proc);

#endif // MOSAIC_H