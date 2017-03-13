function [b_1,b_2,b_3,b_4] = genFourierKoeffizienten(Phi,Z,B_R,nu,kappa_z,l)
%function [b_1,b_2,b_3,b_4] = genFourierKoeffizienten(R,Phi,Z,B_R,nu,kappa_z,l)
% generiert die Foutrier Koeffizienten für nu und kappa_z, indem über Phi 
% und Z integriert wird.
% R muss dabei konstant bleiben!
% 

    N = length(Phi);

    df = 2*pi*l/N;
    w = 2*pi/l;
% analog zu B_zylinder_innen
    b_1 = (2/l)* (2/(2*pi)) * sum(B_R.*cos(nu.*Phi).*cos(w.*kappa_z.*Z)).*df;
    b_2 = (2/l)* (2/(2*pi)) * sum(B_R.*cos(nu.*Phi).*sin(w.*kappa_z.*Z)).*df;
    b_3 = (2/l)* (2/(2*pi)) * sum(B_R.*sin(nu.*Phi).*cos(w.*kappa_z.*Z)).*df;
    b_4 = (2/l)* (2/(2*pi)) * sum(B_R.*sin(nu.*Phi).*sin(w.*kappa_z.*Z)).*df;

%     b_1 = (2/l)* (2/(2*pi)) * sum(B_R.*sin(nu.*P(:,2)).*sin(w.*kappa_z.*P(:,3))).*df;
%     b_2 = (2/l)* (2/(2*pi)) * sum(B_R.*cos(nu.*P(:,2)).*sin(w.*kappa_z.*P(:,3))).*df;
%     b_3 = (2/l)* (2/(2*pi)) * sum(B_R.*sin(nu.*P(:,2)).*cos(w.*kappa_z.*P(:,3))).*df;
%     b_4 = (2/l)* (2/(2*pi)) * sum(B_R.*cos(nu.*P(:,2)).*cos(w.*kappa_z.*P(:,3))).*df;

    
end