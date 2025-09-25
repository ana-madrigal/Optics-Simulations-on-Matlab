
clc; close all; clear; %limpiar siempre antes de iniciar
I=imread('blank.jpg','jpg');%llamamos la imagen y le damos un valor.

I=I(:,:,1);
%imagen de entrada
figure
colormap(gray(255));
image(1*I)
title('Objeto')
axis on
%llamamos la transformada de fourier
FI=fft2(I); %Transformada rápida de Fourier en 2-D
FI=fftshift(FI);%Desplace el componente de frecuencia cero al centro del espectro
max1=max(FI);
max2=max(max1);
scale=1.0/max2;
FI=FI.*scale;
%grafica la transformada de fourier
figure
colormap(gray(255));
image(200*(abs(30*FI)));%cambiar para la tonalidad y claridad
title('Transformada de Fourier')
axis on
[m,n]=size(I);
Mfiltro = zeros(m,n);
y0=input('coordenada x=');
x0=input('coordenada y=');
a=input('valor a =');
b=input('valor b =');
fprintf('Caso 1: Filtro pasa bajas. \n')
fprintf('Caso 2: Filtro pasa altas. \n')
fprintf('Caso 3: Rendija. \n')
fprintf('Caso 4: Rejilla binaria. \n')
fprintf('Caso 5: Rejilla cosenoidal. \n')
G = input('Elija el caso:');

switch G
case 1 %pasa bajas
    for x=1 :m
        for y=1:n
            if ((x-x0)^2/a^2)+((y-y0)^2/b^2)<=1
                Mfiltro(x,y)=1;
            end
        end
    end
 
case 2 %pasa altas
for x=1 :m
    for y=1:n
        if (((x-x0)^2/a^2)+((y-y0)^2/b^2))>1
            Mfiltro(x,y)=1;
        end
    end
end
% case 3%rendija vertical
case 3
for x = 1:m
    for y = 1:n
        if abs(y - y0) <= a/2
            Mfiltro(x, y) = 1;
        end
    end
end

case 4%rejilla binaria
for x=1:m
    for k=1 :n
        for y=1 :n
            if y== k*a
                Mfiltro(x,y)=1;
            end
        end
    end
end

case 5%rejilla cosenoidal
P=input('valor del periodo P = \n');
f = 1/P;
for x=1:m
    for y=1:n
        Mfiltro(x,y)= a+(b*cos(2*f*y*pi));
    end
end

end %end of switch

%grafica de los filtros
gf=(Mfiltro);
max1 =max(gf);
max2=max(max1);
scale=1.0/max2;
gf=gf.*scale;

figure
colormap(gray(255));
image(200*gf);
title('Filtro aplicado');
axis on
IFiltrada = FI.*Mfiltro;
figure
colormap(gray(255));
image(50*(abs(256*IFiltrada)));
title('Imagen filtrada')
axis on
ITF=fft2(IFiltrada);
max2=max(max(ITF));
scale=1.0/max2;
ITF=ITF.*scale;
figure
colormap(gray(255));
image(5*(abs(256*ITF)));
title('Transformada inversa de Fourier')
axis off