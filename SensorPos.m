% SensorPos bestimmt die Postition der sensoren zufällig auf einem
% Zylinder

%aufräumen, alles was nicht gespeichert worden ist hat pech gehabt.

clear all

% h ... höhe des Zylinders
% r ... radius des Zylinders
% sens ... Anzahl der Sensoren


l = 6*pi; % periode in m

% h_1 = 2*pi-pi/2;
% h_2 = 2*pi-pi/4;
% h_1 = 2*pi-0.5; % höhe des inneren Zylinders in m
% h_2 = h_1; % höhe des äußeren Zylinders in m
h_1 = l;% höhe des inneren Zylinders in m
h_2 = l;% höhe des äußeren Zylinders in m
% r_1 = 0.5; % radius des inneren Zylinders in m
% r_2 = 1.5; % radius des äußeren Zylinders in m
r_1 = 0.99; % radius des inneren Zylinders in m
r_2 = 1.01; % radius des äußeren Zylinders in m

% Anzahl der Sensoren
sens_zyl = 500; % auf der Zylinder Fläche
sens_abschl = 0; % auf den abschlißenden Flächen des Zylinders. Sollte 0 sein -> randbedingungen [Lebedew S. 190ff]

%% Zylinder körper
%doppelschicht erzeugen.
P_R(1:sens_zyl/2) = r_1;
P_R(sens_zyl/2+1:sens_zyl) = r_2;

% P_R(1:sens) = r_1;

% r = r_2-r_1;

% P_R(1:sens) = rand([sens 1])*r+r_1;

%zufällige Zahlen zwischen 0 und 2*pi, in einem Vector
P_Phi(1:sens_zyl) = rand([sens_zyl 1])*2*pi;
% P_Phi(1:sens_zyl) = 1;

P_Z(1:sens_zyl/2) = rand([sens_zyl/2 1])*h_1-(h_1/2);
P_Z(sens_zyl/2 + 1:sens_zyl) = rand([sens_zyl/2 1])*h_2-(h_2/2);
% P_Z(1:sens_zyl) = 1;

%% Zylinder abschluss flächen
P_Z(sens_zyl+1:sens_zyl+sens_abschl/4) = h_1/2;
P_Z(sens_zyl+sens_abschl/4+1:sens_zyl+sens_abschl/2) = -h_1/2;

P_Z(sens_zyl+sens_abschl/2+1:sens_zyl+sens_abschl*3/4) = h_2/2;
P_Z(sens_zyl+sens_abschl*3/4+1:sens_zyl+sens_abschl) = -h_2/2;


P_Phi(sens_zyl+1:sens_zyl+sens_abschl) = rand([sens_abschl 1])*2*pi;

P_R(sens_zyl+1:sens_zyl+sens_abschl/2) = rand([sens_abschl/2 1])*r_1;
P_R(sens_zyl+sens_abschl/2+1:sens_zyl+sens_abschl) = rand([sens_abschl/2 1])*r_2;


%% karthesische Koordinaten erzeugen.
[X,Y,Z] = pol2cart(P_Phi,P_R,P_Z);
[S_R,S_Thetha,S_Phi] = cart2spher(X,Y,Z);