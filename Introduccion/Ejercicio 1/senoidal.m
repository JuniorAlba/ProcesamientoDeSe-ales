function [y,t] =  senoidal(fs,fm,fase,tini,tfin)
    T = 1/fm;
    %La fm corresponde con la cantidad de puntos evaluados en un segundo
    %si hacemos que t llegue hasta tfin entonces estariamos tomando fm+1 puntos en ese segundo
    t = tini:T:tfin-T;
    y = sin(2*pi*fs*t+fase);
endfunction