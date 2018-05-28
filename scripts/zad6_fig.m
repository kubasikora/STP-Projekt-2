% STP - Projekt 2 - Zadanie 38 - Jakub Sikora
% Rysowanie obszarów stabilnoœci obu regulatorów na wykresie

load ..\data\zad6_dmc
load ..\data\zad6_pid

data6_dmc(2,10:11) = 1.4;

hold on
xlim([1.0 2.0]);
fig1 = area(data6_dmc(1,:), data6_dmc(2,:));
data6_dmc(2,9:11) = 1.4;
fig2 = area(data6_dmc(1,9:11), data6_dmc(2,9:11));
fig1.LineStyle = 'none';
fig2.LineStyle = 'none';
fig2.FaceColor = [0 0 1];
fig1.FaceColor = [0 0 1];
xlabel('T_0/T_0^{nom}')
ylabel('K_0/K_0^{nom}')
title('Wyznaczone obszary stabilnoœci regulatora DMC')
hold off

name = 'figures\dmc6_area';
print_figure(name, '..\figures')

X = zeros(11, 2);
X(:,1) = data_zad6(1,:);
X(:,2) = data_zad6(1,:)';
Y = zeros(11, 2);
Y(:,1) = data_zad6(2,:)';
Y(:,2) = 5*ones(11,1) - data_zad6(2,:)';

figure
xlim([1.0 2.0]);
    h =area(X,Y);
    h(2).FaceColor = [0 0 1];
    h(1).LineStyle = 'none';
    h(2).LineStyle = 'none';
    h(1).Visible = 'off';
xlabel('T_0/T_0^{nom}')
ylabel('K_0/K_0^{nom}')
title('Wyznaczone obszary stabilnoœci regulatora PID')
hold off

name = 'figures\pid6_area';
print_figure(name, '..\figures')
