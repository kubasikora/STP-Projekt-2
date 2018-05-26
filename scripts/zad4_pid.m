K_kryt = 0.0034;
T_k = 47;
Tp = 0.5;

% Pid uzyskany z eksperymentu

K_reg = 0.6*K_kryt;
T_i = 0.5*T_k;
T_d = 0.12*T_k;

r1 = K_reg*(1 + Tp/(2*T_i) + T_d/Tp);
r2 = K_reg*(Tp/(2*T_i) - 2*T_d/Tp - 1);
r3 = K_reg*T_d/Tp;

y_zad = zeros(1,250);
y_zad(13:250) = 1;
y=zeros(1,250);
u=zeros(1,250);
e=zeros(1,250);
k = 13;

for i=1:238
e(k) = y_zad(k) - y(k-1);
u(k) = u(k-1) + r1*e(k) + r2*e(k-1) + r3*e(k-2);
y(k) = 1.674*y(k-1) - 0.6951*y(k-2) + 0.04818*u(k-11) + 0.04268*u(k-12);
k = k + 1;
end
fig1 = figure;
t = linspace(1,250,250);
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

K_reg = 0.19;
T_i = 8.4;
T_d = 2.13;

r1 = K_reg*(1 + Tp/(2*T_i) + T_d/Tp);
r2 = K_reg*(Tp/(2*T_i) - 2*T_d/Tp - 1);
r3 = K_reg*T_d/Tp;


y_zad = zeros(1,250);
y_zad(13:250) = 1;
y=zeros(1,250);
u=zeros(1,250);
e=zeros(1,250);
k = 13;

for i=1:238
e(k) = y_zad(k) - y(k-1);
u(k) = u(k-1) + r1*e(k) + r2*e(k-1) + r3*e(k-2);
y(k) = 1.674*y(k-1) - 0.6951*y(k-2) + 0.04818*u(k-11) + 0.04268*u(k-12);
k = k + 1;
end


fig2 = figure;
t = linspace(1,250,250);
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