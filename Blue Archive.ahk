#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode "Pixel", "Window"
CoordMode "Mouse", "Window"

Esc::ExitApp

WINDOW := "BlueStacks"

HotIfWinactive WINDOW

/* 
 * Functions
 */

changeSize(window) {
    WinMove( , , 1280, 720, window)
    WinGetPos(&winX, &winY, &winWidth, &winHeight, window)
    MsgBox("Resized window to " winWidth "x" winHeight, "Resize window", "T1")
}

exitAuto() {
    MsgBox "Exiting app", "Automation done!", "T1"
    ExitApp
}

pixSearch(x, y, color ,pad:=0) {
    if PixelSearch(&px, &py, x, y, x+pad, y+pad, color, 2)
        return true
    return false
}

returnMenu() {
    x := 230
    y := 70
    x2 := x
    y2 := y
    color := 0x133453

    while PixelSearch(&px, &py, x, y, x2, y2, color, 2) = 0 {
        Click(1200, 55)
    }
    Sleep 3000
}

cafe() {
    ; click cafe from menu
    cafeLoc := {x:90, y:670}
    Click(cafeLoc.x, cafeLoc.y)

    ; continue clicking until cafe loaded
    while !pixSearch(825, 655, 0xFFFFFF) {
        Sleep 100
        Click(1000, 300)
    }

    ; receive stamina from cafe
    Sleep 1000
    Click(1120, 660)
    Sleep 750
    Click(630, 520)
    Sleep 750
    Click(630, 670)

    ; return to menu
    returnMenu()
}

lessons() {
    ; enter lessons menu
    Click(208, 670)
    x := 360
    y := 330
    color := 0xFFFFFF
    while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
        Sleep 100

    ; click on the first location 
    Sleep 250
    Click(900, 200)

    ; wait after loading
    x := 1000
    y := 240
    color := 0xCAD4E0
    while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
        Sleep 100
    Sleep 250
    Click(1150, 675)

    ; select best classes (last 2)
    Sleep 500
    Click(350, 550)

    x := 400
    y := 550
    color := 0xF7F7F7
    while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
        Sleep 100

    x := 500
    y := 225
    color := 0x2D4C72
    while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0 {
        Sleep 100
        Click(600, 550)
    }

    Sleep 500
    Click(900, 400, 50)

    x := 400
    y := 550
    color := 0xF7F7F7
    while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
        Sleep 100

    x := 500
    y := 225
    color := 0x2D4C72
    while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0 {
        Sleep 100
        Click(600, 550)
    }

    ; return to menu
    returnMenu()
}

club() {
    ; click club from menu
    Click(560, 666)

    while !pixSearch(450, 300, 0xF6F6F6) {
        Sleep 100
    }

    ; return to menu
    returnMenu()
}

mail() {
    ; click mail from menu
    Click(1112, 72)

    while !pixSearch(100, 230, 0xFFFFFF) {
        Sleep 100
    }

    Sleep 500
    Click(1103, 689)
    
    ; return to menu
    returnMenu()
}

daily() {
    ; click tasks from menu
    Click(72, 262)
    x := 600
    y := 140
    color := 0x2D4663
    while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
        Sleep 100
    Sleep 750
    Click(1101, 677)

    ; return to menu
    returnMenu()
}

campaign() {
    Click(1166, 572)

    x := 400
    y := 60
    color := 0xF8FAFB
    while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
        Sleep 100

    bounty()

    Sleep 500
    Click(55, 75)
    Sleep 500

    scrimmage()
}

bounty() {
    ; find bounty button
    Click(730, 450)
    x := 730
    y := 190
    color := 0xFFFFFF
    while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0 {
        Sleep 100
        Click(730, 450)
    }
    Sleep 750

    locations := [300, 420, 555]
    for _, loc in locations {
        Click(800, loc)
        x := 450
        y := 500
        color := 0xFFFFFF
        while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
            Sleep 100
        Sleep 200
        Click(1080, 640)

        x := 500
        y := 300
        color := 0xF7F7F6
        while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
            Sleep 100
        Sleep 200
        Click(1000, 320)
        Sleep 200

        Click(900, 430)
        Sleep 500
        Click(700, 500)

        x := 280
        y := 555
        color := 0xF6FEFD
        while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0 {
            Sleep 100
            Click(555, 700)
        }

        Sleep 300
    }
}

scrimmage() {
    ; find scrimmage button
    while !pixSearch(1200, 200, 0x1A3351) {
        Sleep 100
        Click(730, 600)
    }
    Sleep 750

    locations := [300, 420, 555]
    for _, loc in locations {
        Click(800, loc)
        x := 800
        y := 150
        color := 0x2D4C72
        while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
            Sleep 100
        Sleep 200
        Click(1045, 210)

        x := 500
        y := 300
        color := 0xF7F7F6
        while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0
            Sleep 100
        Sleep 200
        Click(1000, 320)
        Sleep 200

        Click(900, 430)
        Sleep 500
        Click(700, 500)

        x := 1200
        y := 180
        color := 0x1A3351
        while PixelSearch(&px, &py, x, y, x, y, color, 2) = 0 {
            Sleep 100
            Click(555, 700)
        }

        Sleep 300
    }
}

/* 
 * Hotkey
 */

^e:: {
    changeSize(WINDOW)
}

^r:: {
    mail()
}

+g:: {
    startTime := A_TickCount

    cafe()
    lessons()
    club()
    mail() 
    daily()
    campaign()
   
    elapsedTime := A_TickCount - startTime
    elapsedTime /= 1000
    MsgBox elapsedTime "s have passed.", "Elapsed Time", "T1"

    exitAuto()
}