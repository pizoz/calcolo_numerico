%% Esercizio 1
A = [-16 8 -7; 1 -5 -3; 1 10 14];
b = [-9 4 -13]';
format long;

x = A\b;
x1 = inv(A)*b;
disp(x)
disp(x1)

%% Esercizio 2
A = [1 1 1; 2 2 2; 3 3 3];
a = [1 1 1]';

orlA = [A a];
res1 = A\a;
disp(orlA)

disp(rank(A))
disp(rank(orlA))
disp(res1)

B = [1 2 3; 4 5 6; 7 8 9];
b = [1 2 3]';

orlB = [B b];
res2 = B\b;
disp(orlB)

disp(rank(B))
disp(rank(orlB))
disp(res2)

C = [1 2 3; 4 5 6; 7 8 9];
c = [5 2 3]';

orlC = [C c];
res3 = C\c;
disp(orlC)

disp(rank(C))
disp(rank(orlC))
disp(res3)

%% Esercizio 3

A = diag(7*ones(43,1))-diag(3*ones(40,1),-3);
A(1,2:end) = 0.1;

b = ones(43,1);
disp(b)

x = A\b;
disp(x)

%% Esercizio 4

A = [4 -2 1; -2 5 -2; 1 -2 6];

[L,U,P] = lu(A);

b = A*ones(3,1);

y = L\(b);

x = U\y;
disp(x)

%% Esercizio 5

A = [-5 8 -7; 12 -5 -3; 1 10 14];

[L,U,P] = lu(A);
b= A*ones(3,1);
disp(b)

y = L\(P*b);

x = U\y;
disp(x)

%% Esercizio 6
A = diag(4*ones(100,1)) - diag(2*ones(99,1),1)- diag(2*ones(99,1),-1);
I = eye(100);
partialsol = zeros(100,100);
tic;
for i = 1:100
    e_i = I(:,i);
    sol = A\e_i;
    partialsol(:,i) = sol;

end
toc;
A_inv_2 = zeros(100,100);
tic;
[L,U,P] = lu(A);
for i=1:100 
    e_i = I(:,i);
    y = L\(P*e_i);
    A_inv_2(:,i) = U\y;
end
toc
%% Esercizio 7
A= diag(4*ones(10,1))-diag(ones(9,1),-1)-diag(ones(9,1),1);
disp(A)
B = diag(3*ones(10,1))-diag(2*ones(9,1),-1)-diag(2*ones(9,1),1);
disp(B)
C= diag(2*ones(10,1));
C(1,2:end) = 0.1;
C(2:end,1) = 0.1;
disp(C)
D=diag(ones(7,1));
D(:,end) = 1;
D(end,:) = 2:8;
disp(D)

selected = D;

[L,U,P] =lu(selected);

disp(P)
figure(1);
spy(L);
figure(2)
spy(U)