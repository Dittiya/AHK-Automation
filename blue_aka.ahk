#NoEnv
#SingleInstance, Force
#IfWinActive BlueStacks 10
SendMode Input
SetWorkingDir, %A_ScriptDir%
WinGetPos winX, winY, winW, winH, BlueStacks 10

Esc::
ExitApp
return

^f::
MouseGetPos, mx, my
PixelGetColor, pc, mx, my 
MsgBox, % pc " at " mx "x" my
return

^e::
autoplay()
return

^g::
daily()
return

cafe() {
    ; click cafe from menu
    cafeLoc := {x:88, y:668}
    MouseMove, cafeLoc.x, cafeLoc.y
    Click

    ; click confirm when cafe loaded
    cafe := {col: 0xEFEFEF, x: 467, y: 440}
    Loop {
        PixelSearch, px, py, cafe.x, cafe.y, cafe.x, cafe.y, cafe.col, Fast
    } until ErrorLevel = 0
    Sleep, 750
    MouseMove, 630, 460
    Click

    ; receive stamina from cafe
    MouseMove, 1121, 654
    Click
    Sleep, 750
    MouseMove, 630, 520
    Click

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
    MouseMove, 208, 670
    Click
    Loop {
        PixelSearch, OutputVarX, OutputVarY, 68, 82, 68, 82, 0x986346
    } until ErrorLevel = 0
    Sleep, 500

    so := {x:727, y:218}
    MouseMove, so.x, so.y
    Click
    Loop {
        PixelSearch, OutputVarX, OutputVarY, 1091, 230, 1091, 230, 0xDFD4C9
    } until ErrorLevel = 0
    MouseMove, 1127, 673
    Click
    Loop {
        PixelSearch, OutputVarX, OutputVarY, 688, 262, 688, 262, 0xFFFFFF
    } until ErrorLevel = 0
    Sleep, 500

    ; click lesson location 1
    MouseMove, 301, 267
    Click
    Sleep, 1000
    MouseMove, 625, 565
    Click
    Sleep, 2000
    Loop, 200 {
        Click
    }
    ; click lesson location 2
    MouseMove, 641, 267
    Click
    Sleep, 1000
    MouseMove, 625, 565
    Click
    Sleep, 3000
    Loop, 200 {
        Click
    }

    ; return to menu
    MouseMove, 1109, 145
    Click
    Sleep, 500
    MouseMove, 1202, 57
    Click
    Loop {
        PixelSearch, px, py, 237, 66, 237, 66, 0x533413
    } until ErrorLevel = 0
    MouseMove, px, py
    Sleep, 2000

    return
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

autoplay() {
    loc := {x:414, y:324}
    yellow := {col:0x0BBEE1}E

    Loop {
        Loop {
            PixelSearch, px, py, 418, 323, 440, 325, 0x08BEE1, 2, Fast
            if (ErrorLevel = 0) {
                Sleep, 250
                Send, E
            }

            PixelSearch, px, py, 418, 323, 440, 325, 0xBBC237, 2, Fast
            if (ErrorLevel = 0) {
                Sleep, 250
                Send, Q
            }
        }
    }

    ; SetTimer, right_tile
    ; SetTimer, left_tile

    return
}

right_tile:
Loop {
    PixelSearch, px, py, 418, 323, 440, 325, 0x08BEE1, 2, Fast
} until ErrorLevel = 0
Sleep, 125
Send, E
return

left_tile:
Loop {
    PixelSearch, px, py, 418, 323, 440, 325, 0xBBC237, 2, Fast
} until ErrorLevel = 0
Sleep, 125
Send, Q
return