function [conv_circular] = convolucion_circular(x,y)
    x = x(:);
    y = y(:);
    M = length(x);
    conv_circular = zeros(length(x),1);
    x_periodica= [ x(1:end);x];
    x_periodica_inv = x_periodica(end:-1:1);
    for n=1:length(conv_circular)
        x_operativa = x_periodica_inv(M:end);
        for k=1:length(x)
            conv_circular(n) = conv_circular(n) + x_operativa(k)*y(k);
        endfor
        aux = x_periodica_inv(end);
        x_periodica_inv(2:end) = x_periodica_inv(1:end-1);
        x_periodica_inv(1) = aux;
    endfor

endfunction