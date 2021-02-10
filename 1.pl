list(Xs, M, Sh) :-
    M > 0,
    list(Xs, Xs, 1, M, Sh).

list([], [], _, _, []).
list([], [X0 | Xs0], N, M, Sh) :-
    !,
    list([X0 | Xs0], [X0 | Xs0], N, M, Sh).
list([X | Xs], Xs0, M, M, [X | Sh]) :-
    append(Xs1, [X | Xs], Xs0),
    append(Xs, Xs1, Xs2),
    !,
    list(Xs2, Xs2, 1, M, Sh).
list([_ | Xs], Xs0, N, M, Sh) :-
    N1 is N + 1,
    list(Xs, Xs0, N1, M, Sh).
