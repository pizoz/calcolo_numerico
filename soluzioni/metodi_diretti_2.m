A = [7 0 1 4; 0 5 10 1; 1 -3 1 0; 4 1 1 -9];
b1 = [3 1 1 0]';
b2 = [0 4 7 50]';

selected = b2;

[L, U, P] = lu(A);
y = L\(P*selected);
x =U\y;

disp(x)

%% Esercizio 2

A = [-5 8 -7 1; 12 -5 -3 1; 1 10 14 1; 1 0 1 2];
b1 = [-43 21 -1 3]';
b2 = [-1 76 -26 3]';

selected = b2;

[L, U, P] = lu(A);
y = L\(P*selected);
x =U\y;

disp(x)

%% Esercizio 3
I = eye(4,4);
disp(I)
inverse = zeros(4,4);
[L, U, P] = lu(A);
for i = 1:4
    e_i = I(:,i);
    y = L\(P*e_i);
    x = U\y;
    inverse(:,i) = x;
end

disp(inverse)
% Migliore è cosi

[L, U, P] = lu(A);
y = L\(P*eye(size(A)));
inverse = U\y;
disp(inverse)

%% Esercizio 4
A = diag(3*ones(10,1))-diag(ones(9,1),1)-diag(ones(9,1),-1)+hilb(10);
disp(A);

[L, U, P] = lu(A);
normL = norm(L,inf);
normU = norm(U,inf);
b = ones(10,1);

y = L\(P*b);
normY = norm(y,inf);
disp(y)
disp(normY)
x = U\y;
normX = norm(x,inf);
disp(x)
disp(normX)

%%
A = diag(5*ones(8,1))-diag(2*ones(7,1),1)-diag(2*ones(7,1),-1);
disp(A)
b = [ 1 2 3 4 5 6 7 26]';
R = chol(A);
normR = norm(R, inf);
disp(R)
disp(normR)
y = R'\b;
x = R\y;
normY = norm(y,2);
normX = norm(x,2);
disp(x)
disp(normY)
disp(normX)