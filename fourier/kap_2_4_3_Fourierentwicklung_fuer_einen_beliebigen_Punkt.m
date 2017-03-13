close all;
% 3.4.3 Fourierentwicklung eines Dipol an einem Beliebigen Punkt,
% fall nahe an einem Zylinder (0.5 und 1.5), verbesserung der Ergebnisse,
% durch erhöhung der kappa_max werte




save_size = [600 400];
path = '../../Arbeit/grafiken/3_4_3_Fourierentwicklung_fuer_einen_beliebigen_Punkt/';

fak = 4;
l = fak*pi;
a = 1;


%% kappa_amx = 10
kappa_z_max = 10;
nu_max = 10;

r_Q = [0.5 0 0]';
%% innen
% Z;
Z = -l/2:pi/20000:l/2;
R = 1;
Phi = 0;

[B_R_Z B_R_r_Z] = fourierDipolAllInnen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(1) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Z_innen.eps'],save_size ,'Z','B')

% Phi;
Z = 1;
R = 1;
Phi = 0:pi/10000:2*pi;

[B_R_Z B_R_r_Z] = fourierDipolAllInnen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(2) = plot_and_save(B_R_Z,B_R_r_Z,Phi,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Phi_innen.eps'],save_size ,'$\varphi$','B')

% R;
Z = 1;
R = 0:1/10000:3;
Phi = 0;

[B_R_Z B_R_r_Z] = fourierDipolAllInnen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(3) = plot_and_save(B_R_Z,B_R_r_Z,R,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_R_innen.eps'],save_size ,'R','B',[-1e-6 1e-6])

%% aussen
r_Q = [1.5 0 0]';

% Z;
Z = -l/2:pi/20000:l/2;
R = 1;
Phi = 0;

[B_R_Z B_R_r_Z] = fourierDipolAllAussen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(4) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Z_aussen.eps'],save_size ,'Z','B')

% Phi;
Z = 1;
R = 1;
Phi = 0:pi/10000:2*pi;

[B_R_Z B_R_r_Z] = fourierDipolAllAussen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(5) = plot_and_save(B_R_Z,B_R_r_Z,Phi,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Phi_aussen.eps'],save_size ,'$\varphi$','B')

% R
Z = 1;
R = 0:1/10000:3;
Phi = 0;

[B_R_Z B_R_r_Z] = fourierDipolAllAussen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(6) = plot_and_save(B_R_Z,B_R_r_Z,R,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_R_aussen.eps'],save_size ,'R','B',[-1e-6 1e-6])

%% kappa_amx = 70
kappa_z_max = 70;
nu_max = 10;

r_Q = [0.5 0 0]';
%% innen
% Z;
Z = -l/2:pi/20000:l/2;
R = 1;
Phi = 0;

[B_R_Z B_R_r_Z] = fourierDipolAllInnen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(7) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Z_innen.eps'],save_size ,'Z','B')

% Phi;
Z = 1;
R = 1;
Phi = 0:pi/10000:2*pi;

[B_R_Z B_R_r_Z] = fourierDipolAllInnen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(8) = plot_and_save(B_R_Z,B_R_r_Z,Phi,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Phi_innen.eps'],save_size ,'$\varphi$','B')

% R;
Z = 1;
R = 0:1/10000:3;
Phi = 0;

[B_R_Z B_R_r_Z] = fourierDipolAllInnen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(9) = plot_and_save(B_R_Z,B_R_r_Z,R,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_R_innen.eps'],save_size ,'R','B',[-1e-6 1e-6])

%% aussen
r_Q = [1.5 0 0]';

% Z;
Z = -l/2:pi/20000:l/2;
R = 1;
Phi = 0;

[B_R_Z B_R_r_Z] = fourierDipolAllAussen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(10) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Z_aussen.eps'],save_size ,'Z','B')

% Phi;
Z = 1;
R = 1;
Phi = 0:pi/10000:2*pi;

[B_R_Z B_R_r_Z] = fourierDipolAllAussen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(11) = plot_and_save(B_R_Z,B_R_r_Z,Phi,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Phi_aussen.eps'],save_size ,'$\varphi$','B')

% R
Z = 1;
R = 0:1/10000:3;
Phi = 0;

[B_R_Z B_R_r_Z] = fourierDipolAllAussen(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(12) = plot_and_save(B_R_Z,B_R_r_Z,R,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_R_aussen.eps'],save_size ,'R','B',[-1e-6 1e-6])



fprintf('%e\n',err)

