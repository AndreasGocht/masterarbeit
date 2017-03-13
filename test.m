%% Testet die Ergebnisse und zeigt die Abwichnugen vom Richtigen Wert an.
tic
%% Zylindrischer Fall
% ererechne der Mutltipolamplituden
latex = 0;

if (exist('B_mult_R_Zyl','var')==1)
    A_R_Zyl = B_mult_R_Zyl\B_R_Zyl;
    A_Phi_Zyl = B_mult_Phi_Zyl\B_Phi_Zyl;
    A_Z_Zyl = B_mult_Z_Zyl\B_Z_Zyl;

    % zerlegen der Mutlipolamplituden
    len = length(A_R_Zyl);
    s = size(B_mult_innen_R_Zyl);
    len_i = s(2);

    % A_i_R = A_R(1:len/2);
    % A_a_R = A_R(len/2+1:len);

    A_i_R_Zyl = A_R_Zyl(1:len_i);
    A_a_R_Zyl = A_R_Zyl(len_i+1:len);

    disp('==================================================================')
    disp('Zylindrisch')

    table('norm(B_i_R_Zyl):',norm(B_i_R_Zyl),latex);
    table('norm(B_i_R_Zyl - B_mult_innen_R_Zyl * A_i_R_Zyl):',norm(B_i_R_Zyl - B_mult_innen_R_Zyl * A_i_R_Zyl),latex)
    table('norm(B_i_R_Zyl - B_R_Zyl):',norm(B_i_R_Zyl - B_R_Zyl),latex);
    table('Fehlerquotient:',norm(B_i_R_Zyl - B_mult_innen_R_Zyl * A_i_R_Zyl)/norm(B_i_R_Zyl - B_R_Zyl),latex)
    % disp('Fehlerquotient')
    % disp('norm(B_i_R_Zyl - B_mult_innen_R_Zyl * A_i_R_Zyl)/norm(B_i_R_Zyl - B_R_Zyl)')
    % disp(norm(B_i_R_Zyl - B_mult_innen_R_Zyl * A_i_R_Zyl)/norm(B_i_R_Zyl - B_R_Zyl))




    len = length(A_Phi_Zyl);

    A_i_Phi_Zyl = A_Phi_Zyl(1:len_i);
    A_a_Phi_Zyl = A_Phi_Zyl(len_i+1:len);

    disp('------------------------------------------------------------------')
    table('norm(B_i_Phi_Zyl):',norm(B_i_Phi_Zyl),latex);
    table('norm(B_i_Phi_Zyl - B_mult_innen_Phi_Zyl * A_i_Phi_Zyl):',norm(B_i_Phi_Zyl - B_mult_innen_Phi_Zyl * A_i_Phi_Zyl),latex)
    table('norm(B_i_Phi_Zyl - B_Phi_Zyl):',norm(B_i_Phi_Zyl - B_Phi_Zyl),latex);
    table('Fehlerquotient:',norm(B_i_Phi_Zyl - B_mult_innen_Phi_Zyl * A_i_Phi_Zyl)/norm(B_i_Phi_Zyl - B_Phi_Zyl),latex)


    % disp('Fehlerquotient')
    % disp('norm(B_i_Phi_Zyl - B_mult_innen_Phi_Zyl * A_i_Phi_Zyl)/norm(B_i_Phi_Zyl - B_Phi_Zyl)')
    % disp(norm(B_i_Phi_Zyl - B_mult_innen_Phi_Zyl * A_i_Phi_Zyl)/norm(B_i_Phi_Zyl - B_Phi_Zyl))


    len = length(A_Z_Zyl);


    A_i_Z_Zyl = A_Z_Zyl(1:len_i);
    A_a_Z_Zyl = A_Z_Zyl(len_i+1:len);

    disp('------------------------------------------------------------------')
    table('norm(B_i_Z_Zyl):',norm(B_i_Z_Zyl),latex);
    table('norm(B_i_Z_Zyl - B_mult_innen_Z_Zyl * A_i_Z_Zyl):',norm(B_i_Z_Zyl - B_mult_innen_Z_Zyl * A_i_Z_Zyl),latex)
    table('norm(B_i_Z_Zyl - B_Z_Zyl):',norm(B_i_Z_Zyl - B_Z_Zyl),latex);
    table('Fehlerquotient:',norm(B_i_Z_Zyl - B_mult_innen_Z_Zyl * A_i_Z_Zyl)/norm(B_i_Z_Zyl - B_Z_Zyl),latex)




    % disp('Fehlerquotient')
    % disp('norm(B_i_Z - B_mult_innen_Z_Zyl * A_i_Z_Zyl)/norm(B_i_Z_Zyl - B_Z_Zyl)')
    % disp(norm(B_i_Z_Zyl - B_mult_innen_Z_Zyl * A_i_Z_Zyl)/norm(B_i_Z_Zyl - B_Z_Zyl))

    disp('==================================================================')
end


%% Sphärischer Fall

if (exist('B_mult_R_Sph','var')==1)

    % ererechne der Mutltipolamplituden
    A_R_Sph = B_mult_R_Sph\B_R_Sph;
    A_Phi_Sph = B_mult_Phi_Sph\B_Phi_Sph;
    A_Thetha_Sph = B_mult_Thetha_Sph\B_Thetha_Sph;

    % zerlegen der Mutlipolamplituden
    len = length(A_R_Sph);
    s = size(B_mult_innen_R_Sph);
    len_i = s(2);

    A_i_R_Sph = A_R_Sph(1:len_i);
    A_a_R_Sph = A_R_Sph(len_i+1:len);


    disp('==================================================================')
    disp('Sphärisch')

    table('norm(B_i_R_Sph):',norm(B_i_R_Sph),latex);
    table('norm(B_i_R_Sph - B_mult_innen_R_Sph * A_i_R_Sph):',norm(B_i_R_Sph - B_mult_innen_R_Sph * A_i_R_Sph),latex)
    table('norm(B_i_R_Sph - B_R_Sph):',norm(B_i_R_Sph - B_R_Sph),latex);
    table('Fehlerquotient:',norm(B_i_R_Sph - B_mult_innen_R_Sph * A_i_R_Sph)/norm(B_i_R_Sph - B_R_Sph),latex)
    % disp('Fehlerquotient')
    % disp('norm(B_i_R_Sph - B_mult_innen_R_Sph * A_i_R_Sph)/norm(B_i_R_Sph - B_R_Sph)')
    % disp(norm(B_i_R_Sph - B_mult_innen_R_Sph * A_i_R_Sph)/norm(B_i_R_Sph - B_R_Sph))




    len = length(A_Phi_Sph);

    A_i_Phi_Sph = A_Phi_Sph(1:len_i);
    A_a_Phi_Sph = A_Phi_Sph(len_i+1:len);

    disp('------------------------------------------------------------------')
    table('norm(B_i_Phi_Sph):',norm(B_i_Phi_Sph),latex);
    table('norm(B_i_Phi_Sph - B_mult_innen_Phi_Sph * A_i_Phi_Sph):',norm(B_i_Phi_Sph - B_mult_innen_Phi_Sph * A_i_Phi_Sph),latex)
    table('norm(B_i_Phi_Sph - B_Phi_Sph):',norm(B_i_Phi_Sph - B_Phi_Sph),latex);
    table('Fehlerquotient:',norm(B_i_Phi_Sph - B_mult_innen_Phi_Sph * A_i_Phi_Sph)/norm(B_i_Phi_Sph - B_Phi_Sph),latex)


    % disp('Fehlerquotient')
    % disp('norm(B_i_Phi_Sph - B_mult_innen_Phi_Sph * A_i_Phi_Sph)/norm(B_i_Phi_Sph - B_Phi_Sph)')
    % disp(norm(B_i_Phi_Sph - B_mult_innen_Phi_Sph * A_i_Phi_Sph)/norm(B_i_Phi_Sph - B_Phi_Sph))


    len = length(A_Thetha_Sph);


    A_i_Thetha_Sph = A_Thetha_Sph(1:len_i);
    A_a_Thetha_Sph = A_Thetha_Sph(len_i+1:len);

    disp('------------------------------------------------------------------')
    table('norm(B_i_Thetha_Sph):',norm(B_i_Thetha_Sph),latex);
    table('norm(B_i_Thetha_Sph - B_mult_innen_Thetha_Sph * A_i_Thetha_Sph):',norm(B_i_Thetha_Sph - B_mult_innen_Thetha_Sph * A_i_Thetha_Sph),latex)
    table('norm(B_i_Thetha_Sph - B_Thetha_Sph):',norm(B_i_Thetha_Sph - B_Thetha_Sph),latex);
    table('Fehlerquotient:',norm(B_i_Thetha_Sph - B_mult_innen_Thetha_Sph * A_i_Thetha_Sph)/norm(B_i_Thetha_Sph - B_Thetha_Sph),latex)




    % disp('Fehlerquotient')
    % disp('norm(B_i_Thetha - B_mult_innen_Thetha_Sph * A_i_Thetha_Sph)/norm(B_i_Thetha_Sph - B_Thetha_Sph)')
    % disp(norm(B_i_Thetha_Sph - B_mult_innen_Thetha_Sph * A_i_Thetha_Sph)/norm(B_i_Thetha_Sph - B_Thetha_Sph))

    disp('==================================================================')
end

toc