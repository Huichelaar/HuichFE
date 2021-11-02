@echo off

setlocal enabledelayedexpansion

rem Runs sample2ea.py for all .wav files in folder & subfolders
rem does not run sample2ea.py for files where the existing .event file is newer than the .wav file

set FILE_MATCH=*.wav

for %%F in (%FILE_MATCH%) do (
    SET SHOULD_COMPILE=0
    set DUMP_FILE="%%~dF%%~pF%%~nF%.event"
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
	Python "sample2ea.py" -i "%%F" -o "%%~nF.event"
    )
)

echo Done!
if /I not [%1]==[noPause] (
	pause
)
