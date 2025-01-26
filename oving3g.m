%% g) Numerisk integrasjon i sann tid

clear;clc;close all

% åpner figur
figure(1)

% Initialiseringer
t_slutt = 10;     % hvor lenge skal "eksperimentet" vare
k = 1;            % initialverdi indeks
stopp = 0;        % betingelse for while-løkken
noise = 1;        % skal målingene ha støy
pausetid = 0.3;   % hvor lang skal pausen i while-løkken være 

while ~stopp
    if k == 1
        % Starter stoppeklokke og setter initialverdi tid
        tic
        t(1) = 0;
       
        % Første måling
        u(1) = sin(t(1));

        % Initialverdi integrasjon
        y(1) = 0;
    else
        t(k) = toc;  % leser av stoppeklokke

        % Målingene u(k) blir gjort tilgjengelig underveis.
        u(k) = sin(t(k));  % måling

        if noise
            % legger på støy
            u(k) = u(k) + 0.05*randn;
        end

        % Numerisk integrasjon med trapesmetoden
        Ts = t(k)-t(k-1);
        y(k) = y(k-1) + 0.5*Ts*(u(k-1)+u(k));
    end

    % Plotter i "sann tid"
    subplot(2,1,1)
    plot(t,u,'k:o')
    grid on
    title('M{\aa}linger $u_{k}$.')

    subplot(2,1,2)
    plot(t, y, 'b:o')
    xlabel('tid [s]')
    grid on
    title('Trapesintegrasjon $y_{k}$.')
    
    drawnow

    % oppdaterer indeks
    k = k + 1;

    % legger inn pause
    pause(pausetid)

    % Stopper while-løkken dersom medgått tid er større en t_slutt
    if t(end)> t_slutt
        stopp = 1;
    end
end

