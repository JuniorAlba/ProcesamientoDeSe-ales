function [y,t] = onda_cuad(tini,tfin,N)
    T = 1/N;
    t = tini:T:tfin-T;
    y = t;

endfunction