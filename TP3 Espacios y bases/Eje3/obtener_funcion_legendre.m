function [P_normalizada] = obtener_funcion_legendre(n,t)
    %legendre(n,t) me devuelve el polinomio de legendre de grado n evaluado en t 
    %pero esta funcion es ortogonal a las otras pero no ortonormal, por tanto, tenemos que
    %normalizarla para que nuestra formula sea valida.

    %esta funcion nos devuelve una matriz donde la primer fila estan los valores que nos interesan
    P_matriz = legendre(n, t);
    P = P_matriz(1,:);
    P_normalizada = sqrt((2*n+1)/2) .* P;

endfunction