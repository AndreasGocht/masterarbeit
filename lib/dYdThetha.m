function [ dY_nm ] = dYdThetha(n,thetha,phi)
%function [ dY_nm ] = dYdThetha(n,thetha,phi)
%   Berechnet die Ableitung von Y_nm nach dThetha also dY_nm/dThetha
    
% wenn m>n ist Y_nm = 0, ist hier notwendig
    Y_n = [0 Y(n,thetha,phi) 0];
    
%     länge m um 2 kleiner wegen der führenden nullen
    for m = 1:length(Y_n)-2
%         m+1-> da die indizes in Y_n verschoen sind, durch die führende
%         und endende 0
        dY_nm(m) = Y_n(m+1+1)-(n-m+1)*(n+m)*Y_n(m+1-1);
    end
end

