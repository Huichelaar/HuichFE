@ Definitions

@ Functions
.global CopyToPaletteBuffer
.type   CopyToPaletteBuffer, function
.set    CopyToPaletteBuffer, 0x08000DB9

.global GetGameClock
.type   GetGameClock, function
.set    GetGameClock, 0x08000D29


@ Graphics
.global RangeSquareBluePalette
.set    RangeSquareBluePalette, 0x8A02F34

.global RangeSquareRedPalette
.set    RangeSquareRedPalette, 0x8A02F94

.global RangeSquareGreenPalette
.set    RangeSquareGreenPalette, 0x8A02FF4
