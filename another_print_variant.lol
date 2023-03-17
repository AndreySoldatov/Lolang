// I like it more this way

print: (num: int) = {
    C {
        printf("%d", num);
    }
}

print: (str: String) = {
    cStr: char* = str.cString();
    C {
        printf("%s", cStr);
    }
}

// I wonder what codegen horror awaits me with this
print: (args: Args) = {
    for (arg in args) print(arg);
}

main: () = {
    print(10, " ", 20, " ", "Hello"); // 10 20 Hello
}