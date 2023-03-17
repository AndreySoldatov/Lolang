String: Class = {
    data: char *; // Raw pointer
    length: uint;

    String: (cStr: char *) = {
        C { // C interop
            data = malloc(strlen(cStr) + 1);
            strcpy(data, cStr);
            length = strlen(cStr);
        }
    }

    ~String: () = { // mi vse popadem v RAII, a oni prosto delete();
        C {
            free(data);
        }
    }

    print: () = {
        C {
            printf("%s", data);
        }
    }
}

main: () = {
    s: String = "Hello World";
    s.print();
}