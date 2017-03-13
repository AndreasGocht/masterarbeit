% SensorPosKugel bestimmt die Postition der sensoren zufällig auf einer
% Kugel

%aufräumen, alles was nicht gespeichert worden ist hat pech gehabt.

clear all

% r ... radius der Kugel
% sens ... Anzahl der Sensoren

r_1 = 0.99 ;
r_2 = 1.01;

thetha_fak = pi;

sens = 5000;

%doppelschicht erzeugen.
S_R(1:sens/2) = r_1;
S_R(sens/2+1:sens) = r_2;
% S_R(1:sens) =  0.5;

%zufällige Zahlen zwischen 0 und 2*pi, in einem Vector

% S_Thetha(1:sens) = rand([sens 1])*pi;
S_Thetha(1:sens/4) = rand([sens/4 1])*thetha_fak;
S_Thetha(sens/4+1:sens/2) = pi - rand([sens/4 1])*thetha_fak;

S_Thetha(sens/2+1:3*sens/4) = rand([sens/4 1])*thetha_fak;
S_Thetha(3*sens/4+1:sens) = pi - rand([sens/4 1])*thetha_fak;


S_Phi(1:sens) = rand([sens 1])*2*pi-pi;

h = 2*r_2;

%karthesische Koordinaten erzeugen.
[X,Y,Z] = spher2cart(S_R,S_Thetha,S_Phi);
[P_Phi,P_R,P_Z] = cart2pol(X,Y,Z);
