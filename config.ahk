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

; Reception Room config with Utage
utage(var=125) {
    utage := A_ScriptDir . "\Arknights\utage.png"
    rope := A_ScriptDir . "\Arknights\rope.png"

    array := [utage, rope]
    replaceOps(array, var)
    return
}

; Reception Room config with Saria
saria(var=115) {
    saria := A_ScriptDir . "\Arknights\saria.png"
    gitano := A_ScriptDir . "\Arknights\gitano.png"

    array := [saria, gitano]
    replaceOps(array, var)
    return
}