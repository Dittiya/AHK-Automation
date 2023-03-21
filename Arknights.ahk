#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode "Pixel", "Window"
CoordMode "Mouse", "Window"
SetWorkingDir A_ScriptDir "\arknights"

Esc::ExitApp

/* 
 * Constants
 */

WINDOW := "BlueStacks"

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

    Click(650, 230)
    checkOpsPage()

    operators := controlCenterConfig(config)

    findOps(operators, 80)
}

tradingPost_1(config:=0) {
    if (config = 0)
        return Error("Config not found")

    Click(655, 570)
    checkOpsPage()

    operators := tradingPostConfig_1(config)
    findOps(operators)
}

factoryGold_1(config:=0) {
    if (config = 0)
        return Error("Config not found")

    factory := ImgSearch("factory2")
    Click(factory.x+150, factory.y+50)
    checkOpsPage()

    operators := factoryGoldConfig_1(config)
    findOps(operators)

    return factory
}

powerPlant_1(config:=0, relative:=0) {
    if (config = 0) 
        return Error("Config not found")

    if (relative = 0)
        return Error("Relative location not found")

    Click(relative.x+150, relative.y+175)
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
    findOps(operators)

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
    findOps(operators)
}

powerPlant_2(config:=0, relative:=0) {
    if (config = 0)
        return Error("Config not found")
    
    if (relative = 0)
        return Error("Relative location not found")

    Click(relative.x+100, relative.y+320)
    checkOpsPage()

    operators := powerPlantConfig_2(config)
    findOps(operators)
}

office(config:=0) {
    if (config = 0)
        return Error("Config not found")

    office := ImgSearch("office")
    Click(office.x+150, office.y+50)
    checkOpsPage()

    operators := officeConfig(config)
    findOps(operators)
}

factoryExp_1(config:=0) {
    if (config = 0) 
        return Error("Config not found")

    factory := ImgSearch("factory2")
    Click(factory.x+150, factory.y+50)
    checkOpsPage()

    operators := factoryExpConfig_1(config)
    findOps(operators)

    return factory
} 

factoryExp_2(config:=0, relative:=0) {
    if (config = 0)
        return Error("Config not found")

    Click(relative.x+150, relative.y+175)
    checkOpsPage()

    operators := factoryExpConfig_2(config)
    findOps(operators)
}

factoryExp_3(config:=0, relative:=0) {
    if (config = 0)
        return Error("Config not found")

    Click(relative.x+150, relative.y+320)
    checkOpsPage()

    operators := factoryExpConfig_2(config)
    findOps(operators)
}

/*
 * Config
 */

config(var:=50) {
    amiya := ImgSearch("amiya_work", var)
    Click(amiya.x, amiya.y, 0)
    if (amiya.found) 
        return 1
    
    swire := ImgSearch("swire_work", var)
    Click(swire.x, swire.y, 0)
    if swire.found 
        return 2

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

    amiya := ["exu", "lappland", "texas"]
    swire := ["gummy", "midnight", "catapult"]

    if (conf = 1) 
        return swire
    else 
        return amiya
}

tradingPostConfig_2(conf:=0) {
    if (conf = 0)
        return Error("Config not found")

    amiya := ["fang", "mousse", "matoimaru"]
    swire := ["shamare", "bibeak", "kafka"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

factoryGoldConfig_1(conf:=0) {
    if (conf = 0)
        return Error("Config not found")

    amiya := ["gravel", "haze", "spot"]
    swire := ["perfumer", "roberta", "steward"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

factoryGoldConfig_2(conf:=0) {
    if (conf = 0)
        return Error("Config not found")

    amiya := ["ptilo", "vanilla", "scene"]
    swire := ["jessica", "ceobe", "vermeil"]

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
    swire := ["wildmane", "ashlock"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

factoryExpConfig_2(conf:=0) {
    if (conf = 0) 
        return Error("Config not found")

    amiya := ["frostleaf", "castle"]
    swire := ["silence", "meteor"]

    if (conf = 1)
        return swire
    else 
        return amiya
}

factoryExpConfig_3(conf:=0) {
    if (conf = 0) 
        return Error("Config not found")

    amiya := ["shirayuki", "feater"]
    swire := ["kroos", "yato"]

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

changeSize(window) {
    /*
     * w: 1280	h: 739
     * Because BlueStacks is the worst at this
     */
    WinGetPos(&winX, &winY, &winWidth, &winHeight, window)
    MsgBox("Original window size " winWidth "x" winHeight, "Resize window", "T1")

    WinMove( , , 1280, 739, window)
    WinGetPos(&winX, &winY, &winWidth, &winHeight, window)
    MsgBox("Resized window to " winWidth "x" winHeight, "Resize window", "T1")
}

findOps(operators, var:=50) {
    for _, operator in operators {
        ops := ImgSearch(operator, var)
        while !ops.found {
            if (A_Index = 50)
                break
            slideLeft()
            ops.search()
        }
        Click(ops.x, ops.y)
        Sleep 200
    }
}

slideLeft() {
    /* 
     * god this is a pain
     * whatever it's good enough
     */

    start := [winWidth*0.9, winHeight*0.5]
    end := [winWidth*0.5, winHeight*0.5]
    SendEvent "{Click " start[1] " " start[2] " Down}" . "{click " end[1] " " end[2] " Down}"
    Sleep 200
    SendEvent "{Click " end[1] " " end[2] " Up}"
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

pixSearch(x, y, color, pad:=0) {
    if PixelSearch(&px, &py, x, y, x+pad, y+pad, color, 2)
        return true
    return false
}

checkOpsPage() {
    while !pixSearch(1080, 680, 0x0075A8) {
        Sleep 100
    }
    Click(480, 675, 2)
    Sleep 300

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

/* 
 * Hotkey
 */

^e:: {
    changeSize(WINDOW)
}

^d:: {
    /*
     * Autohire
     */

    loc := [{x:300, y:400}, {x:800, y:400}, {x:300, y:650}]

    for l in loc {
        Click(l.x, l.y)
        Sleep 1000

        while pixSearch(770, 60, 0xFFFFFF) {
            Sleep 100
        }

        while !pixSearch(770, 60, 0xFFFFFF) {
            Sleep 100
            Click(1140, 95)
        }
    }

}

^r:: {

}

^g:: {
    back := {x:50, y:75}
    baseAutomation(back)
}