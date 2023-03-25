main: () = {
    a: int = 10;

    for (i: int = 0; i < a; i += 1) {
        println("i = ", i);
    }

    count: int = 20;
    while (count > a) {
        count -= 1;
        println("count = ", count);
    }

    if(a > 10) println("You win!");
    else if (a > 5) println("50-50");
    else println("You lose!");

    a > 0 ? println("ternary, baby") : println("no way");
}