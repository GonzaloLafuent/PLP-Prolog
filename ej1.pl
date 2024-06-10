padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).

abuelo(X,Y) :- padre(X,Z), padre(Z,Y). 

ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).

/*
    1)
    abuelo(X,manuel) :- padre(X,Y), padre(Y,manuel)
    sabmeos que padre(Y,manuel), Y = luis. 
    luego padre(X,luis), X = juan, por lo tanto abuelo(X,manuel), X = juan 
*/

/* 2) */
hijo(X,Y) :- padre(Y,X).
hermano(X,Y) :- hijo(X,Z), hijo(Y,Z), X\=Y.

/* 
    4)
    habria que consultar abuelo(juan,Y)
*/

/*
    5)
    se define como hermano(pablo,Y)
*/

/*
    7)
    Como porlog leee la instruccion de arriba a abajo entonces pirmero entra por
    ancestro(X,X), luego si tengo acnestro(juan,X), X = juan;
    si sigo pidiendo una vez que termina de analizar a luis y a carlos, se cuelga
    tal que ya no sabe como instanciar los otros valores, para diego, ramiro, etc.
*/

/*
    uan solucion seria no considerar que la persona puede ser su propio ancestro
    luego elimino ancestro(X,X). a su vez podemos reinvertir la conuslta como ancestro(Z,Y), padre(X,Z)
*/