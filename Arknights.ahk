#NoEnv
#IfWinActive BlueStacks 10
#SingleInstance Force
SetWorkingDir, Arknights
WinGetPos winX, winY, winW, winH, BlueStacks 10
#Include Lib/image_search.ahk
#Include config.ahk
#Include rooms.ahk
#Include testing.ahk

Esc::
ExitApp
return

^w::
initLoc := {x:458, y:181}
confirm := {x:winW*0.9, y:winH*0.95}

click(initLoc.x, initLoc.y)
click(initLoc.x, initLoc.y+300)
click(initLoc.x+150, initLoc.y)
click(initLoc.x+150, initLoc.y+300)
click(initLoc.x+300, initLoc.y)
click(confirm.x, confirm.y)
return

^e::
changeSize()
return

+r::
scrollDown()
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
baseAutomation(confirm)
return

+g::
changeSize()
Sleep, 250

confirm := {x:winW*0.9, y:winH*0.95}
baseAutomation(confirm)
return

; Hotkey for autohire process
^d::
Gosub, autohire
return

^f::
MouseGetPos, mx, my
MouseMove, mx, my
PixelGetColor, pc, mx, my
MsgBox, % pc " at " mx "x" my
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
autohire:
coords := [{x:winW*0.4, y:winH*0.55}, {x:winW*0.65, y:winH*0.55}, {x:winW*0.4, y:winH*0.9}]
mx := winW*0.61
my := winH*0.075

for _, coord in coords {
    MouseMove, coord.x, coord.y
    Click
    MouseClick, left, winW*0.9, winH*0.1
    Sleep, 2000
    Loop {
        PixelSearch, px, py, mx, my, mx+1, my+1, 0xFFFFFF
        Click
    } until ErrorLevel = 0
    Sleep, 500
}
return

deselect_all:
Gosub, operators_menu
des := new ImgSearch(A_ScriptDir . "\Arknights\des_icon.png", 73)
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
MouseClickDrag, left, winW/2, winH/2, winW/2-200, winH/2, 10
return

scrollRight(n) {
    global winW, winH

    loop, %n% {
        MouseClickDrag, left, winW/2, winH/2, winW/2+550, winH/2, 5
    }
    Sleep, 500
    return
}

scrollUntilFound(img, tolerance=70) {
    image := new ImgSearch(img, tolerance)
    if (!image.found) {
        Loop {
            If (A_Index = 1) {
                scrollRight(1)
            }
            Gosub, scroll_left
            image := new ImgSearch(img, tolerance)
        } Until ErrorLevel = 0
    } 
    image.click()
    return
}

replaceOps(operators, var=100) {
    scrollRight(1)
    for _, image in operators {
        scrollUntilFound(image, var)
    }
    return
}

click(x, y, count=1) {
    Loop %count% {
        MouseMove, x, y
        Click
    }
    return
}

pixelDif(color, x, y, rx=0, ry=0) {
    Loop {
        PixelSearch, px, py, x, y, x+rx, y+ry, color,, Fast
    } Until ErrorLevel = 0
    return
}

changeSize() {
    WinMove, BlueStacks 10, , 150, 125, 1280, 735
    return
}

scrollDown() {
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

    ; 1F
    controlCenter()
    click(confirm.x, confirm.y)
    checkOverview()

    reception()
    click(confirm.x, confirm.y)
    checkOverview()

    tradingPost1()
    click(confirm.x, confirm.y)
    checkOverview()

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.4, 12
    Click
    Sleep, 100

    ; B1
    factoryGold1()
    click(confirm.x, confirm.y)
    checkOverview()

    powerPlant1()
    click(confirm.x, confirm.y)
    checkOverview()

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100
    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100

    ; B3
    tradingPost2()
    click(confirm.x, confirm.y)
    checkOverview()

    factoryGold2()
    click(confirm.x, confirm.y)
    checkOverview()

    powerPlant2()
    click(confirm.x, confirm.y)
    checkOverview()

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100

    office()
    click(confirm.x, confirm.y)
    checkOverview()

    MouseClickDrag, left, winW*0.9, winH*0.9, winW*0.9, winH*0.25, 12
    Click
    Sleep, 100

    ; B4
    xp1()
    click(confirm.x, confirm.y)
    checkOverview()

    xp2()
    click(confirm.x, confirm.y)
    checkOverview()

    xp3()
    click(confirm.x, confirm.y)
    checkOverview()

    return
}