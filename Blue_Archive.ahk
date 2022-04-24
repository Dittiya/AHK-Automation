#NoEnv
#IfWinActive BlueStacks 10
#SingleInstance Force
#Include Lib/image_search.ahk
SetWorkingDir, Blue Archive
WinGetPos winX, winY, winW, winH, BlueStacks 10

Esc::
ExitApp
return

^v::
color := 0xFFDD74
invitation := {x:winW*0.6, y:winH*0.9}
click(invitation.x, invitation.y)
invite := {x:780, y:247}
pixelDif(color, invite.x, invite.y)
click(invite.x, invite.y)
Sleep, 500
click(invite.x, invite.y+250)

return

^f::
mx := 780
my := 245
MouseMove, mx, my
PixelGetColor, pc, mx, my
MsgBox, % pc " at " mx "x" my
return

cafe:
cafe := {x:winW*0.08, y:winH*0.91}
click(cafe.x, cafe.y)

color := 0xFFDD74
invBtn := {x:winW*0.54, y:winH*0.65}
pixelDif(color, invBtn.x, invBtn.y)
click(invBtn.x, invBtn.y)

invitation := {x:winW*0.6, y:winH*0.9}
click(invitation.x, invitation.y)
invite := {x:780, y:247}
pixelDif(color, invite.x, invite.y)
click(invite.x, invite.y)
Sleep, 500
click(invite.x, invite.y+250)
Sleep, 500
click(invite.x+100, invite.y+250)


return

click(x, y, count=1) {
    Loop, %count% {
        MouseMove, x, y
        Click
    }
    return
}

pixelDif(color, x, y, rx=1, ry=1, var=1) {
    Loop {
        PixelSearch, px, py, x, y, rx, ry, color, var
        If (A_Index = 100) {
            MsgBox, Timed out
            Break
        }
    } Until ErrorLevel = 0
    MouseMove, px, py
    return
}