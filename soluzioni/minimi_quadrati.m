%% Esercizio 1

x = 0:10;
y = [0 1.25 2.27 3.04 3.77 4.71 5.91 7.19 8.29 9.12 9.83];
reg = polyfit(x,y,1);
disp(reg)
xplot = linspace(-1,11,1000);
yplot = polyval(reg,xplot);
plot(xplot,yplot,"k-",x,y,'o')

%% Esercizio 2
x = [-5 -2 0.5 1 1.5 3 6];
y = [1.5 2 -1 2.5 1 -2 3];
reg = polyfit(x,y,1);
disp(reg)
xplot = linspace(-6,7,1000);
yplot = polyval(reg,xplot);

plot(xplot,yplot,'k-',x,y,'o')
x_dash = sum(x)/7;
y_dash = sum(y)/7;
disp(x_dash)
disp(y_dash)
y_real = polyval(reg,x_dash);
disp(y_real)
same = y_dash - polyval(reg,x_dash);
disp(same)

%% Esercizio 3

x = linspace(0,1,10);
f = @(t) 2*exp(1).^(-2.*t) - t;
y = f(x);

reg = polyfit(x,y,1);
a = ones(10,1);
M = [x' a];
A = M' * M;
b = M' * y';
res = A\b;
disp(reg);
disp(res);

%% Esercizio 4
f = @(x) 5* cos(pi .* x.^2) - exp(x);
x = linspace(0,1,5);
y = f(x);

res = polyfit(x,y,1);
x_dash = mean(x);
y_dash = polyval(res,x_dash);
disp(y_dash);

p = polyfit(x,y,length(x)-1);
disp(p)

r = roots(p);
disp(r)
r = r(r>= 0 & r<= 1);
disp(r)

%% Esercizio 5
clear;
clc;

x = [-3 -2 0 2 4];
y = [3 2 0.5 1 3];
m = [0 1 2 3 4];
xplot = linspace(-4, 5, 1000);
hold on;
plot(x,y,'o', 'HandleVisibility', 'off');
for val = m
    r = polyfit(x,y,val);
    yplot = polyval(r,xplot);
    plot(xplot,yplot,'DisplayName',[' Grado ' num2str(val)])
end
legend('show', 'Location', 'best')
hold off;

%% Esercizio 6
clc;
clear;
x= -55:10:55;
y=[3.22 3.3 3.32 3.17 3.07 3.02 3.02 3.12 3.2 3.35 3.37 3.25];

m = [1 2 4 11];
xplot = linspace(-56,56,10000);

hold on;
plot(x,y,'o', 'HandleVisibility', 'off');
for val = m
    r = polyfit(x,y,val);
    yplot = polyval(r,xplot);
    plot(xplot,yplot,'DisplayName',[' Grado ' num2str(val)])
end
legend('show', 'Location', 'best')
hold off;

%% Esercizio 7

x = 1:1:5;
y = [4.9 8 12.3 23.1 36.5];

Y = log(y);
p = polyfit(x,Y,1);
A = p(1);
q = p(2);
C = exp(q);

y_approx = @(x) C*exp(A * x);
xplot = linspace(0,6,1000);
yplot = y_approx(xplot);

figure;
hold on; grid on;
plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Dati originari (x, y)');
plot(xplot, yplot, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Approssimazione y = Ce^{Ax}');
legend('Location', 'best');
xlabel('x');
ylabel('y');
title('Approssimazione ai minimi quadrati con funzione esponenziale');
hold off;

x_val = 2.5;
y_val = y_approx(x_val);

fprintf('Il valore della funzione approssimante in x = 2.5 è: %f\n', y_val);


%% Esercizio 8
x = 1:1:5;
y = [0.6 1.9 4.3 7.6 12.6];

X = log(x);
Y = log(y);

p = polyfit(X,Y,1);
A = p(1);
C = exp(p(2));

y_approx = @(x) C * x.^A;
xplot = linspace(0,6,1000);
yplot = y_approx(xplot);

figure;
hold on; grid on;
plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Dati originari (x, y)');
plot(xplot, yplot, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Approssimazione y = Ce^{Ax}');
legend('Location', 'best');
xlabel('x');
ylabel('y');
title('Approssimazione ai minimi quadrati con funzione esponenziale');
hold off;

x_val = 2.5;
y_val = y_approx(x_val);

fprintf('Il valore della funzione approssimante in x = 2.5 è: %f\n', y_val);

%% Esercizi di riepologo 1

q = [1 3 5 9 12 15];
z = [10.7 30.9 41.8 80.9 100.5 129.5];
plot(q,z,'o');

r = polyfit(q,z,1);
disp(r)

%% Esercizio 2
% Dati
T = 0:10:70;
C = [96.4 46.3 21.2 17.89 10.1 6.9 3.5 1.9];
z = 0:0.2:70;
% Retta
retta = polyfit(T,C,1);
yplot = polyval(retta,z);

% Polinomio grado 7
p7 = polyfit(T,C,7);
p7y = polyval(p7,z);

% Spline
s1 = griddedInterpolant(T,C,'linear');
yspline = s1(z);

% Plot
hold on;
plot(T,C,'o')
plot(z,yplot,'k-')
plot(z,p7y,'b-')
plot(z,yspline,'r-')
hold off
disp(polyval(retta,62));
disp(polyval(p7,62));
disp(s1(62))

realY = polyval(retta,T);

scarto_quadratico = sum(abs(realY - C).^2);
disp(scarto_quadratico)

%% Esercizio 3
clear;
clc;

f = @(t) (2/3)*log(2/3 .* t);
a = 3*exp(1)/2;
b = 3*exp(1)/2 +1;
x = linspace(a,b,10);
y = f(x);
r = polyfit(x,y,1);
y_dash = polyval(r,mean(x));

M = [x' ones(length(x),1)];

A = M' * M;
b = M' * y';
z = A\b;
disp(r)
disp(z)

%% Esercizio 4

x = 1:0.15:2.5;
y = [0.1 0.15 0.2 0.3 0.5 0.65 0.78 1 1.2 1.35 1.45];

% Parabola
parab = polyfit(x,y,2);

% Esponenziale

lnx = log(x);
lny = log(y);

p = polyfit(lnx,lny,1);
A = p(1);
C = exp(p(2));

y_approx = @(x) C.* x .^A;
disp(A)
disp(C)

disp(polyval(parab,1.75))
disp(y_approx(1.75))

%% Esercizio 5

x = 1:5;
y = [0.35 0.25 0.2 0.15 0.12];

Y = 1./y;
r = polyfit(x,Y,1);

A = r(1);
B = r(2);
f = @(x) 1/(A.*x + B);

f(1.5)

%% Esercizio 6
clear;
clc;

x = 1:5;
y = [0.25 0.31 0.35 0.4 0.41];

X = 1./x;
Y = 1./y;
p = polyfit(X,Y,1);

A = p(1);
B = p(2);
f = @(x) x ./ (A +( B.*x));
disp(A)
disp(B)
disp(f(4.5))