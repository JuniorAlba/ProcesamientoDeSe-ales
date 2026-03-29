addpath('../Funciones creadas');
fs = 4000;
tini = 0;
tfin = 2;
fase = 0;
fm = 129;

[x,t] = senoidal(fs,fm,fase,tini,tfin);
stem(t,x)
%Se ve como una senoidal de frecuencia 1hz

%Se puede observar una senoidal de aproximadamente 1 Hz en lugar de 4000 Hz.
%Esto se debe a que fm=129 < 2*fs=8000, por lo que no se cumplen las condiciones
%del ejercicio anterior. Al muestrear con tan pocos puntos por ciclo, la periodicidad
%de la función senoidal hace que se interprete como una señal de menor frecuencia.