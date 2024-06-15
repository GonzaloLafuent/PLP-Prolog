/*
    4)
*/
juntar([],YS,YS).
juntar([X|XS],Y,[X|ZS]) :- juntar(XS,Y,ZS).

/* 
    5)
*/
ultimo(_,X) :- append(_,[X],_).

invertir(L1,L2) :- append(L1,[],[L2|_]).

prefijo(P,L) :- append(P,_,L).

sufijo(S,L) :- append(_,S,L).

sublist(S,L) :- prefijo(S,L), sufijo(S,L).

pertenece(X,L) :- append(_,[X|_],L).

/*
    6)
    aplanar([],[X|[]]).
    aplanar([X|L1],L) :- aplanar(L1,[X|L2]).
*/

/*
    7)
*/
palindromo(L,L1) :- append(L,L2,L1), reverse(L,L2).


iesimo(I,L,X) :- append(L1,[X|_],L), N is I-1 , length(L1,N).

/*
    8)
*/
interseccion([],_,[]).
interseccion([X|XS],L2,[X|L3]) :- interseccion(XS,L2,L3), member(X,L2).
interseccion([_|XS],L2,L3) :- interseccion(XS,L2,L3).

partir(N,L,L1,L2) :- append(L,L2,L1), length(L,N).

borrar([],_,[]).
borrar([X|XS],X,LN) :- borrar(XS,X,LN).
borrar([Y|XS],X,[Y|LN]) :- X\=Y, borrar(XS,X,LN).

sacarDuplicados([],[]).
sacarDuplicados([X|L1],[X|L2]) :- borrar(L1,X,L), sacarDuplicados(L,L2).

/*
permutacion([X|XS],L) :- permutacion(XS,L1), inter
*/

/*
    9)
*/

elementosTomadosEnOrden(_,0,[]).
elementosTomadosEnOrden([X,Y|L1],N,[X|L2]) :- N1 is N-1 ,elementosTomadosEnOrden([Y,L1],N1,L2).
elementosTomadosEnOrden([X|L1],N,[X|L2]) :-  N1 is N-1, elementosTomadosEnOrden(L1,N1,L2).

/*
  10)
*/