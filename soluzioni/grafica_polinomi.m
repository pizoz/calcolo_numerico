%% Esercizio 2

x = linspace(0,2.5,50);
fx = sin(exp(1).^x);
x1 = linspace(-3,1.5,50);
gx = (x1.^3-3*x1 +2).*exp(1).^x1;
figure(1)
plot(x,fx,'r');
title("Grafico 1")
grid on
figure(2)
plot(x1,gx,'b');
title("Grafico 2")
grid on;

%% Esercizio 3
clear
x = linspace(0,1,100);
figure(1)
hold on;
for n = 0:20
    f_n = x.^n;
    plot(x,f_n)
end
hold off;
title("x^n per n = 0,1,...,20")
xlabel("Asse x")
ylabel("Asse y")

figure(2)
hold on;
for n = 0:20
    f_n = x.^(1/n);
    plot(x,f_n)
end
hold off;
title("x^{(1/n)} per n = 0,1,...,20")
xlabel("Asse x")
ylabel("Asse y")

%% Esercizio 4
f_x = @(x) ((2*log(x+2))/sqrt(x+1)-(x.^2 +2*x+1)./(x.^2 +1));
x = linspace(1,2,100);
plot(x,f_x(x),"k")

%% Esercizi polinomi 1
p = [1 -1 4 -1];
q = [1 -3 -1];
q = [0 q];
disp(q)
diff = p-q;
disp(diff)
res2 = 3*p + 5*q;
disp(res2)
res3 = conv(p,q);
disp(res3)
res4 = 2*p.^2 -3*q.^3;
disp(res4)

[quoz,resto] = deconv(p,q(2:end));
disp(quoz)
disp(resto)

p_prime = polyder(p);
disp(p)
disp(p_prime)

res = polyval(p,3) - polyval(q,3);
disp(res)

%% Esercizio 2
clear;

x1 = linspace(-2,1,100);
f = x1.^3 -x1 +4;
pol = [1 0 -1 4];
z = roots(pol);
hold on
plot(x1,f)
plot(x1,x1.*0)
plot(real(z),0,'o')

x2 = linspace(-6,3,1000);
f = x2.^5 + 6*x2.^4 -24*x2.^2 -x2 -30;
pol = [1 6 0 -24 -1 -30];
z = roots(pol);
disp(z)
plot(x2,f)
plot(x2,x2.*0)
plot(real(z),0,'o')

%% Esercizio 3
pol1 = [1 -2 1];
int1 = polyint(pol1);
disp(int1)
res1 = polyval(int1,3) - polyval(int1,0);
disp(res1)

pol2 = [4 5 5 0 -1 0];
int2 = polyint(pol2);
disp(int2)
res2 = polyval(int2,7) - polyval(int2,-1);
disp(res2)

%% Esercizio 4
pol1 = [3 -1 -15 5];
der1 = polyder(pol1);
disp(der1)
possible = roots(der1);
possible = possible(possible >= -2 & possible <= 2);
disp(possible)
y = polyval(pol1,possible);
disp(y)

xplot = linspace(-2,2,1000);
yplot = polyval(pol1,xplot);
figure(1)
hold on;

plot(xplot,yplot,'b');
plot(possible,y,'ro')
hold off;

a = -1.5;
b = 2.5;
pol = [12 -15 -40 0 0 0];
der = polyder(pol);
x = roots(der);
disp(x)
x_filtered = x(x >= a & x <= b);
y = polyval(pol,x_filtered);

xplot = linspace(a,b,1000);
yplot = polyval(pol,xplot);
figure(2)
hold on;

plot(xplot,yplot,'b');
plot(x_filtered,y,'ro');
hold off;


