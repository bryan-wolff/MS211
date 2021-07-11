% Método de Newton não-Linear para
% o sistema dado por 
% 1ª equação f(x,y,z) = 3*(x^2)*(y^2) -z + 2
% 2ª equação g(x,y,z) = x – 2*(y^2) - 3*(z^2) + 12
% 3ª equação h(x,yz) = x + y – 0.5
clc
clear all
%
% Preparo do cálculo da função vetorial F = (f(x,y,z),g(x,y,z),h(x,y,z))
f = @ (x,y,z) 3*(x^2)*(y^2) -z + 2
g = @ (x,y,z) x - 2*(y^2) - 3*(z^2) + 12
h = @ (x,y,z) x + y - 0.5
%
% Preparo para construção do Jacobiano
a11 = @ (x,y,z) 6*x*(y^2)
a12 = @ (x,y,z) 3*(x^2)*y
a13 = @ (x,y,z) -1
a21 = @ (x,y,z) 1
a22 = @ (x,y,z) -4*y
a23 = @ (x,y,z) -6*z
a31 = @ (x,y,z) 1
a32 = @ (x,y,z) 1
a33 = @ (x,y,z) 0

% Aproximação inicial do vetor x0
x0 = [1 -1 2]';
% Nº máximo de iterações K, contador icont
% e tolerância tol
K=25;
tol = 1e-10; err=1;
icont = 1;
%
% Procedimento repetitivo/iterativo

%
while icont<K && err>tol
J=[a11(x0(1),x0(2),x0(3)) a12(x0(1),x0(2),x0(3)) a13(x0(1),x0(2),x0(3)); 
a21(x0(1),x0(2),x0(3)) a22(x0(1),x0(2),x0(3)) a23(x0(1),x0(2),x0(3)); 
a31(x0(1),x0(2),x0(3)) a32(x0(1),x0(2),x0(3)) a33(x0(1),x0(2),x0(3))];
F=[f(x0(1),x0(2),x0(3)); g(x0(1),x0(2),x0(3)); h(x0(1),x0(2),x0(3))];
delt = J\(-F);
err=norm(delt);
x0=x0.+delt;
icont=icont+1;
endwhile
display('resultado')
x0
display('nº de iterações')
icont
display('norma de F')
norm(F)

