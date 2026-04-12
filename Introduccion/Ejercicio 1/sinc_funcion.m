function [y,t] = sinc_funcion(fs,fm,tini,tfin)
    %Consideracion: t entre -1 y 1
    T = 1/fm;
    t = tini:T:tfin-T;
    x = 2*pi*fs*t;
    y = sin(x)./x;
    %abs(x) < eps  genera una mascara de los valores de x cercanos a cero (con un error menor al error de maquina)
    %luego y(abs(x)<eps) selecciona los indices de los valores que no sean cero en esa mascara (osea los que cumplen la condicion)
    %y les asigna valor 1

    y(abs(x) < eps) = 1;
    #es preferible que sea entendible o se parezca a lo que vemos conceptualmente
    #en la teoria, cambiar codigo
endfunction