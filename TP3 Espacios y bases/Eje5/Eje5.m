addpath('../../TP1 Introduccion/Funciones creadas');
x = load('te.txt');

fm = 11025;
t = 0:1/fm:(length(x)-1)/fm;
plot(1:1:length(x),x);
%ventanas
%1: indice1:17160  ;  indice2:21450
%2: indice1:30250  ;  indice2:34230
%3: indice1:39680  ;  indice2:43210
%4: indice1:48580  ;  indice2:52870
%5: indice1:59080  ;  indice2:63280
%6: indice1:70000  ;  indice2:73950
%7: indice1:80920  ;  indice2:85210
ventanas = [17160 21450;
            29930 34230;
            39680 43210;
            48580 52870;
            59080 63280;
            70000 73950;
            81090 85120];

fases = [linspace(0,2*pi,20)];
%voy a armar una matriz que tenga como fila una sinusoidal con una fase dada
%y al variar de fila varia la fase, luego matriz por vector(ventana) me da otro vector
%el indice del maximo de ese vector corresponde a una fila de mi matriz, que me dice la
%sinusoidal que mas se parece

frecuencias_filas = [697,770,852,941];
frecuencias_columnas = [1209,1336,1477];
filas = [];
columnas = [];
for z=1:rows(ventanas)
    window = x(ventanas(z,1):ventanas(z,2)-1);
    parecidos = [];
    for i=1:length(frecuencias_filas)
        %armamos la matriz antes mencionada
        fs = frecuencias_filas(i);
        matriz = [];
        for j=1:length(fases)
            fase = fases(j);
            [s,~]=senoidal(fs,fm,fase,t(ventanas(z,1)),t(ventanas(z,2)));
            matriz = [matriz; s];
        endfor
        vector_parecidos = matriz*window;
        [val,indice] = max(vector_parecidos);
        parecidos = [parecidos; val];
    endfor
    [~,fila] = max(parecidos);
    filas = [filas;fila];

    parecidos = [];
    for i=1:length(frecuencias_columnas)
        %armamos la matriz antes mencionada
        fs = frecuencias_columnas(i);
        matriz = [];
        for j=1:length(fases)
            fase = fases(j);
            [s,~]=senoidal(fs,fm,fase,t(ventanas(z,1)),t(ventanas(z,2)));
            matriz = [matriz; s];
        endfor
        vector_parecidos = matriz*window;
        [val,indice] = max(vector_parecidos);
        parecidos = [parecidos; val];
    endfor
    [~,columna] = max(parecidos);
    columnas = [columnas;columna];
endfor


%genero una matriz como referencia del teclado
teclado = {'1', '2', '3';
           '4', '5', '6';
           '7', '8', '9';
           '*', '0', '#'};

for i = 1:length(filas)
    caracter = teclado{filas(i), columnas(i)};  % {} en lugar de ()
    fprintf(' %s \n',caracter);
endfor

