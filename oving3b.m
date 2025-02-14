%% b) Sampling og fenomenet nedfolding.
clear; close all; clc

% Velg først din helt unike samplingsfrekvens i området 32<fs<48
fs = 4           % [Hz], samplingskrekvens

% Velg dine frekvenser f_a for det analoge signal.
% Velg typisk frekvensene 1, 5, 10, 15, 20, ..., 2*fs
% eller 1, 6, 12, 18, ..., 2*fs
f_a = 10;  % [Hz]

% -------------------------------------------------------------
% Lager først analogt signal u(t) som vi kaller "u_a" i koden.
% Signalet er laget med en tilnærmet kontinuerlig
% tidsvektor t som vi kaller "t_a" i koden
% -------------------------------------------------------------
t_slutt = 1;
t_a = 0:0.00001:t_slutt;   % lager en vektor med fiktiv "kontinuerlig tid"
u_a = 0.8*cos(2*pi*f_a*t_a);

% --------------------------------------------------------------
% Lager diskret signal u_k som vi kaller for "u" i koden,
% og som er basert på den diskrete tidsvektoren t_k
% som vi kaller for "t" i koden.
%
% Med refereanse til kap 7.2 i kompendiet så beregner vi altså
%
% u_k = 0.8*cos(2*pi*f_a*t_k)
%
% og demonstrerer at vi ved nedfolding får
%
% u_k = 0.8*cos(2*pi*f_d*t_k)
%
% hvor f_d<f_a
% --------------------------------------------------------------
Ts = 1/fs;       % [sek], sampletid
t = 0:Ts:t_slutt;
u = 0.8*cos(2*pi*f_a*t);


% plotter analogt og samplet signal i samme plot
figure
subplot(2,1,1)
plot(t_a,u_a,'r')
hold on
plot(t,u,'b:','Linewidth',1.5,'Marker','.','MarkerSize',15)
grid
title('Signal $\{u_k\}$')
xlabel('tid [s]')
legend(['Analogt signal $u(t)$, $f_a$=',num2str(f_a),' Hz'],...
    ['Samplet signal $\{u_k\}$, $f_s$=',num2str(fs),' Hz'])


% Beregner spekteret til det samplede signalet
[frekvens,spekter]=FrekvensSpekterSignal(u,t);

subplot(2,1,2)
plot(frekvens,spekter)
grid
title('Frekvens-spekter av signal $\{u_k\}$')
xlabel('frekvenser [Hz] i signalet')
ylabel('Amplitude')


%%
f_a = [];
f_d = [];
figure
plot(f_a,f_d,'*-')
grid
xlabel('Frekvens analogt signal $f_a$ [Hz]')
ylabel('Frekvens diskret signal $f_d$ [Hz]')
legend(['$f_s$=',num2str(fs),' Hz,  $f_N$=', num2str(fs/2),' Hz'])

