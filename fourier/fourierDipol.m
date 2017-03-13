function [B_R B_R_r A_0_S] = fourierDipol(z,R,kappa_z_max,a,l)
%B_R = fourierDipol(z,R,kappa_z_max,a,l)
% Berechnet die Fourierentwicklung für einen dipol im ursprung
% kappa_z_max ist equivalent zu dem maximalwert für kappa in der Arbeit

    d_kappa_z = 1;
    mu_0 = 4*pi*10^-7;
    B_R = zeros(size(z));
    w = 2*pi/l;

    for kappa_z = 1:kappa_z_max
        fun = @(Z) mu_0/(4.*pi) * (3.*Z.*a)./sqrt(a.^2 + Z.^2).^5 .* conj(sin(w.*kappa_z .* Z));
        b_0 = 2/l * integral(fun,-l/2,l/2);
        A_0 = - b_0 / (mu_0.* d_kappa_z * w* kappa_z * besselk(1,w*kappa_z*a));
        A_0_S(kappa_z) = A_0;
        B_R = B_R - mu_0.* A_0 * d_kappa_z * w * kappa_z * besselk(1, w * kappa_z *R)*sin( w *kappa_z* z);
    end
    
    B_R_r= mu_0./(4.*pi) .* 3 .*z.*R./(sqrt(R.^2+z.^2)).^5;
end