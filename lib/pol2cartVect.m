function [ X,Y,Z ] = pol2cartVect( A_Phi,A_R,A_Z,Phi )
%function [ X,Y,Z ] = pol2cartVect( A_Phi,A_R,A_Z,Phi ) 
% Transformiert Polarvektoren in Karthesischevektoren
% nimt die Vektoren A_Phi,A_R,A_Z und transformiert sie in Kathesische
% Koordinaten.
% A_Phi,A_R,A_Z sind die Polarvektorkomponenten
% Phi ist der Winkel an dem diese liegen
% X,Y,Z sind die Karthesischen Vektoren, die ausgegeben werden

Z=A_Z;
X = A_R.*cos(Phi) - A_Phi.*sin(Phi);
Y = A_R.*sin(Phi) + A_Phi.*cos(Phi);

end

