#NoEnv
#Persistent
#SingleInstance, Force
join:="F1"
host:="F2"
exit:="F3"
title:="Ishiiruka-Dolphin  FM v5.9 BETA"
subTitle:="Dolphin NetPlay Setup"
hostTitle:="Dolphin NetPlay"

StartNetPlay() {
	global
	Run, %dolphin%
	WinWaitActive, %title%
	Sleep, 333
	WinMenuSelectItem, %title%, , Tools, Start NetPlay...
	WinWaitActive, %subTitle%
	Sleep, 333
	return
}

Menu, Tray, NoStandard
Menu, Tray, Add, Join (have the code selected), Join 
Menu, Tray, Add, Host, Host 
Menu, Tray, Add, Exit Dolphin, Exit 
Menu, Tray, Add,
Menu, Tray, Add, Close, CloseGui
Menu, Tray, Click, 1
Menu, Tray, Tip, Jan's little helper

FileSelectFile, dolphin
settings:
	Gui, Add, Text,, Join hotkey:
    	Gui, Add, Hotkey, vjoin, %join%
	Gui, Add, Text,, Host hotkey:
   	Gui, Add, Hotkey, vhost, %host%
	Gui, Add, Text,, Exit hotkey:
	Gui, Add, Hotkey, vexit, %exit%
	Gui, Add, Button, default, OK
	Gui, Show,, Jan's little helper	Sleep
	return
	GuiClose:
	ButtonOK:
	Gui, Submit, NoHide
	Hotkey, %join%, Join
	Hotkey, %host%, Host
	Hotkey, %exit%, Exit
	Gui, Destroy
return

return

CloseGui:
	ExitApp
return

Join:
	Sleep, 333
	Send, ^c
	StartNetPlay()
	Send, ^a^v
	ControlClick, Button3,  ahk_class wxWindowNR,, Left, 1,  NA
return

Host:
	window:=WinActive("A")
	StartNetPlay()
	ControlClick, Button5,  ahk_class wxWindowNR,, Left, 1,  NA
	WinWaitActive, %hostTitle%
	Sleep, 333
	ControlClick, Button5, %hostTitle%,, Left, 1,  NA
	if window
		WinActivate, ahk_id %window%
		WinWaitActive, ahk_id %window%
		Sleep, 333
	Send, ^v	
return

Exit:
	IfWinExist, %title%
		WinClose ;
return
