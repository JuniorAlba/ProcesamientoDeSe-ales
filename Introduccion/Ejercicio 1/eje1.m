fm = 100;  % Frecuencia de muestreo fija por consigna
tini = 0;
tfin = 1;
fs = 5;   % Respeta 2*fs <= fm
fase = 0;

figure(1);
hold on;
[y,t] = senoidal(fs,fm,fase,tini,tfin);
plot(t,y,'o-r', 'LineWidth', 1.5, 'MarkerSize', 4)

[y,t] = sinc_funcion(fs,fm,tini,tfin);
plot(t,y,'s-b', 'LineWidth', 1.5, 'MarkerSize', 4)

[y,t] = onda_cuad(fs,fm,fase,tini,tfin);
plot(t,y,'^-g', 'LineWidth', 1.5, 'MarkerSize', 4)

xlabel('Tiempo (s)')
ylabel('Amplitud')
title(sprintf('Señales discretas: fm=%d Hz, fs=%d Hz', fm, fs))
legend('Senoidal', 'Sinc', 'Onda cuadrada')
grid on
