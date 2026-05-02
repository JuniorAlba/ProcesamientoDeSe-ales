coef_izq = [1 -0.6];
coef_der = [1 0.2];
[h,n] = respuesta_impulso(coef_izq,coef_der,20)
plot(n,h)


L=10;
n = 0:1:L-1;
r = n.*(n>=0);
[conv_lineal_sumatoria]=convolucion_lineal_v2(r,h)


L_h = length(h);
L_x = length(r);
L_y = L_h + L_x - 1;
% y(L_y) = x*h = matriz(L_y,L_x)*(L_x)x
H = zeros(L_y, L_x);

for i = 1:L_h
    for j = 1:L_x
        %voy dandole valor a las diagonales
        H(i+j-1, j) = h(i);
    end
end
conv_lineal_matricial = H * r(:)


%L_y = L_h + L_x -1
%necesito agregarle a cada señal la cantidad de ceros necesaria para que tengan el mismo 
%tamaño que el resultado de hacer conv_lineal, agregando ceros evitamos al hacer periodica
%la señal h el elemento que da la vuelta contribuya a los demas resultados

%para la señal de entrada necesitamos agregar: L_y-L_x
%para la señal de salida necesitamos agregar: L_y-L_h
r = [r(:); zeros(L_y-L_x,1)];
h = [h(:); zeros(L_y-L_h,1)];

conv_circular_transformada = convolucion_circular(r,h)



#si todos los elementos de estas operaciones son muy cercanos a ceros entonces el resultado es equivalente.

#muy cercanos ya que puede afectar errores numericos de las operaciones
conv_lineal_sumatoria-conv_lineal_matricial
conv_lineal_sumatoria-conv_circular_transformada