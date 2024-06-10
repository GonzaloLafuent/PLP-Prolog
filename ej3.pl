natural(0).
natural(suc(X)) :- natural(X).

menorOIgual(X,X) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).

/*
    1)
    menorigual(0,X)
        -menorIgual(X1, suc(y1)) {X1 = 0, X = suc(Y1)}
            -menorIgual(X2, succ(Y2)) {X2 = x1, y1 = y2}
                menorIgual(X3, suc(y2)) {x3 = x2, y3 = y2}
                    ------
    se indefine dado a las formas en la que estan defindas las reglas. como prolog
    analiza las reglas de arriba hacia abajao, siempre tomo el primer camino 
*/

/*
    invertir el orden de las ecuciones hara que funcione correctamente
    menorOIgual(X,X) :- natural(X).
    menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
*/