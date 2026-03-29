addpath('../Funciones creadas');
fm = 10;
fs = 1;
tini=0;
tfin=1;
fase = 0;
[x_viej,t_viej] = senoidal(fs,fm,fase,tini,tfin);
figure(1)
stem(t_viej,x_viej);

int_orden0 = @(t) 1*(t>=0 & t<1);

[x,t] = sobremuestreo_avanzado(x_viej,t_viej,fm*4,int_orden0);
figure(2)
stem(t,x);


int_orden1 = @(t) (1-abs(t)).*(abs(t)<1);
[x,t] = sobremuestreo_avanzado(x_viej,t_viej,fm*4,int_orden1);
figure(3)
stem(t,x)


%sinc con fs = 0.5
%agregando al denominado la condicion t==0 permite evitar la division por cero, luego el termino para ese caso es igual a 0
%por lo que no afecta al valor del interpolador
int_sinc = @(t) (sin(pi*t)./((t*pi)+(t==0))) + 1.*(t==0);

[x,t] = sobremuestreo_avanzado(x_viej,t_viej,fm*4,int_sinc);
figure(4)
stem(t,x)