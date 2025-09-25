clc; close all; clear;

% ingresar los valores
a=input('Valor para a=');
b=input('Valor para b=');
p=input('Valor del periodo=');
lambda=input('Valor de lambda=');

%Calcular la distancia de Talbot con la formula
m=input('Qué distancia Talbot se desea conocer=');
Z=(2*m*p^2)/lambda;
%Generar la rejilla cosenoidal
L=zeros(1000,1000);
[m,n]=size(L);
Mfiltro = zeros(m,n);
f=1/p;
    for x=1:m
        for y=1:n
        Mfiltro(x,y)= a+b*cos(2*f*y*pi);
        end
    end

%Calcular la matriz de Irradiancia en la distancia de Talbot
for x=1:m
    for y=1: n
        I(y,x)= a^2+ b^2*(cos(2*pi*x/p))^2 + 2*a*b*cos(2*pi*x/p)*cos(pi*
        lambda*Z*p^2);
    end
end

%Graficar la Rejilla, normalizando las imágenes.
gf=(Mfiltro);
max1 =max(gf);
max2=max(max1);
scale=1.0/max2;
gf=gf.*scale;
figure
colormap(gray(255));
image(200*gf);
title('Rejilla cosenoidal');
axis on

%Graficar la Irradiancia, normalizando las imágenes.
ET=(I);
max1=max(ET);
max2=max(max1);
scale=1.0/max2;
ET=ET.*scale;
figure
colormap(gray(255));
image(200*ET);
title('Efecto Talbot')
axis on