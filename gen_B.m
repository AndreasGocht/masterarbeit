%% Generierung von B
% Generierung der Manetfelder an den Senorpositionen, für den Zylindrischen
% und den Sphärischen fall.


% überführen der Raumpunkte in eine liste, lässt sich später einfacher verarbeiten
% Damit ist auch das eingabeforamt der Raumpunkte egal (Matrix oder Vektor)
% Die Kathesischen koordinaten sind notwendig, damit das Magnetfeld B
% berechnet werden kann, da die gleichugn nur in Karthesischen koordinaten
% gilt.

%% Konstanten
%magnetische Feldkonstante
mu_0 = 4*pi*10^-7;

%unsere dipolmomente zu denen wir das Feld berechnen:

mu_i = [0 0 1]';
% mu_i_2 = [0 0 1]';
% mu_i = [0 0 0]';
% mu_a = [0 0 1]';
mu_a = [0 0 1]';
% I_i = [0 0 1]';
% I_a = [0 0 100]';

%Position der Dipolquellen
r_i = [0 0 0]';
% r_i_2 = [0 0 -0.5]';
r_a = [3 0 0]';

%signal to Noise SNR = (sum(B)/N)/sigma
SNR = Inf;

%raumpunkte werden in SensorPos angelegt, oder aus speicherstand geladen
s = size(X);

%ok jetzt sind alle infos da um die Größen der Matritzen zu bestimmen:
%B_mult_R = zeros(k_max,m_max*4*2);
% 4 ... für die 4 Multipolampituden
% 2 ... weil innen und aussen zusammen gefügt werden müssen

B_R_Zyl = NaN(s(1)*s(2),1);
B_Phi_Zyl = NaN(s(1)*s(2),1);
B_Z_Zyl = NaN(s(1)*s(2),1);
B_i_R_Zyl = NaN(s(1)*s(2),1);
B_i_Phi_Zyl = NaN(s(1)*s(2),1);
B_i_Z_Zyl = NaN(s(1)*s(2),1);
B_a_R_Zyl = NaN(s(1)*s(2),1);
B_a_Phi_Zyl = NaN(s(1)*s(2),1);
B_a_Z_Zyl = NaN(s(1)*s(2),1);

B_R_Sph = NaN(s(1)*s(2),1);
B_Phi_Sph = NaN(s(1)*s(2),1);
B_Thetha_Sph = NaN(s(1)*s(2),1);
B_i_R_Sph = NaN(s(1)*s(2),1);
B_i_Phi_Sph = NaN(s(1)*s(2),1);
B_i_Thetha_Sph = NaN(s(1)*s(2),1);
B_a_R_Sph = NaN(s(1)*s(2),1);
B_a_Phi_Sph = NaN(s(1)*s(2),1);
B_a_Thetha_Sph = NaN(s(1)*s(2),1);


P_Cart = NaN(s(1)*s(2),3);
P_Zyl = NaN(s(1)*s(2),3);
P_Sph = NaN(s(1)*s(2),3);


%% Erzeugung des Feldes an den Sensorpositionen
k=0;
for i=1:s(1)
    for j=1:s(2)
        k = k+1;        
        
        %Zylindrisch
        P_Zyl(k,1) = P_R(i,j);
        P_Zyl(k,2) = P_Phi(i,j);
        P_Zyl(k,3) = P_Z(i,j);

        %Kugel
        P_Sph(k,1) = S_R(i,j);
        P_Sph(k,2) = S_Thetha(i,j);
        P_Sph(k,3) = S_Phi(i,j);
        
        
        %karthesisch
        P_Cart(k,1) = X(i,j);
        P_Cart(k,2) = Y(i,j);
        P_Cart(k,3) = Z(i,j);
    end
end

for n = 1:k
    
%% Inneres Feld

% ====dipol====    
    r_i_ = [P_Cart(n,1),P_Cart(n,2),P_Cart(n,3)]'-r_i;
    B_i = mu_0/(4*pi*norm(r_i_)^2) * (3*r_i_*(mu_i'*r_i_)-mu_i*norm(r_i_)^2)/(norm(r_i_)^3);
    
%     r_i_2_ = [P_Cart(n,1),P_Cart(n,2),P_Cart(n,3)]'-r_i_2;
%     B_i_2 = mu_0/(4*pi*norm(r_i_2_)^2) * (3*r_i_2_*(mu_i_2'*r_i_2_)-mu_i_2*norm(r_i_2_)^2)/(norm(r_i_2_)^3);


% ====unendlich langer leiter====
%   jeder punkt ist senkrecht zum unendlich langen leiter, d.h.
%   r_a_(3) = 0
%   und der es ist, vom leiter aus gesehen, keine R komponente vorhanden.
%   es folgt:
%     r_i_ = [P_Cart(l,1),P_Cart(l,2), 0 ]'- [r_i(1),  r_i(2), 0]';
%     phi = cart2pol(r_i_(1),r_i_(2));
%     [B_i(1,1),B_i(2,1),B_i(3,1)] = pol2cartVect(-mu_0*norm(I_i)./(2*pi*norm(r_i_)),0,0,phi);



% ====unendlich langer leiter====    
    
%% Äuseres Feld    
    
% ====dipol====
    r_a_ = [P_Cart(n,1),P_Cart(n,2),P_Cart(n,3)]'-r_a;
    B_a = mu_0/(4*pi*norm(r_a_)^2) * (3*r_a_*(mu_a'*r_a_)-mu_a*norm(r_a_)^2)/(norm(r_a_)^3);

% ====unendlich langer leiter====
%   jeder punkt ist senkrecht zum unendlich langen leiter, d.h.
%   r_a_(3) = 0
%   und der es ist, vom leiter aus gesehen, keine R komponente vorhanden.
%   phi = pi - sin((r_y-P_Y)/r)
%   es folgt:
%     r_a_ = [P_Cart(l,1),P_Cart(l,2), 0 ]'- [r_a(1),  r_a(2), 0]';
%     phi = cart2pol(r_a_(1),r_a_(2));
%     [B_a(1,1),B_a(2,1),B_a(3,1)] = pol2cartVect(-mu_0*norm(I_a)./(2*pi*norm(r_a_)),0,0,phi);
    
%     B_i = B_i + B_i_2;
    
    B_tmp = B_i + B_a;
    
    %% Einsetzen in Vektor B
    %aufteilen und umrechnen der komponeten
    
    B_i_X_Kart(n) = B_i(1);
    B_i_Y_Kart(n) = B_i(2);
    B_i_Z_Kart(n) = B_i(3);
    B_a_X_Kart(n) = B_a(1);
    B_a_Y_Kart(n) = B_a(2);
    B_a_Z_Kart(n) = B_a(3);

    [B_i_Phi_Zyl(n),B_i_R_Zyl(n),B_i_Z_Zyl(n)] = cart2polVect(B_i(1),B_i(2),B_i(3),P_Zyl(n,2));
    [B_a_Phi_Zyl(n),B_a_R_Zyl(n),B_a_Z_Zyl(n)] = cart2polVect(B_a(1),B_a(2),B_a(3),P_Zyl(n,2));
    [B_Phi_Zyl(n),B_R_Zyl(n),B_Z_Zyl(n)] = cart2polVect(B_tmp(1),B_tmp(2),B_tmp(3),P_Zyl(n,2));
    
    [B_i_R_Sph(n),B_i_Thetha_Sph(n),B_i_Phi_Sph(n)] = cart2spherVect(B_i(1),B_i(2),B_i(3),P_Sph(n,2),P_Sph(n,3));
    [B_a_R_Sph(n),B_a_Thetha_Sph(n),B_a_Phi_Sph(n)] = cart2spherVect(B_a(1),B_a(2),B_a(3),P_Sph(n,2),P_Sph(n,3));
    [B_R_Sph(n),B_Thetha_Sph(n),B_Phi_Sph(n)] = cart2spherVect(B_tmp(1),B_tmp(2),B_tmp(3),P_Sph(n,2),P_Sph(n,3));
    
    
    
    
    
end


%  noch nicht optimal ... ein hoher äuserer Fehler ändert das rauschen nicht ... es sollte festgelegt werden auf einen wert
sigma_Zyl = (sum(abs(B_R_Zyl))/length(B_R_Zyl))/SNR;
sigma_Sph = (sum(abs(B_R_Sph))/length(B_R_Sph))/SNR;

B_R_Zyl_N = B_R_Zyl + sigma_Zyl*randn(length(B_R_Zyl),1);
B_R_Sph_N = B_R_Sph + sigma_Sph*randn(length(B_R_Sph),1);
