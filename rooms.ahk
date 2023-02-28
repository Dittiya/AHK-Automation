baseConfig() {
    amiya := new ImgSearch(A_WorkingDir . "\amiya_work.png", 75)
    if (amiya.found) {
        return 1
    } else {
        swire := new ImgSearch(A_WorkingDir . "\swire_work.png", 75)
        if (swire.found) 
            return 2    
    }
    return 0
}

controlCenter(config) {
    deselectAll()
    switch (config) {
        case 1:
            CCconfig2()
            return
        case 2:
            CCconfig1()
            return
        default:
            MsgBox, No config found
            return
    }

    return
}

reception(config) {
    deselectAll()
    switch (config) {
        case 1:
            utage()
            return
        case 2:
            saria()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}


tradingPost1(config) {
    deselectAll()
    switch (config) {
        case 1:
            gummy()
            return
        case 2:
            exu()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}

factoryGold1(config) {
    deselectAll()
    switch (config) {
        case 1:
            cuora()
            return
        case 2:
            gravel()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}

powerPlant1(config) {
    Sleep, 500
    switch (config) {
        case 1:
            ifrit()
            return
        case 2:
            greyy()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}

tradingPost2(config) {
    deselectAll()
    switch (config) {
        case 1:
            melantha()
            return
        case 2:
            mousse()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}

factoryGold2(config) {
    deselectAll()
    switch (config) {
        case 1:
            roberta()
            return
        case 2:
            ptilo()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}

powerPlant2(config) {
    Sleep, 500
    switch (config) {
        case 1:
            pudding()
            return
        case 2:
            liskarm()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}

office(config) {
    Sleep, 500
    switch (config) {
        case 1:
            aciddrop()
            return
        case 2:
            eyja()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}

xp1(config) {
    deselectAll()
    switch (config) {
        case 1:
            ashlock()
            return
        case 2:
            shirayuki()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}

xp2(config) {
    deselectAll()
    switch (config) {
        case 1:
            meteor()
            return
        case 2:
            vigna()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}

xp3(config) {
    deselectAll()
    switch (config) {
        case 1:
            kroos()
            return
        case 2:
            feater()
            return
        default:
            MsgBox, No config found
            return
    }
    return
}
