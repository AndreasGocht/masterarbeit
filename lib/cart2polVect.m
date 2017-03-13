function [A_Phi,A_R,A_Z] = cart2polVect( X,Y,Z,Phi )
%function [A_Phi,A_R,A_Z] = cart2polVect( X,Y,Z,Phi )
% Transformiert carthesische vektoren in Polarvektoren.
% nimmt vektoren X,Y,Z und transformiert diese Vectoren in Ploarkoordinaten.
% X,Y sind die Vektorkomponenten
% Phi ist der Winkel an dem der Vektor liegt und Transformiert wird.
% Ausgegeben werden A_Phi, A_R und A_Z die transformierten Koordiaten
    
    A_Z=Z;
    A_R =     X.*cos(Phi) + Y.*sin(Phi);
    A_Phi = - X.*sin(Phi) + Y.*cos(Phi);
    



end

