Neuron: Class = {
    activation: (float) > float; // function declaration as a type
    weight: float;

    Neuron: (wt: float, act: (float) > float) = { // lambda
        weight = wt;
        activation = act;
    }

    activate (val: float) > float = activation(val * weight);
}

ReLU: (float v) > float = {
    return v > 0 ? v : 0;
}

main: () = {
    n: Neuron = {1.45, ReLU};
    println(n.activate(12.3));
}