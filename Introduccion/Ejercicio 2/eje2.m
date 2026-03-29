addpath('../Funciones creadas');
fm = 1000;  % Frecuencia de muestreo fija por consigna
tini = -1;
tfin = 1;
fs = 5;   % Respeta 2*fs <= fm
fase = 0;


[y,t] = senoidal(fs,fm,fase,tini,tfin);
figure(1)
hold on
plot(t,y,'-r');

%[y_inv,t] = inversion(y,t);
%plot(t,y_inv,'-b');

%[y_rect,t] = rectificacion(y,t);
%plot(t,y_rect,'-b');

N=5;
[y_cuant,t] = cuantizacion(y,t,N);
plot(t,y_cuant,'-b');
