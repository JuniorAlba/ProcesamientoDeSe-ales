function [y_inv,t] = inversion(t,y)
    %inversion: y_inv = y(-t)
    %Esto funciona si el vector de tiempos esta centrado en t=0
    y_inv = y(end:-1:1);

    %[valor,indice] = min(abs(t));
    %y_inv = y(indice:end);
    %y_inv = [y_inv y(1:indice-1)];
endfunction