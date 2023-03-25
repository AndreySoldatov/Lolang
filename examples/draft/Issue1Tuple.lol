function: (a: int, b: char) = 
    calcVal();  // Function definition with
                // implicit void return type
                // and without curly braces because it's a oneliner

tuple: {a: int, b: char} = 
    (10, 'c');   // Tuple definition

func: (tup: {a: int, b: char}) > int = tup.a + tup.b;

main: () = {
    print(tuple.a, ", ", tuple.b); // "10, c"
    print(func(tuple)); // "73"
}