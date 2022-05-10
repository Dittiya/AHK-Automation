; Testing keybind
^v::
confirm := {x:winW*0.1, y:winH*0.1}
firstPageTest(confirm)
return

+v::
confirm := {x:winW*0.9, y:winH*0.95}
firstPageTest(confirm)
return

; Testing keybind for the 1st scroll
^y::
confirm := {x:winW*0.1, y:winH*0.1}
secondPageTest(confirm)
return

+y::
confirm := {x:winW*0.9, y:winH*0.95}
secondPageTest(confirm)
return

; Testing keybind for the 2nd scroll
^u::
confirm := {x:winW*0.1, y:winH*0.1}
thirdPageTest(confirm)
return

+u::
confirm := {x:winW*0.9, y:winH*0.95}
thirdPageTest(confirm)
return

; Testing keybind for the 3rd scroll
^i::
confirm := {x:winW*0.1, y:winH*0.1}
fourthPageTest(confirm)
return

+i::
confirm := {x:winW*0.9, y:winH*0.95}
fourthPageTest(confirm)
return

; Testing keybind for the 4th scroll
^o::
confirm := {x:winW*0.1, y:winH*0.1}
fifthPageTest(confirm)
return

+o::
confirm := {x:winW*0.9, y:winH*0.95}
fifthPageTest(confirm)
return

firstPageTest(confirm) {
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
}

secondPageTest(confirm) {
    global winW, winH

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.4, 12
    Click
    Sleep, 100

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
}

thirdPageTest(confirm) {
    global winW, winH

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.4, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100

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
}


fourthPageTest(confirm) {
    global winW, winH

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.4, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100

    office()

    click(confirm.x, confirm.y)
    checkOverview()

    MouseMove, winW*0.9, winH*0.5
    Loop, 9 {
        Send, {WheelUp}
        Sleep, 495
    }

    return
}

fifthPageTest(confirm) {
    global winW, winH

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.4, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100

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
}
