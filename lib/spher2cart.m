function [ X,Y,Z ] = spher2cart( R,Thetha,Phi)
%function  [ X,Y,Z ] = spher2cart( R,Thetha,Phi)
% Transformiert Kugelkoordinaten Koordinaten in Karthesiche Koordainten
% zugehörigfe Matlab funktion scheint nicht zu funktionieren

    X = R.*sin(Thetha).*cos(Phi);
    Y = R.*sin(Thetha).*sin(Phi);
    Z = R.*cos(Thetha);

end

