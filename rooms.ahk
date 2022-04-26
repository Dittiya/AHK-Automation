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
    liskarm := new ImgSearch(A_WorkingDir . "\liskarm_work.png", 70)
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

office(variance=70) {
    eyja := new ImgSearch(A_WorkingDir . "\eyja_work.png", variance)
    ethan := new ImgSearch(A_WorkingDir . "\ethan_work.png", variance)

    if (eyja.found) {
        eyja.click(1)
        Gosub, operators_menu
        ethan()
    } else {
        ethan.click(1)
        Gosub, operators_menu
        eyja()
    }
}