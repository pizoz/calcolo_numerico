%% Esercizio 1 - A
a = 1;
b= 1e50;

for c = 1:1000
    a = a/b;
    disp(a)
end
%% Esercizio 1 - B
a = 1;
b = 1e50;

for c = 1:1000
    a = a*b;
    disp(a)
end
%% Esercizio 2
x = 77777777;

y1 = sqrt(x^2 +1) -x;
y2 = 1/(sqrt(x^2 +1)+x);

disp(y1)
disp(y2)
%% Esercizio 3

nepero = exp(1);
for i = 1:7
    n = 10^(2*i);

    approx = (1+ 1/n)^n;
    disp(nepero)
    disp(approx)
end

%% Esercizio 4
A = [3 9 0 -7; 2 2 2 1; 0 2 1 3; 4 -3 0 9];
firstnorm = norm(A,1);
alternative = max(sum(abs(A)));

infnorm = norm(A, inf);
alternative2 = max(sum(abs(A')));

disp(firstnorm)
disp(alternative)
disp(infnorm)
disp(alternative2)
%% Esempio

A = diag(2*ones(7,1))-diag(ones(6,1),1)-diag(ones(6,1),-1);
disp(A)

%% Esercizio 5 - A
v = 1:0.3:2.2;

disp(diag(v,-2))

%% Esercizio 5 - B
A = diag(1:10)-diag(ones(9,1),1)-diag(ones(9,1),-1);

A = diag(1:10.^2);
A(:,1) = 1;
A(1,2:end) = 0.1;

%% Esercizio 6
A = hilb(4);
disp(A)
upper = triu(A);
disp(upper)
lower = tril(A);
disp(lower)

%% Esercizio 7
A= ones(10);
B=triu(tril(A,4),-2);
disp(B)

%% Esercizio 8
A = [-16 8 -7; 1 -5 -3; 1 10 14];
b = [-9 4 13]';
x = A\b;
disp(x)
x1 = inv(A)*b;
disp(x1)

%% Esercizi riepilogo 1
a = 1e-08;
for c= 1:4
    res = ((a+1)-1)/a;
    disp(res)
    a = a/100;
end
%% Esercizi riepilogo 2
A = diag(20*ones(10,1))+diag(1:9,1)+diag(1:9,-1)-diag(2*ones(7,1),-3)-diag(2*ones(7,1),3);

%% 3
A = diag(2*ones(10,1));
disp(A)

for i = 1:10
    for j = 1:10
        if (i ==j)
            continue
        end
        if (i>j)
            A(i,j) = -1;
        end
        if (i <j)
            A(i,j) = 1;
        end
    end
end
disp(A)

A = diag(2*ones(10,1));
O = ones(10,10);
A = A+triu(O,1)-tril(O,-1)+tril(O,-6)-triu(O,6);
disp(O)
disp(A)
%% 4

A = [-5 8 -7 1; 
     12 -5 -3 1; 
     1 10 14 1; 
     1 0 1 2];
disp(A)
b1 = [-43 21 -1 3]';
b2 = [-1 76 -26 3]';

x1 = A\b1;
x2 = A\b2;
disp(x1)
disp(x2)





