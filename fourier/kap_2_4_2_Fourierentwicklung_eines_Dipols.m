close all;
% 3.4.2 Fourierentwicklung eines Dipol an einem Beliebigen Punkt auf der
% X-Y-Ebende, außerhalb des Zylinders




save_size = [600 400];
path = '../../Arbeit/grafiken/3_4_2_Fourierentwicklung_eines_Dipol_an_einem_Beliebigen_Punkt/';

fak = 4;
l = fak*pi;
a = 1;

r_Q = [3 0 0]';

%% kappa_z_max = 10, Z;
kappa_z_max = 10;
nu_max = 10;

Z = -l/2:pi/20000:l/2;
R = 1;
Phi = 0;
% % 

[B_R_Z B_R_r_Z] = fourierDipolAll2(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(1) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Z.eps'],save_size ,'Z','B')

%% kappa_z_max = 10, Phi;

Z = 1;
R = 1;
Phi = 0:pi/10000:2*pi;


[B_R_Z B_R_r_Z] = fourierDipolAll2(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(2) = plot_and_save(B_R_Z,B_R_r_Z,Phi,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_Phi.eps'],save_size ,'$\varphi$','B')

%% kappa_z_max = 10, R;

Z = 1;
R = 0:1/10000:3;
Phi = 0;


[B_R_Z B_R_r_Z] = fourierDipolAll2(Z,R,Phi,kappa_z_max,nu_max,a,l,r_Q);
err(3) = plot_and_save(B_R_Z,B_R_r_Z,R,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_R.eps'],save_size ,'R','B',[-1e-6 1e-6])


fprintf('%e\n',err)

