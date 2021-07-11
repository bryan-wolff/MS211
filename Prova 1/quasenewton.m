f1 = @ (x,y,z) 3*(x^2)*(y^2) -z + 2
g1 = @ (x,y,z) x - 2*(y^2) - 3*(z^2) + 12
h1 = @ (x,y,z) x + y - 0.5

a11 = @ (x,y,z) 6*x*(y^2)
a12 = @ (x,y,z) 3*(x^2)*y
a13 = @ (x,y,z) -1
a21 = @ (x,y,z) 1
a22 = @ (x,y,z) -4*y
a23 = @ (x,y,z) -6*z
a31 = @ (x,y,z) 1
a32 = @ (x,y,z) 1
a33 = @ (x,y,z) 0

f=@(x) [f1(x(1),x(2),x(3)); g1(x(1),x(2),x(3)); h1(x(1),x(2),x(3))];
J=@(x) [a11(x(1),x(2),x(3)) a12(x(1),x(2),x(3)) a13(x(1),x(2),x(3)); 
a21(x(1),x(2),x(3)) a22(x(1),x(2),x(3)) a23(x(1),x(2),x(3)); 
a31(x(1),x(2),x(3)) a32(x(1),x(2),x(3)) a33(x(1),x(2),x(3))];

x=[1; -1; 2];
B=J(x);
tol=1e-5;
E=1e-7;

dr=tol+1;
Fx=f(x);

cont=0;

while norm(Fx,inf)>E && dr>tol
    s=B\(-Fx);
    x=x+s;
    dr=norm(s,inf);
    Fx=f(x);
    B=B+(Fx.*s')/(s'*s);
    %
    cont=cont+1;
end

resultado=x

iteracoes=cont