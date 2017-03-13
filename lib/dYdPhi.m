function [ dY_nm ] = dYdPhi( n,thetha,phi )
%function [ dY_nm ] = dYdThetha(n,thetha,phi)
%   Berechnet die Ableitung von Y_nm nach dPhi also dY_nm/dPhi

    Y_n = Y(n,thetha,phi);

    for m=1:length(Y_n)
        dY_nm(m) = 1i*m*Y_n(m);
    end

end

