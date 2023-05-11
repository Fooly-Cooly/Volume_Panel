;================================================================================;
;	Volume Panel - Opens master volume sound panel at a set location or mouse    ;
;	Copyright (C) 2023  Brian Baker https://github.com/Fooly-Cooly               ;
;	Licensed with MIT https://opensource.org/license/mit/                        ;
;	Works with AHK ANSI, Unicode & 64-bit                                        ;
;================================================================================;

#NoEnv
#NoTrayIcon
SendMode Input
SetWinDelay, -1
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Screen
CoordMode, Window, Screen

SplitPath, A_Scriptname, , , , A_ScriptNameNoExt
IniFile := A_ScriptNameNoExt . ".ini"
if FileExist( IniFile ) {

	IniRead, PosX, %IniFile%, Position, X
	IniRead, PosY, %IniFile%, Position, Y
}
if ( !PosX && !PosY )
	MouseGetPos, PosX, PosY

Run, % "sndvol -f"
WinWaitActive, ahk_class #32770
WinMove, % PosX, PosY