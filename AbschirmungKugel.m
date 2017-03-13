% 
% Dieses Skript berechent ein Feld resultirend aus inneren Quellen und
% äußeren Quellen, die als Störer angenommen werden, bereinigt diese wieder
% und gibt die abweichung vom Orgianl inneren Feld an
% 
% 
% eingabe Parameter:
% S_R ... Vector oder Matrix mit den Radien der einzelnen Punkte in
% Sphärischen Koordinaten
% S_Phi ... Vector oder Matrix mit den Winkeln der einzelnen Punkte in
% Sphärischen Koordinaten
% S_Thetha ... Vector oder Matrix mit den Winkeln der einzelnen Punkte in
% Sphärischen Koordinaten
% X ... Vector oder Matrix mit den X-koordinaten der einzelnen Punkte in
% Karthesischen Koosrdiaten
% Y ... Vector oder Matrix mit den Y-koordinaten der einzelnen Punkte in
% Karthesischen Koosrdiaten
% Z ... Vector oder Matrix mit den Z-koordinaten der einzelnen Punkte in
% Karthesischen Koosrdiaten
% 
% Dabei folgt die zuoordnung dem system:
% Punkt_1 = (X(1,1),Y(1,1),Z(1,1))
% bzw.
% Punkt_1 = (S_R(1,1),S_Thetha(1,1),S_Phi(1,1))
% 
% 
% Diese Daten sollten aus einem Speicherstand kommen, um die
% Vergelichbarkeit zu gewährleisten. Ist dies nicht der Fall können sie mit
% SensPosKugel erzeugt werden
%
% 
% 
% Ausgegeben wird:
% A_R ... Multipolamplituden der R komponente
% A_Phi ... Multipolamplituden der Phi komponente
% A_Thetha ... Multipolamplituden der Z komponente
% B_mult_R ... Matrix B_mult, R Anteil
% B_mult_Phi ... Matrix B_mult, Phi Anteil
% B_mult_Thetha ... Matrix B_mult, Z Anteil
% 
% A_innen_(R,Thetha,Phi) ... Multipolampituden der inneren Quellen
% B_mult_innen_(R,Thetha,Phi) ... innerer B_mult anteil
% 
% A_aussen_(R,Thetha,Phi) ... Multipolampituden der äußeren Quellen
% B_mult_aussen_(R,Thetha,Phi) ... äußerer B_mult anteil


%% Init stuff
%variablen:
tic
%magnetische Feldkonstante
mu_0 = 4*pi*10^-7;

L_in = 10;
L_out = 10;

[ B_mult_innen_R_Sph,B_mult_aussen_R_Sph,B_mult_innen_Thetha_Sph,B_mult_aussen_Thetha_Sph,B_mult_innen_Phi_Sph,B_mult_aussen_Phi_Sph ] ...
= B_mult_kugel( L_in,L_out,S_R,S_Thetha,S_Phi );
B_mult_R_Sph = [ B_mult_innen_R_Sph,B_mult_aussen_R_Sph ];
B_mult_Thetha_Sph = [B_mult_innen_Thetha_Sph,B_mult_aussen_Thetha_Sph];
B_mult_Phi_Sph = [B_mult_innen_Phi_Sph,B_mult_aussen_Phi_Sph];


toc
