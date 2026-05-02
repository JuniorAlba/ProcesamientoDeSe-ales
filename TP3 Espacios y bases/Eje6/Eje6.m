addpath('../../TP1 Introduccion/Funciones creadas');

[x, fm] = audioread('escala.wav');
[filas, columnas] = size(x); %vector columna
t = 0:1/fm:(length(x)-1)/fm;

fases = [linspace(0,2*pi,20)];
frecuencias = [261.63 293.66 329.63 349.23 392.00 440.00 493.88 523.25];
notas = {'DO' 'RE' 'MI' 'FA' 'SOL' 'LA' 'SI' 'DO'};
tam_ventana = round(0.5 * fm);
n_ventanas = floor(length(x) / tam_ventana);
ventanas = [];
for i = 1:n_ventanas
    inicio = (i-1) * tam_ventana + 1;
    fin = i * tam_ventana;
    ventanas = [ventanas; inicio, fin];
endfor
frec_parecidas = [];
for i=1:length(ventanas)
    s = x(ventanas(i,1):ventanas(i,2)-1);
    parecidos = [];
    for j=1:length(frecuencias)
        fs = frecuencias(j);
        matriz = [];
        for  z=1:length(fases)
            [sen,~] = senoidal(fs,fm,fases(z),t(ventanas(i,1)),t(ventanas(i,2)));
            matriz = [matriz; sen];
        endfor
        parecido = matriz*s;
        [val,indice] = max(parecido);
        parecidos = [parecidos ; val];
    endfor
    [val,indice] = max(parecidos);
    frec_parecidas = [frec_parecidas;indice];
endfor


for i = 1:length(frec_parecidas)
    caracter = notas{frec_parecidas(i)};  % {} en lugar de ()
    fprintf(' nota %1.0f tiene gran parecido a %s , tiempo inicio %1.2f , tiempo fin: %1.2f\n',i,caracter,t(tam_ventana*(i-1)+1), t(tam_ventana*(i)));

endfor



