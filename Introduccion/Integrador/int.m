addpath('../Funciones creadas');
%PARTE 1

%   item1
[x,t] = senoidal(10,400,pi/4,0,1);
x = 5*x;
figure(1)
stem(t,x)
%   item2
%Clasificacion morfologica:
%tiempo
%la señal es de tiempo discreto, al seleccionar la frecuencia de muestreo estamos
%estamos muestreando el tiempo en unos instantes especificos, por lo que no puede tomar
%cualquier valor de los reales

%amplitud
%A la amplitud no le realizamos ningun tipo de muestreo/cuantizacion
%sus valores estan dados por los de la senoidal, es decir, puede tomar como valor
%cualquier real perteneciente al [-5,5]

%   item3

[x_rec,t_rec] = rectificacion(t,x);

[x_rec_cuant,t_rec_cuant] = cuantizacion(t_rec,x_rec,16);
figure(2)
stem(t_rec_cuant,x_rec_cuant)