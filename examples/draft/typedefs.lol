Byte: Type = char;

CharPtr: Type = char *;

Option<T, E>: Union = {
    data: T;
    error: E;

    Option: () = delete;
    
    Option: (val: T) = data = val;
    Option: (err: E) = error = err;
}

Ok<T, E>: (val: T) > Option<T, E> = Option<T, E>(val);
Err<T, E>: (err: E) > Option<T, E> = Option<T, E>(err);

main: () = {
    Option<Str, std::BadStringErr> = Ok("HelloWorld");
}

// C codegen