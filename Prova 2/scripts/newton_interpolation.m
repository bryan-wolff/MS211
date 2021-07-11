% Script for Newton's Interpolation.
% Muhammad Rafiullah Arain
% Mathematics & Basic Sciences Department
% NED University of Engineering & Technology - Karachi
% Pakistan.
% ---------
% x and y are two Row Matrices and p is point of interpolation

clc;
clear all;

%Matrizes de linhas
x = [0.06813 0.17032 0.32361 0.55355 0.89845 1.41581 2.19184];
y = [121.9718 123.4432 125.6814 129.1098 134.4159 142.7555 156.1629];
p = 0.63;


%chamando a função de interpolação de newton para o ponto 0.63
pointInterpolation = newtonInterpolation(x,y,p);
fprintf("O ponto de inerpolação y(0.63) é dado por: %0.8f\n", pointInterpolation )

%calculando a estimativa de erro
x0=x(4);
x1=x(5);
x2=x(6);
erro = estimativaErro(x,y,p,x0,x1,x2);
fprintf("Estimativa para o erro de interpolação: %.8f\n", erro)

%função da estimativa do erro para ordem2
%x,y matriz de linhas
%p é o ponto de interpolação
%x0,x1,x2 pontos da matriz x próximos de p
function erro = estimativaErro(x,y,p,x0,x1,x2)
    ordem0 = y;
    ordem1 = [];
    ordem2 = [];
    ordem3 = [];

    i = 1;
    %calculando ordem 1
    while true
        ordem1(end+1)= (abs(ordem0(i)-ordem0(i+1)))/(abs(x(i)-x(i+1)));
        i = i + 1;
        if i == length(y);
            break
        end
    end

    %calculando ordem 2
    i=1;
    while true
        ordem2(end+1) = (abs(ordem1(i)-ordem1(i+1)))/(abs(x(i)-x(i+2)));
        i = i + 1;
        if i == length(ordem1);
            break
        end
    end
    %calculando ordem 3
    i=1;
    while true
        ordem3(end+1) = (abs(ordem2(i)-ordem2(i+1)))/(abs(x(i)-x(i+3)));
        i = i + 1;
        if i == length(ordem2);
            break
        end
    end
    erro = abs(max(ordem3)*(p-x0)*(p-x1)*(p-x2));
end


function fp = newtonInterpolation(x,y,p)
n = length(x);
a(1) = y(1);
for k = 1 : n - 1
   d(k, 1) = (y(k+1) - y(k))/(x(k+1) - x(k));
end
for j = 2 : n - 1
   for k = 1 : n - j
      d(k, j) = (d(k+1, j - 1) - d(k, j - 1))/(x(k+j) - x(k));
   end
end
d;
for j = 2 : n
   a(j) = d(1, j-1);
end
Df(1) = 1;
c(1) = a(1);
for j = 2 : n
   Df(j)=(p - x(j-1)) .* Df(j-1);
   c(j) = a(j) .* Df(j);
end
fp=sum(c);
end




