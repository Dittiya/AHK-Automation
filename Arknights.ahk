#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode "Pixel", "Window"
CoordMode "Mouse", "Window"
SetWorkingDir A_ScriptDir "\arknights"

Esc::ExitApp

/* 
 * Constants
 */

WINDOW := "BlueStacks App Player"

HotIfWinactive WINDOW

WinGetPos &winx, &winy, &winWidth, &winHeight, WINDOW

/*
 * Image Search
 */

class ImgSearch {
    __New(img, var:=100) {
        this.img := "*" var " " A_WorkingDir "\" img ".png"
        this.found := false
        this.search()
    }

    search() {
        img := this.img
        if ImageSearch(&imgx, &imgy, winx, winy, winWidth, winHeight, img) {
            this.found := true
            this.x := imgx
            this.y := imgy
        } else {
            this.found := false
        }
    }
}

/*
 * Room
 */

controlCenter(config:=0) {
    if (config = 0)
        return Error("Config not found")

    Click(655, 230)
    Click(655, 230)
    checkOpsPage()

    ; Click(850, 75)
    Sleep 500
    operators := controlCenterConfig(config)

    findOps(operators, 85)
}

tradingPost_1(config:=0) {
    if (config = 0)
        return Error("Config not found")

    Click(655, 570)
    checkOpsPage()

    operators := tradingPostConfig_1(config)
    findOps(operators, 90)
}

factoryGold_1(config:=0) {
    if (config = 0)
        return Error("Config not found")

    factory := ImgSearch("factory")
    Click(factory.x+120, factory.y+50)
    checkOpsPage()

    operators := factoryGoldConfig_1(config)
    findOps(operators, 90)

    return factory
}

powerPlant_1(config:=0, relative:=0) {
    if (config = 0) 
        return Error("Config not found")

    if (relative = 0)
        return Error("Relative location not found")

    Click(relative.x+120, relative.y+175)
    checkOpsPage()

    operators := powerPlantConfig_1(config)
    findOps(operators)
}

tradingPost_2(config:=0) {
    if (config = 0) 
        return Error("Config not found")

    trade := ImgSearch("trading")
    Click(trade.x+100, trade.y+50)
    checkOpsPage()

    operators := tradingPostConfig_2(config)
    findOps(operators, 90)

    return trade
}

factoryGold_2(config:=0, relative:=0) {
    if (config = 0)
        return Error("Config not found")

    if (relative = 0)
        return Error("Relative location not found")
    
    Click(relative.x+100, relative.y+175)
    checkOpsPage()
    
    operators := factoryGoldConfig_2(config)
    findOps(operators, 90)
}

powerPlant_2(config:=0, relative:=0) {
    if (config = 0)
        return Error("Config not found")
    
    if (relative = 0)
        return Error("Relative location not found")

    Click(relative.x+100, relative.y+320)
    checkOpsPage()

    operators := powerPlantConfig_2(config)
    findOps(operators, 90)
}

office(config:=0) {
    if (config = 0)
        return Error("Config not found")

    office := ImgSearch("office")
    Click(office.x+150, office.y+50)
    checkOpsPage()

    operators := officeConfig(config)
    findOps(operators, 80)
}

factoryExp_1(config:=0) {
    if (config = 0) 
        return Error("Config not found")

    factory := ImgSearch("factory")
    Click(factory.x+120, factory.y+50)
    checkOpsPage()

    operators := factoryExpConfig_1(config)
    findOps(operators, 100)

    return factory
} 

factoryExp_2(config:=0, relative:=0) {
    if (config = 0)
        return Error("Config not found")

    Click(relative.x+150, relative.y+175)
    checkOpsPage()

    operators := factoryExpConfig_2(config)
    findOps(operators, 80)
}

factoryExp_3(config:=0, relative:=0) {
    if (config = 0)
        return Error("Config not found")

    Click(relative.x+150, relative.y+320)
    checkOpsPage()

    operators := factoryExpConfig_3(config)
    findOps(operators, 80)
}

dorm(x, y) {
    Click(x, y)
    checkOpsPage()
    Send("^w")
    Sleep 200
    checkOverviewPage()
}

/*
 * Config
 */

config(var:=50) {
    amiya := ImgSearch("amiya_work", var)
    if (amiya.found) {
        Click(amiya.x, amiya.y, 0)
        return 1
    }
    
    swire := ImgSearch("swire_work", var)
    if swire.found {
        Click(swire.x, swire.y, 0)
        return 2
    }

    return 0
}

controlCenterConfig(conf:=0) {
    if (conf = 0) {
        return Error("Config not found")
    }

    amiya := ["amiya", "pudding", "ash", "tachanka", "blitz"]
    swire := ["swire", "kal", "dobermann", "red", "scavenger"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

tradingPostConfig_1(conf:=0) {
    if (conf = 0) 
        return Error("Config not found")

    amiya := ["lappland", "texas", "jaye"]
    swire := ["midnight", "catapult", "sora"]

    if (conf = 1) 
        return swire
    else 
        return amiya
}

tradingPostConfig_2(conf:=0) {
    if (conf = 0)
        return Error("Config not found")

    amiya := ["shamare", "exu", "gummy"]
    swire := ["ambriel", "mousse", "matoimaru"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

factoryGoldConfig_1(conf:=0) {
    if (conf = 0)
        return Error("Config not found")

    amiya := ["gravel", "haze", "spot"]
    swire := ["astgenne", "dorothy", "ptilo"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

factoryGoldConfig_2(conf:=0) {
    if (conf = 0)
        return Error("Config not found")

    amiya := ["purestream", "weedy", "eunectes"]
    swire := ["perfumer", "roberta", "mizuki"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

powerPlantConfig_1(conf:=0) {
    if (conf = 0)
        return Error("Config not found")

    amiya := ["lancet"]
    swire := ["greyy"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

powerPlantConfig_2(conf:=0) {
    if (conf = 0)
        return Error("Config not found")

    amiya := ["thrmex"]
    swire := ["ifrit"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

factoryExpConfig_1(conf:=0) {
    if (conf = 0) 
        return Error("Config not found")

    amiya := ["conviction", "vigna"]
    swire := ["vanilla", "jessica"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

factoryExpConfig_2(conf:=0) {
    if (conf = 0) 
        return Error("Config not found")

    amiya := ["frostleaf", "feater"]
    swire := ["steward", "asbestos"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

factoryExpConfig_3(conf:=0) {
    if (conf = 0) 
        return Error("Config not found")

    amiya := ["castle", "shirayuki"]
    swire := ["fang", "kroos"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

officeConfig(conf:=0) {
    if (conf = 0)
        return Error("Config not found")

    amiya := ["eyja"]
    swire := ["aciddrop"]

    if (conf = 1)
        return swire
    else
        return amiya
}

/* 
 * Functions
 */

exitAuto() {
    MsgBox "Exiting app", "Automation done!", "T1"
    ExitApp
}

testSearch(operators, var) {
    for _, operator in operators {
        ops := ImgSearch(operator, var)
        if ops.found {
            Click(ops.x, ops.y, 0)
        } else {
            MsgBox(operator " Not found", "Err", "T0.5")
        }
    }
}

changeSize(window) {
    /*
     * w: 1280	h: 739
     * Because BlueStacks is the worst at this
     */
    WinGetPos(&winX, &winY, &winWidth, &winHeight, window)
    MsgBox("Original window size " winWidth "x" winHeight, "Resize window", "T1")

    WinMove(100, 100, 1280, 739, window)
    WinGetPos(&winX, &winY, &winWidth, &winHeight, window)
    MsgBox("Resized window to " winWidth "x" winHeight, "Resize window", "T1")
}

findOps(operators, var:=90) {
    for _, operator in operators {
        ops := ImgSearch(operator, var)
        while !ops.found {
            slideLeft()
            Sleep 100
            ops.search()
        }
        Click(ops.x, ops.y)
        Sleep 200
    }
}

slideLeft() {
    start := [winWidth*0.9, winHeight*0.5]
    end := [winWidth*0.6, winHeight*0.5]

    Click(start[1], start[2], 0)
    SendMode "Event"
    MouseClickDrag "L", start[1], start[2], end[1], end[2], 20
    SendMode "Input"
}

slideUp() {
    start := [winWidth*0.9, winHeight*0.8]
    end := [winWidth*0.9, winHeight*0.2]

    Click(start[1], start[2], 0)
    SendMode "Event"
    MouseClickDrag "L", start[1], start[2], end[1], end[2], 10
    SendMode "Input"
    Click()
}

slideDown() {
    start := [winWidth*0.9, winHeight*0.2]
    end := [winWidth*0.9, winHeight*0.8]
    Click(start[1], start[2], 0)
    SendMode "Event"
    MouseClickDrag "L", start[1], start[2], end[1], end[2], 10
    SendMode "Input"
    Sleep 75
    Click()
}

pixSearch(x, y, color, pad:=0) {
    if PixelSearch(&px, &py, x, y, x+pad, y+pad, color, 2)
        return true
    return false
}

checkOpsPage() {
    while !pixSearch(1080, 680, 0x0075A8) {
        Sleep 100
    }
    Click(480, 675)
    Sleep 300
    Click(480, 675)

    return true
}

checkOverviewPage() {
    while !pixSearch(230, 375, 0xFFFFFF) {
        Sleep 100
    }
    Sleep 750

    return true
}

baseAutomation(back) {
    cfg := config(50)

    MsgBox("Config " cfg, "Config", "T1")

    if (cfg = 0) 
        return Error("Config not found")

    controlCenter(cfg)
    Click(back.x, back.y)
    checkOverviewPage()
    
    tradingPost_1(cfg)
    Click(back.x, back.y)
    checkOverviewPage()

    slideUp()
    
    factory := factoryGold_1(cfg)
    Click(back.x, back.y)
    checkOverviewPage()
    
    PowerPlant_1(cfg, factory)
    Click(back.x, back.y)
    checkOverviewPage()

    loop 2
        slideUp()

    trade := tradingPost_2(cfg)
    Click(back.x, back.y)
    checkOverviewPage()

    factoryGold_2(cfg, trade)
    Click(back.x, back.y)
    checkOverviewPage()

    powerPlant_2(cfg, trade)
    Click(back.x, back.y)
    checkOverviewPage()

    slideUp()

    office(cfg)
    Click(back.x, back.y)
    checkOverviewPage()

    slideUp()

    factory := factoryExp_1(cfg)
    Click(back.x, back.y)
    checkOverviewPage()

    factoryExp_2(cfg, factory)
    Click(back.x, back.y)
    checkOverviewPage()

    factoryExp_3(cfg, factory)
    Click(back.x, back.y)
    checkOverviewPage()

    loop 2
        slideUp()
}

rest() {
    dorm(650, 620)
    dorm(650, 250)

    slideDown()
    slideDown()
    
    dorm(650, 190)
    
    slideDown()
    slideDown()

    dorm(650, 130)
}

/* 
 * Hotkey
 */

^r:: {
    ops := ["kroos"]
    testSearch(ops, 90)
}

^e:: {
    changeSize(WINDOW)
}

^d:: {
    /*
     * Autohire
     */

    loc := [{x:300, y:400}, {x:800, y:400}, {x:300, y:675}]
    anchor := {x:775, y:60, color:0xFFFFFF}
    btn := {x:1160, y:95}

    for l in loc {
        Click(l.x, l.y)
        Sleep 500

        while pixSearch(anchor.x, anchor.y, anchor.color) {
            Sleep 100
        }

        while !pixSearch(anchor.x, anchor.y, anchor.color) {
            Sleep 100
            Click(btn.x, btn.y)
        }
    }

}

^g:: {
    startTime := A_TickCount
    
    back := {x:50, y:75}
    baseAutomation(back)

    elapsedTime := A_TickCount - startTime
    elapsedTime := Ceil(elapsedTime / 1000)
    MsgBox("Finished in " elapsedTime  "s.", "Elapsed Time", "T1")
}

+g:: {
    startTime := A_TickCount
    
    confirm := {x:1080, y:680}
    baseAutomation(confirm)
    Sleep 500
    rest()

    elapsedTime := A_TickCount - startTime
    elapsedTime := Ceil(elapsedTime / 1000)
    MsgBox("Finished in " elapsedTime  "s.", "Elapsed Time", "T1")
    exitAuto()
}
