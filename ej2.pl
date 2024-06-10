vecino(X, Y, [X|[Y|Ls]]).
vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).

/*
    1)
    vecino(5, Y, [5,6,5,3])
        - vecino(5, Y, [6,5,3]) {y = 6 , x = 5, ls = [5,3]} 
        - vecino(5, Y, [6,5,3]) { X = 5 , W = 5, ls = [6,5,3]} 
            -vecino(5, Y, [5,3]) { x = 5, W = 6, ls = [5,3]}
                -vecino(5, Y, [3]) { x = 5, Y = 3 , ls = []} 
                -vecino(5, Y, [])  falla, tal que no puedo asghinar a W o Y
*/

/*
    2)
    si inmvertimos las reglas no afectaremos a los resultados, solo que los obtenedremos
    en distintos orden. solo cambiaremos la forma en la que entro a cada ramificacion del arbol,
    pero al final obtenego todos los vecinos.
*/