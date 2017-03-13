function [A_1,A_2,A_3,A_4,e_rcond] = genFourierAmplituden(R,Phi,Z,B_R,nu,kappa_z,l,d_kappa_z)
%function [A_1,A_2,A_3,A_4] = genFourierAmplituden(R,Phi,Z,B_R,nu,kappa_z,l)
% gerneriert die Multipolamplitunden für nu und kappa. Wichtig ist das R(1:length(R)/2)
% konstant ist, und der Rest von R konstant ist.
% A_1(1) ... dKdR(R_1)
% A_1(2) ... didR(R_1)

    s = size(R);
    P = zeros([s(1)*s(2) 3]);
    w = 2*pi/l;
    
    k=0;
    for i=1:s(1)
        for j=1:s(2)
            k = k+1;

            %Zylindrisch
            P(k,1) = R(i,j);
            P(k,2) = Phi(i,j);
            P(k,3) = Z(i,j);
        end
    end
    
    len = length(P);
    R_1 = P(len/2,1);
    R_2 = P(len/2+1,1);
    
    mu_0 = 4*pi*10^-7;
    
    if(R_1==R_2)
        disp('die radien Stimmen nicht! siehe Doku');
        return
    end
    
    [b_1_R_1,b_2_R_1,b_3_R_1,b_4_R_1] = genFourierKoeffizienten(...
            P(1:len/2,2),P(1:len/2,3),B_R(1:len/2),nu,kappa_z,l);
    [b_1_R_2,b_2_R_2,b_3_R_2,b_4_R_2] = genFourierKoeffizienten(...
            P(len/2+1:len,2),P(len/2+1:len,3),B_R(len/2+1:len),nu,kappa_z,l);
    
    b_1 = [b_1_R_1;b_1_R_2];
    b_2 = [b_2_R_1;b_2_R_2];
    b_3 = [b_3_R_1;b_3_R_2];
    b_4 = [b_4_R_1;b_4_R_2];
   
    if(nu~=0)
      dKdR = @(R)-w.*kappa_z.*(besselk(nu-1,w.*kappa_z.*R)+besselk(nu+1,w.*kappa_z.*R))/2;
      dIdR = @(R) w.*kappa_z.*(besseli(nu-1,w.*kappa_z.*R)+besseli(nu+1,w.*kappa_z.*R))/2;      
	else
	  dKdR = @(R)-w.*kappa_z.*besselk(1,w.*kappa_z.*R);
      dIdR = @(R) w.*kappa_z.*besseli(1,w.*kappa_z.*R);      
    end
    
    dZdR = - mu_0.*d_kappa_z.*[dKdR(R_1) dIdR(R_1);...
                             dKdR(R_2) dIdR(R_2)];
                         
    A_1 = dZdR\b_1; 
    A_2 = dZdR\b_2;
    A_3 = dZdR\b_3;
    A_4 = dZdR\b_4;
    
    e_rcond = rcond(dZdR);
end
