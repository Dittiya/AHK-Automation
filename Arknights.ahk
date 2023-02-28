#NoEnv
#IfWinActive BlueStacks App Player
#SingleInstance Force
SetWorkingDir, Arknights
WinGetPos winX, winY, winW, winH, BlueStacks App Player
#Include config.ahk
#Include rooms.ahk
#Include Lib/image_search.ahk
#Include testing.ahk
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

Esc::
ExitApp
return

^e::
changeSize()
return

+r::
MouseMove, 0, 0 
return

^r::
dorm()
return

^s::
Gosub, base
Gosub, collect_resources
Gosub, overview_menu

return

^g::
changeSize()
Sleep, 250

confirm := {x:winW*0.1, y:winH*0.1}
startTime := A_TickCount
baseAutomation(confirm)
elapsedTime := A_TickCount - startTime
elapsedTime /= 1000
MsgBox, % elapsedTime "s Have passed."
return

+g::
changeSize()
Sleep, 250

confirm := {x:winW*0.9, y:winH*0.95}
startTime := A_TickCount

baseAutomation(confirm)
dorm()

elapsedTime := A_TickCount - startTime
elapsedTime /= 1000
MsgBox, , Time, % elapsedTime "s Have passed.", 1
exitApp()
return

; Hotkey for autohire process
^d::
autohire()
return

^f::
base()
return

base:
base := {x:winW*0.8, y:winH*0.85}
MouseClick, left, base.x, base.y
return 

collect_resources:
bell := {x:winW*0.915, y:winH*0.15}
pc := 0xFFFFFF
Loop {
    PixelSearch, px, py, bell.x, bell.y, bell.x+10, bell.y+10, pc, Fast
} until ErrorLevel = 0
MouseMove, px, py
Sleep, 3000
MouseClick, left, px, py

collect := {x:winW*0.2, y:winH*0.95}
MouseMove, collect.x, collect.y
Sleep, 250
Loop {
    Click
    if A_Index < 4
        Sleep, 3000
    else break
}
return

overview_menu:
ov := {x:winW*0.1, y:winH*0.2}
MouseMove, ov.x, ov.y
Click
Sleep, 500
Click
Sleep, 3000
return


; Hiring process
autohire() {
    coords := [{x:300, y:400}, {x:900, y:400}, {x:300, y:670}]

    for _, coord in coords {
        click(coord.x, coord.y)
        Sleep, 1000
        Loop {
            PixelSearch, px, py, 790, 50, 790, 50, 0xFFFFFF
            click(1180, 76, 1, 500)
        } until ErrorLevel = 0
    }
    return
}

deselectAll() {
    pixelDif(0xA87500, 1455, 675)
    click(450, 680)
    return
}

deselect_all:
Gosub, operators_menu
des := new ImgSearch(A_ScriptDir . "\Arknights\des_icon.png", 73, 1)
des.click()
return

operators_menu:
pos :=  {x:winW*0.86, y:winH*0.95}
color := 0xA87500

pixelDif(color, pos.x, pos.y)
return

checkOverview() {
    assigned := new ImgSearch(A_WorkingDir . "\assigned.png", 73, 1)
    return
}

scroll_left:
MouseClickDrag, left, winW/2, winH/2, winW/2-200, winH/2, 8
return

exitApp() {
    MsgBox, , Finished, Automation done!, 0.5
    ExitApp
}

scrollRight(n) {
    global winW, winH

    loop, %n% {
        MouseClickDrag, left, winW/2, winH/2, winW/2+550, winH/2, 5
    }
    Sleep, 500
    return
}

scrollDown(x, y) {
    global winW, winH

    MouseMove, winW*0.9, winH*0.9
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*x, winH*y, 10
    Click
    Sleep, 100
}

scrollUp(x, y) {
    global winW, winH

    MouseMove, winW*x, winH*y
    Sleep, 100
    MouseClickDrag, left, winW*x, winH*y, winW*0.9, winH*0.9, 10
    Click
    Sleep, 100
}

scrollUntilFound(img, tolerance=70) {
    image := new ImgSearch(img, tolerance)
    if (!image.found) {
        Loop {
            ; If (A_Index = 1) {
            ;     scrollRight(1)
            ; }
            Gosub, scroll_left
            image := new ImgSearch(img, tolerance)
        } Until ErrorLevel = 0
    } 
    image.click()
    return
}

replaceOps(operators, var=100) {
    for _, image in operators {
        scrollUntilFound(image, var)
    }
    return
}

click(x, y, count=1, wait=100) {
    SendMode, Input

    Loop %count% {
        Sleep, wait
        MouseMove, x, y
        Click
    }

    SendMode, Event
    return
}

pixelDif(colorId, x, y, rx=0, ry=0) {
    Loop {
        PixelSearch, px, py, x, y, x+rx, y+ry, colorId,, Fast
    } Until ErrorLevel = 0
    return
}

changeSize() {
    WinMove, BlueStacks App Player, , , , 1649, 720
    ; WinMove, BlueStacks App Player, , 150, 125, 1280, 735
    return
}

scrollDownConfig() {
    global winW, winH
    speed := 12

    ; B1
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.4, speed
    Click
    Sleep, 100


    ; B2
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, speed
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, speed
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, speed
    Click
    Sleep, 100


    ; B3
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, speed
    Click
    Sleep, 100

    return
}

baseAutomation(confirm) {
    global winW, winH

    config := baseConfig()

    ; 1F
    cc := new ImgSearch(A_WorkingDir . "\control_center.png", 90)
    if (!cc.found) {
        MsgBox, Img not found %config%
        return
    }

    click(cc.X+200, cc.Y+50)
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

    scrollDown(0.9, 0.4)

    ; B1
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

    scrollDown(0.9, 0.25)
    scrollDown(0.9, 0.25)

    ; B3
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

    scrollDown(0.9, 0.25)

    office := new ImgSearch(A_WorkingDir . "\office.png", 100)
    if (!office.found) {
        MsgBox, img not found
        return
    }

    click(office.X+150, office.Y+50)
    office(config)
    click(confirm.x, confirm.y)
    checkOverview()

    scrollDown(0.9, 0.25)

    ; B4
    ft := new ImgSearch(A_WorkingDir . "\factory.png", 110)
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
    
    return
}

dorm() {
    scrollDown(0.9, 0.25)
    scrollDown(0.9, 0.25)

    Sleep, 500

    click(660, 600)
    deselectAll()
    Send, ^w
    checkOverview()

    click(660, 225)
    deselectAll()
    Send, ^w
    checkOverview()

    scrollUp(0.9, 0.25)
    scrollUp(0.9, 0.25)

    click(660, 270)
    deselectAll()
    Send, ^w
    checkOverview()

    scrollUp(0.9, 0.25)
    scrollUp(0.9, 0.25)

    click(660, 270)
    deselectAll()
    Send, ^w
    checkOverview()

    return
}

base() {
    click(1000, 650)
    pixelDif(0xFFFFFF, 175, 135)
    Loop {
        PixelSearch, _x, _y, 175, 135, 175, 135, 0xFFFFFF,, Fast
        click(1200, 150)
    } until ErrorLevel = 1
    MouseMove, 250, 700
    click(250, 700, 50)
    click(250, 600)
    return
}