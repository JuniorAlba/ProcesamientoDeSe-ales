function [conv_lineal] = convolucion_lineal_v2(x,y)
    % fijo n y calculo la sumatoria sobre k
    % y[n] = Σ x[k] * y[n-k] → requiere invertir y y desplazarla
    x = x(:);
    y = y(:);
    conv_lineal = zeros(length(y)+length(x)-1,1);
    M = length(x);
    y_aumentada = [y ; zeros(length(conv_lineal)-length(y),1)];
    for n=1:length(conv_lineal)
            y_invertida = zeros(length(conv_lineal),1);
            y_invertida(1:n) = y_aumentada(n:-1:1)
        for k=1:length(x)
            conv_lineal(n) = conv_lineal(n) + x(k)*y_invertida(k);
        endfor
    endfor
endfunction