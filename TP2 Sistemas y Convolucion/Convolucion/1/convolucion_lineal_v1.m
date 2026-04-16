function [conv_lineal] = convolucion_lineal_v1(x,y)
    %De esta forma veo la contribucion que realiza cada x[k]
    %a cada valor de la convolucion, luego actualizo los valores de la convolucion
    %de esta forma no hace falta invertir y ya que barremos todos los n valores de la
    %convolucion para un k fijo
    x = x(:);
    y = y(:);
    conv_lineal = zeros(length(y)+length(x)-1,1);
    M = length(x);
    for k=1:M
        % y desplazada k-1 posiciones representa y[n-k] para todo n
        y_desplazada = [zeros(k-1,1) ; y];
        vec_aux = x(k)*y_desplazada;
        for j=1:length(vec_aux)
            conv_lineal(j) = conv_lineal(j) + vec_aux(j);
        endfor
    endfor
endfunction