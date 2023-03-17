Mod: Scope = { // we need more of those

Test: Class = {
    a: int = 10;

    square: () > int = a * a;
}

build: () > Test = Test(); // statics are not supported

}

main: () = {
    obj: auto = Mod::build();
    println(obj.square());
}