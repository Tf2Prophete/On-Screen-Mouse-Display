#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Imgs/Icon.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=R.S.S.
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;~ #AutoIt3Wrapper_Icon=Imgs\Icon.ico

#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <Misc.au3>
#include "GUICtrlPic.au3"

Opt("GUIOnEventMode", 1)

Local $hDLL = DllOpen("user32.dll")
Global $MouseAction = 1
GuiCreate("Mouse", 350, 250)
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")

$Pic1 = @ScriptDir & "/Imgs/MouseNoClick3.png"
$Pic2 = @ScriptDir & "/Imgs/MouseLeftClick3.png"
$Pic3 = @ScriptDir & "/Imgs/MouseRightClick3.png"

$Pic = GUICtrlCreatePic(@ScriptDir & "/Imgs/MouseNoClicks3.png", 0, 0, 300, 200)
GuiCtrlSetState(-1,$GUI_DISABLE)
$a1 = _GUICtrlPic_Create($Pic1 , 25, 25, 300, 200, BitOR($SS_CENTERIMAGE,$SS_SUNKEN, $SS_NOTIFY), Default)



GuiSetState()

Func _Exit()
	Exit
EndFunc


While 1
	If _IsPressed("01", $hDLL) Then
		$MouseAction = 1
		_GuiCtrlPic_SetImage($a1, $Pic2)
		Sleep(250)
	ElseIf _IsPressed("02", $hDLL) Then
		$MouseAction = 1
		_GuiCtrlPic_SetImage($a1, $Pic3)
		Sleep(250)
	Else
		If $MouseAction = 1 Then
			$MouseAction = 0
		_GuiCtrlPic_SetImage($a1, $Pic1)
		EndIf
	EndIf



	Sleep(10)
WEnd
