swire(var=120) {
    swire := A_ScriptDir . "\Arknights\swire.png"
    dobermann := A_ScriptDir . "\Arknights\dobermann.png"
    scavenger := A_ScriptDir . "\Arknights\scavanger.png"
    greythroat := A_ScriptDir . "\Arknights\greythroat.png"
    red := A_ScriptDir . "\Arknights\red.png"

    array := [swire, dobermann, scavenger, greythroat, red]
    replaceOps(array, var)
    return
}

amiya(var=100){
    amiya := A_ScriptDir . "\Arknights\amiya.png"
    ash := A_ScriptDir . "\Arknights\ash.png"
    blitz := A_ScriptDir . "\Arknights\blitz.png"
    tachanka := A_ScriptDir . "\Arknights\tachanka.png"
    nearl := A_ScriptDir . "\Arknights\nearl.png"

    array := [amiya, ash, blitz, tachanka, nearl]
    replaceOps(array, var)
    return
}