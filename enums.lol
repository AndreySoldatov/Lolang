Color: Enum = Red, Green, Blue;

IP: Enum = {
    IPV4,
    IPV6
}

main: () = {
    col: Color = Color::Red;
    ipNew: auto = IP::IPV6;

    match ipNew {
        case IP::IPV6 = println("The future is here, old man");
        case _ = {};
    }
}