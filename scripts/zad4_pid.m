K_kryt = 0.5125;
T_k = 20.5;
Tp = 0.5;

% Pid uzyskany z eksperymentu

K_reg = 0.6*K_kryt;
T_i = 0.5*T_k;
T_d = 0.12*T_k;

r1 = K_reg*(1 + Tp/(2*T_i) + T_d/Tp);
r2 = K_reg*(Tp/(2*T_i) - 2*T_d/Tp - 1);
r3 = K_reg*T_d/Tp;
kk = 1000;

y_zad = zeros(1,kk);
y_zad(13:kk) = 1;
y=zeros(1,kk);
u=zeros(1,kk);
e=zeros(1,kk);


disp('Nastawy regulatora uzyskanego za pomoc¹ eksperymentu Z-N:')

disp(strcat('Wartoœæ K: ', num2str(K_reg)));
disp(strcat('Wartoœæ Ti: ', num2str(T_i)));
disp(strcat('Wartoœæ Td: ', num2str(T_d)));

for k=13:kk
    y(k) = 1.674*y(k-1) - 0.6951*y(k-2) + 0.04818*u(k-11) + 0.04268*u(k-12);
    e(k) = y_zad(k) - y(k);
    u(k) = u(k-1) + r1*e(k) + r2*e(k) +r3*e(k);
end


fig1 = figure;
t = linspace(1,kk,kk);
hold on
plot(t, y_zad, 'g');
stairs(t, u, 'b');
stairs(t, y, 'r');
grid on
grid minor
legend('y_{zad}[k]', 'u[k]', 'y[k]');
xlabel('Próbki dyskretne k');
ylabel('Wartoœci sygna³ów');
title('Regulator uzyskany za pomoc¹ eksperymentu Z-N');
hold off

name = strcat('figures\zad4_pid_zn');
print_figure(name, '..\figures')

% Poprawiony pid
kk = 150;
K_reg = 0.19;
T_i = 8.4;
T_d = 2.13;

r1 = K_reg*(1 + Tp/(2*T_i) + T_d/Tp);
r2 = K_reg*(Tp/(2*T_i) - 2*T_d/Tp - 1);
r3 = K_reg*T_d/Tp;


y_zad = zeros(1,kk);
y_zad(13:kk) = 1;
y=zeros(1,kk);
u=zeros(1,kk);
e=zeros(1,kk);


for k=13:kk
e(k) = y_zad(k) - y(k-1);
u(k) = u(k-1) + r1*e(k) + r2*e(k-1) + r3*e(k-2);
y(k) = 1.674*y(k-1) - 0.6951*y(k-2) + 0.04818*u(k-11) + 0.04268*u(k-12);
end

disp('Nastawy poprawionego regulatora:')

disp(strcat('Wartoœæ K: ', num2str(K_reg)));
disp(strcat('Wartoœæ Ti: ', num2str(T_i)));
disp(strcat('Wartoœæ Td: ', num2str(T_d)));


fig2 = figure;
t = linspace(1,kk,kk);
hold on
plot(t, y_zad, 'g');
stairs(t, u, 'b');
stairs(t, y, 'r');
grid on
grid minor
legend('y_{zad}[k]', 'u[k]', 'y[k]');
xlabel('Próbki dyskretne k');
ylabel('Wartoœci sygna³ów');
title('Regulator uzyskany dziêki rêcznej poprawie nastawów z Z-N');

name = strcat('figures\zad4_pid_zn_popr');
print_figure(name, '..\figures')