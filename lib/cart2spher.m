function [ R,Thetha,Phi ] = cart2spher( X,Y,Z )
%function [ r,Thetha,Phi ] = cart2spher( X,Y,Z )
% Transformiert Karthesische Koordinaten in Sphärische Koordainten
% zugehörigfe Matlab funktion scheint nicht zu funktionieren

    R       = sqrt(X.^2+Y.^2+Z.^2);
    Thetha  = atan2((sqrt(X.^2+Y.^2)),Z);
    Phi     = atan2(Y,X);

end

