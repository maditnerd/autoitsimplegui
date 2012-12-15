#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

Opt("TrayMenuMode",1)
$MovingEvent  = 0

#region GUI
;~ Windows Parameters

$Width = 100
$Height = 100
$Posx = 0
$Posy = 0

$App_Name = "Unnamed"
$App_color = 0xffffff

;~ GUI
Global $Windows = GUICreate($App_Name,$Width,$Height,$Posx,$Posy,$WS_POPUP,$WS_EX_TOPMOST)
GUISetBkColor($App_color, $Windows)
TraySetToolTip($App_Name)

;~ Buttons
$Exit_Button = GUICtrlCreatePic("img\exit.bmp", $Width - 16, 0, 16, 16)

GUISetState(@SW_SHOW)
#endregion GUI

#region GUIEvent
While 1
	$GuiEvent = GUIGetMsg()
	Switch $GuiEvent

;~ If Secondary Button Pressed move the windows
		Case $GUI_EVENT_SECONDARYUP
			if $MovingEvent = 0 Then
			$MovingEvent = 1
			Else
			GUISetState(@SW_ENABLE)
			$MovingEvent = 0
		EndIf

;~ If Exit Button Clicked exit
		Case $Exit_Button
			Exit
	EndSwitch


if $MovingEvent = 1 Then
	WinMove($App_Name,"",MouseGetpos(0),MouseGetpos(1))
EndIf

WEnd
#endregion GUIEvent
