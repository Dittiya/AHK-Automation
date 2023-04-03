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
    WinMove( , , 1280, 739, window)
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
    while !pixSearch(230, 70, 0x133453) {
        Click(1200, 55)
        Sleep 100
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
    while !pixSearch(360, 330, 0xFFFFFF) {
        Click(208, 670)
        Sleep 100
    }

    ; click on the first location 
    Sleep 250
    Click(900, 200)

    ; wait after loading
    while !pixSearch(1000, 240, 0xCAD4E0)
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

lessonsV2() {
    ; enter lessons menu
    while !pixSearch(360, 330, 0xFFFFFF) {
        Click(208, 670)
        Sleep 100
    }

    ; click on the first location 
    Sleep 250
    Click(900, 350)

    ; wait after loading
    while !pixSearch(1000, 240, 0xCAD4E0)
        Sleep 100
    Sleep 750
    Click(1150, 675)

    ; select best classes (last 2)
    classes := [{x:350, y:550}, {x:950, y:400}]
    for cls in classes {
        while !pixSearch(800, 350, 0x2D4C72) {
            Click(cls.x, cls.y)
            Sleep 250
        }
        Click(600, 600)
        while !pixSearch(500, 430, 0x2D4C72) {
            Click(780, 430)
            Sleep 250
        }
        Sleep 250
        Click(600, 600)
    }

    returnMenu()
}

club() {
    ; click club from menu
    while pixSearch(230, 70, 0x133453) {
        Click(560, 666)
        Sleep 100
    }
    
    Sleep 750

    ; return to menu
    returnMenu()
}

mail() {
    ; click mail from menu
    while !pixSearch(100, 230, 0xFFFFFF) {
        Click(1112, 72)
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

    while !pixSearch(600, 140, 0x2D4663) {
        Sleep 100
    }

    Sleep 750
    Click(1101, 677)

    ; return to menu
    returnMenu()
}

campaign() {
    while pixSearch(230, 70, 0x133453) {
        Click(1166, 572)
        Sleep 100
    }

    bounty()

    Sleep 500
    Click(55, 75)
    Sleep 500

    scrimmage()
}

bounty() {
    ; find bounty button
    while !pixSearch(800, 650, 0x435266) {
        Click(730, 450)
        Sleep 250
    }
    Sleep 750

    locations := [300, 420, 555]
    for _, loc in locations {
        Click(800, loc)
        while !pixSearch(450, 500, 0xFFFFFF)
            Sleep 100
        Sleep 200
        Click(1080, 640)

        while !pixSearch(500,300, 0xF7F7F6)
            Sleep 100
        Sleep 200
        Click(1000, 320)
        Sleep 200

        Click(900, 430)
        Sleep 500
        Click(700, 500)

        while !pixSearch(280, 555, 0xF6FEFD) {
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
        while !pixSearch(800, 150, 0x2D4C72)
            Sleep 100
        Sleep 200
        Click(1045, 210)

        while !pixSearch(500, 300, 0xF7F7F6)
            Sleep 100
        Sleep 200
        Click(1000, 320)
        Sleep 200

        Click(900, 430)
        Sleep 500
        Click(700, 500)

        while !pixSearch(1200, 180, 0x1A3351) {
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
    club()
}

+g:: {
    startTime := A_TickCount

    cafe()
    lessonsV2()
    club()
    mail() 
    daily()
    campaign()
   
    elapsedTime := A_TickCount - startTime
    elapsedTime := Ceil(elapsedTime / 1000) 
    MsgBox elapsedTime "s have passed.", "Elapsed Time", "T1"

    exitAuto()
}