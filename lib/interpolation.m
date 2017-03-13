function [ B,P_R,P_Phi,P_Z,X,Y,Z,P_R_a,P_Phi_a,P_Z_a,B_a,P_Zyl_a ] = interpolation( B_a,P_R_a,P_Phi_a,P_Z_a,r_i,r_a,l )
% function [ B,P_R,P_Phi,P_Z,X,Y,Z,P_R_a,P_Phi_a,P_Z_a,B_a,P_Zyl_a ] = interpolation( B_a,P_R_a,P_Phi_a,P_Z_a,r_i,r_a,l )
%   Interpoliert die Funktion auf 50000 Sensoren

%% interpolation

    
    
    

% transform B
    s = size(P_R_a);
    B_new_a = reshape(B_a',s(2),s(1))';

% 
%     P_R_a = [...
%             P_R_a P_R_a P_R_a ...
%             P_R_a P_R_a P_R_a...
%             P_R_a P_R_a P_R_a
%             ];
%     P_Phi_a = [...
%             P_Phi_a-2.*pi   P_Phi_a-2.*pi   P_Phi_a-2.*pi...
%             P_Phi_a         P_Phi_a         P_Phi_a ...
%             P_Phi_a+2.*pi   P_Phi_a+2.*pi   P_Phi_a+2.*pi
%             ];
%     P_Z_a = [...
%             P_Z_a-l P_Z_a P_Z_a+l...
%             P_Z_a-l P_Z_a P_Z_a+l...
%             P_Z_a-l P_Z_a P_Z_a+l
%             ];
    

% 
%     B_new_a = [...
%         B_new_a B_new_a B_new_a ...
%         B_new_a B_new_a B_new_a ...
%         B_new_a B_new_a B_new_a ...
%         ];
        

% periodizität in Phi richtung
    P_R_a = [...
            P_R_a           P_R_a       P_R_a ...
            ];
    P_Phi_a = [...
            P_Phi_a-2.*pi   P_Phi_a     P_Phi_a+2.*pi ...
            ];
    P_Z_a = [...
            P_Z_a           P_Z_a       P_Z_a ...
            ];

    B_new_a = [...
            B_new_a         B_new_a     B_new_a ...
            ];
        

    s_a = size(P_R_a);
    
    P_Zyl_a(:,1) = reshape(P_R_a',1,s_a(1)*s_a(2));
    P_Zyl_a(:,2) = reshape(P_Phi_a',1,s_a(1)*s_a(2));
    P_Zyl_a(:,3) = reshape(P_Z_a',1,s_a(1)*s_a(2));
    B_a          = reshape(B_new_a',1,s_a(1)*s_a(2))';


    len_a = length(P_Zyl_a);

    h = l;
    
%     sens = 50000;
% 
%     R_1(1:500) = r_i;
%     R_2(1:500) = r_a;
    
    fprintf('generating new SensorPos\n')
    
    sens = 1000000;
    R_1(1:500) = r_i;
    R_2(1:500) = r_a;
   
    
    sensors = sens/length(R_1)/2;
    
    [X_1,Y_1,Z_1] = cylinder(R_1,sensors);
    [X_2,Y_2,Z_2] = cylinder(R_2,sensors);


    X = [X_1;X_2];
    Y = [Y_1;Y_2];
    Z = [Z_1;Z_2];

%     X(:,sensors+1)=[];
%     Y(:,sensors+1)=[];
%     Z(:,sensors+1)=[];
    
    Z = Z*h-h/2-0.01;
    
    fprintf('Coordination transformation\n')
    
    [P_Phi,P_R,P_Z] = cart2pol(X,Y,Z);
 

    fprintf('generating Sensor List\n')
    
    s = size(P_R);
     
    P_Zyl(:,1) = reshape(P_R',1,s(1)*s(2));
    P_Zyl(:,2) = reshape(P_Phi',1,s(1)*s(2));
    P_Zyl(:,3) = reshape(P_Z',1,s(1)*s(2));

    
    len = length(P_Zyl);
    
    fprintf('interpolating\n')
    
    B(1:len/2,1)      = griddata(P_Zyl_a(1:len_a/2,2),        P_Zyl_a(1:len_a/2,3),       B_a(1:len_a/2),         P_Zyl(1:len/2,2),       P_Zyl(1:len/2,3),     'linear');
    B(len/2+1:len,1)  = griddata(P_Zyl_a(len_a/2+1:len_a,2),  P_Zyl_a(len_a/2+1:len_a,3), B_a(len_a/2+1:len_a),   P_Zyl(len/2+1:len,2),   P_Zyl(len/2+1:len,3), 'linear');
    
    fprintf('interpolating is ready\n')

end

