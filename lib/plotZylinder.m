function [ h ] = plotZylinder( X,Y,Z,B )
%function [ h ] = plotZylinder( X,Y,Z,B )
%   Plottet ein Feld auf ein Doppellagigen Zylinder, erstelt mit SensorPosZyl

    s = size(X);
    
    k = 0;
    for i=1:s(1)
        for j=1:s(2)
            k = k+1;
            B_new(i,j) = B(k);
        end
    end

    l = s(1);
    
%     h = surf([X(1:l/2,:) X(1:l/2,1)],[Y(1:l/2,:) Y(1:l/2,1)],[Z(1:l/2,:) Z(1:l/2,1)],[B_new(1:l/2,:) B_new(1:l/2,1)]);  
    h(1) = surf(X(1:l/2,:),Y(1:l/2,:),Z(1:l/2,:),B_new(1:l/2,:));
    hold all
    
%     surf([X(l/2+1:l,:) X(l/2+1:l,1)],[Y(l/2+1:l,:) Y(l/2+1:l,1)],[Z(l/2+1:l,:) Z(l/2+1:l,1)],[B_new(l/2+1:l,:) B_new(l/2+1:l,1)]);    
    h(2) = surf(X(l/2+1:l,:),Y(l/2+1:l,:),Z(l/2+1:l,:),B_new(l/2+1:l,:));        
    hold off
end

