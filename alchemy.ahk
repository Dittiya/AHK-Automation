#NoEnv
#SingleInstance Force
#IfWinActive Alchemy Stars
SetWorkingDir, Alchemy
WinGetPos winX, winY, winW, winH, Alchemy Stars

Esc::
ExitApp
return

; Toggle click down or up
toggle := 0
^r::
toggle := !toggle
if (toggle) {
    Click, Down
} else {
    Click, Up
}
return

+r::
Loop {
    autoFish()
}
return

^d::
pixelSearchDiff(0xFFFFFF, 819, 523)
return

^g::
aurorian()
Sleep, 1500
colossus()
return

^t::
dispatch()
return 

click(x, y, count=1, wait=0) {
    loop, %count% {
        MouseMove, x, y
        Sleep, wait
        Click
    }
}

pixelSearchDiff(colorId, x, y, pad=0, var=0) {
    loop {
        PixelSearch, outX, outY, x, y, x+pad, y+pad, colorId,, Fast
    } until ErrorLevel = 0
}

goHome() {
    Loop {
        PixelSearch, outX, outY, 65, 145, 65, 145, 0xFFFFFF,, Fast
        click(255, 72)
    } until ErrorLevel = 0
}

; Fishing
autoFish() {
    fishingBtn := {x:1470, y:580}
    bar := {x:1171, y:680}
    barColor := 0x4DDAFF

    ; Click start fishing button
    MouseMove, fishingBtn.x, fishingBtn.y
    Click

    ; Wait until orange bar appears
    Loop {
        PixelSearch, px, py, bar.x, bar.y, bar.x+1, bar.y, barColor, Fast
    } until ErrorLevel = 0

    ; Click fishing button repeatedly until button disappears
    delay := 50
    MouseMove, fishingBtn.x, fishingBtn.y
    Loop {
        PixelSearch, px, py, fishingBtn.x, fishingBtn.y, fishingBtn.x+1, fishingBtn.y, 0xFFFFFF, fast
        Click, Down
        Sleep, delay
        Click, Up
    } until ErrorLevel = 1

    ; Click outside the rewards repeatedly until button appears
    Loop {
        MouseMove, bar.x, bar.y
        Click
        PixelSearch, px, py, fishingBtn.x, fishingBtn.y, fishingBtn.x+1, fishingBtn.y, 0xFFFFFF, fast
    } until ErrorLevel = 0
}

aurorian() {
    ; Click aurorian tab
    click(1250, 865)
    pixelSearchDiff(0xFFFFFF, 819, 523)

    ; Select character with level below 80 and affinity below 10
    character := {x: 1400, y: 275}
    click(character.x, character.y,, 1000)

    ; Level up 
    pixelSearchDiff(0xFFFFFF, 1530, 500)
    click(1500, 860,, 500)
    click(1040, 180,, 500)
    click(1500, 860,, 500)

    ; Increase affinity
    click(123, 70,, 500)
    click(1530, 215,, 500)
    click(1460, 400,, 2000)
    click(1500, 860,, 500)

    goHome()
}

colossus() {
    ; Enter colossus
    click(1150, 500,, 500)
    pixelSearchDiff(0xFFFF3C, 946, 72)

    ; Claim resources
    click(1524, 500,, 500)
    click(1480, 335,, 750)

    Sleep, 1000
    dispatch()
}

imgSearch(filename, var) {
    global winW, winH

    ImageSearch, outX, outY, 0, 0, winW, winH, *%var% %filename%
    if (ErrorLevel = 2) {
        MsgBox, , ErrorLevel 2, Image not available, 2
    }
    else if (ErrorLevel = 1) {
        MsgBox, , ErrorLevel 1, %filename% Image not found on %var%, 1
    } else {
        click(outX+5, outY+5, , 100)
    }
    Sleep, 250
}

dispatch() {
    complete := A_ScriptDir . "\Alchemy\c.png"
    Loop, 4 {
        imgSearch(complete, 85)
        click(400, 200, 5, 100)
    }
}