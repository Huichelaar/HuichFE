#ifndef CREDITS_TRAVERSEM7_H
#define CREDITS_TRAVERSEM7_H


struct CRE_M7TravelStruct {
  const int x;
  const int y;
  const int z;
  const u32 bitfield;               // bit 0: move instantly if set. ==0xFF: terminator.
};

struct CRE_ProcStateTraverseM7 {
  
	/* 00 */ PROC_HEADER;
  /* 2C */ u32 timer;
  /* 30 */ struct CRE_M7TravelStruct* travelStruct;
  
};
extern const ProcInstruction CRE_traverseM7_Proc[];
void CRE_traverseM7Loop(struct CRE_ProcStateTraverseM7* proc);

struct CRE_ProcStateTraverseM7Dim {
  
	/* 00 */ PROC_HEADER;
  /* 2C */ int startPos;
  /* 30 */ int endPos;
  /* 34 */ int currentT;
  /* 38 */ int endT;
  /* 3C */ int* dim;
  
};
extern const ProcInstruction CRE_traverseM7Dim_Proc[];
void CRE_moveCam(struct CRE_ProcStateTraverseM7Dim* proc);

struct CRE_ProcStateTraverseM7Rot {
  
	/* 00 */ PROC_HEADER;
  /* 2C */ int startPos;
  /* 30 */ int endPos;
  /* 34 */ int currentT;
  /* 38 */ int endT;
  
};
extern const ProcInstruction CRE_traverseM7Rot_Proc[];
void CRE_rotateCam(struct CRE_ProcStateTraverseM7Rot* proc);

#endif // CREDITS_TRAVERSEM7_H