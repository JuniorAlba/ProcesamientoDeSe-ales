x_coef_a = [1];
y_coef_a = [1 0 -1];
x_coef_b = [1 0.5];
y_coef_b = [1];
x_coef_c = [1];
y_coef_c = [1 -0.5 0.25];
[h,_] = respuesta_impulso(x_coef_a,y_coef_a,10);
h
[h,_] = respuesta_impulso(x_coef_b,y_coef_b,10);
h
[h,_] = respuesta_impulso(x_coef_c,y_coef_c,10);
h