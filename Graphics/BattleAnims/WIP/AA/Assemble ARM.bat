@echo off

SET startDir=C:\devkitPro\devkitARM\bin\

@rem Assemble into an elf
SET as="%startDir%arm-eabi-as"
%as% -g -mcpu=arm7tdmi -mthumb-interwork %1 -o "%~n1.elf"

@rem Print symbol table
SET readelf="%startDir%arm-eabi-readelf"
%readelf% -s "%~n1.elf" > "%~n1.symbols.log"

@rem Extract raw assembly binary (text section) from elf
SET objcopy="%startDir%arm-eabi-objcopy"
%objcopy% -S "%~n1.elf" -O binary "%~n1.dmp"

echo y | del "%~n1.elf"
pause