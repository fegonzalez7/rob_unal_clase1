%% Desarrollo Laboratorio 1 - Herramientas Matematicas
% Por: Felipe Gonzalez
%% Punto a
% Este codigo grafica un punto aleatorio
p1 = [randi(10) randi(10)]'; 
figure (1)
plot(p1(1),p1(2),'b*')
axis([0 10 0 10])
grid on
hold on
%% Punto b
p2 = [randi(10) randi(10)]';
plot(p2(1),p2(2),'gx')
plot([p1(1) p2(1)],[p1(2) p2(2)],'b')
%% Punto c
figure (2)
quiver(2,0,2,2,0,'m')
axis([-4 4 -4 4])
grid on
%% Punto d
figure (3)
quiver(2,3,0,1)
axis([1 4 1 5])
grid on
%% Punto e
figure (4)
hold
quiver(0,0,1,0,0,'r')
quiver(0,0,0,1,0,'g')
axis([-2 2 -2 2])
grid on
%% Punto f
Pini = [0 0 0; 2 2 0];
figure (5)
quiver(Pini(1,1),Pini(1,2),Pini(2,1),Pini(2,2),0)
axis([-6 6 0 6])
hold on
grid on
%% Punto g
Prot = Pini;
Prot(2,:)= (rotz(pi/6)*Pini(2,:)')';
quiver(Prot(1,1),Prot(1,2),Prot(2,1),Prot(2,2),0,'r')
%% Punto h
patch([Pini(:,1)' Prot(2,1)],[Pini(:,2)' Prot(2,2)],'g')
%% Punto i
Pini = [0 0 0; 5 3 2];
Prot = Pini;
Prot(2,:)= (rotz(30)*Pini(2,:)')';
figure (6)
patch([Pini(:,1)' Prot(2,1)],[Pini(:,2)' Prot(2,2)],...
    [Pini(:,3)' Prot(2,3)],[1 0 1])
grid on
hold on
view(3)
trplot(eye(4),'arrow','text','rgb','thick',1)

%% 
T_BA = [-1 0 0 0; 
         0 0 1 3;
         0 1 0 2;
         0 0 0 1];
P_B = [1 1 0 1]';
P_A = T_BA*P_B;
figure
trplot(eye(4),'arrow','text','rgb','thick',1)
hold on 
trplot(T_BA,'arrow','text','rgb','thick',1)
axis([-4 4 -4 4 0 4])
quiver3(0,3,2,-P_B(1),P_B(3),P_B(2),0,'b')
quiver3(0,0,0,P_A(1),P_A(2),P_A(3),0,'r')
%% 
Ta = transl(0,0,0);
Tb = trotz(pi/6)*troty(-pi/3)*trotz(pi/4)
Tang = angvec2tr(pi/4,[sqrt(3)/2 1/2 0])
Tb2 = Tb*Tang

figure
trplot(Ta,'color','k','length',1,'arrow','frame','A')
hold on
trplot(Tb2,'rgb','length',1,'frame','B')
Tab = transl(4,3.5,0)*trotz(pi/2)
Tbc = transl(0,0,1.5)*trotz(pi/2)*trotx(3*pi/4)
Tcd = transl(0,3.5*cos(pi/4),2.5*sin(pi/4))*trotx(pi/4)*trotz(-pi/3)

figure
trplot(eye(4))
hold on
trplot(Tab)
trplot(Tab*Tbc)
trplot(Tab*Tbc*Tcd)
axis([0 6 0 9 0 3])

%% Robot
% Las distancias estan escaladas 1 a 100
% T_HB -> Se lee H respecto a B
% Recuerden crear la funcion que les genera la inversa de una MTH

trplot(eye(4))
hold on
R_HB = rotz(pi+.28)*rotx(3*pi/4);
T_HB = [[R_HB; zeros(1,3)] [-1.35 4.70 4.12 1]'];
r_P = [.50 1.00 .50 1]';
trplot(T_HB,'color','r')

R_PB = rotx(pi)*rotz(2*pi/3);
T_PB = [[R_PB; zeros(1,3)] [-1.507 4.87 3.25 1]'];
trplot(T_PB,'color','k')
axis([-6 6 -6 6 -6 6])

disp('T_HB')
disp(T_HB)

disp('r respecto a {B}')
r_B = T_PB*r_P;
disp(r_B)

T_BH = [[R_HB'; zeros(1,3)] [(-R_HB'*T_HB(1:3,4)); 1]]; % Inversa MTH
disp('r respecto a {H}')
r_H = T_BH*T_PB*r_P;
disp(r_H)

% GRAFICAS
% Es muy importante revisar la solucion visualmente
plot3(r_B(1),r_B(2),r_B(3),'m*')
quiver3(0,0,0,r_B(1),r_B(2),r_B(3),0,'b')

aux = R_PB*r_P(1:3);
quiver3(T_PB(1,4),T_PB(2,4),T_PB(3,4),aux(1),aux(2),aux(3),0,'k')

aux2 = T_HB(1:3,1:3)*r_H(1:3);
quiver3(T_HB(1,4),T_HB(2,4),T_HB(3,4),aux2(1),aux2(2),aux2(3),0,'r')





