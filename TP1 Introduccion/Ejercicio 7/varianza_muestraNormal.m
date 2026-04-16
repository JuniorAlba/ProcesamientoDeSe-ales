function v = varianza_muestraNormal(muestra)
    muestra = muestra(:)'; %Forzamos a que sea un vector fila
    N = length(muestra);
    m=(ones(1,N)*muestra')/N;
    vector_aux = muestra-m;
    v = 1/(N-1)*(vector_aux*vector_aux');
endfunction