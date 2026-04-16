function [y,t] = onda_cuad(fs,fm,fase)
    tini = 0;
    tfin = 1;
    T = 1/fm;
    t = tini:T:tfin-T;
    x = 2*pi*fs*t;
    y = -1*(mod(x + fase,2*pi)>=pi) + 1*(mod(x + fase,2*pi)<pi);

endfunction