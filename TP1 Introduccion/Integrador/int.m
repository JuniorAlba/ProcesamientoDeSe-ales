addpath('../Funciones creadas');
%PARTE 1

%   item1
[x,t] = senoidal(10,400,pi/4,0,1);
x = 5*x;
figure(1);
stem(t,x);
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

[x_opr,t_opr] = rectificacion(t,x);

[x_opr,t_opr] = cuantizacion(t_opr,x_opr,16);
figure(2);
stem(t_opr,x_opr);


%PARTE 2

%   item1
varianza = 2;
r1 = sqrt(varianza)*randn(1,length(x_opr));

varianza = 3;
r2 = sqrt(varianza)*randn(1,length(x_opr));

%   item2
figure(3)
x_opr_r1 = x_opr+r1;
stem(t_opr,x_opr_r1);
figure(4)
x_opr_r2 = x_opr+r2;
stem(t_opr,x_opr_r2);

%   item3
pot_x = potencia_sen(x_opr);
pot_r1 = potencia_sen(r1);
pot_r2 = potencia_sen(r2);
SNR_r1 = 10*log10(pot_x/pot_r1)
SNR_r2 = 10*log10(pot_x/pot_r2)

%   item4
k1 = 10^(-6/20)*sqrt(pot_x/pot_r1);
k2 = 10^(-6/20)*sqrt(pot_x/pot_r2);
pot_r1k = k1^2*pot_r1;
pot_r2k = k2^2*pot_r2;
SNR_r1k = 10*log10(pot_x/pot_r1k)
SNR_r2k = 10*log10(pot_x/pot_r2k)


%A mayor varianza mas grande es el desvio de los valores con respecto a la media
%esto se puede ver en el resultado de las relaciones S-R para r1 y r2, en r2 la relacion
%es mas baja, lo que quiere decir que la potencia del ruido es mayor.


%PARTE3

%   item1
%Si se reduce el numero de bits en la cuantizacion entonces los valores de amplitud presentarian
%saltos mas grandes, lo que impide representar correctamente la forma de la funcion 

%   item2
%Si la frecuencia de muestreo se redujera a 15hz, nuestra señal muestreada no podria representar correctamente la
%señal original, ya que es necesario que fm>=2*fs, comenzaria a ocurrir el fenomeno de aliasing, en el cual observamos
%una señal de menor frecuencia debido a una mala eleccion para la frecuencia de muestreo.
%Ademas si la frecuencia de muestreo se redujera a 15hz, entonces en un periodo habria niveles de la cuantizacion
%que no serian utilizados

%   item3
%Multiplicaria el ruido por una constante k que respete la siguiente restriccion k = sqrt(Ps/Pr)
%donde Ps es la potencia de la señal sin ruido y Pr es la potencia del ruido original, sin escalar