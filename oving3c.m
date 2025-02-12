%% c) Sampling og nedfolding av sammensatt signal
clear; close all; clc

% Velg samplingsfrekvenser i området 0.6 < fs < 3 Hz
% Start gjerne på fs=3 og reduser i steg på 0.2 Hz 
fs = 0.6;  % [Hz]

%-------------------------------------------------------------
% Lager først analogt signal u_a basert på 
% u_a1, u_a2 og u_a3 og kontinuerlig tid t_a  
%-------------------------------------------------------------
% Frekvensene i det analoge signalet. 
f_a1 = 0.2;  % Hz
f_a2 = 0.55;  % Hz
f_a3 = 1.17;  % Hz
t_slutt = 20;              % sekund
t_a = 0:0.0001:t_slutt;    % "t_a" er kontinuerlige t
u_a1 = cos(2*pi*f_a1*t_a);   
u_a2 = cos(2*pi*f_a2*t_a);
u_a3 = cos(2*pi*f_a3*t_a);
u_a = u_a1 + u_a2 + u_a3;


%--------------------------------------------------------------
% Lager diskret signal {u_k} basert på {u_1,k}, {u_2,k}, {u_3,k}
% og diskret tid {t_k}. 
% Kaller disse for u, u_1, u_2, u_3 og t. 
%--------------------------------------------------------------
Ts = 1/fs;       % [sek], sampletid
fN = fs/2;
t = 0:Ts:t_slutt;
u_1 = cos(2*pi*f_a1*t);    
u_2 = cos(2*pi*f_a2*t);
u_3 = cos(2*pi*f_a3*t);
u = u_1 + u_2 + u_3;

figure
set(gcf,'position',[550 200 650 650])
subplot(3,2,1)
plot(t_a, u_a1,'r-')
hold on
plot(t, u_1,'b:','Linewidth',1.5,'Marker','.','MarkerSize',15)

xlabel('tid [s]')
ylim([-3 3])
legend(['$u_1(t)$, $f_{a,1}=',num2str(f_a1),'$ Hz'],...
    '$\{u_{1,k}\}$')

subplot(3,2,3)
plot(t_a, u_a2,'r-')
hold on
plot(t, u_2,'b:','Linewidth',1.5,'Marker','.','MarkerSize',15)
xlabel('tid [s]')
ylim([-3 3])
legend(['$u_2(t)$, $f_{a,2}=',num2str(f_a2),'$ Hz'],...
    '$\{u_{2,k}\}$')

subplot(3,2,5)
plot(t_a, u_a3,'r-')
hold on
plot(t, u_3,'b:','Linewidth',1.5,'Marker','.','MarkerSize',15)
xlabel('tid [s]')
ylim([-3 3])
legend(['$u_3(t)$, $f_{a,3}=',num2str(f_a3),'$ Hz'],...
    '$\{u_{3,k}\}$')

sgtitle(['Sampling av analoge signal. ',...
    'Samplingsfrekvens $f_s=$ ',num2str(fs),' Hz'])

subplot(3,2,2)
plot(t_a, u_a,'r-')
hold on
plot(t, u,'b:','Linewidth',1.5,'Marker','.','MarkerSize',15)
xlabel('tid [s]')
ylim([-3 3])
legend('$u(t)=u_1(t)+u_2(t)+u_3(t)$',...
    '$\{u_{k}\}$')


[frekvens_u,spekter_u]=FrekvensSpekterSignal(u,t);

subplot(3,2,4)
plot(t,u)
ylim([-3 3])
xlabel('tid $t$ [s]')
legend(['$\{u_{k}\}$, $f_s$=',num2str(fs),' Hz'])

subplot(3,2,6)
plot(frekvens_u,spekter_u)
grid
title('Frekvens-spekter av $\{u_{k}\}$')
xlabel('Frekvenser $f_d$ [Hz] i signalet $\{u_{k}\}$')
ylabel('Amplitude')
xticks([0,f_a1,f_a2,f_a3])  % x-akse-verdiene er de analoge frekvensene
xlim([0,1.5])               % tilpasser x-aksen 


