
% SensorPosZyl bestimmt die Postition der sensoren regelmäßig auf einem
% Zylinder

%aufräumen, alles was nicht gespeichert worden ist hat pech gehabt.

clear all

% h ... höhe des Zylinders
% r ... radius des Zylinders
% sens ... Anzahl der Sensoren

l = 6*pi;
% l=1;
r_1 = 0.99; % radius des inneren Zylinders
r_2 = 1.01; % radius des äußeren Zylinders

h = l;
% h = 2*pi;

% % 
% sens = 1000000;
% 
% R_1(1:500) = r_1;
% R_2(1:500) = r_2;

% sens = 50000;
% 
% R_1(1:500) = r_1;
% R_2(1:500) = r_2;

sens = 5000;

R_1(1:100) = r_1;
R_2(1:100) = r_2;


sensors = sens/length(R_1)/2;

%Festlegen der Raumpunkte R
%erzeugt einen Zylinder vom radius 1 mit 10 punkten in der höhe und 20 im
%kreis
    
[X_1,Y_1,Z_1] = cylinder(R_1,sensors);
[X_2,Y_2,Z_2] = cylinder(R_2,sensors);


X = [X_1;X_2];
Y = [Y_1;Y_2];
Z = [Z_1;Z_2];



%Matlab erzeug am Ende Punkte die exakt auf dem Anfang liegen, und von uns
%nicht verwendet werden können.
% X(:,sensors+1)=[];
% Y(:,sensors+1)=[];
% Z(:,sensors+1)=[];


%clinder gibt nur die normierte höhe h zurück. Das heist jede höhe muss
%mittels multipikation mit h abgebildet werden
Z = Z*h-h/2-0.01;

%umwandeln in polarcoordinaten
[P_Phi,P_R,P_Z] = cart2pol(X,Y,Z);
[S_R,S_Thetha,S_Phi] = cart2spher(X,Y,Z);


%%
%verschieben der Sensoren
% Phi = Phi+0.1;
% Z = Z+0.1;
% [X,Y,Z] = pol2cart(Phi,R,Z);

