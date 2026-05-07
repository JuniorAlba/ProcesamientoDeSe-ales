%Genere una señal compuesta x[n] de N =500 muestras que sea la suma de dos
%componentes: una señal senoidal de frecuencia 100Hz y una señal de ruido aleatorio
%con distribución normal (media 0 y varianza 0.5). Considere una frecuencia de muestreo
%de 1000Hz.

addpath('../../TP1 Introduccion/Funciones creadas');

fm= 1000;
fs = 100;
tini = 0;
tfin = (500)/fm;
fase = 0;
[x1,t1] = senoidal(fs,fm,fase,tini,tfin);

%ruido
x2 = sqrt(0.5)*randn(1,length(x1));

x_comp = x1 + x2;

%Grafique la señal y calcule la norma-2 y, a partir de ella, determine la energía y el valor
%RMS de la señal.

plot(t1,x_comp);
norma2 = norm(x_comp,2);
energia = norma2^2;
potencia_media = energia/length(x_comp);
rms = sqrt(potencia_media);


% Calcule la acción y la amplitud de la señal generada.
accion = norm(x_comp,1);
amplitud = max(abs(x_comp));




%ITEM B

%Cree una "señal de referencia" y[n] que sea una senoidal pura de 100Hz de la misma
%longitud que x[n]. Calcule el producto interno ⟨ x , y ⟩ entre la señal ruidosa y la
%referencia.

y = x1; %señal de referencia
producto_interno = x_comp*y'


%Obtenga el ángulo entre ambas señales. Explique, basándose en el resultado, si las
%señales son parecidas o no
angulo = acos(producto_interno/(norm(x_comp)*norm(y)))
norm(x_comp)*norm(y)*cos(angulo) %esto es igual al producto interno, por lo tanto el resultado es correcto

angulo * 180/pi %angulo en grados


% JUSTIFICACIÓN DEL ÁNGULO ENTRE x Y y
%
% La señal compuesta es x = x1 + x2, donde x1 es la senoidal y x2 el ruido.
% La referencia es y = x1.
%
% El ángulo entre x e y se define como:
%
%   cos(θ) = <x, y> / (‖x‖ · ‖y‖)
%
% PRODUCTO INTERNO:
%   <x, y> = <x1 + x2, y> = <x1, y> + <x2, y>
%
%   Como el ruido es aleatorio con media 0, es aproximadamente ortogonal
%   a cualquier señal determinista, por lo que <x2, y> ≈ 0. Entonces:
%
%   <x, y> ≈ <x1, y> = <x1, x1> = ‖x1‖²
%
% NORMAS:
%   ‖y‖ = ‖x1‖
%
%   Como x1 y x2 son aproximadamente ortogonales:
%   ‖x‖² = ‖x1 + x2‖² ≈ ‖x1‖² + ‖x2‖²
%
% Sustituyendo:
%
%   cos(θ) ≈ ‖x1‖² / (√(‖x1‖² + ‖x2‖²) · ‖x1‖)
%           = ‖x1‖ / √(‖x1‖² + ‖x2‖²)
%           = 1 / √(1 + (‖x2‖/‖x1‖)²)
%
% El ángulo θ depende entonces de la relación entre las energías de la
% senoidal y el ruido. Si ‖x2‖ << ‖x1‖, cos(θ) → 1 y θ → 0° (señales
% muy parecidas). Si ‖x2‖ >> ‖x1‖, θ → 90° (señales casi ortogonales).
%
% En este caso particular, los parámetros del problema hacen que ‖x2‖ ≈ ‖x1‖,
% lo que da cos(θ) ≈ 1/√2, es decir θ ≈ 45°.


%ITEM C

%Suponga que desea aproximar su señal ruidosa x[n] utilizando una base simplificada de solo
%dos vectores ortonormales: ϕ1 (senoidal de 100 Hz) y ϕ2 (senoidal de 200 Hz).


base1 = x1/norm(x1); %ϕ1
base2 = (senoidal(200,fm,0,tini,tfin)(1,:));
base2 = base2/norm(base2); %ϕ2

%Obtenga los coeficientes de proyección α1 y α2.
alpha1 = x_comp*base1';
alpha2 = x_comp*base2';
%Construya la señal aproximada ~x.
x_aprox = alpha1*base1 + alpha2*base2;
%Calcule el Error Cuadrático Total entre la señal original y su aproximación (utilizando
%la norma-2)
error_cuadratico = norm(x_comp - x_aprox, 2)^2


%Si se cambiara la fase de la señal de referencia y[n] a 90° ( π/2 )
%¿cómo afectaría esto al valor del producto interno? Justifique su respuesta.

% Cambiar la fase de la señal de referencia a 90° (π/2) haría que la senoidal de referencia
% se convirtiera en una cosenoidal en lugar de una senoidal. Dado que el producto interno
% entre una senoidal y una cosenoidal de la misma frecuencia es cero (son ortogonales), el
% producto interno entre la señal ruidosa x[n] y la nueva referencia y[n] con fase de 90° sería aproximadamente cero
% lo que indicaría que las señales no son parecidas.
