function  [l,e] = MUSICfindPos2(G,B,Pl)
%function  [l,e] = MUSICfindPos2(G,B,Pl)
% Ermiitelt die Position eines Dipols Aus dem Magentfeld
% G ... Fain matrix
% B ... Magnetfeld
% Pl ... Liste der Punkte die auch zur generieung der Gainmatrix verwendet
% wurden.
% Verfahren wie in "Multiple Dipole Modeling and Localisation from Spatio-Temporal MEG Data"
% [Mosher] S. 549 IV B Rotationg Dipole Modell
% 


    [u,~,~]=svd(B);
    p=1;
    P = u(:,3*p+1:end)*u(:,3*p+1:end)';
    
    h = waitbar(0,'calc');
    for i = 1:size(G,2)/3
        
        waitbar(i/(size(G,2)/3),h);
        
        G_i = [G(:,(i-1)*3+1) G(:,(i-1)*3+2) G(:,(i-1)*3+3)];
%         G_i = G(:,i);
        J(i) = norm(P*G_i,'fro')^2/norm(G_i,'fro')^2;

%         P_(:,:,i) = P*G_i;
%         J(i) = norm(P_(:,:,i),'fro')^2/norm(G_i,'fro')^2;
    
    end
    close(h)
    
    [~,ind] = sort(J);
    
    l = Pl(ceil(ind(1:p)/3),:);
    e(:,1) = J(ind(1:p));
    
    

end