#NoEnv
#SingleInstance, force
SetWorkingDir % A_ScriptDir

#Include, Module\image_search.ahk

#IfWinActive BlueStacks 10

    WinGetPos winX, winY, winW, winH, BlueStacks 10

    ; Find and click Base
    ^q::
    basePath := A_ScriptDir . "\Arknights\base_icon.png"
    base := new ImgSearch(basePath)
    return

    ; Continuously find Bell then click when found
    ^w::
    bellPath := A_ScriptDir . "\Arknights\bell_icon.png"
    bell := new ImgSearch(bellPath, 1)
    return

    ^e::
    collectPath := A_ScriptDir . "\Arknights\p_icon.png"
    collect := new ImgSearch(collectPath)
    collect.clickImage(3,3)
    collect.clickImage(1,0,0,-50)
    return

    ^a::
    new ImgSearch(A_ScriptDir . "\Arknights\ov_icon.png")
    return 

    ^s::
    ccPath := A_ScriptDir . "\Arknights\cc_icon.png"
    cc := new ImgSearch(ccPath)
    cc.clickImage(1,0,200)
    return
    
    ^d::
    new ImgSearch(A_ScriptDir . "\Arknights\des_icon.png")
    return

    ; ^2::
    ; img := new ImgSearch("order2_icon.png")
    ; MouseMove, img.getX(), img.getY()

return