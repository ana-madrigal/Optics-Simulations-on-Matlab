clc; close all; clear;

% Parámetros de la rejilla cosenoidal
m = 512; % número de filas
n = 512; % número de columnas
P = input('Periodo P = '); % periodo espacial
f = 1/P; % frecuencia espacial
a = input('Valor de a (nivel DC) = ');
b = input('Valor de b (amplitud del coseno) = ');

% Generar la rejilla cosenoidal
I = zeros(m,n);
for x = 1:m
    for y = 1:n
        I(x,y) = a + b*cos(2*pi*f*y); % rejilla cosenoidal horizontal
    end
end

% Mostrar la rejilla cosenoidal
figure
colormap(gray(255));
imagesc(I);
title('Rejilla cosenoidal');
axis image; axis off;

% Transformada de Fourier
FI = fft2(I);
FI = fftshift(FI);
FI_mag = abs(FI);

% Normalizar para visualización
FI_mag = FI_mag / max(FI_mag(:));

% Mostrar la transformada de Fourier
figure
colormap(gray(255));
imagesc(FI_mag);
title('Transformada de Fourier de la rejilla cosenoidal');
axis image; axis off;