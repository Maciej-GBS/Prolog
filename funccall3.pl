func_call(F/_/I, Arg, Res) :- %nth0(pos, full_list, element, cut_list)
	I1 is I + 1,
	length(L1, I1),
	nth0(0, L, F, Arg),
	nth0(I, L1, Res, L),
	Call =.. L1,
	Call, !.

func_call(F/_/_, Arg, Res) :- %nth0(pos, full_list, element, cut_list)
	!, nth0(0, L, F, Arg),
	length(L, I1),
	nth0(I1, L1, Res, L),
	Res = L1.

func_call(F/I, Arg, Res) :- %nth0(pos, full_list, element, cut_list)
	func_call(F/I/I, Arg, Res).

:- op(900, xfx, <#).
:- op(800, xfy, #).
%Result <# Function # ArgsChain :- func_call(Function, ArgsChain, Result).

Result <# Function # ArgsChain :-
	parse_args_chain(ArgsChain, Args), 
	func_call(Function, Args, Result).

parse_args_chain(H # T, [H|TArgs]) :-
	!, parse_args_chain(T, TArgs).
parse_args_chain(H, [H]).

