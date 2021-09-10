cd %~dp0

midi2agb -m 80 %~n1.mid

powershell -Command "(gc %~n1.s) -replace 'voicegroup000', 'SOUNDFONT_Custom1' | Out-File -encoding ASCII %~n1.s"

s2ea %~n1.s

powershell -Command "(gc %~n1.event) -replace '.align  2', 'ALIGN 4' | Out-File -encoding ASCII %~n1.event"

del %~n1.s /q

pause