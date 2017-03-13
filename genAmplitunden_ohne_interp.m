function [A_i,A_a,B_R] = genAmplitunden_ohne_interp(R,Phi,Z,B_R,nu_max,kappa_z_max,l,d_kappa_z,r_i,r_a)
%function [A_i,A_a] = genAmplitunden_ohne_interp(R,Phi,Z,B_R,nu_max,kappa_z_max,l,d_kappa_z,r_i,r_a)
%  gernerirt die Multipolamplituden durch integration über die beiden Zylinderoberflächen, analog
%  zur Masterarbeit "Die zylindrische Multipolentwicklung und ihre Anwendung bei der
%  Magnetokardiographie" kap. 2.5. Diese version verzichtet auf Interpolation
%  
%  Eingabe:
%  R,Phi,Z ... generiert von SensorPosZyl, die Zylinderkomponenten P_R,P_...
%  B_R ... gerneiert von gen_B
%  nu_max,kappa_max ... max für nu und kappa
%  l ... periodendauer aus 
%  d_kappa_z ... meistens 1 sonst wie in Abschirmung_B_all,
%  r_i,r_a ... aus SensorPosZyl
%  
%  Ausgabe
%  A_i ... multipolamplituden innerhlab des Zylinders
%  A_a ...  multipolamplituden für außerhalb des Zylinders

tic
length_i = (nu_max+1)*kappa_z_max*4;
length_a = length_i;

A_i = zeros([length_i 1]);
A_a = zeros([length_a 1]);

%% Interpolation

% [B_R,R,Phi,Z] = interpolation(B_R,R,Phi,Z,r_i,r_a,l);
% [Phi,R,Z] = cart2pol(X,Y,Z);


%% Berechnung

m=0;

for kappa_z = 1:kappa_z_max
    for nu = 0:nu_max
        [A_1,A_2,A_3,A_4] = genFourierAmplituden(R,Phi,Z,B_R,nu,kappa_z,l,d_kappa_z);
        
        if(nu~=0)
            A_i(m*4+1) = A_1(1);
            A_i(m*4+2) = A_2(1);
            A_i(m*4+3) = A_3(1);
            A_i(m*4+4) = A_4(1);

            A_a(m*4+1) = A_1(2);
            A_a(m*4+2) = A_2(2);
            A_a(m*4+3) = A_3(2);
            A_a(m*4+4) = A_4(2);
        else
            A_i(m*4+1) = A_1(1)/2;
            A_i(m*4+2) = A_2(1)/2;
            A_i(m*4+3) = 0;
            A_i(m*4+4) = 0;

            A_a(m*4+1) = A_1(2)/2;
            A_a(m*4+2) = A_2(2)/2;
            A_a(m*4+3) = 0;
            A_a(m*4+4) = 0;            
        end
        
        m=m+1;
    end
end
toc


end