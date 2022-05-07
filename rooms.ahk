controlCenter(variance=75) {
    amiya := new ImgSearch(A_WorkingDir . "\amiya_work.png", variance)
    swire := new ImgSearch(A_WorkingDir . "\swire_work.png", variance)
    if (amiya.found) {
        amiya.click()
        Gosub, deselect_all
        swire()
    } else {
        swire.click()
        Gosub, deselect_all
        amiya()
    }
    return
}

reception(variance=73) {
    saria := new ImgSearch(A_WorkingDir . "\saria_work.png", variance)
    utage := new ImgSearch(A_WorkingDir . "\utage_work.png", variance)
    if (saria.found) {
        saria.click()
        Gosub, deselect_all
        utage()
    } else {
        utage.click()
        Gosub, deselect_all
        saria()
    }
    return
}


tradingPost1(variance=75) {
    exu := new ImgSearch(A_WorkingDir . "\exu_work.png", variance)
    gummy := new ImgSearch(A_WorkingDir . "\gummy_work.png", variance)
    if (exu.found) {
        exu.click()
        Gosub, deselect_all
        gummy()
    } else {
        gummy.click()
        Gosub, deselect_all
        exu()
    }
    return
}

factoryGold1(variance=70) {
    gravel := new ImgSearch(A_WorkingDir . "\gravel_work.png", variance)
    cuora := new ImgSearch(A_WorkingDir . "\cuora_work.png", variance)

    if (gravel.found) {
        gravel.click()
        Gosub, deselect_all
        cuora()
    } else {
        cuora.click()
        Gosub, deselect_all
        gravel()
    }
    return
}

powerPlant1(variance=73) {
    greyy := new ImgSearch(A_WorkingDir . "\greyy_work.png", variance-5)
    ifrit := new ImgSearch(A_WorkingDir . "\ifrit_work.png", variance)

    if (greyy.found) {
        greyy.click(1)
        Gosub, operators_menu
        scrollRight(3)
        ifrit()
    } else {
        ifrit.click(1)
        Gosub, operators_menu
        scrollRight(3)
        greyy()
    }
    return
}

tradingPost2(variance=75) {
    mousse := new ImgSearch(A_WorkingDir . "\mousse_work.png", variance)
    melantha := new ImgSearch(A_WorkingDir . "\melantha_work.png", variance)

    if(mousse.found) {
        mousse.click()
        Gosub, deselect_all
        melantha()
    } else {
        melantha.click()
        Gosub, deselect_all
        mousse()
    }
    return
}

factoryGold2(variance=70) {
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

powerPlant2(variance=50) {
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

    if (ethan.found) {
        ethan.click(1)
        Gosub, operators_menu
        eyja()
    } else {
        eyja.click(1)
        Gosub, operators_menu
        ethan()
    }
}

xp1(variance=60) {
    shirayuki := new ImgSearch(A_WorkingDir . "\shirayuki_work.png", variance)
    cardigan := new ImgSearch(A_WorkingDir . "\cardigan_work.png", variance)

    if(shirayuki.found) {
        shirayuki.click()
        Gosub, deselect_all
        cardigan()
    } else {
        cardigan.click()
        Gosub, deselect_all
        shirayuki()
    }
}

xp2(variance=60) {
    vigna := new ImgSearch(A_WorkingDir . "\vigna_work.png", variance)
    beagle := new ImgSearch(A_WorkingDir . "\beagle_work.png", variance)

    if(vigna.found) {
        vigna.click()
        Gosub, deselect_all
        beagle()
    } else {
        beagle.click()
        Gosub, deselect_all
        vigna()
    }
}

xp3(variance=60) {
    conviction := new ImgSearch(A_WorkingDir . "\conviction_work.png", variance)
    beanstalk := new ImgSearch(A_WorkingDir . "\beanstalk_work.png", variance)

    if(conviction.found) {
        conviction.click()
        Gosub, deselect_all
        beanstalk()
    } else {
        beanstalk.click()
        Gosub, deselect_all
        feater()
    }
}

