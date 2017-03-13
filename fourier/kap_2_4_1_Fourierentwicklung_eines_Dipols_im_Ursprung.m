close all;


a = 1;
R = 1;

save_size = [600 400];
path = '../../Arbeit/grafiken/3_4_1_Fourierentwicklung_eines_Dipols_im_Ursprung/';

%% 2pi
fak = 2;
l = fak*pi;
Z = -l/2:pi/20000:l/2;


%% kappa_z_max = 2;
kappa_z_max = 2;

[B_R_Z B_R_r_Z] = fourierDipol(Z,R,kappa_z_max,a,l);
err(1) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '.eps'],save_size ,'Z','B')

%% kappa_z_max = 5;
kappa_z_max = 5;

[B_R_Z B_R_r_Z] = fourierDipol(Z,R,kappa_z_max,a,l);
err(2) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '.eps'],save_size ,'Z','B')

%% kappa_z_max = 10;
kappa_z_max = 10;

[B_R_Z B_R_r_Z] = fourierDipol(Z,R,kappa_z_max,a,l);
err(3) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '.eps'],save_size ,'Z','B')

%% kappa_z_max = 20;
kappa_z_max = 20;

[B_R_Z B_R_r_Z] = fourierDipol(Z,R,kappa_z_max,a,l);
err(4) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '.eps'],save_size ,'Z','B')

%% 4pi
fak = 4;
l = fak*pi;
Z = -l/2:pi/20000:l/2;

%% kappa_z_max = 10;
kappa_z_max = 10;

[B_R_Z B_R_r_Z] = fourierDipol(Z,R,kappa_z_max,a,l);
err(5) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '.eps'],save_size ,'Z','B')

%% kappa_z_max = 20;
kappa_z_max = 20;

[B_R_Z B_R_r_Z] = fourierDipol(Z,R,kappa_z_max,a,l);
err(6) = plot_and_save(B_R_Z,B_R_r_Z,Z,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '.eps'],save_size ,'Z','B')

%% kappa_z_max = 20, R;
kappa_z_max = 20;

Z = 0.5;
R = 0:1/10000:3;

[B_R_Z B_R_r_Z] = fourierDipol(Z,R,kappa_z_max,a,l);
err(7) = plot_and_save(B_R_Z,B_R_r_Z,R,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_R_Achse.eps'],save_size ,'R','B',[-1e-6 1e-6])

%% Kappa_z__max = 40, R;
kappa_z_max = 20;

a=0.1

[B_R_Z B_R_r_Z] = fourierDipol(Z,R,kappa_z_max,a,l);
err(8) = plot_and_save(B_R_Z,B_R_r_Z,R,path,[ num2str(fak) '_pi_kappa_' num2str(kappa_z_max) '_R_Achse_a01.eps'],save_size ,'R','B',[-1e-6 1e-6])


fprintf('%e\n',err)

