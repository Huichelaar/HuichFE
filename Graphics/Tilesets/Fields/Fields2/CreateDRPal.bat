SET Png2Dmp="%~p0\..\..\..\..\Event Assembler\Tools\Png2Dmp.exe"

%Png2Dmp% "%~1" --palette-only -po "%~dpn1Pal1.dmp"

Python "TilesetFogFilter.py" -i "%~dpn1Pal1.dmp" -o "%~dpn1Palette.dmp"

del %~dpn1Pal1.dmp /q