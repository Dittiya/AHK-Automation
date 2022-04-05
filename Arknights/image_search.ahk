class ImgSearch {
    __New( img, continuous=0 ) {
        this.imagePath := A_WorkingDir . "\images\" . img

        If (continuous = 1)
            this.continuousSearch(this.imagePath)
        Else
            this.doImgSearch(this.imagePath)
    }

    getPath() {
        return this.imagePath
    }

    getX() {
        return this.X
    }

    getY() {
        return this.Y
    }

    clickImage(adjustmentX=20, adjustmentY=20) {
        MouseClick, left, this.X+adjustmentX, this.Y+adjustmentY
    }

    doImgSearch(imagePath) {
        ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *70 %imagePath%
        if (ErrorLevel = 2)
            MsgBox, Could not find image err2
        else if (ErrorLevel = 1)
            MsgBox, Image not found err1
        else 
            this.X := X
            this.Y := Y
            this.clickImage()
    }

    continuousSearch(imagePath) {
        Loop 
            ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *70 %imagePath%
        Until ErrorLevel = 0
        this.X := X
        this.Y := Y
        Sleep, 4000
        this.clickImage()
    }
    
}