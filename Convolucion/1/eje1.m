% Señales de prueba
x = [1 2 3];
h = [1 1 1];

% La salida esperada se puede calcular a mano fácilmente:
% y[0] = 1*1 = 1
% y[1] = 1*1 + 2*1 = 3
% y[2] = 1*1 + 2*1 + 3*1 = 6
% y[3] = 2*1 + 3*1 = 5
% y[4] = 3*1 = 3
% y = [1 3 6 5 3]
% y_conv   = conv(x, h)
y_manual = convolucion_lineal_v1(x, h)
y_manual = convolucion_lineal_v2(x, h)
