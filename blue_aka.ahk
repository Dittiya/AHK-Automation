#NoEnv
#SingleInstance, Force
#IfWinActive BlueStacks App Player
SendMode Input
SetWorkingDir, %A_ScriptDir%
WinGetPos winX, winY, winW, winH, BlueStacks App Player

Esc::
ExitApp
return

^f::
MouseGetPos, mx, my
PixelGetColor, pc, mx, my 
MsgBox, % pc " at " mx "x" my
return

^g::
lessons()
return

returnMenu() {
    Loop {
        PixelSearch, px, py, 237, 66, 237, 66, 0x533413
        click(1200, 55)
    } until ErrorLevel = 0
}

pixelSearchCont(colorId, X1, Y1, range=0, move=0) {
    X2 := X1 + range
    Y2 := Y1 + range
    Loop {
        PixelSearch, outX, outY, X1, Y1, X2, Y2, colorId, Fast
    } until ErrorLevel = 0
    If (move = 1) {
        MouseMove, outX, outY
    }

    return ErrorLevel
}

cafe() {
    ; click cafe from menu
    cafeLoc := {x:90, y:670}
    MouseMove, cafeLoc.x, cafeLoc.y
    Click

    ; click confirm when cafe loaded
    cafe := {col: 0xF0F0F0, x: 400, y: 450}
    Loop {
        PixelSearch, px, py, cafe.x, cafe.y, cafe.x, cafe.y, cafe.col, Fast
    } until ErrorLevel = 0
    Sleep, 750
    click(895, 215, 2)

    ; receive stamina from cafe
    click(1120, 660)
    click(630, 520, 1, 750)
    click(630, 670, 1, 750)

    ; return to menu
    returnMenu()
    MouseMove, 237, 66
    Sleep, 2000
}

club() {
    ; click club from menu
    clubLoc := {x: 560, y: 666}
    MouseMove, clubLoc.x, clubLoc.y
    Click

    ; accept energy

    ; return to menu
    MouseMove, 1200, 55
    Click
    Loop {
        PixelSearch, px, py, 237, 66, 237, 66, 0x533413
    } until ErrorLevel = 0
    MouseMove, px, py
    Sleep, 2000

    return 
}

mail() {
    ; click mail from menu
    MouseMove, 1112, 72
    Click
    Loop {
        PixelSearch, px, py, 125, 603, 125, 603, 0xF6F5F4
    } until ErrorLevel = 0
    Sleep, 500
    MouseMove, 1103, 689
    Click

    ; return to menu
    Loop, 10 {
        Click
    }
    MouseMove, 1200, 55
    Click
    Loop {
        PixelSearch, px, py, 237, 66, 237, 66, 0x533413
    } until ErrorLevel = 0
    MouseMove, px, py
    Sleep, 2000

    return
}

lessons() {
    ; Enter lessons menu
    click(208, 670)
    pixelSearchCont(0xFFFFFF, 360, 330)

    ; Click on the first location (Schale Office)
    click(900, 200,, 250)

    ; Wait after loading
    pixelSearchCont(0xE0D4CA, 1000, 240)
    click(1150, 675,, 250)

    ; Select best class (last 2) regardless of students
    click(350, 550,, 500)
    pixelSearchCont(0xF7F7F7, 400, 550)
    loop {
        click(600, 550)
        PixelSearch, px, py, 500, 225, 500, 225, 0x724C2D, Fast
    } until ErrorLevel = 0

    click(900, 400,, 500)
    pixelSearchCont(0xF7F7F7, 400, 550)
    loop {
        click(600, 550)
        PixelSearch, px, py, 500, 225, 500, 225, 0x724C2D, Fast
    } until ErrorLevel = 0

    returnMenu()
}

daily() {
    ; click tasks from menu
    MouseMove, 72, 262
    Click
    Loop {
        PixelSearch, px, py, 137, 255, 137, 255, 0xF6F5F4
    } until ErrorLevel = 0
    Sleep, 500
    MouseMove, 1101, 677
    Click
    Loop, 20 {
        Click
    }

    ; return to menu
    MouseMove, 1202, 57
    Click
    Loop {
        PixelSearch, px, py, 237, 66, 237, 66, 0x533413
    } until ErrorLevel = 0
    MouseMove, px, py
    Sleep, 2000

    return 
}

campaign() {
    MouseMove, 1166, 572
    Click

    bounty()
    mission()

    return
}

bounty() {
    return
}

mission() {
    return
}

click(x, y, count=1, wait=0) {
    Sleep, wait
    Loop %count% {
        MouseMove, x, y
        Click
    }
    return
}