%%ESTACIONARIDAD
%Queremos ver dos cosas

%1)A medida que aumentamos las realizaciones nuestra varianza y media se deberian acerca a 1 y 0 respectivamente
%2)Y si el proceso es estacionario, la media de las variables estadisticas en todos los intantes tambien deberian
%estar bastante cerca de los valores mencionados antes.
%Para esto ultimo vamos a establecer una tolerancia


N=1000;
error_media = [];
error_varianza = [];
z=1.96;
%establece el nivel de confianza de la tolerancia en un 95%
%es decir, el 95% de la las muestras que tomemos van a tener un error menor al establecido por la tolerancia
for i=1:1:10

    R=1000*i;
    tolerancia_media = z/sqrt(R);
    % error esperado de la media con R realizaciones
    tolerancia_varianza = z*sqrt(2/(R-1));
    %error esperado de la varianza con R realizaciones

    randn('state', 0);
    %me permite mantener la misma matriz pero solo agregando muestras/realizaciones
    %sirve para comparar si realmente nos acercamos a los valores esperados a medida que agrandamos la matriz
    %si no lo usaramos cada vez generariamos un proceso estocastico distinto
    Proceso_estocastico=randn(R,N);

    errores_media = [];
    errores_varianza = [];
    for j = 1:1:N
        media    = mean(Proceso_estocastico(:,j));
        varianza = var(Proceso_estocastico(:,j));
        errores_media    = [errores_media abs(media)];              % comparamos con 0
        errores_varianza = [errores_varianza abs(varianza - 1)];    % comparamos con 1
    endfor

    error_media    = [error_media mean(errores_media)];
    error_varianza = [error_varianza mean(errores_varianza)];
endfor

if  error_media(end) < error_media(1) && error_varianza(end) < error_varianza(1)
    disp('El proceso se acerca a los valores esperados');
else
    disp('El proceso NO se acerca a los valores esperados');
end


if error_media(end) < tolerancia_media && error_varianza(end) < tolerancia_varianza
    disp('Es estacionario');
else
    disp('No es estacionario');
end


%%ERGODICIDAD
%Queremos ver dos cosas
%1) A medida que aumentamos las muestras nuestra varianza y media se deberian acerca a 1 y 0 respectivamente o
% a la media y varianza de un instante de tiempo.
%2) Para verificar ergodicidad vamos a comparar los valores de la media para cada variable estadistica
%contra el valor de las variables estadisticas para un instante dado, la teoria nos dice que nuestras
%realizaciones deberian presentar los mismos valores estadisticos (por eso comparo media de cada realizacion)
R=1000;
error_media = [];
error_varianza = [];
for i=1:1:10
    N=1000*i;
    tolerancia_media    = z*sqrt(1/N + 1/R);
    tolerancia_varianza = z*sqrt(2/(N-1) + 2/(R-1));
    %Estoy comparando dos estimadores independientes, la varianza del resultado es Vf = V1 + V2
    %Pero yo quiero el error (desvio) entonces DesvF = sqrt(Desv1^2 + Desv2^2)
    %luego z me establece la confianza de la tolerancia

    randn('state', 0);
    Proceso_estocastico = randn(R,N);

    % Estadísticas ensemble en t=1 (instante fijo de referencia)
    media_ensemble    = mean(Proceso_estocastico(:,1));
    varianza_ensemble = var(Proceso_estocastico(:,1));

    errores_media    = [];
    errores_varianza = [];
    for j = 1:1:R
        % Estadísticas temporales de la realización j
        media_temporal    = mean(Proceso_estocastico(j,:));
        varianza_temporal = var(Proceso_estocastico(j,:));

        % Comparamos temporal vs ensemble
        errores_media    = [errores_media    abs(media_temporal    - media_ensemble)];
        errores_varianza = [errores_varianza abs(varianza_temporal - varianza_ensemble)];
    endfor

    error_media    = [error_media    mean(errores_media)];
    error_varianza = [error_varianza mean(errores_varianza)];
endfor

if  error_media(end) < error_media(1) && error_varianza(end) < error_varianza(1)
    disp('El proceso se acerca a los valores esperados');
else
    disp('El proceso NO se acerca a los valores esperados');
end

if error_media(end) < tolerancia_media && error_varianza(end) < tolerancia_varianza
    disp('Es ergódico');
else
    disp('No es ergódico');
end
