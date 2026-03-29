addpath('../Funciones creadas');
%Randn(R,N) nos genera una matriz de N muestras con R realizaciones
%donde las relaizaciones siguen las distribucion gausseana con varianza 1 
% y media 0
%Podemos controlar la media y la varianza de la siguiente manera: d*randn(N,R) + m
%esto nos permite crear un proceso estocastico con distribucion gausseana de media m y varianza d^2

%%ESTACIONARIDAD
N=1000;
error_media = [];
error_varianza = [];
for i=1:1:10
    R=1000*i;
    Proceso_estocastico=randn(R,N);
    %le damos una primer pasada para tener valores con los que comparar
    media = media_muestraNormal(Proceso_estocastico(:,1));
    varianza = varianza_muestraNormal(Proceso_estocastico(:,1));
    media_max = media;
    varianza_max=varianza;
    for  j = 2:1:N
        media = media_muestraNormal(Proceso_estocastico(:,j));
        varianza = varianza_muestraNormal(Proceso_estocastico(:,j));
        if(abs(media)>abs(media_max))
            media_max = media;
        endif
        if(abs(varianza-1)>abs(varianza_max-1))
            varianza_max = varianza;
        endif
    endfor
    error_media = [error_media abs(media_max)];
    error_varianza = [error_varianza abs(varianza_max-1)];
endfor
error_media(end) < error_media(1)
error_varianza(end) < error_varianza(1)
%si ambas condiciones se cumplen entonces el proceso se acerca a la media y varianza
%deseadas a medida que aumentamos la cantidad de realizaciones.
error_media(end)
error_varianza(end)
%Si son cercanas a cero significa que los estimadores convergen a los valores
%esperados (media=0, varianza=1) para todos los instantes de tiempo,
%lo que verifica la estacionaridad del proceso.


%Observando los resultados se puede afirmar que el proceso estocastico es estacionario
%Ahora queda observar que sea ergodico

%ERGODICIDAD
R=1000;
error_media = [];
error_varianza = [];
for i=1:1:10
    N=100*i;
    Proceso_estocastico=randn(R,N);
    %le damos una primer pasada para tener valores con los que comparar
    media = media_muestraNormal(Proceso_estocastico(1,:));
    varianza = varianza_muestraNormal(Proceso_estocastico(1,:));
    media_max = media;
    varianza_max=varianza;
    for  j = 2:1:R
        media = media_muestraNormal(Proceso_estocastico(j,:));
        varianza = varianza_muestraNormal(Proceso_estocastico(j,:));
        if(abs(media)>abs(media_max))
            media_max = media;
        endif
        if(abs(varianza-1)>abs(varianza_max-1))
            varianza_max = varianza;
        endif
    endfor
    error_media = [error_media abs(media_max)];
    error_varianza = [error_varianza abs(varianza_max-1)];
endfor
error_media(end) < error_media(1)
error_varianza(end) < error_varianza(1)
%si ambas condiciones se cumplen entonces el proceso se acerca a la media y varianza
%deseadas a medida que aumentamos el tamaño de la muestra.
error_media(end)
error_varianza(end)
%Si son cercanas a cero significa que los estimadores convergen a los valores
%esperados (media=0, varianza=1) para todos los instantes de tiempo,
%lo que verifica la ergodicidad del proceso.



%Observando los resultados se puede afirmar que el proceso estocastico es ergodico