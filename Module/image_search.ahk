class ImgSearch {
    __New( img, continuous=0, tolerance=2 ) {
        this.imagePath := img

        If (continuous = 1)
            this.continuousSearch(this.imagePath, tolerance)
        Else
            this.doImgSearch(this.imagePath, tolerance)
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

    clickImage(count=1, delay=0, adjustmentX=20, adjustmentY=20) {
        Loop, %count% {
            MouseClick, left, this.X+adjustmentX, this.Y+adjustmentY
            Sleep, delay*1000
        }
    }

    doImgSearch(imagePath, n) {
        ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *%n% %imagePath%
        if (ErrorLevel = 2)
            MsgBox, Could not find image err2
        else if (ErrorLevel = 1)
            MsgBox, Image not found err1
        else {
            this.X := X
            this.Y := Y
            this.clickImage()
        }
    }

    continuousSearch(imagePath, n) {
        Loop 
            ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *%n% %imagePath%
        Until ErrorLevel = 0
        this.X := X
        this.Y := Y
        Sleep, 4000
        this.clickImage()
    }
    
}