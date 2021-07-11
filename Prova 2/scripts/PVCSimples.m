clc
clear all

%Resolvendo um sistema linear da forma Av+B

% Equação dada por
% y''(x) + a*y(x)' b*y(x) = f(x)

% Domínio
L=5;

% Parâmetros
a=2.12; b=0.078; 

% Dados de Discretização
N=120; deltx=L/N; dx=deltx^2;

% Preparação da matriz e do vetor
n=N-1;
%Costrução da Matriz A
for i=1:n
  A(i,i) = 2 + b*dx;
end
for i=1:n-1
  A(i,i+1) = -1 + ((a*deltx)/2); %Diagonal Superior
  A(i+1,i) = -1 - ((a*deltx)/2); %Diagonal Inferior
end

%condições de contorno
yi=2;    yf=2;

%construção da matriz B
B = [];
time = deltx;
pos = 1;
while true
    B(end + 1) = -dx*f(time);
    if pos == n
        break
    end
    time = time + deltx
    pos = pos+1
end
B(1)= B(1) - (yi*(-1 - ((a*deltx)/2)));
B(5)= B(5) - (yf*(-1 + ((a*deltx)/2)));
B = B'

% Resolução do sistema
y = A\B;

%gráfico
x=[0:deltx:L];
varal=-[0 ; y; 0];
plot(x,varal,'r');
grid;
xlabel('t');
ylabel('y(t)');
title("Problema de Valor de Contorno");

function t = f(x)
    if x >= 0 && x < 1
        t = 0;
    end
    if x >= 1 && x <=3.5
        t = 2;
    end

    if x > 3.5 && x <= 5
        t = 0;
    end
end