@ Definitions

@ Functions
.global CpuSet
.type   CpuSet, function
.set    CpuSet, 0x80D1679

.global ClearUnits
.type   ClearUnits, function
.set    ClearUnits, 0x80177C5

.global ClearConvoyItems
.type   ClearConvoyItems, function
.set    ClearConvoyItems, 0x8031509

.global ClearGlobalTriggerState
.type   ClearGlobalTriggerState, function
.set    ClearGlobalTriggerState, 0x8083D19

.global gpReadSramFast
.type   gpReadSramFast, function
.set    gpReadSramFast, 0x030067A0

.global SRAMTransfer_WithCheck
.type   SRAMTransfer_WithCheck, function
.set    SRAMTransfer_WithCheck, 0x080D184D


@ RAM locations
.global gGenericBuffer
.set    gGenericBuffer, 0x2020188
