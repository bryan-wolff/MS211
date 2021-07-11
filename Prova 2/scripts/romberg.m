clc
clear all

format long

% Função para ser integrada
f=@(t) (abs(sin(t)*cos(t))^(3/2));

%intervalo de integração [a,b]
a=0; b=pi/2;

% aumentar n para aumentar a precisão.
% dívide o intervalo [a,b] em 2^n
n=10; 
h=b-a;

R=zeros(n,n);
R(1,1)=(f(a)+f(b))*h/2;

for k=2:n
   for i=1:2^(k-2)
       R(k,1)=R(k,1)+f(a+(2*i-1)*h/(2^(k-1)));
   end
   R(k,1)=R(k-1,1)*0.5 + R(k,1)*h/(2^(k-1));
end

for k=2:n
   for j=2:k
       R(k,j)=R(k,j-1)+(R(k,j-1)-R(k-1,j-1))/(4^(j-1) -1);
   end
end

IntRomberg = R(n,n);
fprintf("O valor da integral no intervalo [a,b] é dado por: %.8f", IntRomberg);


