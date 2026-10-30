%% Esercizio 1 - A
u = [1 0 2 -3];
v = [3 0 2 1];

z = (u.*v)';
w = (u.^v)';
y = (z./w);

%% Esercizio 1 - A
x = linspace(1,2,11);

disp(x)
res1 = x.*log(x);
res2 = (x.^3).*cos(x);

disp(x)

%% Esercizio 2

x = [-3 5 8 0 1 5 -2 4];
x(6) = 100;
x(1:3) = [4 7 -1];
x(4) = [];
x = [[1 2 3] x];
disp(x)

%% Esercizio 3 - A
x = [1 2 3 4 5 6 7 8 9 10];

x = sin(x.^2);

massimo = max(x);
minimo = min(x);
disp(x)
disp(massimo);
disp(minimo);

%% Esercizio 3 - B
x = [1 2 3 4 5 6 7 8 9 10];

res1 = sum(x);
res2 = sum(x.^2);

disp(res1);
disp(res2);

%% Esercizio 3 - C

dispari = 1:2:20;
dispari = dispari.^(-1);
res1 = prod(dispari);

x = 1:1:100;
res = diff(x);
disp(x)
disp(res)
disp(sum(res));

%% Esercizio 4

u = [1 0 2 -3];
v = [3 0 2 1];

res1 = dot(u,v);
res2 = dot(v,u);

disp(res1)
disp(res2)

norm1 = norm(u,2);
norm2 = norm(v,2);

disp(norm1);
disp(norm2);

%% Esercizio 5

id = eye(5);
disp(id);

nulla = zeros(5,5);
disp(nulla);

A = ones(5,5);
disp(A)
H = hilb(5);

disp(H);

res = id+nulla+A+H;

disp(res)
%% Esercizio 5 - B

A = [2 1 0; 3 1 0; -2 1 1];
E = [1 -1 1; 2 -1 0; 3 2 1];
disp(E)

res1 = A*E;
res2 = E*A;

disp(res1);
disp(res2);

C = A.*E;

disp(C);

%% Esercizio 6

A = [1 2 3 4; -1 0 -1 0; 4 5 6 7; 5 4 3 2];
disp(A)

A(:,3) = 100;
A(2,:) = -3;
new = [1 2; 3 4];
A(3:4, 2:3) = new;

A(:,3) = [];
newrow = [3 1 5];
A = [A;newrow];
disp(A)

%% Esercizio 7

A = [2 1 0; 3 1 0; -2 1 1];
E = [1 -1 1; 2 -1 0; 3 2 1];
alpha = 0.2;
disp(det(A) == det(A'));
disp(det(alpha*A) == alpha^3*det(A'));
disp(det(A*E))
disp(det(A)*det(E))

%% Esercizi Finali - A

x = [-1 2 3 8 10 5 -4 3];
x([1,3,4]) = [5 6 7];
x = [x [10 11 12]];
x(4:7) = [];
disp(x)

%% Esercizi Finali - B
b1 = 0;
for c = 1:19
    a_n1 = 1/(c+1);
    a_n = 1/c;
    b1 = b1+ a_n1/a_n;
end
% Soluzione
n = 1:20;
a = 1./n;
B1 = sum(a(2:20) ./ a(1:19));
disp(B1)

B2 = sqrt(prod(a(2:20) +1));

disp(B2)

%% Esercizi Finali - C

A = [2 1; 3 1; -2 1];
E = [1 -1 1; 2 -1 0];

res1 = A*E;

disp(res1)

res2 = E*A;

disp(res2)

%% Esercizi Finali  - E
A = [4 3 2 1; -1 0 -1 0; 2 9 1 1; 5 4 3 -2];

A(2,:) = 10;
A(:, 4) = -1;

A(2:3, 3:4) = [1 2; 3 4];

A(1,:) = [];
A(:,end) = [];
A = [A [3 1 5]'];

disp(A)