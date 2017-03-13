% 
% Dieses Skript fügt die Matritzen zusammen, und sorgt somit für die 
% Generation von B_mult. Die berechnung der zugehörigen Felder erfolgt im
% Moment mittels gen_B, und das berechnen der der Multipolamplitunden
% erfolgt manuel mittels A_R = B_mult_R\B_R.
% für alles werden folgende daten benötigt:
% 
% eingabe Parameter:
% P_R ... Vector oder Matrix mit den Radien der einzelnen Punkte in
% Polarkoordianten
% P_Phi ... Vector oder Matrix mit den Winkeln der einzelnen Punkte in
% Polarkoordianten
% P_Z ... Vector oder Matrix mit den Z-koordinaten der einzelnen Punkte in
% Polarkoordianten
% Z ... Vector oder Matrix mit den Z-koordinaten der einzelnen Punkte in
% Katrhesischen Koordinaten
% X ... Vector oder Matrix mit den X-koordinaten der einzelnen Punkte in
% Katrhesischen Koordinaten
% Y ... Vector oder Matrix mit den Y-koordinaten der einzelnen Punkte in
% Katrhesischen Koordinaten
% h ... höhe des Zylinders wird für die ermittlung von kappa_z benötigt.
% Dabei folgt die zuoordnung dem system:
% Punkt_1 = (X(1,1),Y(1,1),Z(1,1))
% bzw.
% Punkt_1 = (P_R(1,1),P_Phi(1,1),P_Z(1,1))
% 
% Diese Daten sollten aus einem Speicherstand kommen, um die
% Vergelichbarkeit zu gewährleisten. Ist dies nicht der Fall können sie mit
% SensPos erzeugt werden
%
% 
% 
% Ausgegeben wird:
% A_R ... Multipolamplituden der R komponente
% A_Phi ... Multipolamplituden der Phi komponente
% A_Z ... Multipolamplituden der Z komponente
% B_mult_R ... Matrix B_mult, R Anteil
% B_mult_Phi ... Matrix B_mult, Phi Anteil
% B_mult_Z ... Matrix B_mult, Z Anteil
% 
% A_innen_(R,Phi,Z) ... Multipolampituden der inneren Quellen
% B_mult_innen_(R,Phi,Z) ... innerer B_mult anteil
% 
% A_aussen_(R,Phi,Z) ... Multipolampituden der äußeren Quellen
% B_mult_aussen_(R,Phi,Z) ... äußerer B_mult anteil

%% Init stuff
%variablen:


%maximalwerte für nu un kappa, bis zu denen summiert werden soll
nu_max_i = 10;
kappa_max_i = 40;

nu_max_a = 10;
kappa_max_a = 40;

% zeitmessung
tic

%% Berechnen der B_mult_... Matritzen
[B_mult_innen_R_Zyl,B_mult_innen_Phi_Zyl,B_mult_innen_Z_Zyl] = B_mult_innen_B_all(P_R,P_Phi,P_Z,l,nu_max_i,kappa_max_i);
[B_mult_aussen_R_Zyl,B_mult_aussen_Phi_Zyl,B_mult_aussen_Z_Zyl] = B_mult_aussen_B_all(P_R,P_Phi,P_Z,l,nu_max_a,kappa_max_a);

%% Zusammenfügen der Matritzen
B_mult_R_Zyl = [B_mult_innen_R_Zyl,B_mult_aussen_R_Zyl];
B_mult_Phi_Zyl = [B_mult_innen_Phi_Zyl,B_mult_aussen_Phi_Zyl];
B_mult_Z_Zyl = [B_mult_innen_Z_Zyl,B_mult_aussen_Z_Zyl];

%ausgeben der Zeit
toc


