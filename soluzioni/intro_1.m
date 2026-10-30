%% Esercizio 1

a = 3;
b = 2;

res1 = 3/(a+b);
res2 = (a+b)/2;
res3 = (a+b)/2*a;
res4 = 1/(nthroot(8,3));
res5 = nthroot(64,4);

ics = 10;
y = 5;
z = 2;

num = 3*ics -2*y;
den = 5*(z^2);

res6 = num/den;

a = 1/3;
b = 1/5;

res7 = a^(-3)/(1-b+3*a)^2;

z = 7 -5i;
w = conj(z);
%% Esercizio 2

x = pi/2;
y = 2*sin(x)*cos(x) - cos(2*x);

x = 5;
den = nthroot(x-9,5);
y = x/den;

x = 10;
e = exp(1);

num = e^(sin(x^2)) + cos(x);
den = 2*sqrt(x) + 5*log(x);

ulty = num/den;
%%
vec = [28:2:80];

vec = [22:-4:-10]

vec = linspace(-1,5,125);
%%
u = [1,2,0,-3];
v = [3,0,2,1];
res1 = u+v;

res3 = 5*u;
res4 = (u+v)/10;
u = u';
v= v';
res2 = u-v;

%%

a = (e^2*cos(pi/6) +1)/(4+log(3));

a = 8;

res = (a+nthroot(a,3))/(2*a+4);

x = 3;

y = e^(-2*x)*cos(3*x) - 3*sqrt(x+1);

z = (-7)^(1/5);

z1 = real(z);
z2 = imag(z);
%%
vec1 = -13:2:75;

vec2 = -2.7:1.5:8.3;

vec3 = linspace(-2,3,150);

x = 10;
space = 1/10

res1 = 0:space:1
res2 = linspace(0,1,x+1)
