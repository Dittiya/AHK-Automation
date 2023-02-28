#NoEnv
#SingleInstance, Force
#IfWinActive BlueStacks App Player
SendMode Input
SetWorkingDir, %A_ScriptDir%
WinGetPos winX, winY, winW, winH, BlueStacks App Player

Esc::
ExitApp
return

^g::
changeSize()
startTime := A_TickCount

cafe()
Sleep, 250
lessons()
Sleep, 250
club()
Sleep, 250
mail()
Sleep, 250
daily()
Sleep, 250
campaign()

elapsedTime := A_TickCount - startTime
elapsedTime /= 1000
MsgBox, , Elapse Time, % elapsedTime "s Have passed.", 2

exitApp()
return

+g::
scrimmage()
return

changeSize() {
    WinMove, BlueStacks App Player, , 150, 125, 1280, 735
    return
}

exitApp() {
    MsgBox, , Finished, Automation done!, 0.5
    ExitApp
}

returnMenu() {
    Loop {
        PixelSearch, px, py, 237, 66, 237, 66, 0x533413
        click(1200, 55)
    } until ErrorLevel = 0
    Sleep, 2000
}

; TODO
; Make this function able to process continuous click until pixel is found
pixelSearchCont(colorId, X1, Y1, range=0, move=0, clicker=0) {
    X2 := X1 + range
    Y2 := Y1 + range
    Loop {
        PixelSearch, outX, outY, X1, Y1, X2, Y2, colorId, 2, Fast
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
        PixelSearch, px, py, cafe.x, cafe.y, cafe.x, cafe.y, cafe.col, 2, Fast
    } until ErrorLevel = 0
    Sleep, 750
    click(895, 215, 2)

    ; receive stamina from cafe
    click(1120, 660,, 1000)
    click(630, 520, 1, 750)
    click(630, 670, 1, 750)

    ; return to menu
    returnMenu()
}

club() {
    ; click club from menu
    click(560, 666)

    ; accept energy
    pixelSearchCont(0xF7F7F7, 850, 300)

    returnMenu()
}

mail() {
    ; click mail from menu
    click(1112, 72)
    pixelSearchCont(0xF6F5F4, 120, 600)
    click(1103, 689,, 500)

    returnMenu()
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
        PixelSearch, px, py, 500, 225, 500, 225, 0x724C2D, 2, Fast
    } until ErrorLevel = 0

    click(900, 400, 50, 500)
    pixelSearchCont(0xF7F7F7, 400, 550)
    loop {
        click(600, 550)
        PixelSearch, px, py, 500, 225, 500, 225, 0x724C2D, 2, Fast
    } until ErrorLevel = 0

    returnMenu()
}

daily() {
    ; click tasks from menu
    click(72, 262)
    pixelSearchCont(0x63462D, 600, 140)
    Sleep, 250
    click(1101, 677,, 500)

    returnMenu()
}

campaign() {
    MouseMove, 1166, 572
    Click

    pixelSearchCont(0xFBFAF8, 400, 60)
    Sleep, 300

    bounty()
    click(55, 69)
    Sleep, 500
    pixelSearchCont(0xFBFAF8, 400, 60)

    scrimmage()
    click(55, 69)
    pixelSearchCont(0xFBFAF8, 400, 60)
    Sleep, 200

    mission()

    return
}

bounty() {
    ; find bounty button
    click(730, 450)
    pixelSearchCont(0xFFFFFF, 730, 190)
    Sleep, 500

    locations := [300, 420, 555]
    for _, loc in locations {
        click(800, loc)
        pixelSearchCont(0xFFE48D, 1045, 555)
        Sleep, 200
        click(1080, 640)

        pixelSearchCont(0xF6F7F7, 500, 300)
        Sleep, 200
        click(1000, 320)
        Sleep, 200

        click(900, 430)
        Sleep, 500
        click(700, 500)

        loop {
            click(555, 600, 1, 500)
            PixelSearch, px, py, 280, 555, 280, 555, 0xFDFEF6, 2, Fast
        } until ErrorLevel = 0

        Sleep, 300
    }

    return
}

mission() {
    return
}

scrimmage() {
    ; find bounty button
    click(730, 600)
    pixelSearchCont(0x51331A, 1200, 180)
    Sleep, 500

    locations := [300, 420, 555]
    for _, loc in locations {
        click(800, loc)
        pixelSearchCont(0x724C2D, 1100, 150)
        Sleep, 200
        click(1045, 210)

        pixelSearchCont(0xF6F7F7, 500, 300)
        Sleep, 200
        click(1000, 320)
        Sleep, 200

        click(900, 430)
        Sleep, 500
        click(700, 500)

        loop {
            click(555, 700, 1, 100)
            PixelSearch, px, py, 1200, 180, 1200, 180, 0x51331A, 2, Fast
        } until ErrorLevel = 0

        Sleep, 250
    }

    return
}

click(x, y, count=1, wait=0) {
    Loop %count% {
        if (A_Index < 2) {
            Sleep, wait
        }
        MouseMove, x, y
        Click
    }
    return
}