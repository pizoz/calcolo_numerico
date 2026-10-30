%% Esercizio 1
a = -2;
b = 5;
p = [3 -2 5 -1];


pm = (b-a) * polyval(p,(a+b)/2);
tp = ((b-a)/2) * (polyval(p,a) + polyval(p,b));
cs = ((b-a)/6) * (polyval(p,a) + polyval(p,b)+4*polyval(p,(a+b)/2));

primitiva = polyint(p);
integrale = polyval(primitiva,5) - polyval(primitiva,-2);
disp(integrale)
fprintf("Punto Medio %8.4f\n",pm);
fprintf("Trapezi %8.4f\n",tp);
fprintf("Cavalieri - Simpson %8.4f\n",cs)
fprintf("Integrale %8.4f \n", integrale)

%% Esercizio 2
clear;
clc;
a = -10;
b = 10;

f = @(x) cos(x).*exp(1).^(sin(x));
m = [20 200 2000 20000];

for val = m
    x = linspace(a,b,val);
    y = f(x);
    fprintf("H è: %1.4f \n",(b-a)/val);
    q = trapz(x,y);
    integrale = integral(f,a,b);
    fprintf("Errore è: %8.12f \n",integrale-q);
end

%% Esercizio 3
clear;
clc;

tic;
toll = realmax("double");
a = -10;
b = 10;
f = @(x) cos(x).*exp(1).^(sin(x));
minimum = 1e-6;

m = 2;
x1 = linspace(a,b,m);
y1 = f(x1);
q1 = trapz(x1,y1);

while toll > minimum
    m = m*2;
    x2 = linspace(a,b,m);
    y2 = f(x2);
    q2 = trapz(x2,y2);

    toll = abs(q2-q1);
    q1 = q2;
end
toc;

%% Esercizio 4
clear;
clc;
a = 1;
b = 2;

f = @(x) 1./x + exp(1).^x;
m = [20 200 2000 20000];

for val = m
    x = linspace(a,b,val);
    y = f(x);
    fprintf("H è: %1.4f \n",(b-a)/val);
    q = simpsc(a,b,val,f);
    integrale = integral(f,a,b);
    fprintf("Errore è: %8.12f \n",integrale-q);
end

%% Esercizio 1 zeri

clear;
clc;

f = @(x) (x.^3 -3.*x +2).*exp(1).^x;
a = -3;
b = 1.5;

alfa = fzero(f,[a,b]);
xplot = linspace(a,b,1000);
yplot = f(xplot);
hold on;
plot(xplot,yplot, 'k-')
y = f(alfa);
plot(alfa,y,'o')

a = -3;
b = 1;
alfa = fzero(f,[a,b]);
y = f(alfa);
plot(alfa,y,'o')
% 
% a = 2;
% b = 2.5;
% alfa = fzero(f,[a,b]);
% y = f(alfa);
% plot(alfa,y,'o')

%% Esercizi di riepilogo 1
clear;
clc;
format short e;
a = 9;

f = @(x) (a.* x.^5 -1)./(x.^5 +1);

xl = linspace(0,1,10);
y = f(xl);
integrale = integral(f,0,1);
disp(integrale)
trapezi = trapz(xl,y);
disp(trapezi)

s1 = griddedInterpolant(xl,y,'linear');
xplot = linspace(0,1,1000);
yplot = s1(xplot);

hold on;
plot(xl,y,'o');
plot(xplot,yplot,'k-')

z = (1/a)^(1/5);
disp(z);
disp(s1(z))

%% Esercizio 2 a

clear;
clc;
format short e;
m = [10 100 1000 10000];
% a = 0;
% b = pi/4;

% f = @(x) 1./cos(x);
a = -1;
b = 0;

f = @(x) sqrt(2.*x +5);

for val = m
    fprintf("M: %5.0f \n",val)
    H = (b-a)/val;
    fprintf("H: %5.4e \n",H)
    integrale = integral(f,a,b);
    x = linspace(a,b,val+1);
    y = f(x);

    stima = trapz(x,y);
    % stima = pmedc(a,b,val,f);
    % stima = simpsc(a,b,val,f);

    fprintf("Errore %5.4e \n",abs(integrale-stima))


end

