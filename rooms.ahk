factoryGold2(variance=60) {
    roberta:= new ImgSearch(A_WorkingDir . "\roberta_work.png", variance)
    ptilo := new ImgSearch(A_WorkingDir . "\ptilo_work.png", variance)

    if (roberta.found) {
        roberta.click(1)
        Gosub, deselect_all
        ptilo()
    } else {
        ptilo.click(1)
        Gosub, deselect_all
        roberta()
    }
    return
}