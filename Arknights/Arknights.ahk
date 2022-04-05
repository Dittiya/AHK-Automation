#IfWinActive BlueStacks 10

    WinGetPos winX, winY, winW, winH, BlueStacks 10

    ^q::
    ImageSearch, baseX, baseY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\base_icon.png
    if (ErrorLevel = 2)
        MsgBox, Could not find image
    else if (ErrorLevel = 1)
        MsgBox, Image not found
    else 
        ; MsgBox, Icon found at %baseX%x%baseY%
        MouseClick, left, baseX+20, baseY+20

    ^w::
    ; continuous ImageSearch cause of load time to enter the base
    ImageSearch, bellX, bellY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\bell_icon.png
    While ErrorLevel = 1
    {
        ImageSearch, bellX, bellY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\bell_icon.png
    }
    ; MsgBox, found icon at %bellX%x%bellY%
    Sleep, 5000 ; slight sync after entering base
    MouseClick, left, bellX+20, bellY+20

    ^e::
    ImageSearch, pX, pY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\p_icon.png
    MouseClick, left, pX+20, pY
    Sleep, 3000 ; slight sync after claim
    MouseClick, left, pX+20, pY
    Sleep, 3000 ; slight sync after claim
    MouseClick, left, pX+20, pY
    Sleep, 3000 ; slight sync after claim
    MouseClick, left, pX+20, pY-200

    ^a::
    ImageSearch, ovX, ovY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\ov_icon.png
    MouseClick, left, ovX+20, ovY+10
    Sleep, 3000

    ^s::
    ImageSearch, ccX, ccY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\cc_icon.png
    if (ErrorLevel = 2)
        MsgBox, Could not find image
    else if (ErrorLevel = 1)
        MsgBox, Image not found
    else 
        MouseClick, left, ccX*1.5, ccY+20
        Sleep, 1000
    
    ^d::
    ImageSearch, desX, desY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_WorkingDir%\images\des_icon.png
    MouseClick, left, desX+20, desY+10

    ^1::
    Goto, pick_trade_trait

    ^2::
    img := new ImgSearch("order2_icon.png")
    MouseMove, img.getX(), img.getY()

return

; module to drag screen to the left
drag_left_to_right:
MouseClickDrag, left, winW/2+200, winH/2, winW/2-200, winH/2, 10

class ImgSearch {
    __New( img ) {
        this.imagePath := A_WorkingDir . "\images\" . img
        this.doImgSearch(this.imagePath)
    }

    getPath() {
        return this.imagePath
    }

    getX() {
        return this.imgX
    }

    getY() {
        return this.imgY
    }

    doImgSearch(imgPath) {
        ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *70 %imgPath%
        if (ErrorLevel = 2)
            MsgBox, Could not find image err2
        else if (ErrorLevel = 1)
            MsgBox, Image not found err1
        else 
            this.imgX := X
            this.imgY := Y
    }
}