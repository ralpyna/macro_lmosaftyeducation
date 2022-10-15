#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

main() {
	loop
	{
		detect_and_click("학습하기 - Chrome", "images/next_page_20.png", "images/next_button_20.png")
		detect_and_click("학습하기 - Chrome", "images/next_page_22.png", "images/next_button_22.png")
		detect_and_click("학습하기 - Chrome", "images/next_page_24.png", "images/next_button_24.png")
		detect_and_click("학습하기 - Chrome", "images/next_page_26.png", "images/next_button_26.png")
		Sleep 500
	}
}

image_search(img, conf_threshold=30) {
	ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, % "*" conf_threshold " " img
	if (ErrorLevel = 0) {
		Return [x, y]
	}
	Return False
}

detect_and_click(win_name, img_state, img_btn) {
	result_state := image_search(img_state)
	if not (result_state = False) {
		result_btn := image_search(img_btn, 10)
		if not (result_btn = False) {
			control_click_win(win_name, result_btn[1], result_btn[2])
			control_click_win(win_name, result_btn[1], result_btn[2] + 50)
		}
	}
}

control_click_win(win_name, x_abs, y_abs) {
	WinGetPos, X, Y, W, H, % win_name
	ControlClick, % "X" x_abs - X " Y" y_abs - Y, % win_name
}

F1::
	main()
	return

F2::
	result_test_btn := image_search("images/next_button_22.png", 10)
	mousemove, % result_test_btn[1], % result_test_btn[2]
	return

F3::Exitapp