% STP - Projekt 2 - Zadanie 38 - Jakub Sikora
% Symulacja regulatora DMC

clear

%Dane regulatora
kk = 500;
y_zad = zeros(1,kk);
y_zad(13:kk) = 1;
du = zeros(1,kk);
N = 30;
Nu = 2;
lambda = 1000;
D = 80;


%Wyznaczenie odpowiedzi skokowej
K0 = 4.3;
T0 = 5;
T1 = 1.85;
T2 = 5.35;

Tp = 0.5;
s = tf('s');
Gs = (K0 * exp(-s*T0))/((T1*s + 1)*(T2*s +1));
Gz = c2d(Gs, Tp, 'zoh');
u=zeros(1,kk);
u(13:kk) = 1;
y=zeros(1,kk);

for k =13:kk
    y(k) = 1.674*y(k-1) - 0.6951*y(k-2) + 0.04818*u(k-11) + 0.04268*u(k-12);
end

odp_skok = step(Gz, 0:Tp:1.5*D);

y_zad = zeros(1,kk);
y_zad(D:kk) = 1;
%y_zad(200:kk) = 2;
%y_zad(400:kk) = 0;
y=zeros(1,kk);
u=zeros(1,kk);



% Wyznaczenie macierzy dynamicznej
M = zeros(N, Nu);
for i=1:Nu
    for j=1:N
        if j >= i
            M(j+i-1,i) = odp_skok(j);
        else
            M(j,i) = 0;
        end
    end
end
M = M(1:N, 1:Nu);

% Wyznaczenie macierzy predykcji
Mp = zeros(N,D-1);
for j=1:(D-1)
    for i=1:N
        Mp(i,j) = odp_skok(i+j) - odp_skok(j);
    end
end

% Wyznaczenie wektora K

K = (M'*M + lambda*eye(Nu))^-1 * M';

K1 = K(1,1:N);
ke = sum(K1);

for k=D:kk
    y(k) = 1.674*y(k-1) - 0.6951*y(k-2) + 0.04818*u(k-11) + 0.04268*u(k-12);
    swob = 0;
    for j=1:(D-1)
        ku = K1*Mp(:,j);
        swob = swob + ku*du(k-j);
    end
    du(k) = ke*(y_zad(k) - y(k)) - swob;
    u(k) = u(k-1) + du(k);
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
title('Regulator DMC');
hold off

name = strcat('figures\zad5_dmc_l_', strrep(num2str(lambda), '.', ','), '_N_', num2str(N), '_Nu_', num2str(Nu), '_D_', num2str(D));
print_figure(name, '..\figures')
