%% a) Fourier-rekker av sagtannsignal

clear; close all; clc

% ønsket periode på frekvens på signal
Tp = 5; % ønsket periodetid
f_signal = 1/Tp;   % desired

% antall sinusledd
M = 10;

% tidsvektor
t = 0:0.01:10;

figure
set(gcf,'position',[200 600   750  500])

y = 0;

for n=1:M
    B(n) = 1/n;
    f(n) = n*f_signal;
    y_n = B(n)*sin(2*pi*f(n)*t);
    y = y + y_n;

    subplot(2,2,1)
    plot(t,y_n)
    title(['$y_n(t) = B_n',...
        '\sin(2\pi f_n t)$',...
        ',~$B_n{=}\frac{1}{n},~f_n{=}n{\cdot}f_{\mathrm{signal}}$ ']);
    legend(['$T_p$=',num2str(Tp),' sekund',...
        ' gir $f_{\mathrm{signal}}$=',num2str(f_signal),' Hz'])
    hold on
    xlabel('tiden $t$')
    grid on
    ylim([-1.2 1.2])

    subplot(2,2,2)
    plot(t,y,'b')
    xlabel('tiden $t$')
    title(['$y(t) = \sum_{n=1}^{M}',...
        'B_n\sin(2\pi f_n t)$'])
    grid on
    legend(['$y(t)$, $M$=',num2str(n)])


    subplot(2,2,3)
    stem(f(n),B(n),'linewidth',1.5)
    hold on
    xlabel('$f_n$ [Hz]')
    xlim([0 f(n)])
    xticks([0,f])
    yticks(flip(B(1:min(5,n))))
    title('Fourierkoeffisientene $B_n$ mot frekvens $f_n$')
    ylabel('$B_n$')
    x_axis = xlim;
    grid on

    pause
end

% bekrefter resultatet
[frekvens,spekter]=FrekvensSpekterSignal(y,t);

subplot(2,2,4)
plot(frekvens,spekter,'b','marker','o')
grid
title(['Fouriertransformasjonen av $y(t)$'])
xlabel('Frekvenser $f$ [Hz] i signalet $y(t)$')
ylabel('Amplitude')
legend('Resultat fra {\tt FrekvensSpekter(y,t)}')
xticks([0,f])  % x-akse-verdiene er alle frekvensene f(n)
xlim(x_axis)   % kutter x-aksen til den samme som subplot(2,2,3)
yticks(flip(B(1:min(5,n))))

