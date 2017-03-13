function  [l,e] = MUSICfindPos3(G,B,Pl)
%function  [l,e] = MUSICfindPos3(G,B,Pl)
% Ermiitelt die Position eines Dipols Aus dem Magentfeld
% G ... Fain matrix
% B ... Magnetfeld
% Pl ... Liste der Punkte die auch zur generieung der Gainmatrix verwendet
% wurden.
% Verfahren wie in "Multiple Dipole Modeling and Localisation from Spatio-Temporal MEG Data"
% [Mosher] S. 550 IV C Fixed Orientated Dipoles
% 

    [u,~,~]=svd(B);
    p=1; % Anzahl der Dipole
    P = u(:,p+1:end)*u(:,p+1:end)';
    
    
    
    h = waitbar(0,'calc');
    for i = 1:(size(G,2)/3)
        G_i = [G(:,(i-1)*3+1) G(:,(i-1)*3+2) G(:,(i-1)*3+3)];
        
        [ug,~,~] = svd(G_i);
        
        tmp = ug(:,1:3)'*P*ug(:,1:3);
        J(i) = min(eig(tmp));
        
        waitbar(i/(size(G,2)/3),h);
    
    end
    close(h);
    
%     [~,ind] = min(J);
%     
%     l = Pl(ind,:);
%     e(:,1) = J(ind);
    
    [~,ind] = sort(J);
    l = Pl(ind(1:p),:);
    e(:,1) = J(ind(1:p));

end