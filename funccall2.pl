insert(Element, 0, Lista, [Element|Lista]).
insert(Element, I, [H|T], [H|NT]) :-
    I > 0,
    NI is I - 1,
    insert(Element, NI, T, NT).

func_call(P,Pos,X) :- P =..Args, insert(X, Pos, Args, W), Call =..W, Call.
