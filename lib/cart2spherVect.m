function [ A_R,A_Thetha, A_Phi] = cart2spherVect( X,Y,Z,Thetha,Phi)
%[ A_R,A_Thetha, A_Phi] = cart2spherVect( X,Y,Z,Thetha,Phi)
%Transformiert karthesische Vektoren in Sphärische Vektoren.
% X,Y,Z sind die Vektorkomponenten
% Phi und Thetha sind die Winkel an dem der Vektor liegt und Transformiert wird.
% Ausgegeben werden A_R,A_Thetha und A_Phi die transformierten Koordiaten

    A_R = X.*sin(Thetha).*cos(Phi) + Y.*sin(Thetha).*sin(Phi) + Z.*cos(Thetha);
    A_Thetha = X.*cos(Thetha).*cos(Phi) + Y.*cos(Thetha).*sin(Phi) - Z.*sin(Thetha);
    A_Phi = -X.*sin(Phi) +Y.*cos(Phi);


end

