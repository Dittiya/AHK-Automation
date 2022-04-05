#Include, image_search.ahk

#IfWinActive BlueStacks 10

    WinGetPos winX, winY, winW, winH, BlueStacks 10

    ; Find and click Base
    ^q::
    base := new ImgSearch("base_icon.png")
    return

    ^w::
    bell := new ImgSearch("bell_icon.png", 1)
    return

    ; ^e::
    ; ImageSearch, pX, pY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\p_icon.png
    ; MouseClick, left, pX+20, pY
    ; Sleep, 3000 ; slight sync after claim
    ; MouseClick, left, pX+20, pY
    ; Sleep, 3000 ; slight sync after claim
    ; MouseClick, left, pX+20, pY
    ; Sleep, 3000 ; slight sync after claim
    ; MouseClick, left, pX+20, pY-200

    ; ^a::
    ; ImageSearch, ovX, ovY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\ov_icon.png
    ; MouseClick, left, ovX+20, ovY+10
    ; Sleep, 3000

    ; ^s::
    ; ImageSearch, ccX, ccY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\cc_icon.png
    ; if (ErrorLevel = 2)
    ;     MsgBox, Could not find image
    ; else if (ErrorLevel = 1)
    ;     MsgBox, Image not found
    ; else 
    ;     MouseClick, left, ccX*1.5, ccY+20
    ;     Sleep, 1000
    
    ; ^d::
    ; ImageSearch, desX, desY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\des_icon.png
    ; MouseClick, left, desX+20, desY+10

    ; ^2::
    ; img := new ImgSearch("order2_icon.png")
    ; MouseMove, img.getX(), img.getY()

return