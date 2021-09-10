#ifndef CREDITS_KEYLISTENER_H
#define CREDITS_KEYLISTENER_H


extern const ProcInstruction CRE_keylistener_Proc[];
void CRE_listenForKeys(Proc* proc);
void CRE_skipSegment(Proc* proc);
void CRE_skipCredits(Proc* proc);

#endif // CREDITS_KEYLISTENER_H