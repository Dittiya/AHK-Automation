#NoEnv
#SingleInstance Force
#IfWinActive Alchemy Stars
#Include Lib/image_search.ahk

Esc::
ExitApp
return

toggle := 0
^r::
toggle := !toggle
if (toggle) {
    Click, Down
} else {
    Click, Up
}
return

^e::
Loop, 200 {
    Click
}
return

+g::
Loop {
    Gosub, ^g
}
return

; Fishing
^g::
xbtn := {x:1029, y:729} 
fbtn := {x:1280, y:507}
ubtn := {x:1334, y:529}

MouseMove, fbtn.x, fbtn.y
Click
Loop {
    PixelSearch, px, py, xbtn.x, xbtn.y, xbtn.x+1, xbtn.y, 0xFFFFFF, fast
} until ErrorLevel = 0
MouseMove, fbtn.x, fbtn.y
Loop {
    PixelSearch, px, py, xbtn.x, xbtn.y, xbtn.x+1, xbtn.y, 0xFFFFFF, fast
    Click, Down
    Sleep, 50
    Click, Up
} until ErrorLevel = 1

MouseMove, ubtn.x+50, ubtn.y
Loop {
    Click
    PixelSearch, px, py, ubtn.x, ubtn.y, ubtn.x+1, ubtn.y, 0xFFFFFF, fast
} until ErrorLevel = 0
return