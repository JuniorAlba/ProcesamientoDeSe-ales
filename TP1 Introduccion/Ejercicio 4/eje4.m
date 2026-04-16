addpath('../Funciones creadas');
fs = 5;
tini = 0;
tfin = 1;
fase = 0;
fm_1 = 100;
fm_2 = 25;
fm_3 = 10;
fm_4 = 4;
fm_5 = 1;
fm_6 = 0.5;

figure(1)
hold on;
% [x,t] = senoidal(fs,fm_1,fase,tini,tfin);
% stem(t,x);
%corresponde con la sinusoidal esperada

% [x,t] = senoidal(fs,fm_2,fase,tini,tfin);
% stem(t,x);
%corresponde pero ya se ve una grafica menos suave

[x,t] = senoidal(fs,fm_3,fase,tini,tfin);
stem(t,x);
%podria corresponder con una de 5hz o con una constante de valor cero


% [x,t] = senoidal(fs,fm_4,fase,tini,tfin);
% stem(t,x);
%aca ya no corresponde con una sinusoidal de 5hz
%se parece mas a una de menor frecuencia, corresponde a una de 1hz

% [x,t] = senoidal(fs,fm_5,fase,tini,tfin);
% plot(t,x);
%ya no se puede observar una grafica, solo un punto

% [x,t] = senoidal(fs,fm_6,fase,tini,tfin);
% stem(t,x);
%aca el vector ya no tiene elementos

%Se puede notar que cuando fm < 10 (en este ejemplo) la señal graficada
%muestra una frecuencia distinta a la original. Esto puede
%deberse a la periodicidad de la función senoidal, que hace
%que al muestrear con pocos puntos por ciclo se interprete
%como una señal de menor frecuencia. Por lo tanto se concluye
%que para representar correctamente una señal puede ser conveniente tomar
%como frecuencia de muestreo el doble de la frecuencia de la señal.