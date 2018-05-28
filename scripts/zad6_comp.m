% STP - Projekt 2 - Zadanie 38 - Jakub Sikora
% Porównanie regulatorów PID i DMC

% comp y
figure 
hold on
grid on
grid minor
plot(t,y_zad, 'b')
plot(t,pid_y, 'r')
plot(t,dmc_y, 'g')
legend('y\_{zad}', 'PID', 'DMC')
xlabel('Czas dyskretny k')
title('Porównanie przebiegów wyjœciowych')
ylabel('Wyjœcie procesu')
hold off

name = strcat('figures\zad6_y_comp');
print_figure(name, '..\figures')

% comp u
figure 
hold on
grid on
grid minor
plot(t,pid_u, 'r')
plot(t,dmc_u, 'g')
legend('PID', 'DMC')

xlabel('Czas dyskretny k')
ylabel('Sygna³ steruj¹cy')
title('Porównanie przebiegów sygna³ów steruj¹cych')
hold off
name = strcat('figures\zad6_u_comp');
print_figure(name, '..\figures')