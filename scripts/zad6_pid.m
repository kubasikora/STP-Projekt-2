T_mn = 1.3;
K_mn = 2.2468;

% Dane zadania 
K0 = 4.3*K_mn;
T0 = 5*T_mn;
T1 = 1.85;
T2 = 5.35;
Tp = 0.5;
s = tf('s');
G = (K0 * exp(-s*T0))/((T1*s + 1)*(T2*s +1));
discrete = c2d(G, Tp, 'zoh');

K_reg = 0.19;
T_i = 8.4;
T_d = 2.13;

z = tf('z', Tp);
Rz = K_reg*(1 + Tp*z/(T_i*(z-1)) + T_d*(z-1)/(Tp*z));

GGG = Rz*discrete/(1 + Rz*discrete);

fig2 = figure;
step(GGG, 1:Tp:1000)


hold on

grid on
grid minor
xlabel('Próbki dyskretne k');
ylabel('Wyjœcie procesu y');
legend('y[k]');
title('Badanie obszarów stabilnoœci regulatora PID');

name = strcat('figures\zad6_Tmn_', num2str(T_mn));
print_figure(name, '..\figures')
