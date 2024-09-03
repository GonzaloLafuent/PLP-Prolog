
noSumaSenK(S,K) :- not((generarListas(S,K,L),sumlist(L,S))). 

generarListas(_,0,[]).
generarListas(S,K,[X|XS]) :- between(1,S,X),K1 is K-1, S1 is S - X, generarListas(S1,K1,XS). 

sumaSeEnK(S,K,L) :- generarListas(S,K,L), sumlist(L,S).

descomponer([],_,[]). 
descomponer([X|XS],K,[X|R]) :- K=\=0 ,noSumaSenK(X,K), descomponer(XS,K,R).
descomponer([X|XS],K,R) :-  K=\=0,sumaSeEnK(X,K,Y1),descomponer(XS,K,Y2), append(Y1,Y2,R). 