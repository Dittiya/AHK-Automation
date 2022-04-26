controlCenter(var=73) {
    amiya := new ImgSearch(A_ScriptDir . "\Arknights\amiya_work.png", var)
    swire := new ImgSearch(A_ScriptDir . "\Arknights\swire_work.png", var)
    if (amiya.found) {
        amiya.click(1)
        Gosub, deselect_all
        Gosub, swire_config
    } else {
        swire.click(1)
        Gosub, deselect_all
        Gosub, amiya_config
    }
    return
}