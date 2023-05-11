@ECHO OFF
FOR /f "tokens=2*" %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\AutoHotkey" /v InstallDir') DO ( SET "AHKPath=%%B")
FOR %%C IN (*.ahk) DO ( SET "AHKScript=%%~nC")
IF EXIST icon.ico SET "ICON=/ICON icon.ico"

:menuLOOP
ECHO.
ECHO.= Choose encoding =================================================
ECHO.
FOR /f "tokens=1,2,* delims=_ " %%A IN ('"findstr /b /c:":menu_" "%~f0""') DO ECHO.  %%B  %%C
SET choice=
ECHO.&SET /p choice=Make a choice or hit ENTER to quit: ||GOTO:EOF
ECHO.&CALL:menu_%choice%
GOTO:menuLOOP

:menu_1   Unicode 32-bit (Recommended)
	SET "ARCH=%AHKPath%\Compiler\Unicode 32-bit.bin"
GOTO:menu_Q

:menu_2   Unicode 64-bit
	SET "ARCH=%AHKPath%\Compiler\Unicode 64-bit.bin"
GOTO:menu_Q

:menu_3   ANSI 32-bit
	SET "ARCH=%AHKPath%\Compiler\ANSI 32-bit.bin"
GOTO:menu_Q

:menu_

:menu_Q   Quit
	START "compile" "%AHKPath%\Compiler\Ahk2exe.exe" /IN %AHKScript%.ahk /OUT %AHKScript%.exe %ICON% /BIN "%ARCH%"
EXIT