addpath('../Funciones creadas');

ruido = 1*randn(100,1)';
[sen,t] = senoidal(1,100,0,0,1);
sen = 6*sen; %amplificamos

sen_ruido = sen + ruido;
plot(t,sen_ruido);
pot_sen = potencia_sen(sen)
pot_ruido = potencia_sen(ruido)

Rel_sen_ruido = 10*log10(pot_sen/pot_ruido)

ruido_amplificado = 2*ruido;  % k=2 arbitrario para observar el cambio en SNR
pot_ruido_amp = potencia_sen(ruido_amplificado)
Rel_sen_ruidoamp = 10*log10(pot_sen/pot_ruido_amp)



%PARTE 2
k = sqrt(pot_sen/pot_ruido);
ruido_amplificado2 = k*ruido;
pot_ruido_amp2 = potencia_sen(ruido_amplificado2);
Rel_sen_ruidoamp2 = 10*log10(pot_sen/pot_ruido_amp2)