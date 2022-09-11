#NoEnv
#SingleInstance Force
#IfWinActive Alchemy Stars
CoordMode, Mouse, Window
SendMode, Input

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
fishingBtn := {x:1470, y:580}
bar := {x:1171, y:680}
outsideReward := {x:1334, y:529}
barColor := 0x4DDAFF

; Click start fishing button
MouseMove, fishingBtn.x, fishingBtn.y
Click

; Wait until orange bar appears
Loop {
    PixelSearch, px, py, bar.x, bar.y, bar.x+1, bar.y, barColor, fast
} until ErrorLevel = 0


MouseMove, fishingBtn.x, fishingBtn.y
Loop {
    PixelSearch, px, py, fishingBtn.x, fishingBtn.y, fishingBtn.x+1, fishingBtn.y, 0xFFFFFF, fast
    Click, Down
    Sleep, 50
    Click, Up
} until ErrorLevel = 1

Loop {
    MouseMove, bar.x, bar.y
    Click
    PixelSearch, px, py, fishingBtn.x, fishingBtn.y, fishingBtn.x+1, fishingBtn.y, 0xFFFFFF, fast
} until ErrorLevel = 0


return