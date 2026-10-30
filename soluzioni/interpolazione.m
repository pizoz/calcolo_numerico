%% File 7

%% Esercizio 1
x = [-1 1 2 7];
y = [-4 -1 0.5 3];
n = length(x)-1;
p = polyfit(x,y,n);
disp(p)
xplot = linspace(-2,7,1000);
yplot= polyval(p,xplot);

figure(1);
hold on;
plot(xplot,yplot,'r');
plot(x,y,'bo');
hold off;

x = [-5 -3 -1 1 3 5];
y = [0.1 -0.5 0.5 1.1 0.9 -2];
n = length(x)-1;
p = polyfit(x,y,n);
xplot = linspace(-5,5,1000);
yplot = polyval(p,xplot);
figure(2)
hold on
plot(xplot,yplot,'r');
plot(x,y,'bo');
hold off;
%% Esercizio 2
clear;
close all;
clc;
% 1. Definiamo i gradi usando una variabile con un nome univoco
gradi = [2 4 8 16]; 
a = -1;
b = 1;
xplot = linspace(a, b, 1000);

figure; 
hold on; % Blocca la figura per disegnare più curve insieme

% 2. Iteriamo usando una variabile 'n' che scorre i valori di 'gradi'
for n = gradi 
    
    x = linspace(a, b, n+1);
    y = 3.^x .* sin(x);
    
    p = polyfit(x, y, n);
    yplot = polyval(p, xplot);
    
    curva = plot(xplot, yplot, 'LineWidth', 1.5, 'DisplayName', ['Grado ' num2str(n)]); 
    plot(x, y, 'o', 'Color', curva.Color, 'HandleVisibility', 'off'); 
    
end

hold off;
grid on;
legend('show', 'Location', 'best'); % Mostra la legenda per confermare i cambiamenti
title('Variazione del polinomio di interpolazione');

%% Esercizio 3
format long;
a = -5;
b = 5;
gradi = [4 8 16 32];
xplot = linspace(a,b,1000);
f = @(x) 1./(1+x.^2);
max_err = [];
hold on
for n = gradi
    x = linspace(a,b, n+1);
    y = f(x);
    p = polyfit(x, y, n);
    yplot = polyval(p, xplot);

    res = f(xplot);
    
    curva = plot(xplot, yplot, 'LineWidth', 1.5, 'DisplayName', ['Grado ' num2str(n)]); 
    plot(x, y, 'o', 'Color', curva.Color, 'HandleVisibility', 'off');

    max_err =[max_err max(abs(yplot-res))];
    disp(n);
end
hold off;
grid on;
legend('show', 'Location', 'best'); % Mostra la legenda per confermare i cambiamenti
title('Variazione del polinomio di interpolazione');
disp(max_err)

%% Spline Interpolanti
x = [-1 1 2 3 5];
y = [0 -1 5 2 1];

s1 = griddedInterpolant(x,y,'linear');
disp(s1)
z = 0;
s1z = s1(x);
plot(x,y,'o',x,y,z,s1z,'*g');
grid on;

%% Esercizio 6
a = -5;
b = 5;
m = 100;
H = 10/m; 

% 1. Definisci la funzione (Funzione di Runge)
f = @(x) 1./(1+x.^2);

% 2. Crea i nodi sparsi (devono essere vettori COLONNA per griddedInterpolant)
xspline = (a:H:b)'; 
disp('Nodi xspline:');
disp(xspline);
yspline = f(xspline);

% 3. CREA L'INTERPOLANTE SUI NODI SPARSI (xspline, yspline), NON su x e y!
s1 = griddedInterpolant(xspline, yspline, 'linear');
disp(s1)

% 4. Crea la griglia densa e i valori esatti
x = linspace(a, b, 1000)';
y = f(x); 

% 5. Valuta l'interpolante sulla griglia densa
s1z = s1(x);

% 6. Plotta tutti gli elementi in modo chiaro
figure;
plot(x, y, 'k-', 'LineWidth', 1.5, 'DisplayName', 'Funzione Esatta'); % Funzione vera
hold on;
plot(x, s1z, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Interpolante lineare (s1z)'); % Interpolazione
plot(xspline, yspline, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'Nodi'); % Nodi
hold off;

% Calcolo dell'errore massimo (norma infinito)
err_max = max(abs(y - s1z));

disp(['L''errore massimo di approssimazione è: ', num2str(err_max)]);
grid on;
legend('show', 'Location', 'best');
title('Interpolazione con griddedInterpolant');


%% Esercizio 7

a = -1;
b = 1;
m = 500;
H = 10/m;
f = @(x) exp(1).^x .* cos(4.*x);
f_2 = @(x) sqrt(abs(x));

xspline = a:H:b;
yspline = f_2(xspline);

s1 = griddedInterpolant(xspline,yspline,'linear');

x = linspace(a,b,1000);
y = f_2(x);

s1z = s1(x);

figure;
plot(x, y, 'k-', 'LineWidth', 1.5, 'DisplayName', 'Funzione Esatta'); % Funzione vera
hold on;
plot(x, s1z, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Interpolante lineare (s1z)'); % Interpolazione
plot(xspline, yspline, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'Nodi'); % Nodi
hold off;

% Calcolo dell'errore massimo (norma infinito)
err_max = max(abs(y - s1z));

disp(['L''errore massimo di approssimazione è: ', num2str(err_max)]);
grid on;
legend('show', 'Location', 'best');
title('Interpolazione con griddedInterpolant');