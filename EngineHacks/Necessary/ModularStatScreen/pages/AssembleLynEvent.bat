@echo off

SET startDir=%~p0\..\..\..\..\..\devkitARM\bin\
SET as="%startDir%arm-none-eabi-as"
SET LYN=%~p0\..\..\..\..\..\devkitPro\lyn.exe

@rem Assemble into an elf
%as% -g -mcpu=arm7tdmi -mthumb-interwork %1 -o "%~n1.elf"

if exist "..\defs\Definitions.asm" (

	@rem Assemble definitions into a .elf if exists	
	%as% -g -mcpu=arm7tdmi -mthumb-interwork "mss_defs.asm" -o "mss_defs.elf"

	@rem Assemble into a .lyn.event with definitions
	%LYN% "%~n1.elf" "mss_defs.elf" > "%~n1.lyn.event"

	echo y | del "%~dp0mss_defs.elf"

) else (

	@rem Assemble into a .lyn.event
	%LYN% "%~n1.elf" > "%~n1.lyn.event"
)

echo y | del "%~n1.elf"

pause