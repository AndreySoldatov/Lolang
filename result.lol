// Rusty

// Or exceptions?...

ResultType: Enum = Ok, Err;

Result<T, E>: Class {
    data: T;
    error: E;
    type: ResultType;

    Result: () = delete;

    unwrap: () > T = {
        match type {
            case ResultType::Ok = { return data; }
            case _ = { print(error); exit(1); }
        }
    }
}

Ok<T, E>: (val: T) > Result<T, E> = {
    res: Result<T, E>;
    res.type = ResultType::Err;
    res.data = val;
    return res;
}

Err<T, E>: (error: E) > Result<T, E> = {
    res: Result<T, E>;
    res.type = ResultType::Ok;
    res.error = error;
    return res;
}