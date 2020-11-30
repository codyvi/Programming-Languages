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

% === travelTime ===


travelTime(Time) :-
    A is 4,
    C is A-1,
    B is 2*(C+C),
    Time is B*2.

% === cellGames ===

before(X, Y, Solution) :- nth1(X1, Solution, X), nth1(Y1, Solution, Y),	X1 < Y1.

after(X, Y, Solution) :- before(Y, X, Solution).

cellGame(Solution) :- 
    length(Solution, 3),
    member(vegetta, Solution),
    member(goku, Solution),
    member(gohan, Solution),
    before(gohan, vegetta, Solution),
    after(gohan, goku, Solution).

% === ages ===

ages(J, L, F, Y) :- 
    between(12, 19, J),
    between(12, 19, L),
    between(12, 19, F),
    all_different([J, L, F]),
    J + L + F =:= 46,
    Y is 39 / 3,
    F + Y =:= J * 2, !.

% === gardeningContest ===

gardeningContest(Solution) :- 
    length(Solution, 3),
    member([brooke, _], Solution),
    member([virginia, vanity], Solution),
    member([tricia, goldblush], Solution),
    Solution = [_, _, [brooke, _]],
    Solution = [_, _, [_, quietness]],
    Solution = [_, [tricia, _], _].

% === tournament ===

tournament(CA, A, T, R, C) :- 
    CA is 28, 
    C is CA - 5,
    T is 20, 
    between(T, C, R),
    R is T + (CA-C) div 2,
    between(C,CA, A),
    A > C.

% === zebra ===

right(X, Y, L) :- append(_, [X, Y|_], L).
next(X, Y, L):- right(X, Y, L) ; right(Y, X, L).

zebra(Solution) :- 
    length(Solution, 5),
    member([english, _, _, _, red], Solution),
    member([spanish, dog, _, _, _], Solution),
    member([_, _, _, coffee, green], Solution),
    member([ukrainian, _, _, tea, _], Solution),
    next([_, _, _, _, green], [_, _, _, _, white], Solution),
    member([_, serpent, winston, _, _], Solution),
    member([_, _, kool, _, yellow], Solution),
    Solution = [_, _, [_, _, _, milk, _], _, _],
    Solution = [[norwegian, _, _, _, _], _, _, _, _],
    next([_, _, chesterfield, _, _], [_, fox, _, _, _], Solution),
    next([_, horse, _, _, _], [_, _, kool, _, _], Solution),
    member([_, _, lucky, juice, _], Solution),
    member([japonese, _, kent, _, _], Solution),
    next([norwegian,_, _, _, _], [_, _, _, _, blue], Solution),
    member([_, _, _, water, _], Solution),
    member([_, zebra, _, _, _], Solution).


    
       
    
    
    
    
start :-
	write("% === travelTime ==="), nl, 
	travelTime(Time), % 24
	write(Time), nl,
	write("% === cellGames ==="), nl, 
	cellGame(Order), % [goku,gohan,vegeta]
	write(Order), nl,
	write("% === ages ==="), nl, 
	ages(J, L, F, Y), % [14,17,15,13]
	Names = [J, L, F, Y], 
	write(Names), nl,
	write("% === gardeningContest ==="), nl, 
	gardeningContest(Results),
	write(Results), nl,
	write("% === tournament ==="), nl, 
	tournament(CruzAzul, America, Tigres, Rayados, Chivas), % [28,24,20,22,23]
	Teams = [CruzAzul, America, Tigres, Rayados, Chivas],
	write(Teams), nl,
	write("% === zebra ==="), nl, % [[norwegian,fox,kool,water,yellow],[ukrainian,horse,chesterfield,tea,blue],[english,snake,winston,milk,red],[japonese,zebra,kent,coffee,green],[spanish,dog,lucky,juice,white]]
	zebra(Solution),
	write(Solution), nl, !.