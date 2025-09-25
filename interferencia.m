% Parámetros de la simulación
lambda = 633e-9;           % Longitud de onda (en metros)
k = 2*pi/lambda;           % Número de onda
theta1 = 0;                % Ángulo de incidencia de la primera onda
theta2 = pi;            % Ángulo de la segunda onda (más cercano para franjas más anchas)

% Malla espacial (más pequeña para acercar el patrón)
L = 5;                  % Tamaño del plano (1 mm)
N = 1000;                  % Resolución
x = linspace(-L, L, N);
y = linspace(-L, L, N);
[X, Y] = meshgrid(x, y);

% Definición de ondas
E1 = exp(1i * k * (X * cos(theta1) + Y * sin(theta1)));
E2 = exp(1i * k * (X * cos(theta2) + Y * sin(theta2)));

% Interferencia
I = abs(E1 + E2).^2;

% Visualización en blanco y negro
figure;
imagesc(x, y, I);
axis image;
colormap gray;            % Escala de grises
title('Simulador de Interferencia');
xlabel('x (m)');
ylabel('y (m)');