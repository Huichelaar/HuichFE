@echo off

setlocal enabledelayedexpansion

rem Runs s2dmp.py for all .s files in folder & subfolders
rem does not run s2dmp.py for files where the existing .dmp file is newer than the .s file

set FILE_MATCH=*.s

for /R "%~dp0" %%F in (%FILE_MATCH%) do (
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
	echo Assembling "%%~nxF"...
	Python "s2dmp.py" -i "%%F" -o "%%~dF%%~pF%%~nF%.dmp"
    )
)

echo Done!
if /I not [%1]==[noPause] (
	pause
)
