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

H = zeros(L_y, L_x);

for i = 1:L_h
    for j = 1:L_x
        %voy dandole valor a las diagonales
        H(i+j-1, j) = h(i);
    end
end
conv_lineal_matricial = H * r(:)