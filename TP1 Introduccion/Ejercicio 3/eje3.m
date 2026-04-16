%Amplitud = 3unidades -> corresponde al valor maximo de la grafica
% fm = 8/0.01 = 800;  -> Tm = 1/800
% Ts = 0.05 -> fs = 20
%hay dos formas de calcular la fase: arcsen(-2/3) aprox pq parece que en t=0 x>-2
%t1 = 5*0.01/8 -> sin(-t1*2*pi*fs)= -raiz(2)/2 -> fase = -pi/4

addpath('../Funciones creadas');
fm = 800;  % Frecuencia de muestreo fija por consigna
tini = 0;
tfin = 0.1;
fs = 20;   % Respeta 2*fs <= fm
fase = -pi/4;

[x,t] = senoidal(fs,fm,fase,tini,tfin);
stem(t, 3*x)
set(gca, 'XTick', 0:0.01:0.1);
%para controlar la separacion entre cada marca del eje x