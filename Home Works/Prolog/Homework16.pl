% ====================
% Complete the following programs and submit your file to Canvas.
% ====================
% Do not change the names of the programs. 
% Do not change the number of elements in the clauses.
% If your file cannot be loaded by the Prolog interpreter, your submission may be cancelled. 
% Then, submit only code that works.
% ====================
% Grading instructions:
% There is a series of test cases for each program. In order to state that your program
% "works as described", your output must be similar to the expected one in each case.

:- use_module(library(clpfd)).

% === duplicate ===

duplicate([], []).
duplicate([H|T], [H,H|T2]) :- duplicate(T, T2).

% === sum ===

sum([], 0).
sum([H | T], N):- is_list(H), sum(T, N).
sum([H | T], N):- sum(T,X), N is H + X.

% === toBinaryString ===

toBinaryString(1, "1").
toBinaryString(0, "0").
toBinaryString(N, X) :- A is N mod 2, B is N div 2, toBinaryString(A, Z), toBinaryString(B, W), string_concat(W, Z, X), !.

% === isort ===

insert(N, [], [N]) :- !.
insert(N, [L|LS], [N, L|LS]) :- N =< L, !.
insert(N, [X|L1], [X|L]) :- insert(N, L1, L).

isort([], []) :- !.
isort([L|LS], X) :- isort(LS, S), insert(L, S, X).

% === magicSquare ===

% |-------|
% | A B C |
% | D E F |
% | G H I |
% |-------|

magicSquare([A, B, C, D, E, F, G, H, I]) :-
    between(1, 9, A),
    between(1, 9, B),
    between(1, 9, C),
    all_different([A, B, C]),
    15 is A + B + C,
    between(1, 9, D),
    between(1, 9, E),
    between(1, 9, F),
    all_different([D, E, F]),
    15 is D + E + F,
    between(1, 9, G),
    between(1, 9, H),
    between(1, 9, I),
    all_different([G, H, I]),
    15 is G + H + I,
    all_different([A, B, C, D, E, F, G, H, I]),
    15 is A + E + I,
    15 is C + E + G,
    15 is A + D + G,
    15 is B + E + H,
    15 is C + F + I, !. 

% === path ===

edge(a, c, 5).
edge(c, b, 6).
edge(c, d, 8).
edge(b, e, 8).
edge(d, e, 2).
edge(e, f, 3).
edge(e, g, 7).
edge(f, g, 1).

path(X, Y, [X|Y], C) :- edge(X, Y, C).
path(X, Y, [X|LS], C) :- edge(X, Z, C1),  path(Z, Y, LS, C2), C is C1 + C2.

start :-
	write("% === duplicate ==="), nl, 
	duplicate([], X1), % []
	write(X1), nl,
	duplicate([1, 2, 3], X2), % [1,1,2,2,3,3]
	write(X2), nl,
	duplicate(X3, [a, a, b, b]), % [a,b]
	write(X3), nl,
	write("% === sum ==="), nl, 
	sum([], X4), % 0
	write(X4), nl,
	sum([1, 2, 3, 4, 5, 6], X5), % 21
	write(X5), nl,
	sum([1, [2, 3], [4, 5, 6], 7], X6), % 8
	write(X6), nl,
	write("% === toBinaryString ==="), nl, 
	toBinaryString(0, X7), % 0
	write(X7), nl,
	toBinaryString(1, X8), % 1
	write(X8), nl,
	toBinaryString(32, X9), % 100000
	write(X9), nl,
	toBinaryString(572, X10), % 1000111100
	write(X10), nl,
	write("% === isort ==="), nl, 
	isort([1, -1, 2, 10, 3], X11), % [-1,1,2,3,10]
	write(X11), nl, 
	write("% === magicSquare ==="), nl, 
	magicSquare(X12), % Many answers, check the constraints. 
	write(X12), nl,
	write("% === path ==="), nl, 
	path(a, e, PathAE, CostAE), % [a,c,b,e], 19
	write(PathAE), write(", "), write(CostAE), nl,
	path(d, g, PathDG, CostDG), % [d,e,g], 9
	write(PathDG), write(", "), write(CostDG), nl, !.