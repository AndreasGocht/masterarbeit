function  [location,err] = MUSICfindPos(G,B,Pl)
%function  [location,err] = MUSICfindPos(G,B,Pl)
% einfache implementierung zur Quelllokalisation
% G ... GainMatrix aus MUSICgenG
% B ... die Radialkomponente der Feldes
% Pl ... die mit G verknüpfte location liste
    for i = 1:length(Pl)
        J((i-1)*3+1) = norm(B-G(:,(i-1)*3+1));
        J((i-1)*3+2) = norm(B-G(:,(i-1)*3+2));
        J((i-1)*3+3) = norm(B-G(:,(i-1)*3+3));
    end
    [err,ind] = min(J);
    
    ind = fix(ind/3);
    
    location = [Pl(ind,1) Pl(ind,2) Pl(ind,3)];
end