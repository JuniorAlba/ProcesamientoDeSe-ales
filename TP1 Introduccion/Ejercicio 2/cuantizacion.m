function [y_cuantizada,t] = cuantizacion(t,y,N)
    minimo = min(y);
    y_pos = y - minimo;
    Amplitud = max(y_pos);
    H = Amplitud/(N-1);
    y_cuantizada = 0.*(y_pos<0) + H.*floor(y_pos./H).*(y_pos>=0 & y_pos<Amplitud) + (N-1)*H.*(y_pos>=Amplitud);
    y_cuantizada = y_cuantizada + minimo;
endfunction