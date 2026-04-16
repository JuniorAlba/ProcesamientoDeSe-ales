addpath('../Funciones');
N=20;
a = 0.5;
n = (0:1:N-1)'
delta_dirac = @(n) 1*(n==0);
x = delta_dirac(n) - a*delta_dirac(n-1)
hA = sin(8*n)
hB = a.^(n)

#graficas
figure(1)
plot(n,x)

figure(2)
plot(n,hA)

figure(3)
plot(n,hB)

#Sistema figura 2
[r1] = convolucion_lineal_v1(x,hA);
[r2] = convolucion_lineal_v1(r1,hB);
figure(4)
n = (0:1:length(r2)-1)';
plot(n,r2)

#Sistema invertido
[r1]= convolucion_lineal_v1(x,hB);
[r2] = convolucion_lineal_v1(r1,hA);
figure(5)
n = (0:1:length(r2)-1)';
plot(n,r2)


#Conclusion, se obtiene la misma señal con el sistema invertido