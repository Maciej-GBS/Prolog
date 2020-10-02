func_call(P,X) :- P =..Args, append(Args, [X], W), Call =..W, Call.
