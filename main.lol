Area: Trait = { // Traits (MAYBE)
    area: () > int;
}

Length: Trait = {
    length: () > int;
}

Square: Class = {
    x: int;

    Square: (a_x: int) = { // No return type because constructor
        x = a_x;
        println("Constructed");
    };

    ~Square: () = println("Destructed");

    Area = { // I think this is a good middle point between rust way and c++ way
        area = x * x;
    }

    Length = {
        length = x * 4;
    }
}

print<Shape: Area + Length>: (shape: Shape) = { // Trait bounds (MAYBE)
    println("Shape area is: ", s.area(), " and length is: ", a.length());
}

main: () = {
    s: Square = Square(10);
    print(s);
}