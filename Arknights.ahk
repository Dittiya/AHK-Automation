#NoEnv
SetWorkingDir, Arknights
#Include, Module\image_search.ahk

WinGetPos winX, winY, winW, winH, BlueStacks 10
#IfWinActive BlueStacks 10

    ^r::
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
    Sleep, 4000
    bell.click(1,0.5)
    return

    ^e::
    collectPath := A_ScriptDir . "\Arknights\collect.png"
    collect := new ImgSearch(collectPath, 100)
    collect.click(3,3)
    collect.click(1,0.5,0,-50)
    return

    ^a::
    ov := new ImgSearch(A_ScriptDir . "\Arknights\ov_icon.png", 70)
    ov.click(1,1)
    ov.click(1,4)
    return 

    ; This should find amiya_work.png then Gosub to amiya config
    ; If not found then should search for swire_work.png then Gosub to swire config
    ^s::
    amiya := new ImgSearch(A_ScriptDir . "\Arknights\amiya_work.png")
    swire := new ImgSearch(A_ScriptDir . "\Arknights\swire_work.png")
    if (amiya.found) {
        amiya.click(1,3)
        Gosub, deselect_all
        Gosub, swire_config
    } else {
        swire.click(1,3)
        Gosub, deselect_all
        Gosub, amiya_config
    }

    confirm := new ImgSearch(A_ScriptDir . "\Arknights\confirm.png")
    confirm.click(1,1.5)

    saria := new ImgSearch(A_ScriptDir . "\Arknights\saria_work.png")
    utage := new ImgSearch(A_ScriptDir . "\Arknights\utage_work.png")
    if (saria.found) {
        saria.click(1,3)
        Gosub, deselect_all
        Gosub, utage_config
    } else {
        utage.click(1,3)
        Gosub, deselect_all
        Gosub, saria_config
    }
    confirm.click(1,1.5)

    Gosub, replace_trading_post_1
    confirm.click(1,1.5)

    Gosub, replace_factory_gold_1
    confirm.click(1,1.5)
    
    return

    ^g::
    return
    
    ; Hotkey for autohire process
    ^d::
    Gosub, autohire
    return

    replace_trading_post_1:
    exu := new ImgSearch(A_ScriptDir . "\Arknights\exu_work.png")
    gummy := new ImgSearch(A_ScriptDir . "\Arknights\gummy_work.png", 70)
    if (exu.found) {
        exu.click(1,3)
        Gosub, deselect_all
        Gosub, gummy_config
    } else {
        gummy.click(1,3)
        Gosub, deselect_all
        Gosub, exu_config
    }
    return

    replace_factory_gold_1:
    variance := 73
    gravel := new ImgSearch(A_WorkingDir . "\gravel_work.png", variance)
    cuora := new ImgSearch(A_WorkingDir . "\cuora_work.png", variance)

    if (gravel.found) {
        gravel.click(1,3)
        Gosub, deselect_all
        Gosub, cuora_config
    } else {
        cuora.click(1,3)
        Gosub, deselect_all
        Gosub, gravel_config
    }
    return

    ; Prototype all
    ^o::
    Gosub, ^q
    Gosub, ^w
    Gosub, ^e
    Gosub, ^a
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
    replaceOps(array)
    return

    ; Control Center config with Amiya
    amiya_config:
    amiya := A_ScriptDir . "\Arknights\amiya.png"
    ash := A_ScriptDir . "\Arknights\ash.png"
    blitz := A_ScriptDir . "\Arknights\blitz.png"
    tachanka := A_ScriptDir . "\Arknights\tachanka.png"
    nearl := A_ScriptDir . "\Arknights\nearl.png"

    array := [amiya, ash, blitz, tachanka, nearl]
    replaceOps(array)
    return

    ; Reception Room config with Utage
    utage_config:
    utage := A_ScriptDir . "\Arknights\utage.png"
    rope := A_ScriptDir . "\Arknights\rope.png"

    array := [utage, rope]
    replaceOps(array)
    return

    ; Reception Room config with Saria
    saria_config:
    saria := A_ScriptDir . "\Arknights\saria.png"
    gitano := A_ScriptDir . "\Arknights\gitano.png"

    array := [saria, gitano]
    replaceOps(array)
    return

    ; Trading Post config with Exu
    exu_config:
    exu := A_ScriptDir . "\Arknights\exu.png"
    lappland := A_ScriptDir . "\Arknights\lappland.png"
    texas := A_ScriptDir . "\Arknights\texas.png"

    array := [exu, lappland, texas]
    replaceOps(array)
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
    spot_config:
    gravel := A_WorkingDir . "\gravel.png"
    spot := A_WorkingDir . "\spot.png"
    haze := A_WorkingDir . "\haze.png"

    array := [gravel, spot, haze]
    replaceOps(array)
    return 

    ; Factory gold config with Cuora
    cuora_config:
    cuora := A_WorkingDir . "\cuora.png"
    noir := A_WorkingDir . "\noir.png"
    bubble := A_WorkingDir . "\bubble.png"

    array := [cuora, noir, bubble]
    replaceOps(array)
    return 

    ; Hiring process
    autohire:
    loop, 3 {
        loop {
            hire := new ImgSearch(A_WorkingDir . "\hire.png", 120)
            MouseClick, left, winW/2-10, winH/2
        } until hire.found = True
        hire.click(1,3.25)

        skip := new ImgSearch(A_WorkingDir . "\skip.png", 100)
        skip.click(1,1)
    }
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
    Sleep, 500
    return
}

scrollUntilFound(img, tolerance=70) {
    image := new ImgSearch(img, tolerance)
    if (!image.found) {
        Loop {
            Gosub, scroll_left
            image := new ImgSearch(img, tolerance)
        } Until ErrorLevel = 0
        
    } 
    image.click()
    return
}

replaceOps(operators) {
    for i, image in operators {
        scrollUntilFound(image, 100)
        scrollRight(2)
    }
    return
}