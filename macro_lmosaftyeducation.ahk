#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

Global targetwin := "학습하기 - Chrome"
Global fix_next_button_x = 1005, fix_next_button_y = 786

main() {
	loop
	{
		ImageSearch, next_button_x, next_button_y, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 images/next_button.png

		ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 images/next_page.png
		if (ErrorLevel = 0) {
			Sleep 500
			ControlClick, % "X" fix_next_button_x " Y" fix_next_button_y, % targetwin
			Sleep 500
			ControlClick, % "X" fix_next_button_x " Y" fix_next_button_y + 50, % targetwin
		}
		Sleep 500
	}
}

F1::
	main()
	return

F2::
	ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 images/next_page.png
	mousemove, % OutputVarX, % OutputVarY
	Sleep 1000
	ImageSearch, next_button_x, next_button_y, 0, 0, A_ScreenWidth * 2, A_ScreenHeight, *30 images/next_button.png
	mousemove, % next_button_x, % next_button_y
	return

F3::Exitapp