// I dont really like traits so this is snippet will less likely be possible

Allocable: Trait = { // Or maybe builtin?
    malloc: (uint) > Self *;
    calloc: (uint, uint) > Self *;
    realloc: (Self *, uint) > Self *;
    free: (Self *);
}

Vec<T: Allocable>: Class = {
    data: T *;
    size: uint;

    Class: () = {
        data = calloc(0, sizeof());
        size = 0;
    }

    Class: (args: Args<T>) = {
        Class();
        for (arg in args) {
            push(arg); // Uhhhh... Maybe compiler will check
        }
    }

    ~Class: () = {
        free(data);
    }

    push: (val: T) > Vec = {
        data = realloc(data, size + 1);
        data[size] = val;
        size += 1;
        return self;
    }

    operator[]: (index: uint) > T = {
        return data[index];
    }
}

Printable: Trait = {
    print: (Self);
}

println: (args: Args<Printable /* Trait objects? */>) = {
    for (arg in args) {
        print(arg);
    }
    print("\n");
}

main: () = {
    v: Vec<int> = {1, 2, 3, 4};
    v.push(10);
    println(v[0]);
}