function [ B_1,B_2,B_3,B_4 ] = B_zylinder_innen(nu,kappa_z,d_kappa_z,l,R,phi,z)
% B_zylinder_innen gibt die ergebinsse der verschiedenen
% Fundameltallösungen zurrück
% 
%Generiert das ergbis der fundamentallösung B_1..4 in abhängigkeit von nu,
%kappa_z,R und phi. Für die bedeutung der Variablen siehe die arbeit.
%Aus diesen werten kann später z.B. eine MAtrix zur bestimmung der
%mutlipolamplitunden generiert werden.
%B_1(1) = R
%B_1(2) = phi
%B_1(3) = z
%usw.
% l ... definiert die Periode

%definition der Konstanten

mu_0 = 4.*pi.*10.^-7;

w = 2.*pi./l;

%B_1(1) = R
%B_1(2) = phi
%B_1(3) = z
if (kappa_z~=0)
   if(nu~=0)
       dZdR = - w.*kappa_z.*(besselk(nu-1,w.*kappa_z.*R)+besselk(nu+1,w.*kappa_z.*R))./2;
   else
       dZdR = - w.*kappa_z.*besselk(1,w.*kappa_z.*R);
   end
   Z = besselk(nu,w.*kappa_z.*R);
else
   if(nu~=0)
       dZdR = -nu.*R.^-(nu+1);
       Z = R.^-nu;
   else
       dZdR = 1./R;
       Z = log(R);
   end
end

if (nu ~= 0)
%     disp('nu ~= 0');
    B_1(1,:) = - mu_0 .* d_kappa_z .* dZdR .* cos(nu.*phi).*cos(w.*kappa_z.*z);
    B_1(2,:) = + mu_0 .* d_kappa_z .* 1./R .* Z .* nu .* sin(nu.*phi).*cos(w.*kappa_z.*z);
    B_1(3,:) = + mu_0 .* d_kappa_z .* Z .* cos(nu.*phi).*w.*kappa_z.*sin(w.*kappa_z.*z);

    B_2(1,:) = - mu_0 .* d_kappa_z .* dZdR .* cos(nu.*phi).*sin(w.*kappa_z.*z);
    B_2(2,:) = + mu_0 .* d_kappa_z .* 1./R .* Z .* nu .* sin(nu.*phi).*sin(w.*kappa_z.*z);
    B_2(3,:) = - mu_0 .* d_kappa_z .* Z .* cos(nu.*phi).*w.*kappa_z.*cos(w.*kappa_z.*z);

    B_3(1,:) = - mu_0 .* d_kappa_z .* dZdR .* sin(nu.*phi).*cos(w.*kappa_z.*z);
    B_3(2,:) = - mu_0 .* d_kappa_z .* 1./R .* Z .* nu .* cos(nu.*phi).*cos(w.*kappa_z.*z);
    B_3(3,:) = + mu_0 .* d_kappa_z .* Z .* sin(nu.*phi).*w.*kappa_z.*sin(w.*kappa_z.*z);

    B_4(1,:) = - mu_0 .* d_kappa_z .* dZdR .* sin(nu.*phi).*sin(w.*kappa_z.*z);
    B_4(2,:) = - mu_0 .* d_kappa_z .* 1./R .* Z .* nu .* cos(nu.*phi).*sin(w.*kappa_z.*z);
    B_4(3,:) = - mu_0 .* d_kappa_z .* Z .* sin(nu.*phi).*w.*kappa_z.*cos(w.*kappa_z.*z);
else
%     disp('nu == 0');
    B_1(1,:) = - mu_0 .* d_kappa_z .* dZdR .*cos(w.*kappa_z.*z);
    B_1(2,:) = - mu_0 .* d_kappa_z .* 1./R ;
    B_1(3,:) = + mu_0 .* d_kappa_z .* Z .* w.*kappa_z.*sin(w.*kappa_z.*z);

    B_2(1,:) = - mu_0 .* d_kappa_z .* dZdR .*sin(w.*kappa_z.*z);
    B_2(2,:) = - mu_0 .* d_kappa_z .* 1./R ;
    B_2(3,:) = - mu_0 .* d_kappa_z .* Z .* w.*kappa_z.*cos(w.*kappa_z.*z);

    B_3(1,:) = 0;
    B_3(2,:) = 0;
    B_3(3,:) = 0;

    B_4(1,:) = 0;
    B_4(2,:) = 0;
    B_4(3,:) = 0;
end


end

