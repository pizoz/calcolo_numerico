%% Esercizio 1

A_1 = [3 0 4; 7 4 2; 1 1 2];
b_1 = A_1*ones(3,1);

A_2 = [-3 3 -6; -4 7 -8; 5 7 -9];
b_2 = A_2*ones(3,1);

A_3 = [4 1 1; 2 -9 0; 0 8 6];
b_3 = A_3*ones(3,1);

A_4 = [7 6 9; 4 5 -4; -7 -3 8];

selected = A_1;

F = -triu(selected);
E = -tril(selected);
D = -(selected + F + E);
disp(selected)


%%
format short e;
A = diag(10*(20:-1:1))-diag(2*ones(17,1),-3)-diag(2*ones(17,1),3);
disp(A)
b= ones(20,1);
disp(det(A));

lamdas = eig(A);
disp(min(lamdas))

[L, U, P] = lu(A);
infnormL = norm(L, inf);
disp(infnormL)

y = L\(P*b);
x = U\y;

infnormY = norm(y,inf);
infnormX = norm(x, inf);
disp(infnormY);
disp(infnormX);

toll = 1e-06;
maxit = 100;
x_0 = zeros(20,1);
disp(x_0)

[x_t,nit] = jacobi(A,b,x_0,toll,maxit);

diff = x_t-x;
normDIFF = norm(diff,inf);
disp(normDIFF)

