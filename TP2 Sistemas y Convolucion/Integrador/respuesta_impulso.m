function [h,n] = respuesta_impulso(x_coef,y_coef,N)

    x_coef = x_coef(:); #fuerzo a que sea vector columna
    y_coef = y_coef(:); #fuerzo a que sea vector columna

    #Debido a que defini la respuesta al impulso como suma de productos vectoriales
    #me aseguro que tengan la misma dimension
    if(N>length(x_coef))
        x_coef = [x_coef; zeros(N-length(x_coef),1)];
    endif
    if(N>length(y_coef))
        y_coef = [y_coef; zeros(N-length(y_coef),1)];
    endif
    x_val = [1 ; zeros(length(x_coef)-1,1)];
    #defino vector memoria de valores de x
    #el primer indice corresponde a n, el segundo a n-1...
    y_val = [zeros(length(y_coef),1)];
    #defino vector memoria de valores de y
    #el primer indice corresponde a n-1, el segundo a n-2...
    n = [0:1:N-1]';
    h = [];
    for i=1:1:N
        h(i) = (x_coef'*x_val - y_coef(2:end)'*y_val(1:end-1))./y_coef(1);
        y_val(2:end) = y_val(1:end-1);
        y_val(1) = h(i);
        x_val(2:end) = x_val(1:end-1);
        x_val(1) = 0;
    endfor
    h = h(:);   #fuerzo a que sea vector columna
endfunction