clc; close all; clear;

%EDO
f=@(t,y) 0.025*y*(1-(y/(2000+(exp(-t/12)))));

%intervalos e condições iniciais
t0=0; tf=75;
y0=121;

% para construção do gráfico
h=0.01;
t=t0:h:tf;
%

sol=ode45(f,[t0 tf],y0);
y=deval(sol,t);

plot(t,y,'b-','LineWidth',2)
title('Solução com ODE45 para o intervalo [0,75]')
grid;
xlabel('t');
ylabel('p(t)');
xlim([0 75]);