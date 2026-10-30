%% Esercizio 1

a = 0.1;
b = 2;

f = @(x) exp(1).^x - x.^2 - sin(x) -1;

xplot = linspace(a-1,b+1,10000);
yplot = f(xplot);
hold on
plot(xplot,yplot,'k-')

toll = 1e-8;

[x, nit] = bisezione(f,a,b,toll);
disp(x)
plot (x,f(x),'o')
hold off;

%% Esercizio 2 a
clear;
clc;

a = -1;
b = 5;
toll = 1e-5;
f = @(x) exp(1).^(-x) -sin(x);

xplot = linspace(a,b,10000);
yplot = f(xplot);

hold on;
plot(xplot,yplot,'k-')

[alfa1,nit1] = bisezione(f,a,1,toll);
[alfa2,nit2] = bisezione(f,1,b,toll);

disp(alfa1)
disp(alfa2)
plot(alfa1,f(alfa1),'o');
plot(alfa2,f(alfa2),'o')
hold off;

%% Esercizio 2 b
clear;
clc;

a = -1;
b = 2;
toll = 1e-5;

f = @(x) (5.*x.^3 - 8.^2 + x +2).*sin(x);

xplot = linspace(a,b,10000);
yplot = f(xplot);
hold on;
plot(xplot,yplot,'k-')

[alfa1, nit1] = bisezione(f,a,b,toll);
y1 = f(alfa1);
plot(alfa1,y1,'o');

hold off

%% Esercizio 3
clear;
clc;

f = @(x) x.^2 -7;
f1 = @(x) 2.*x;

x_0 = 10;
toll = 10e-12;
nitmax = 200;

[x1,nit] = newton(f,f1,x_0,toll,nitmax);
disp(x1)

%% Esercizio 4 -a
clear;
clc;
a = -1;
b = 5;

toll = 1e-6;
nitmax = 100;

f = @(x) exp(1).^(-x) .* sin(x);
f1 = @(x) exp(1).^(-x).*cos(x) - exp(1).^(-x).*sin(x);

xplot = linspace(a,b,1000);
yplot = f(xplot);

[alfa1, nit1] = newton(f,f1,a,toll,nitmax);
y1 = f(alfa1);
[alfa2, nit2] = newton(f,f1,b,toll,nitmax);
y2 = f(alfa2);

hold on;
plot(xplot,yplot,'k-')
plot(alfa1,y1,'o',alfa2,y2,'o')


%% Esercizio 5
clear;
clc;

f = @(x) atan(x);

f1 = @(x) 1./(x.^2 +1);

a = -15;
b = 20;

x0 = 20;
toll = 1e-12;

xplot = linspace(-15,20,10000);
yplot = f(xplot);
hold on
plot(xplot,yplot,'k-')

[alfa, nit] = bisezione(f,a,b,toll);
[alfa1,nit2] = newton(f,f1,x0,toll,100);

disp(alfa1)
plot(alfa,f(alfa),'bo')
plot(alfa1,f(alfa1),'ro')

hold off

%% Esercizio 5 b
clear;
clc;

f = @(x) atan(x);

f1 = @(x) 1./(x.^2 +1);

a = -15;
b = 20;
toll = 0.001;

xplot = linspace(-15,20,10000);
yplot = f(xplot);
hold on
plot(xplot,yplot,'k-')

[alfa, ~] = bisezione(f,a,b,toll);

toll = 1e-12;

[alfa, ~] = newton(f,f1,alfa,toll,100);

plot(alfa,f(alfa),'o')

%% Esercizio 6 - a
clear;
clc;

f = @(t,y) -2.*t.*y.^2;
y0 = 1;

t0 = 0;
tmax = 2;

[T, U] = ode45(f, [t0 tmax],y0);

truef = @(t) 1./(1+t.^2);
xplot = linspace(t0,tmax,1000);
yplot = truef(xplot);

hold on;
plot(xplot,yplot,'k-');
plot(T,U,'ro')

truevalues = truef(T);
infnorm = norm(truevalues-U,inf);
disp(infnorm)


%% Esercizio 6 - b
clear;
clc;
f = @(t,y) -25*y;

t0 = 0;
tmax = 2;
y0 = 1;

[T, U] = ode45(f, [t0 tmax],y0);

truef = @(t) exp(-25*t);
xplot = linspace(t0,tmax,1000);
yplot = truef(xplot);

hold on;
plot(xplot,yplot,'k-');
plot(T,U,'ro')

truevalues = truef(T);
infnorm = norm(truevalues-U,inf);
disp(infnorm)

%% Esempio 1
clear;
clc;

F = @(t,y) [-2*y(2)+2*t; -y(1)+y(2)+1-t];
t0 = 0;
tmax = 3;
y0_1 = 2;
y0_2 = 1;

[T,Y]=ode45(F,[t0,tmax],[y0_1, y0_2]);

figure(1)
plot(T,2*exp(-T),'g',T,exp(-T)+T,'m')
title('soluzione esatta')
figure(2)
plot(T,Y(:,1),'r',T,Y(:,2),'b')
title('soluzione numerica')

%% Esercizi di riepilogo 1
clear;
clc;

% Si approssimi la radice α di f nell’intervallo [0, 5] utilizzando la function
% di Matlab fzero.
format long e;
f = @(x) x - (1./(sin(x)+2));

xplot = linspace(0,5,10000);
yplot = f(xplot);
hold on;
plot(xplot,yplot,'k-')

[x,y] = fzero(f,[0,5]);
disp(x)

%Si approssimi la radice α di f nell’intervallo [0, 5] utilizzando il metodo
% di bisezione con tolleranza 1e-8.

f = @(x) x - (1./(sin(x)+2));
toll = 1e-8;

[x1,~] = bisezione(f,0,5,toll);
disp(abs(x-x1))

% Si approssimi la radice α di f nell’intervallo [0, 5] utilizzando il metodo
% di Newton con tolleranza 1e-8 e numero massimo di iterazioni 200 a
% partire dal punto iniziale x0 = 2

f = @(x) x - (1./(sin(x)+2));
f1 =@(x) (cos(x))./(sin(x)+2).^2 +1;
toll = 1e-8;
nitmax = 200;
x0 = 2;

[x2,nit] = newton(f,f1,x0,toll,nitmax);
disp(x2)
disp(x)
disp(abs(x-x2))

%% Esercizio 2
clear;
clc;
format long;
f = @(x) 2*x.^2 - (1/(cos(x.^2)+3));
df = @(x) 4.*x - (2.*x.*sin(x.^2))/(cos(x.^2)+3).^2;
a = 0;
b = 5;

[x,y] = fzero(f,[0,5]);
disp(x)

toll = 1e-2;
[x0,nit] = bisezione(f,0,5,toll);

disp(x0);
disp(nit)

toll = 1e-6;
nitmax = 200;
[x1,nit] = newton(f,df,x0,toll,nitmax);

disp(x1)
disp(nit)

err = abs(x-x1);
disp(err)

%% Esercizio 3
clear;
clc;
format short e;

% Definizione del problema
f = @(t,y) (cos(2*pi*t) - 4*t.^2).*y;
t0 = 0;
tmax = 5;
y0 = 4;

[T, Y] = ode45(f, [t0, tmax], y0);

Ymax = max(Y);
disp('Ymax =');
disp(Ymax);

ftrue = @(t) 4 * exp((1/(2*pi))*sin(2*pi*t) - (4/3)*t.^3);
ytrue = ftrue(T);

err = norm(ytrue - Y) / norm(ytrue);
disp('err =');
disp(err);

I_t = trapz(T,Y);
I_e = integral(ftrue,t0,tmax);

err = abs(I_e-I_t)/abs(I_e);

disp(I_t)
disp(err)