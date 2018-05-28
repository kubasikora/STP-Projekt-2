% STP - Projekt 2 - Zadanie 38 - Jakub Sikora
% Por�wnanie regulator�w PID i DMC

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
title('Por�wnanie przebieg�w wyj�ciowych')
ylabel('Wyj�cie procesu')
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
ylabel('Sygna� steruj�cy')
title('Por�wnanie przebieg�w sygna��w steruj�cych')
hold off
name = strcat('figures\zad6_u_comp');
print_figure(name, '..\figures')