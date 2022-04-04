#IfWinActive BlueStacks 10

    WinGetPos X, Y, W, H, BlueStacks 10

    ^q::
    ImageSearch, baseX, baseY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 D:\Repository\Automation\Arknights\images\base_icon.png
    if (ErrorLevel = 2)
        MsgBox, Could not find image
    else if (ErrorLevel = 1)
        MsgBox, Image not found
    else 
        ; MsgBox, Icon found at %baseX%x%baseY%
        MouseClick, left, baseX+20, baseY+20

    ^w::
    ; continuous ImageSearch cause of load time to enter the base
    ImageSearch, bellX, bellY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 D:\Repository\Automation\Arknights\images\bell_icon.png
    While ErrorLevel = 1
    {
        ImageSearch, bellX, bellY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 D:\Repository\Automation\Arknights\images\bell_icon.png
    }
    ; MsgBox, found icon at %bellX%x%bellY%
    Sleep, 5000 ; slight sync after entering base
    MouseClick, left, bellX+20, bellY+20

    ^e::
    ImageSearch, pX, pY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 D:\Repository\Automation\Arknights\images\p_icon.png
    MouseClick, left, pX+20, pY
    Sleep, 3000
    MouseClick, left, pX+20, pY

    
return