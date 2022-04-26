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

powerPlant2(variance=30) {
    liskarm := new ImgSearch(A_WorkingDir . "\liskarm_work.png", variance)
    indigo := new ImgSearch(A_WorkingDir . "\indigo_work.png", variance)

    if (liskarm.found) {
        liskarm.click(1)
        Gosub, operators_menu
        scrollRight(3)
        indigo()
    } else {
        indigo.click(1)
        Gosub, operators_menu
        scrollRight(3)
        liskarm()
    }
}