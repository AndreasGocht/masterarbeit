% SensorPosKugel2 bestimmt die Postition der sensoren regelmäßig auf einer
% Kugel mithilfe der Matlabfunktion Sphere

%aufräumen, alles was nicht gespeichert worden ist hat pech gehabt.

clear all

% h ... höhe des Zylinders
% r ... radius des Zylinders
% sens ... Anzahl der Sensoren

l = 6*pi;
r_1 = 0.99; % radius des inneren Zylinders
r_2 = 1.01; % radius des äußeren Zylinders

sens = 5000;
sensors = sqrt(sens/2);

[X_1,Y_1,Z_1] = sphere(sensors);
[X_2,Y_2,Z_2] = sphere(sensors);

% Sensor gibt nur eine Kugel mit dem Radius 1 zurück. deshalb muss der
% radius überall drauf multipliziert werden
X_1 = X_1.*r_1;
Y_1 = Y_1.*r_1;
Z_1 = Z_1.*r_1;
X_2 = X_2.*r_2;
Y_2 = Y_2.*r_2;
Z_2 = Z_2.*r_2;

% zusammenführen
X = [X_1;X_2];
Y = [Y_1;Y_2];
Z = [Z_1;Z_2];


%Matlab erzeug am Ende Punkte die exakt auf dem Anfang liegen, und von uns
%nicht verwendet werden können.
X(:,sensors+1)=[];
Y(:,sensors+1)=[];
Z(:,sensors+1)=[];


%umwandeln in polarcoordinaten und sphätrische koordinaten
[P_Phi,P_R,P_Z] = cart2pol(X,Y,Z);
[S_R,S_Thetha,S_Phi] = cart2spher(X,Y,Z);


%%
%verschieben der Sensoren
% Phi = Phi+0.1;
% Z = Z+0.1;
% [X,Y,Z] = pol2cart(Phi,R,Z);

