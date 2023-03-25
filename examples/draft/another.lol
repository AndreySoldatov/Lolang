SerEx: Class = {
    a: int = 15; // Defaults
    b: int = 10;
    c: String = "Hello";

    Class: () = { // Default constructor
        a = 150;
    }
}

main: () = {
    obj: SerEx;
    println(obj.a, ", ", obj.b, ", ", obj.c); 
}