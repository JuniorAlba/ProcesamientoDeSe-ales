addpath('../../TP1 Introduccion/Funciones creadas');

fs = 2;
fm = 10;
fase = 0;
tini=0;
tfin=1;
[y_sen,t_sen] = senoidal(fs,fm,fase,tini,tfin);
[y_cuad,t_cuad] = onda_cuad(fs,fm,fase);
[y_rampa,t_rampa] = rampa(tini,tfin,fm);

[y_aleatoria, t_aleatoria] = aleatoria(tini,tfin,fm);
%valor medio

%maximo

%minimo

%amplitud

%energia
%Cuadrado de la norma euclidea

%accion
%suma en valor absoluto

%potencia media
%cuadrado de la norma euclidea dividida por la cantidad de componentes

%Valor cuadratico medio
%raiz de la potencia media
seniales = [y_sen; y_cuad; y_rampa; y_aleatoria];  % cada fila = una señal
nombres  = {'senoidal', 'cuadrada', 'rampa', 'aleatoria'}; 

for i = 1:size(seniales, 1)       % iterar filas
    y = seniales(i, :);           % tomar la fila i como vector fila
    fprintf('--- %s ---\n', nombres{i});
    fprintf('  Media:    %.4f\n', mean(y));
    fprintf('  Maximo:   %.4f\n', max(y));
    fprintf('  Minimo:   %.4f\n', min(y));
    fprintf('  Amplitud: %.4f\n', max(abs(y)));
    fprintf('  Energia:  %.4f\n', sum(y.^2));
    fprintf('  Accion:   %.4f\n', sum(abs(y)));
    fprintf('  Potencia: %.4f\n', mean(y.^2));
    fprintf('  RMS:      %.4f\n', sqrt(mean(y.^2)));
end