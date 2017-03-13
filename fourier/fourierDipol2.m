function [B_R B_R_r A] = fourierDipol2(z,R,phi,kappa_z_max,nu_max,f,l,r_Q)
%function [B_R B_R_r] = fourierDipol2(z,R,phi,kappa_z_max,nu_max,f,l,r_Q)
% Berechnet die Fourierentwicklung für einen dipol der auf der Z-Achse
% verschoben ist
    R_S = R;
    Z_S = z;
    Phi_S = phi;

    R_Q = r_Q(1);
    Phi_Q = r_Q(2);
    Z_Q = r_Q(3);

    
    d_kappa_z = 1;
    mu_0 = 4*pi*10^-7;
    B_R = zeros(size(z));
    w = 2*pi/l;
    
%     unabhängig von nu und kappa_z
    B_org = @(R_S,Phi_S,Z_S) mu_0/(4.*pi) .*(3.*(Z_S-Z_Q).*(R_S - R_Q.*cos(Phi_S-Phi_Q)))./...
            sqrt((R_S - R_Q.*cos(Phi_S-Phi_Q)).^2+(R_Q.*sin(Phi_S-Phi_Q)).^2 + (Z_S-Z_Q).^2).^5;

    i = 0;

    for kappa_z = 1:kappa_z_max
        for nu = 0:nu_max
            i=i+1;
            
            if(nu~=0)
			  dZdR = @(R)-w.*kappa_z.*(besselk(nu-1,w.*kappa_z.*R)+besselk(nu+1,w.*kappa_z.*R))/2;
			else
			  dZdR = @(R)-w.*kappa_z.*besselk(1,w.*kappa_z.*R);
            end
                
                fun_a = @(Z) B_org(f,0,Z) .* sin(w.*kappa_z.*Z);
                a_nu_kappa = 2/(l) .* integral(fun_a,-l/2,l/2);
                A_nu_kappa_1 = -a_nu_kappa/(mu_0.*d_kappa_z.*dZdR(f));
                A(1,i) = A_nu_kappa_1;
                
                fun_b = @(Z) B_org(f,0,Z) .* cos(w.*kappa_z.*Z);
                b_nu_kappa = 2/(l) .* integral(fun_b,-l/2,l/2);
                A_nu_kappa_2 = -b_nu_kappa/(mu_0.*d_kappa_z.*dZdR(f));
                A(2,i) = A_nu_kappa_2;
                
            if(kappa_z~=0)
                B_R = B_R ...
                        -mu_0.*A_nu_kappa_1.*d_kappa_z.*dZdR(R_S).*sin(w.*kappa_z.*Z_S) ...
                        -mu_0.*A_nu_kappa_2.*d_kappa_z.*dZdR(R_S).*cos(w.*kappa_z.*Z_S);
            else
                B_R = B_R ...
                        -mu_0.*A_nu_kappa_2.*d_kappa_z.*dZdR(R_S).*1./2;

            end
        end
    end
    
    B_R_r = B_org(R_S,Phi_S,Z_S);
end
