/*
    4)
*/
juntar([],YS,YS).
juntar([X|XS],Y,[X|ZS]) :- juntar(XS,Y,ZS).

/* 
    5)
*/
ultimo(L,X) :- append(L1,[X],L2).

invertir(L1,L2) :- append(L1,[],[L2|X]).

prefijo(P,L) :- append(P,L2,L).

sufijo(S,L) :- append(L1,S,L).

sublist(S,L) :- prefijo(S,L), sufijo(S,L).

pertenece(X,L) :- append(L1,[X|L2],L).

/*
    6)
*/

aplanar([],[X|[]]).
aplanar([X|L1],L) :- aplanar(L1,[X|L2]).

/*
    7)
*/
palindromo(L,L1) :- append(L,L2,L1), reverse(L,L2).

