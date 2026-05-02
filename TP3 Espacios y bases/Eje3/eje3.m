t = linspace(-1, 1, 1000);
f = -1.*(t<0) + 1.*(t>=0);
%el error entre los coeficientes reales y el que obtengo depende de cuan fina es la 
%discretizacion
n_coefs =  4;  % cuantos coeficientes quiero
alphas = [];
funciones = [];
for n = 0:n_coefs-1

    P_normalizada = obtener_funcion_legendre(n,t);
    %aproximacion a la integral 
    dt = t(2) - t(1);
    ai = f * P_normalizada' *dt;


    funciones = [funciones ; P_normalizada];
    alphas = [alphas; ai];
    fprintf('alpha_%d = %.6f\n', n, alphas(n+1));
end
Error_cuadratico = norm(f' - funciones'*alphas)^2 * dt
figure(1)
hold on
plot(t',funciones'*alphas)
plot(t,f)


%ITEM B
% coeficientes exactos
a1_exacto = alphas(2);   % alpha_1
a3_exacto = alphas(4);   % alpha_3

% variaciones alrededor de los coeficientes exactos
variacion = linspace(-0.5, 0.5, 50);
a1_vec = a1_exacto + variacion;
a3_vec = a3_exacto + variacion;

% matriz de ECT para cada combinacion
ECT_matriz = zeros(length(a1_vec), length(a3_vec));

for i = 1:length(a1_vec)
    for j = 1:length(a3_vec)
        % reconstruis la señal con estos coeficientes modificados
        alphas_mod = alphas;
        alphas_mod(2) = a1_vec(i);
        alphas_mod(4) = a3_vec(j);
        f_aprox = funciones' * alphas_mod;
        ECT_matriz(i,j) = norm(f' - f_aprox)^2 * dt;
    end
end

% grafico 3D
figure(2)
% Para graficar la superficie 3D necesitamos tres matrices del mismo tamaño
% donde cada posicion (i,j) representa un par de coeficientes (a1, a3) y su ECT.
%
% Para esto usamos la funcion meshgrid, que nos ayuda a crear las matrices para respresentar
% las coordenadas X e Y, luego con ECT le damos valor a la coordenada Z
%
% ECT_matriz(i,j) corresponde al par (a1_vec(i), a3_vec(j))
% Es decir, que la matriz resultante A1 deberia mantener las componentes de una misma fila constantes
% mientras que la matriz A3 deberia mantener las componentes de una columna constantes

% por eso le enviamos a mesh grid los argumentos en este orden
% Para A1: se encarga de tomar el vector enviado y colocarlo como columna hasta obtener la matriz del tamaño necesario
% Para A2: se encarga de tomar el vector enviado y colocarlo como fila hasta obtener la matriz del tamaño esperado
[A3, A1] = meshgrid(a3_vec, a1_vec);

% Luego surf simplemente grafica
surf(A1, A3, ECT_matriz)
xlabel('alpha_1')
ylabel('alpha_3')
zlabel('ECT')

% se puede observar que en el centro de la superficie es el punto de menor error


%ITEM C

n_coefs =  10;  % cuantos coeficientes quiero
alphas = [];
funciones = [];
for n = 0:n_coefs-1

    P_normalizada = obtener_funcion_legendre(n,t);
    %aproximacion a la integral 
    dt = t(2) - t(1);
    ai = f * P_normalizada' *dt;


    funciones = [funciones ; P_normalizada];
    alphas = [alphas; ai];
    fprintf('alpha_%d = %.6f\n', n, alphas(n+1));
end
Error_cuadratico = norm(f' - funciones'*alphas)^2 * dt
figure(3)
hold on
plot(t',funciones'*alphas)
plot(t,f)

