; Testing keybind
^v::
confirm := {x:winW*0.1, y:winH*0.1}
; confirm := {x:winW*0.9, y:winH*0.95}

controlCenter()
click(confirm.x, confirm.y)
checkOverview()

reception()
click(confirm.x, confirm.y)
checkOverview()

tradingPost1()
click(confirm.x, confirm.y)
checkOverview()
return

; Testing keybind for the 1st scroll
^y::
confirm := {x:winW*0.1, y:winH*0.1}
; confirm := {x:winW*0.9, y:winH*0.95}

MouseMove, winW*0.9, winH*0.5
Sleep, 300
Send, {WheelDown}
Sleep, 805
Click

factoryGold1()
click(confirm.x, confirm.y)
checkOverview()

powerPlant1()
click(confirm.x, confirm.y)
checkOverview()

MouseMove, winW*0.9, winH*0.5
Loop, 2 {
    Send, {WheelUp}
    Sleep, 495
}
return

; Testing keybind for the 2nd scroll
^u::
confirm := {x:winW*0.1, y:winH*0.1}
; confirm := {x:winW*0.9, y:winH*0.95}

MouseMove, winW*0.9, winH*0.5
Sleep, 300
Send, {WheelDown}
Sleep, 805
Click
Sleep, 300
MouseMove, winW*0.9, winH*0.5
Loop, 4 {
    Send, {WheelDown}
    Sleep, 495
    If (A_Index = 4)
        Click
}

tradingPost2()
click(confirm.x, confirm.y)
checkOverview()

factoryGold2()
click(confirm.x, confirm.y)
checkOverview()

powerPlant2()
click(confirm.x, confirm.y)
checkOverview()

MouseMove, winW*0.9, winH*0.5
Loop, 7 {
    Send, {WheelUp}
    Sleep, 495
}
return

; Testing keybind for the 3rd scroll
^i::
confirm := {x:winW*0.1, y:winH*0.1}
; confirm := {x:winW*0.9, y:winH*0.95}

MouseMove, winW*0.9, winH*0.5
Sleep, 300
Send, {WheelDown}
Sleep, 805
Click
Sleep, 300
MouseMove, winW*0.9, winH*0.5
Loop, 4 {
    Send, {WheelDown}
    Sleep, 495
    If (A_Index = 4)
        Click
}
Sleep, 300
MouseMove, winW*0.9, winH*0.5
Loop, 2 {
    Send, {WheelDown}
    Sleep, 495
    If (A_Index = 2)
        Click
}

office()

click(confirm.x, confirm.y)
checkOverview()

MouseMove, winW*0.9, winH*0.5
Loop, 9 {
    Send, {WheelUp}
    Sleep, 495
}
return

; Testing keybind for the 4th scroll
^o::
confirm := {x:winW*0.1, y:winH*0.1}
; confirm := {x:winW*0.9, y:winH*0.95}

MouseMove, winW*0.9, winH*0.5
Sleep, 300
Send, {WheelDown}
Sleep, 805
Click
Sleep, 300
MouseMove, winW*0.9, winH*0.5
Loop, 4 {
    Send, {WheelDown}
    Sleep, 495
    If (A_Index = 4)
        Click
}
Sleep, 300
MouseMove, winW*0.9, winH*0.5
Loop, 2 {
    Send, {WheelDown}
    Sleep, 495
    If (A_Index = 2)
        Click
}
Sleep, 300
Loop, 2 {
    Send, {WheelDown}
    Sleep, 480
    If (A_Index = 2)
        Click
}

xp1()
click(confirm.x, confirm.y)
checkOverview()

xp2()
click(confirm.x, confirm.y)
checkOverview()

xp3()
click(confirm.x, confirm.y)
checkOverview()

MouseMove, winW*0.9, winH*0.5
Loop, 11 {
    Send, {WheelUp}
    Sleep, 495
}
return