% Método dos quadrados mínimos lineares
% exemplo prático usando exponencial 
% y = a*exp(b*x²)
% fi1=1   e   fi2=x²
clc
clear all
% Dados da CoViD-19 no Brasil: casos diários.média de 7 dias
% Fonte: view-source:https://www.worldometers.info/coronavirus/country/brazil/
%
% 49 últimos dias
dias=[1:66];
% Casos correspondentes
casos=[15812,14673,13855,10766,11519,14705,15233,14594,14453,13513,10927,11543,14505,14587,14435,14047,13289,10606,11515,14846,13705,14000,13595,11635,10484,9519,12844,12740,11950,12013,10946,8544,8934,11071,11301,11101,10439,9366,7765,7948,10297,10223,10197,9438,8659,6888,6798,9243,9508,8753,9057,8707,6780,6439,8931,9094,8655,8782,7635,6345,6307,7892,8784,8318,8545,7214];
% visualização

N=length(dias); a11=N;
a12=sum(dias.*dias); a21=a12; a22=sum(dias.^4);
Y=log(casos);
m=[a11 a12; a21 a22]; b=[sum(Y);sum((dias.*dias).*Y)];
c1=m\b;
x=0.25*[1:320];
% Transformar c1 em d1 em d1=exp(c1(2)) e d2=c1(2)
d1=exp(c1(1)); d2=c1(2);
for i=1:320
  y1(i)=d1*exp(d2*(x(i)*x(i)));
end

figure
p1 = plot(dias,casos,'ro'); hold on;
p2 = plot(x,y1,'b'); hold off;
h = [p1(1);p2(1)];
legend(h, 'Dados de dispersão','Aproximação');
grid;
xlabel('Dias');
ylabel('Número de Mortes');
title('Previsão do Numero de Mortes Coronavírus');
fprintf("O número de mortes previstas para o 80° dia é %i", y1(320));


