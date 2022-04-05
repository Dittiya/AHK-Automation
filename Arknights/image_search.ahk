class ImgSearch {
    __New( img ) {
        this.imagePath := A_WorkingDir . "\images\" . img
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

    doImgSearch(imgPath) {
        ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *70 %imgPath%
        if (ErrorLevel = 2)
            MsgBox, Could not find image err2
        else if (ErrorLevel = 1)
            MsgBox, Image not found err1
        else 
            this.X := X
            this.Y := Y
            this.clickImage()
    }

    clickImage() {
        MouseClick, left, this.X+20, this.Y+20
    }
}