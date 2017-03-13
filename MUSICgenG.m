function  [G_Zyl,Pl] = MUSICgenG(X,Y,Z,Phi,xl,yl,zl)
%function  [G_Zyl,Pl] = MUSICgenG(X,Y,Z,Phi,xl,yl,zl)
% Generiert die Gainmatrix, zu den Sensorpositionen X,Y,Z für die Dipol
% positionen xl,yl,zl.
% Phi ist der winkel der Sensorpositionen.
% Diese Funktion liefert als resultat nur die Radialkomponente, sowie die
% liste der koordinaten, wie sie mit der GainMatrix verknüpft sind

    s = size(X);
    
    P=NaN([s(1)*s(2) 3]);
    PPhi = NaN([s(1)*s(2) 1]);
    
    mu_0 = 4*pi*10^-7;
    
    
    k=0;
    for i=1:s(1)
        for j=1:s(2)
            k=k+1;

            P(k,1) = X(i,j);
            P(k,2) = Y(i,j);
            P(k,3) = Z(i,j);
            PPhi(k,1) = Phi(i,j);
        end
    end
    
    [s1 s2 s3] = size(xl);
    
    Pl=NaN([s1*s2*s3 3]);
    
    k=0;
    
    for i=1:s1
        for j=1:s2
            for l=1:s3
                k=k+1;
                
                Pl(k,1) = xl(i,j,l);
                Pl(k,2) = yl(i,j,l);
                Pl(k,3) = zl(i,j,l);
            end
        end
    end
    
%     G_Zyl = NaN([length(Pl) length(P) 3]);

    mu = [0 0 1]';

    h = waitbar(0,'calc');
    for j=1:length(Pl)
        for i = 1:length(P)
            r = [P(i,1),P(i,2),P(i,3)]'-[Pl(j,1),Pl(j,2),Pl(j,3)]';
            G = mu_0/(4*pi)* (3*r*r'/norm(r)^5 - eye(3)/norm(r)^5);
            [~,G_R,~] = cart2polVect(G(1,:),G(2,:),G(3,:),PPhi(i,1));
%             G = mu_0/(4*pi*norm(r)^2) * (3*r*(mu'*r)-mu*norm(r)^2)/(norm(r)^3);
%             [~,G_R,~] = cart2polVect(G(1,:),G(2,:),G(3,:),PPhi(i,1));
%             G_Zyl(j,i,:) = G_R;
            G_Zyl(i,(j-1)*3+1:(j-1)*3+3) = G_R;
        end
        waitbar(j/length(Pl),h);
    end
    close(h)
    
%     G =ha_mgain(P(:,1),P(:,2),P(:,3),Pl(:,1),Pl(:,2),Pl(:,3),PPhi(:,1));
end
