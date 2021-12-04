@echo off

setlocal enabledelayedexpansion

rem Runs Png2Dmp with palette-only for all .png files in folder.
rem Does not run Png2Dmp for files where the existing .dmp file is newer than the .png file.

set FILE_MATCH=*.png

for %%F in (%FILE_MATCH%) do (
    SET SHOULD_COMPILE=0
    set DUMP_FILE="%%~dF%%~pF%%~nF%.dmp"
    if exist !DUMP_FILE! (
	For /F "Delims=" %%I In ('dir /b /OD "!DUMP_FILE!" %%F ^| more +1') Do Set NEWER=%%I
	if !NEWER! == %%~nxF (
	    set SHOULD_COMPILE=1
	)
    ) else (
	set SHOULD_COMPILE=1
    )
    if /I "!SHOULD_COMPILE!" EQU "1" (
	echo Assembling "%%~dF%%~pF%%~nF%.dmp"
	"%~p0\..\..\Event Assembler\Tools\Png2Dmp.exe" "%%F" --palette-only -po "%%~dF%%~pF%%~nF%_pal.dmp"
    )
)

echo Done!
if /I not [%1]==[noPause] (
	pause
)
