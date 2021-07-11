%% Gauss Seidel Method
%% Solution of x in Ax=b using Gauss Seidel Method
% * _*Initailize 'A' 'b' & intial guess 'x'*_
%%
%
n=251;
%
% Matriz
m=sparse(n);
for i=1:n
m(i,i) = 2.35;
endfor
for i=1:n-1
m(i,i+1) = -0.78;
m(i+1,i) = -0.41;
endfor
for i=1:n-25
m(i,i+25) = -0.51;
m(i+25,i) = -0.28;
endfor
%
% Termo independente
for i=1:2:n
b(i) = 1.5;
endfor
for i=2:2:n-1
b(i)=0.75;
endfor
b=b';

%x = m\b'

A = m;
C = b;% constants vector
n = length(C);
X = zeros(n,1);
Error_eval = ones(n,1);
%% Check if the matrix A is diagonally dominant
for i = 1:n
    j = 1:n;
    j(i) = [];
    B = abs(A(i,j));
    Check(i) = abs(A(i,i)) - sum(B); % Is the diagonal value greater than the remaining row values combined?
    if Check(i) < 0
        fprintf('The matrix is not strictly diagonally dominant at row %2i\n\n',i)
    end
end
%% Start the Iterative method
iteration = 0;
while max(Error_eval) > 0.001
    iteration = iteration + 1;
    Z = X;  % save current values to calculate error later
    for i = 1:n
        j = 1:n; % define an array of the coefficients' elements
        j(i) = [];  % eliminate the unknow's coefficient from the remaining coefficients
        Xtemp = X;  % copy the unknows to a new variable
        Xtemp(i) = [];  % eliminate the unknown under question from the set of values
        X(i) = (C(i) - sum(A(i,j) * Xtemp)) / A(i,i);
    end
    Xsolution(:,iteration) = X;
    Error_eval = sqrt((X - Z).^2);
end
%% Display Results
GaussSeidelTable = [1:iteration;Xsolution]'
MaTrIx = [A X C]

display(x)
