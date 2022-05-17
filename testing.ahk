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
    cc := new ImgSearch(A_WorkingDir . "\control_center.png", 100)
    if (!cc.found) {
        MsgBox, Img not found
        return
    }

    config := baseConfig()

    click(cc.X+250, cc.Y+50)
    controlCenter(config)
    click(confirm.x, confirm.y)
    checkOverview()

    click(cc.X+250, cc.Y+200)
    reception(config)
    click(confirm.x, confirm.y)
    checkOverview()

    click(cc.X+250, cc.Y+400)
    tradingPost1(config)
    click(confirm.x, confirm.y)
    checkOverview()

    return
}

secondPageTest(confirm) {
    global winW, winH

    config := baseConfig()

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.4, 12
    Click
    Sleep, 100

    tp := new ImgSearch(A_WorkingDir . "\trading_post.png", 100)
    if (!tp.found) {
        MsgBox, img not found
        return
    }

    click(tp.X+100, tp.Y+200)
    factoryGold1(config)
    click(confirm.x, confirm.y)
    checkOverview()

    click(tp.X+100, tp.Y+350)
    powerPlant1(config)
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

    config := baseConfig()

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.4, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100

    tp := new ImgSearch(A_WorkingDir . "\trading_post.png", 100)
    if (!tp.found) {
        MsgBox, img not found
        return
    }

    click(tp.X+100, tp.Y+50)
    tradingPost2(config)
    click(confirm.x, confirm.y)
    checkOverview()

    click(tp.X+100, tp.Y+200)
    factoryGold2(config)
    click(confirm.x, confirm.y)
    checkOverview()

    click(tp.X+100, tp.Y+350)
    powerPlant2(config)
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

    config := baseConfig()

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

    office := new ImgSearch(A_WorkingDir . "\office.png", 100)
    if (!office.found) {
        MsgBox, img not found
        return
    }

    click(office.X+150, office.Y+50)
    office(config)
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

    config := baseConfig()

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

    ft := new ImgSearch(A_WorkingDir . "\factory.png", 100)
    if (!ft.found) {
        MsgBox, img not found
        return
    }

    click(ft.X+150, ft.Y+50)
    xp1(config)
    click(confirm.x, confirm.y)
    checkOverview()

    click(ft.X+150, ft.Y+200)
    xp2(config)
    click(confirm.x, confirm.y)
    checkOverview()

    click(ft.X+150, ft.Y+350)
    xp3(config)
    click(confirm.x, confirm.y)
    checkOverview()

    MouseMove, winW*0.9, winH*0.5
    Loop, 11 {
        Send, {WheelUp}
        Sleep, 495
    }

    return
}
