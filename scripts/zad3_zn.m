% STP - Projekt 2 - Zadanie 38 - Jakub Sikora
% Eksperyment Zieglera Nicholsa

y_zad = 1;
y=zeros(1,250);
u=zeros(1,250);
e=zeros(1,250);
k = 13;

K_reg = 0.08555; % eksperymentalnie wyznaczona wartoœæ wzmocnienia krytycznego

for i=1:238
e(k) = y_zad - y(k-1);
u(k) = K_reg*e(k);
y(k) = 1.674*y(k-1) - 0.6951*y(k-2) + 0.4818*u(k-11) + 0.04268*u(k-12);
k = k + 1;
end


t = linspace(1,250,250);
hold on
stairs(t, y_zad*ones(250));
stairs(t, u);
stairs(t, y);
grid on
grid minor
legend('y_{zad}[k]', 'u[k]', 'y[k]');
xlabel('Próbki dyskretne k');
ylabel('Wartoœci sygna³ów');
title('Wynik eksperymentu Zieglera-Nicholsa');

name = strcat('figures\zad3_zn_exp');
print_figure(name, '..\figures')
