addpath('../../TP1 Introduccion/Funciones creadas');

tini = 0;
tfin = 1;
fm   = 1000;   % frecuencia de muestreo alta para mejor aproximacion
fs_fija = 5;
fase_fija = 0;
A_fija = 1;
[y2, ~] = senoidal(fs_fija, fm, fase_fija, tini, tfin);   % señal de referencia fija
y2 = A_fija.*y2;

fprintf('Señal 2 fija: \n   A=%.1f \n   f=%.1f \n   phi=%.3f\n\n',A_fija,fs_fija,fase_fija);


% Al duplicar A, el producto interno se duplica (250->500->1000->2000).
% Esto confirma la linealidad del producto interno: <A*x1, x2> = A * <x1, x2>
% El valor que refleja un mayor parecido entre las señales es 500
fprintf('=== EFECTO DE LA AMPLITUD (A) ===\n');
fprintf('Señal 2 fija: A=%.1f, f=%.1f, phi=%.3f\n',A_fija,fs_fija,fase_fija);
amplitudes = [0.5, 1, 2, 4];
for i = 1:length(amplitudes)
    A = amplitudes(i);
    [y1, ~] = senoidal(fs_fija, fm, fase_fija, tini, tfin);
    y1 = A * y1;   % escalar amplitud
    pi_val = dot(y1, y2);
    fprintf('  A=%.1f -> producto interno = %.4f\n', A, pi_val);
end



% Cuando f1 == f2 (ambas en 5 Hz) el producto interno es maximo (500).
% Cuando f1 != f2 el resultado es ~0: las senoidales de distinta frecuencia
% son ortogonales entre si en un periodo completo, es decir no se "parecen".
fprintf('\n=== EFECTO DE LA FRECUENCIA (f) ===\n');
fprintf('Señal 2 fija: A=%.1f, f=%.1f, phi=%.3f\n',A_fija,fs_fija,fase_fija);

frecuencias = [1, 3, 5, 7, 10];
for i = 1:length(frecuencias)
    f1 = frecuencias(i);
    [y1, ~] = senoidal(f1, fm, fase_fija, tini, tfin);
    y1 = A_fija.*y1;
    pi_val = dot(y1, y2);
    fprintf('  f1=%2d Hz -> producto interno = %.4f\n', f1, pi_val);
end



% El producto interno varia como cos(phi): maximo en phi=0 (señales identicas),
% cero en phi=pi/2 (señales ortogonales) y minimo en phi=pi (señales opuestas).
% Esto muestra que el producto interno mide el "alineamiento" entre señales.
fprintf('\n=== EFECTO DE LA FASE (phi) ===\n');
fases = [0, pi/4, pi/2, 3*pi/4, pi];
nombres_fases = {'0', 'pi/4', 'pi/2', '3pi/4', 'pi'};
for i = 1:length(fases)
    [y1, ~] = senoidal(fs_fija, fm, fases(i), tini, tfin);
    y1 = A_fija.*y1;
    pi_val = dot(y1, y2);
    fprintf('  phi=%-6s -> producto interno = %.4f\n', nombres_fases{i}, pi_val);
end



% El producto interno mide el grado de similitud entre dos señales, pero al variar
% la amplitud el resultado cambia (250->500->1000->2000) aunque la forma sea identica.
% Esto se debe a que el producto interno depende tanto del angulo entre las señales
% (similitud de forma) como de sus normas (amplitudes).
% En el caso de frecuencia y fase el resultado si refleja correctamente el parecido,
% ya que ambas señales tienen la misma amplitud y solo varia el angulo entre ellas.
% Para medir similitud pura independientemente de la amplitud se deberia normalizar
% por las normas (similitud coseno).


%dado que medir de esta forma podria dar como resultado que dos señales  son muy similares
%cuando es el caso de que simplemente tienen mucha energia

% Conclusion: el producto interno es una buena medida de similitud entre dos señales
% siempre que se tenga en cuenta la norma/energia de las mismas.