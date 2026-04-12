%%ESTACIONARIDAD
%Queremos ver
%si el proceso es estacionario, la media de las variables estadisticas en todos los intantes tambien deberian
%estar bastante cerca de los valores 1(para la varianza) y 0 (para la media).
%Para esto ultimo vamos a establecer una tolerancia

%ensemble: conjunto de valores de realizaciones en un instante dado
N=1000;
R=1000;
Proceso_estocastico=randn(R,N);
z=1.96; %establece el nivel de confianza de la tolerancia en un 95%
        %es decir, el 95% de la las muestras que tomemos van a tener un error menor al establecido por la tolerancia
tolerancia_media = z/sqrt(R);  % error esperado de la media con R realizaciones
tolerancia_varianza = z*sqrt(2/(R-1));  %error esperado de la varianza con R realizaciones
errores_media = [];
errores_varianza = [];
for j = 1:1:N
    media    = mean(Proceso_estocastico(:,j));
    varianza = var(Proceso_estocastico(:,j));
    errores_media    = [errores_media abs(media)];       % comparamos con 0
    errores_varianza = [errores_varianza abs(varianza - 1)]; % comparamos con 1
endfor

error_media    = mean(errores_media);
error_varianza = mean(errores_varianza);

if error_media < tolerancia_media && error_varianza < tolerancia_varianza
    disp('Es estacionario');
else
    disp('No es estacionario');
end


%%ERGODICIDAD
%Queremos ver dos cosas
%1) Para verificar ergodicidad vamos a comparar los valores de la media para cada variable estadistica
%contra el valor de las variables estadisticas para un instante dado, la teoria nos dice que nuestras
%realizaciones deberian presentar los mismos valores estadisticos (por eso comparo media de cada realizacion)
R=1000;
error_media = [];
error_varianza = [];
tolerancia_media    = z*sqrt(1/N + 1/R);  %Estoy comparando dos estimadores independientes, la varianza del resultado es Vf = V1 + V2
tolerancia_varianza = z*sqrt(2/(N-1) + 2/(R-1));  %Pero yo quiero el error (desvio) entonces DesvF = sqrt(Desv1^2 + Desv2^2)
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

error_media    =  mean(errores_media);
error_varianza = mean(errores_varianza);

if error_media < tolerancia_media && error_varianza < tolerancia_varianza
    disp('Es ergódico');
else
    disp('No es ergódico');
end
