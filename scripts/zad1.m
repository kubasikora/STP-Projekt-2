% STP - Projekt 1 - Zadanie 38 - Jakub Sikora
% Wyznaczanie transmitancji dyskretnej przy wykorzystaniu pakietu Matlab

% Dane zadania 
load_params
Tp = 0.5;
s = tf('s');
G = (K0 * exp(-s*T0))/((T1*s + 1)*(T2*s +1));

% Czas symulacji
tsym = 50;

% Stworzenie systemu dyskretnego na podstawie systemu ci�g�ego
discrete = c2d(G, Tp, 'zoh');

% Wypisanie transmitancji dyskretnej
discrete


% Rysowanie wykresu
fig = figure('Name', 'Por�wnanie odpowiedzi skokowych transmitancji ci�g�ej i dyskretnej');
set(gcf, 'Position', [100, 100, 800, 600])
hold on;
grid on;
grid minor;
t = linspace(0, tsym, tsym/Tp + 1);
cont = step(G,  t);
disc = step(discrete, t);
plot(t, cont);
stairs(t, disc);
legend('Model ci�g�y', 'Model dyskretny', 'Location', 'northeast');
title('Odpowiedzi skokowe transmitancji ci�g�ej i dyskretnej', 'FontName', 'Helvetica');
xlabel('Czas t');
ylabel('Wyj�cie modelu y');

name = strcat('figures\zad1_cont_disc_comp');
print_figure(name, '..\figures')
