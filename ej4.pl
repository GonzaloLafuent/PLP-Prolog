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

/*
desde2(X,Y) :- Y is X+1.
desde2(X,Y) :- N is X+1, desde2(N,Y).
*/

desde2(X,X).
desde2(X,Y) :- var(Y), N is X+1, desde2(N,Y).
desde2(X,Y) :- nonvar(Y), X < Y.

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

 
/* 
    Esto no funciona, tal que si bien me va a dar un valor de pares que tengan el mcd 1, solo
    chequeo aquellos cuayas pares arrancar la coordenda en 1. luego el resultado no es del todo el esperado.
    coprimos(X,Y) :- desde2(1,X), desde2(1,Y), gcd(X,Y) == 1.
*/


sumanS(X,Y,S) :- S1 is S-1, between(1,S1,X), Y is S1-X.

generarPares(X,Y) :- desde2(2,S), sumanS(X,Y,S).

coprimos(X,Y) :- generarPares(X,Y), gcd(X,Y) =:= 1.


/*
    15)
*/

generarFila(0,0,[]).
generarFila(N,S,[E|RestoFila]) :- N\=0, between(0,S,E), S1 is S-E, N1 is N-1, generarFila(N1,S1,RestoFila). 

generarCuadrado(0,_,_,[]).
generarCuadrado(N,CantColumns,S,[Fila|Cuadrado]) :- N\=0, generarFila(CantColumns,S,Fila), N1 is N-1, generarCuadrado(N1,CantColumns,S,Cuadrado). 

cuadradoSemilatino(N,C) :- desde2(0,S), generarCuadrado(N,N,S,C).




esMagico([Fila|Cuadrado],N) 

cuadradoMagico(N,[Fila|C]) : cuadradoSemilatino(N,[Fila|C]), sumList(Fila,N), esMagico(C,N).


/*
    16)
*/
    esTriangulo(tri(A,B,C)) :- A < B+C, B < A+C, C < B+A.

/*
    20)
    para definir el minimo X tal que P(X) vale lo puedo definir de la siguiente manera.
    minimoXP(X) :- desde2(0,X), P(X), not((between(0,X,Y),P(Y))), !.
    el corte esta puesto para que una vez obtenido dicho minimo, no busco ninguno mas

*/

/*
    21)
    conjuntoDeNaturales(X) :- pertenece(E,X), natural(E).
*/

