coef_izq = [1 -0.6];
coef_der = [1 0.2];
[h,n] = respuesta_impulso(coef_izq,coef_der,20)
plot(n,h)


L=10;
n = 0:1:L-1;
r = n.*(n>=0);
[conv_lineal]=convolucion_lineal_v2(r,h)

h_inv = h(end:-1:1);
matriz = h_inv.*r;
%me gustaria sumar los elementos de las diagonales inversas de esta matriz
%ya que dicha suma me da cada elemento de mi vector de convolucion

%ej
%[1 2 3
% 4 5 6
% 7 8 9]
%mi vector deberia tomar v[0] = 1; v[1] = 2 + 4; v[3] = 3 + 5 + 7
%a esa diagonal llamo diagonal inversa, seria lo mismo que tomar la diagonal de la matriz:
%[3 2 1
% 6 5 4
% 9 8 7]
%que solo espeja los elementos horizontales de cada fila con respecto a la diagonal
%esa transformacion se hace con una matriz:
%[0 0 1
% 0 1 0
% 1 0 0]
%para crear la matrzi:
espeja = zeros(L, L);
espeja(L : L-1 : L^2-L+1) = 1;
matriz_diag = matriz*espeja;
for()
conv_matricial = diag(matriz_diag,-9:1:9)