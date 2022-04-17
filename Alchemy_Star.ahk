#SingleInstance, Force
#NoEnv
SendMode Input
SetWorkingDir, Alchemy Star

#IfWinActive, Alchemy Stars
WinGetPos winX, winY, winW, winH, Alchemy Stars
Esc::
ExitApp
return

^1::
Gosub, collect_dispatch
return

^f::
Gosub, level_unit
return 

enter_colossus:
col := {x:winW*0.7, y:winH*0.55}
MouseClick, left, col.x, col.y
return

click_resources:
MouseClick, left, winW-20, winH*0.5
Sleep, 1500
MouseClick, left, winW-80, winH/2-150
return

dispatch:
MouseClick, left, winW-100, winH/2+175
Sleep, 3000
return

collect_dispatch:
var := 70
Loop, 4 {
    Loop {
        disp := new ImgSearch(A_WorkingDir . "\complete.png", var)
    } until disp.found = True
    disp.click(1,1.5)
    Sleep, 750
    MouseClick, left, winX+30, winY+30
}
return

level_unit:
unitMenu := {x:winW*0.75, y:winH*0.9}
MouseClick, left, unitMenu.x, unitMenu.y
Sleep, 3000

unit := {x:winW*0.1, y:winH*0.2}
MouseClick, left, unit.x, unit.y
Sleep, 2000

lvl := {x:winW*0.9, y:winH*0.9}
MouseClick, left, lvl.x, lvl.y
Sleep, 2000

mats := {x:winW*0.65, y:winH*0.2}
MouseClick, left, mats.x, mats.y
Sleep, 500

upgrd := {x:winW*0.9, y:winH*0.9}
MouseClick, left, upgrd.x, upgrd.y
Sleep, 1000

back := {x:winW*0.1, y:winH*0.1}
MouseClick, left, back.x, back.y
Sleep, 1250

aff := {x:winW*0.95, y:winH*0.25}
MouseClick, left, aff.x, aff.y
Sleep, 2000

MouseClick, left, mats.x, mats.y+150
Sleep, 500

MouseClick, left, upgrd.x, upgrd.y
Sleep, 1000

MouseClick, left, back.x+100, back.y
Sleep, 3000
return
