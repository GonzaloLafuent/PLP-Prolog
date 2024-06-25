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


sumaColumna([],_,0).
sumaColumna([Fila|Cuadrado],I,S) :- nth0(I,Fila,E), sumaColumna(Cuadrado,I,S1), S is S1+E.

esMagico(C,SumaFila,N) :- not((between(0,N,I),sumaColumna(C,I,S), S\= SumaFila)).   

cuadradoMagico(N,C) :- cuadradoSemilatino(N,C), nth0(0,C,Fila), sumlist(Fila,Suma), N1 is N-1, esMagico(C,Suma,N1).


/*
    16)
*/
    esTriangulo(tri(A,B,C)) :- A < B+C, B < A+C, C < B+A.

/*
    17)
*/

frutal(frutilla).
frutal(banana).
frutal(manzana).
cremoso(banana).
cremoso(americana).
cremoso(frutilla).
cremoso(dulceDeLeche).

leGusta(X) :- frutal(X), cremoso(X).
cucurucho(X,Y) :- leGusta(X), leGusta(Y).

/*
    18)
    a) Estamos pidiendo que el valor instcniado en Y sea uno tal que cumple P pero no cumple Q.

    b)

    c) para determinar esto se puede escribir de la siguiente manera:

        unicoYqueCumpleP(Y) :- P(Y), not((P(X)), X \=Y)

       La idea es que como el predicado P es reversible de acuerdo a la consigna, si no lo instacion me devuelve
       un posible valor X que cumple P. Luego si quiero ve que Y es el unicion elemento que hace valor P entonces
       lo podemos pensar como que Y debe cumplir el prediado P y a su vez no debe existir otro elemento X
       donde X sea distinto que Y, tal que haga valer P. esto esta expresado con el ultimo not. 
*/

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

/*
    23)
    I)
    G = Grafo, D = Nodo Inicial, H = Nodo Final, L = Camino, V = Visitados

    generarCamino(G,H,H,[H],V) :- not(member(V,H)).
    generarCamino(G,D,H,[X|L],V) :- esArista(G,D,X), not(member(X,V)), append([X],V,V1), generarCamino(G,X,H,L,V1).

    caminoSimple(G,D,H,[D|L]) :- esNodo(G,H), esNodo(G,D) , generarCamino(G,D,H,L,[D])

    

    II)

    listarNodos(G,L,V) :- not((esNodo(G,X), not(member(X,visitados)))).
    listarNodos(G,[V|L],listados) :- esNodo(G,V), not(member(V,listados)),
                                     append(V,L1), listarNodos(G,L,L1).

    nodos(G,[V|L]) :- esNodo(G,V), listarNodos(G,L,[V]).

    generarParDeNodos(G,D,H) :- esNodo(G,D), esNodo(G,H). 

    caminoHamiltoniano(G,L) :- generarParDeNodos(G,D,H), nodos(G,L), caminoSimple(G,D,H,C),
                               not((member(V,L),not(member(V,C)))).

    III)
    noEsConexo(G) :- generarParDeNodos(G,D,H), not(caminoSimple(G,D,H,C)).

    esConexo(G) :- not(noEsConexo(G)).

    IV)
    listarAritas(G,_,Listados) :- not((esArista(G,X,Y), not(member([X,Y],Listados)))).
    listarAristas(G,[[X,Y]|L],Listados) :- esAristas(G,X,Y), not(member([X,Y],listados)),
                                           append([[X,Y]],Listados,L1), listarNodos(G,L,L1).

    aristas(G,[[X,Y]|L]) :- esArista(G,X,Y), listarArista(G,L,[[X,Y]]).

    esEstrella(G) :- esConexo(G), aristas(G,L), esNodo(G,V), not(esArista(G,V,Y), not(member([X,Y],L))).

*/

/*
    24)
    
*/


