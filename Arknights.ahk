#IfWinActive BlueStacks 10

    WinGetPos X, Y, W, H, BlueStacks 10
    ImageSearch, baseX, baseY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 D:\Repository\Automation\images\base_icon.png
    if (ErrorLevel = 2)
        MsgBox Could not search
    else if (ErrorLevel = 1)
        MsgBox, Icon not on screen
    else 
        MsgBox, Icon found at %baseX%x%baseY%
        MouseClick, left, baseX+20, baseY+20

return