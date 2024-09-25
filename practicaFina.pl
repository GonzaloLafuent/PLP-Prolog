
noSumaSenK(S,K) :- not((generarListas(S,K,L),sumlist(L,S))). 

generarListas(_,0,[]).
generarListas(S,K,[X|XS]) :- between(1,S,X),K1 is K-1, S1 is S - X, generarListas(S1,K1,XS). 

sumaSeEnK(S,K,L) :- generarListas(S,K,L), sumlist(L,S).

descomponer([],_,[]). 
descomponer([X|XS],K,[X|R]) :- K=\=0 ,noSumaSenK(X,K), descomponer(XS,K,R).
descomponer([X|XS],K,R) :-  K=\=0,sumaSeEnK(X,K,Y1),descomponer(XS,K,Y2), append(Y1,Y2,R). 

p(a).
p(b).

a(c).
a(d).

r(X) :-not(not(X)), not(not(X)).

rotar([X|XS],R) :- append(XS,[X],R).

generarRotaciones(0,_,[]).
generarRotaciones(N,L,[R|RS]) :- N\=0 , N1 is N-1 , rotar(L,R), generarRotaciones(N1,R,RS).

rotaciones(L,Rotaciones) :- length(L,N), generarRotaciones(N,L,Rotaciones).

alfa(a).
alfa(b).
alfa(c).
alfa(d).
alfa(e).

buscar(X,cons( _ ,XS)) :- buscar(X,XS).
buscar(X,cons(X, _)).