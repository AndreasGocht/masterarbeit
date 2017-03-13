function [ Y_nm ] = Y( n,thetha,phi)
%errechnet die Kugelflächenfunktionen für m=-n bis n und speichert diese in
%einem array

    P_n = legendre(n,cos(thetha)); %legendere polynome von 0 bis n
    s = length(P_n);  
    
%     positive m und m=0
    for j = 1:s
        m = j-1;
        Y_nm((s-1)+j) = sqrt((2*n+1)/(4*pi) * factorial(n-m)/factorial(n+m)) * P_n(j)*exp(1i*m*phi);
    end
%     negative m
    for j = 1:s-1
        m=j;
        Y_nm(s-j) = (-1)^m*conj(Y_nm(s+j));
    end
end

