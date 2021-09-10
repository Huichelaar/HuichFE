@ Called as ASMC at the end of every chapter.
.thumb

push  {r14}


bl    IncreaseFortProduce
bl    IncreaseFortExp
bl    ClearFortMaster


pop   {r0}
bx    r0
