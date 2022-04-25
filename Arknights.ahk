#NoEnv
#IfWinActive BlueStacks 10
#SingleInstance Force
#Include Lib/image_search.ahk
SetWorkingDir, Arknights
WinGetPos winX, winY, winW, winH, BlueStacks 10

Esc::
ExitApp
return

^e::
collectPath := A_ScriptDir . "\Arknights\collect.png"
collect := new ImgSearch(collectPath, 100)
collect.click(3,3)
collect.click(1,0.5,0,-50)
return

^s::
Gosub, base
Gosub, collect_resources
Gosub, overview_menu

return

^g::
; confirm := {x:winW*0.9, y:winH*0.95}
confirm := {x:winW*0.1, y:winH*0.1}
Gosub, replace_control_center
click(confirm.x, confirm.y)
Gosub, check_overview

Gosub, replace_reception_room
MouseMove, confirm.x, confirm.y
Click
Gosub, check_overview

Gosub, replace_trading_post_1
MouseMove, confirm.x, confirm.y
Click
Gosub, check_overview

MouseMove, winW*0.9, winH*0.5
Send, {WheelDown}
Sleep, 750
Click

Gosub, replace_factory_gold_1
MouseMove, confirm.x, confirm.y
Click
Gosub, check_overview

Gosub, replace_power_1
MouseMove, confirm.x, confirm.y
Click
Gosub, check_overview

MouseMove, winW*0.9, winH*0.5
Loop, 4 {
    Send, {WheelDown}
    Sleep, 475
    If (A_Index = 4)
        Click
}

Gosub, replace_trading_post_2
click(confirm.x, confirm.y)

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

; Testing keybind
^v::
MouseMove, winW*0.9, winH*0.5
Send, {WheelDown}
Sleep, 1000

MouseMove, winW*0.9, winH*0.5
Loop, 4 {
    Send, {WheelDown}
    Sleep, 475
    If (A_Index = 4)
        Click
}

Gosub, replace_trading_post_2
click(winW*0.1, winH*0.1)
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

replace_control_center:
var := 73
amiya := new ImgSearch(A_ScriptDir . "\Arknights\amiya_work.png", var)
swire := new ImgSearch(A_ScriptDir . "\Arknights\swire_work.png", var)
if (amiya.found) {
    amiya.click(1)
    Gosub, deselect_all
    Gosub, swire_config
} else {
    swire.click(1)
    Gosub, deselect_all
    Gosub, amiya_config
}
return

replace_reception_room:
var := 73
saria := new ImgSearch(A_ScriptDir . "\Arknights\saria_work.png", var)
utage := new ImgSearch(A_ScriptDir . "\Arknights\utage_work.png", var)
if (saria.found) {
    saria.click(1)
    Gosub, deselect_all
    Gosub, utage_config
} else {
    utage.click(1)
    Gosub, deselect_all
    Gosub, saria_config
}
return

replace_trading_post_1:
var := 70
exu := new ImgSearch(A_ScriptDir . "\Arknights\exu_work.png")
gummy := new ImgSearch(A_ScriptDir . "\Arknights\gummy_work.png", var)
if (exu.found) {
    exu.click(1)
    Gosub, deselect_all
    Gosub, gummy_config
} else {
    gummy.click(1)
    Gosub, deselect_all
    Gosub, exu_config
}
return

replace_factory_gold_1:
variance := 73
gravel := new ImgSearch(A_WorkingDir . "\gravel_work.png", variance)
cuora := new ImgSearch(A_WorkingDir . "\cuora_work.png", variance)

if (gravel.found) {
    gravel.click(1)
    Gosub, deselect_all
    Gosub, cuora_config
} else {
    cuora.click(1)
    Gosub, deselect_all
    Gosub, gravel_config
}
return

replace_power_1:
variance := 70
greyy := new ImgSearch(A_WorkingDir . "\greyy_work.png", variance)
ifrit := new ImgSearch(A_WorkingDir . "\ifrit_work.png", variance)

if (greyy.found) {
    greyy.click(1)
    Gosub, operators_menu
    scrollRight(3)
    Gosub, ifrit_config
} else {
    ifrit.click(1)
    Gosub, operators_menu
    scrollRight(3)
    Gosub, greyy_config
}
return

replace_trading_post_2:
variance := 73
mousse := new ImgSearch(A_WorkingDir . "\mousse_work.png", variance)
melantha := new ImgSearch(A_WorkingDir . "\melantha_work.png", variance)

if(mousse.found) {
    mousse.click(1)
    Gosub, deselect_all
    Gosub, melantha_config
} else {
    melantha.click(1)
    Gosub, deselect_all
    Gosub, mousse_config
}

return

; Control Center config with Swire
swire_config:
var := 120
swire := A_ScriptDir . "\Arknights\swire.png"
dobermann := A_ScriptDir . "\Arknights\dobermann.png"
scavenger := A_ScriptDir . "\Arknights\scavanger.png"
greythroat := A_ScriptDir . "\Arknights\greythroat.png"
red := A_ScriptDir . "\Arknights\red.png"

array := [swire, dobermann, scavenger, greythroat, red]
replaceOps(array, var)
return

; Control Center config with Amiya
amiya_config:
var := 100
amiya := A_ScriptDir . "\Arknights\amiya.png"
ash := A_ScriptDir . "\Arknights\ash.png"
blitz := A_ScriptDir . "\Arknights\blitz.png"
tachanka := A_ScriptDir . "\Arknights\tachanka.png"
nearl := A_ScriptDir . "\Arknights\nearl.png"

array := [amiya, ash, blitz, tachanka, nearl]
replaceOps(array, var)
return

; Reception Room config with Utage
utage_config:
var := 125
utage := A_ScriptDir . "\Arknights\utage.png"
rope := A_ScriptDir . "\Arknights\rope.png"

array := [utage, rope]
replaceOps(array, var)
return

; Reception Room config with Saria
saria_config:
var := 115
saria := A_ScriptDir . "\Arknights\saria.png"
gitano := A_ScriptDir . "\Arknights\gitano.png"

array := [saria, gitano]
replaceOps(array, var)
return

; Trading Post config with Exu
exu_config:
var := 100
exu := A_ScriptDir . "\Arknights\exu.png"
lappland := A_ScriptDir . "\Arknights\lappland.png"
texas := A_ScriptDir . "\Arknights\texas.png"

array := [exu, lappland, texas]
replaceOps(array, var)
return

; Trading Post config with Gummy
gummy_config:
gummy := A_ScriptDir . "\Arknights\gummy.png"
midnight := A_ScriptDir . "\Arknights\midnight.png"
catapult := A_ScriptDir . "\Arknights\Catapult.png"

array := [gummy, midnight, catapult]
replaceOps(array)
return

; Factory gold config with Gravel
gravel_config:
var := 120
gravel := A_WorkingDir . "\gravel.png"
spot := A_WorkingDir . "\spot.png"
haze := A_WorkingDir . "\haze.png"

array := [gravel, spot, haze]
replaceOps(array, var)
return 

; Factory gold config with Cuora
cuora_config:
cuora := A_WorkingDir . "\cuora.png"
noir := A_WorkingDir . "\noir.png"
bubble := A_WorkingDir . "\bubble.png"

array := [cuora, noir, bubble]
replaceOps(array)
return 

ifrit_config:
var := 100
ifrit := A_WorkingDir . "\ifrit.png"

array := [ifrit]
replaceOps(array, var)
return

greyy_config:
var := 100
greyy := A_WorkingDir . "\greyy.png"

array := [greyy]
replaceOps(array, var)
return

melantha_config:
var := 100
melantha := A_WorkingDir . "\melantha.png"
orchid := A_WorkingDir . "\orchid.png"
jaye := A_WorkingDir . "\jaye.png"

array := [melantha, orchid, jaye]
replaceOps(array, var)
return

mousse_config:
var := 100
mousse := A_WorkingDir . "\mousse.png"
fang := A_WorkingDir . "\fang.png"
matoimaru := A_WorkingDir . "\matoimaru.png"

array := [mousse, fang, matoimaru]
replaceOps(array, var)
return

; Hiring process
autohire:
coords := [{x:winW*0.4, y:winH*0.55}, {x:winW*0.65, y:winH*0.55}, {x:winW*0.4, y:winH*0.9}]
mx := winW*0.61
my := winH*0.075

for _, coord in coords {
    MouseMove, coord.x, coord.y
    Click
    Sleep, 3000
    MouseClick, left, winW*0.9, winH*0.1
    Loop {
        PixelSearch, px, py, mx, my, mx+1, my+1, 0xFFFFFF
        Click
    } until ErrorLevel = 0
    Sleep, 500
}
return

deselect_all:
Gosub, operators_menu
des := new ImgSearch(A_ScriptDir . "\Arknights\des_icon.png", 70)
des.click()
return

operators_menu:
pos :=  {x:winW*0.86, y:winH*0.95}
color := 0xA87500

pixelDif(color, pos.x, pos.y)
return

check_overview:
pos := {x:winW*0.07, y:winH*0.52}
color := 0xFFCC33

pixelDif(color, pos.x, pos.y)
return

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
        PixelSearch, px, py, x, y, x+rx, y+ry, color
    } Until ErrorLevel = 0
    return
}