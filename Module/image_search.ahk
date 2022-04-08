class ImgSearch {
    __New( img, tolerance=20, continuous=0 ) {
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

    click(count=1, delay=0, padX=20, padY=20) {
        Loop, %count% {
            MouseClick, left, this.X+padX, this.Y+padY
            Sleep, delay*1000
        }
    }

    move(padX=20, padY=20) {
        MouseMove, this.X+padX, this.Y+padY
    }

    doImgSearch(imagePath, n) {
        ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *%n% %imagePath%
        if (ErrorLevel = 2)
            MsgBox, , ErrorLevel 2, Image not available, 2
        else if (ErrorLevel = 1) {
            MsgBox, , ErrorLevel 1, Image not found, 0.5
            this.found := False
        }
        else {
            this.found := True
            this.X := X
            this.Y := Y
            this.move()
        }
    }

    continuousSearch(imagePath, n) {
        Loop {
            ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *%n% %imagePath%
            MsgBox, , ErrorLevel 1, Image not found, 0.5
            this.Found := False
        } Until ErrorLevel = 0
        this.X := X
        this.Y := Y
        this.move()
        Sleep, 4000
    }
    
}