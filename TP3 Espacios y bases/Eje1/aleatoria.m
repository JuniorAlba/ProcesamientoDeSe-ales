function [y,t] = aleatoria(tini,tfin,N)
    T = 1/N;
    t = tini:T:tfin-T;
    y=randn(1,N);
endfunction