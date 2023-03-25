main: () = {
    a: int = 10;
    a += 15;
    b: int = a + 20;
}

// expected C codegen:

// void main() {
//     int a = 10;
//     a += 15;
//     int b = a + 20;
// }