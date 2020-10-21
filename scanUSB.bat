@ echo off
REM Written by Ben Foley, 20/10/2020

REM %1 = Drive Letter to Scan
REM %2 = Suppress Output
SETLOCAL ENABLEDELAYEDEXPANSION
REM ECHO Conducting Malware scan of drive %1...
SET outputcount=1
	FOR /F "tokens=* USEBACKQ" %%F IN (`^"^"C:\Program Files\Windows Defender\MpCmdRun.exe^" -Scan -ScanType 3 -File ^"%1\^"`) DO (
	SET var!outputcount!=%%F
	SET /a count=!outputcount!+1
	)
	
	IF "!var1:~0,8!" == "Scanning" (
	ECHO %var1%
	Pause
	)

ENDLOCAL