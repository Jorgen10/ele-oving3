%% f) Numerisk integrasjon og derivasjon i Matlab
 
clear; close all; clc

% Tidspunkt og målinger i {t_k} og {u_k}.
t_slutt = 3;
Ts = 0.4;
t = 0:Ts:t_slutt;    % Skriv t som en vektor/array som t=fra:step:til
u = 2 * t.^2;  % Skriv uttrykket for u = 2*t^2. Husk elementvis operasjoner.

% Initialverdier integrasjon og derivasjon
y(1) = 0;
v(1) = 0;

for k = 2:length(t)
    % ------------- Trapesmetoden -------------
    y(k) = y(k-1) + Ts/2*(u(k-1)+u(k));

    % ------------- Bakoverderivasjon --------------
    v(k) = (u(k)-u(k-1))/Ts;
end

figure
set(gcf,'position',[1000 250 500 700])
subplot(3,1,1)
plot(t, y, 'b:o')
xticks(t)
grid
legend('$y_k$ fra trapesmetoden')

subplot(3,1,2)
area(t,u,'FaceColor',[0.7 0.7 0.7])
hold on
stem(t,u,'k')
xticks(t)
grid
legend('Areal med trapesmetoden','M{\aa}linger $u_{k}$')

subplot(3,1,3)
plot(t, v, 'r:o')
grid
xticks(t)
legend('$v_k$ fra bakoverderivasjon')
xlabel('tid [s]')

