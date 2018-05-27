% STP - Projekt 2 - Zadanie 38 - Jakub Sikora
% Eksperyment Zieglera Nicholsa
kk = 250;

y_zad = zeros(1,kk);
y_zad(13:kk) = 1;
y=zeros(1,kk);
u=zeros(1,kk);
e=zeros(1,kk);

K_reg = 0.5125;

for k=13:kk
    y(k) = 1.674*y(k-1) - 0.6951*y(k-2) + 0.04818*u(k-11) + 0.04268*u(k-12);
    e(k) = y_zad(k) - y(k);
    u(k) = K_reg*e(k);
end

t = linspace(1,kk,kk);
hold on
stairs(t, y_zad, 'g');
stairs(t, y, 'r');
grid on
grid minor
legend('y_{zad}[k]', 'y[k]');
xlabel('Próbki dyskretne k');
ylabel('Wartoœci sygna³ów');
title('Wynik eksperymentu Zieglera-Nicholsa');

name = strcat('figures\zad3_zn_exp');
print_figure(name, '..\figures')