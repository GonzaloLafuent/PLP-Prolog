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

reparto(,0,LL).
reparto(L,N,LL) :- 
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
  Para evitar que se cicle se deberia evitar que X sea mayor a Y.
  Esto se debe a que nunca va entra en la primer regla definida, luego
  al entrar siempre por la segunda va tener a aumentar X sin producir ninfun resultado
  si llamo desde con x = y, luego va ser siempre true tal que entro por la primer instruccion
  si x < y, luego lo voy a aumentar hasta llegar a x, por lo tanto voy a volver entrar
  por la primer instruccion dando true. si no insstancia Y me va dar X, lo mismo al reves.
*/
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

desde2(X,Y) :- Y is X+1.
desde2(X,Y) :- N is X+1, desde2(N,Y).

/*
    11)
*/

intercalar([],L2,L2).
intercalar(L1,[],L1).
intercalar([X|L1],[Y|L2],[X,Y|L3]) :- intercalar(L1,L2,L3).

/*
    12)
*/
vacio(nil).

raiz(bin(_,R,_),RAIZ) :- RAIZ is R.

cantidadDeNodos(nil,N) :- N is 0.
cantidadDeNodos(bin(I,_,D),N) :- cantidadDeNodos(I,N1), cantidadDeNodos(D,N2), N is N1 + N2 +1. 

altura().

/*
    13)
*/

inorder(nil,[]).
inorder(bin(I,R,D),L) :- inorder(I,LI), inorder(D,LD), append(LI,[R|LD],L).

/*
arbolConInorder([],nil).
arbolConInorder([I,_,D|L],).
*/

aBB(nil).
aBB(bin(nil,_,nil)).
aBB(bin(I,R,D)) :- raiz(I,IR), raiz(D,DR), IR < R, DR > R,aBB(I), aBB(D).

/*
    14)
*/

 
coprimos(X,Y) :- desde2(1,X), desde2(1,Y), gcd(X,Y) == 1.







