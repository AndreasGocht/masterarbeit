function [ X,Y,Z ] = spher2cartVect( A_R,A_Thetha,A_Phi,Phi,Thetha )
%function [ X,Y,Z ] = spher2cartVect( A_R,A_Thetha,A_Phi,Phi,Thetha )
% Transformiert Polarvektoren in Karthesischevektoren
% nimt die Vektoren A_R,A_Thetha,A_Phi und transformiert sie in Kathesische
% Koordinaten.
% A_R,A_Thetha,A_Phi  sind die Polarvektorkomponenten
% Phi und Thetha sind die Winkel an dem diese liegen
% X,Y,Z sind die Karthesischen Vektoren, die ausgegeben werden

    X = A_R.*sin(Thetha).*cos(Phi) + A_Thetha.*cos(Thetha).*cos(Phi) - A_Phi.*sin(Phi);
    Y = A_R.*sin(Thetha).*sin(Phi) + A_Thetha.*cos(Thetha).*sin(Phi) + A_Phi.*cos(Phi);
    Z = A_R.*cos(Thetha) - A_Thetha.*sin(Thetha);

end

