function p = potencia_sen(muestra)
    muestra = muestra(:)'; %fuerzo a que sea un vector fila
    N = length(muestra);
    p = (muestra*muestra')/N;

endfunction