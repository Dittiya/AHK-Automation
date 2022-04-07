#NoEnv
SetWorkingDir % A_ScriptDir

#Include, Module\image_search.ahk

WinGetPos winX, winY, winW, winH, BlueStacks 10
#IfWinActive BlueStacks 10
    ^p::
    ExitApp
    return

    ; Find and click Base
    ^q::
    basePath := A_ScriptDir . "\Arknights\base_icon.png"
    base := new ImgSearch(basePath)
    base.click()
    return

    ; Continuously find Bell then click when found
    ^w::
    bellPath := A_ScriptDir . "\Arknights\bell.png"
    bell := new ImgSearch(bellPath, 70, 1)
    bell.click()
    return

    ^e::
    collectPath := A_ScriptDir . "\Arknights\p_icon.png"
    collect := new ImgSearch(collectPath, 70)
    collect.click(3,3)
    collect.click(1,0,0,-50)
    return

    ^a::
    ov := new ImgSearch(A_ScriptDir . "\Arknights\ov_icon.png")
    ov.click(1,1)
    ov.click(1,4)
    return 

    ; This should find amiya_work.png then Gosub to amiya config
    ; If not found then should search for swire_work.png then Gosub to swire config
    ^s::
    amiya := new ImgSearch(A_ScriptDir . "\Arknights\amiya_work.png")
    amiya.click(1,3)
    Gosub, deselect_all
    if (amiya.found)
        Gosub, swire_config
    else
        Gosub, amiya_config
    return
    
    ^d::
    return

    ; Prototype all
    ^o::
    Gosub, ^q
    Gosub, ^w
    Gosub, ^a
    Gosub, ^s
    MsgBox, , Done, Task done, 3
    return

    ; Control Center config with Swire
    swire_config:
    swire := A_ScriptDir . "\Arknights\swire.png"
    dobermann := A_ScriptDir . "\Arknights\dobermann.png"
    scavenger := A_ScriptDir . "\Arknights\scavanger.png"
    greythroat := A_ScriptDir . "\Arknights\greythroat.png"
    red := A_ScriptDir . "\Arknights\red.png"

    array := [swire, dobermann, scavenger, greythroat, red]
    For i, image in array {
        scrollUntilFound(image, 100)
        scrollRight(3)
    }
    confirm := new ImgSearch(A_ScriptDir . "\Arknights\confirm.png")
    confirm.click()
    return

    ; Control Center config with Amiya
    amiya_config:
    amiya := A_ScriptDir . "\Arknights\amiya.png"
    ash := A_ScriptDir . "\Arknights\ash.png"
    blitz := A_ScriptDir . "\Arknights\blitz.png"
    tachanka := A_ScriptDir . "\Arknights\tachanka.png"
    nearl := A_ScriptDir . "\Arknights\nearl.png"

    array := [amiya, ash, blitz, tachanka, nearl]
    For i, image in array {
        scrollUntilFound(image, 100)
        scrollRight(3)
    }
    confirm := new ImgSearch(A_ScriptDir . "\Arknights\confirm.png")
    confirm.click()
    return

return

deselect_all:
des := new ImgSearch(A_ScriptDir . "\Arknights\des_icon.png")
des.click()
return

scroll_left:
MouseClickDrag, left, winW/2, winH/2, winW/2-200, winH/2, 10
return

scrollRight(n) {
    global winW, winH

    loop, %n% {
        MouseClickDrag, left, winW/2, winH/2, winW/2+550, winH/2, 5
    }
    return
}

scrollUntilFound(img, tolerance=70) {
    Loop {
        Gosub, scroll_left
        image := new ImgSearch(img, 100)
    } Until ErrorLevel = 0
    image.click()

    return
}