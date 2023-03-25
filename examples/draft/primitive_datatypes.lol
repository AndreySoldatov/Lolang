// Primitive datatypes:

a: int = 10; // All C pt's are supported

b: bool = false; // Boolean

ap: int * = &a; // Pointer

ar: int & = a; // Reference

arr: [int, 3] = [a, a, a]; // Array

as: {arg1: int, arg2: char} = {a, a + 10}; // Anonymous structs, or tuples

func: () > int = a + 10; // Function