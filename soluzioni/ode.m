%% Esercizio 1

clear;
clc;

f = @(t,y) t.*(2+t) - y;
y0 = 1;
h = [0.5 0.25 0.125];
t0 = 0;
tmax = 2;
sol = @(t) t.^2 + exp(-t);


tplot = linspace(t0,tmax,1000);
yplot = sol(tplot);


hold on;
legend on;

plot(tplot,yplot,'k-', 'DisplayName', 'Soluzione')

for val = h

    T = t0:val:tmax;
    [T,U] = eulero(f,T,y0);
    realy = sol(T);
    plot(T, U, 'o', 'DisplayName', ['H:' num2str(val)]);
    err = norm(realy-U,inf);
    disp(err)
end
hold off;


%% Esercizio 2 - a

clear;
clc;

f = @(t,y) -2.* t.*y.^2;
y0 = 1;
t0 = 0;
tmax = 2;
h = [0.1 0.01 0.001 0.0001];
sol = @(t) 1./(1+t.^2);

tplot = linspace(t0,tmax,1000);
yplot = sol(tplot);

hold on;
legend on;

plot(tplot,yplot,'k-', 'DisplayName', 'Soluzione')

for val = h

    T = t0:val:tmax;
    [T,U] = eulero(f,T,y0);
    realy = sol(T);
    plot(T, U, 'o', 'DisplayName', ['H:' num2str(val)]);
    err = norm(realy-U,inf);
    fprintf("H: %1.5f , err = %1.4e \n",[val err]);
end
hold off;

%% Esercizio 2 -b 
clear;
clc;

h = [0.01 0.001 0.0001];
f = @(t,y) -25 .* y;
y0 = 1;
t0 = 0;
tmax = 2;
sol = @(t) exp(-25.* t);

tplot = linspace(t0,tmax,1000);
yplot = sol(tplot);



for val = h
    figure;
    legend on;
    hold on;
    plot(tplot,yplot,'k-', 'DisplayName', 'Soluzione')
    T = t0:val:tmax;
    [T,U] = eulero(f,T,y0);
    realy = sol(T);
    plot(T, U, 'o', 'DisplayName', ['H:' num2str(val)]);
    err = norm(realy-U,inf);
    fprintf("H: %1.5f , err = %1.4e \n",[val err]);
    hold off;
end


%% Esercizio 3 - a

clear;
clc;

f = @(t,y) -2.* t.*y.^2;
y0 = 1;
t0 = 0;
tmax = 2;
h = [0.1 0.01 0.001 0.0001];
toll = 1e-6;
nitmax = 20;


sol = @(t) 1./(1+t.^2);

tplot = linspace(t0,tmax,1000);
yplot = sol(tplot);

dfy = @(t,y) -4.*t.*y;

for val = h
    figure;
    legend on;
    hold on;
    plot(tplot,yplot,'k-', 'DisplayName', 'Soluzione')
    T = t0:val:tmax;
    [T,U] = eulimp(f,T,y0,dfy,toll,nitmax);
    realy = sol(T);
    plot(T, U, 'o', 'DisplayName', ['H:' num2str(val)]);
    err = norm(realy-U,inf);
    fprintf("H: %1.5f , err = %1.4e \n",[val err]);
    hold off;
end

%% Esercizio 2 - b
clear;
clc;

h = [0.1 0.01 0.001 0.0001];
f = @(t,y) -25 .* y;
y0 = 1;
t0 = 0;
tmax = 2;
toll = 1e-6;
nitmax = 20;

sol = @(t) exp(-25.* t);

dfy = @(t,y) -25;

tplot = linspace(t0,tmax,1000);
yplot = sol(tplot);

for val = h
    figure;
    legend on;
    hold on;
    plot(tplot,yplot,'k-', 'DisplayName', 'Soluzione')
    T = t0:val:tmax;
    [T,U] = eulimp(f,T,y0,dfy,toll,nitmax);
    realy = sol(T);
    plot(T, U, 'o', 'DisplayName', ['H:' num2str(val)]);
    err = norm(realy-U,inf);
    fprintf("H: %1.5f , err = %1.4e \n",[val err]);
    hold off;
end

%% Esercizio 4 - a

clear;
clc;

f = @(t,y) -2.* t.*y.^2;
y0 = 1;
t0 = 0;
tmax = 2;
h = [0.1 0.01 0.001 0.0001];
sol = @(t) 1./(1+t.^2);

tplot = linspace(t0,tmax,1000);
yplot = sol(tplot);


plot(tplot,yplot,'k-', 'DisplayName', 'Soluzione')

for val = h
    figure;
    legend on;
    hold on;
    plot(tplot,yplot,'k-', 'DisplayName', 'Soluzione')
    T = t0:val:tmax;
    [T,U] = heun(f,T,y0);
    realy = sol(T);
    plot(T, U, 'o', 'DisplayName', ['H:' num2str(val)]);
    err = norm(realy-U,inf);
    fprintf("H: %1.5f , err = %1.4e \n",[val err]);
    hold off;
end
hold off;

%% Esercizio 4 - b

clear;
clc;

h = [0.1 0.01 0.001 0.0001];
f = @(t,y) -25 .* y;
y0 = 1;
t0 = 0;
tmax = 2;
sol = @(t) exp(-25.* t);

tplot = linspace(t0,tmax,1000);
yplot = sol(tplot);

for val = h
    figure;
    legend on;
    hold on;
    plot(tplot,yplot,'k-', 'DisplayName', 'Soluzione')
    T = t0:val:tmax;
    [T,U] = heun(f,T,y0);
    realy = sol(T);
    plot(T, U, 'o', 'DisplayName', ['H:' num2str(val)]);
    err = norm(realy-U,inf);
    fprintf("H: %1.5f , err = %1.4e \n",[val err]);
    hold off;
end
hold off;


%% Esercizi di riepilogo
clear;
close all;
clc;
h = [0.1 0.01 0.001];
toll = 1e-6;
nitmax = 20;

% Problema 1
% f = @(t,y) t.^2 .*(1- 3.*y);
% dfy = @(t,y) -3 .*t.^2;
% y0 = 2;
% t0 = 0;
% tmax = 2;
% sol = @(t) (1/3).* (1 + 5.*exp(-t.^3));

% Problema 2
% f = @(t,y) y./t + (y./t).^2;
% dfy = @(t,y) 1./t + 2.*y./(t.^2);
% y0 = exp(1);
% t0 = exp(1);
% tmax = exp(1)+2;
% sol = @(t) t./(2 - log(t));

% Problema 3
% f = @(t,y) -1./t .*(2.*y + t.^2 .*y.^2);
% dfy = @(t,y) -1./t .* (2 + 2.*t.^2.*y);
% y0 = 1;
% t0 = 1;
% tmax = 5;
% 
% sol = @(t) 1./(t.^2 + log(t));

% Problema 4
% f = @(t,y) -y.^2;
% dfy = @(t,y) -2.*y;
% y0 = 5;
% t0 = 0;
% tmax = 10;
% sol = @(t) 5./(1+ 5.*t);

% Problema 5
f = @(t,y) y./t + pi.*t.*cos(pi.*t);
dfy = @(t,y) 1./t;
y0 = 0;
t0 = 1;
tmax = 3;
sol = @(t) t.*sin(pi.*t);






tplot = linspace(t0,tmax,1000);
yplot = sol(tplot);
for val = h
    figure;
    legend on;
    hold on;
    plot(tplot,yplot,'k-', 'DisplayName', 'Soluzione')
    T = t0:val:tmax;
    % Eulero esplicito
    % [T,U] = eulero(f,T,y0);
    % Eulero implicito
    % [T,U] = eulimp(f,T,y0,dfy,toll,nitmax);
    % Heun
    % [T,U] = heun(f,T,y0);
    % Crank-Nicolson
    [T,U] = cranknic(f,T,y0,dfy,toll,nitmax);
    realy = sol(T);
    plot(T, U, 'o', 'DisplayName', ['H:' num2str(val)]);
    err = norm(realy-U,inf);
    fprintf("H: %1.3f , err = %1.4e \n",[val err]);
    hold off;
end
