clc; clear; close all

%% Parameters Defenition

% Quadrotor Parameters
mt = 2.45+1; %Total = Robot+Payload
Ix = 0.038; %kgm2
Iy = 0.033; %kgm2
Iz = 0.079; %kgm2
Jr = Iz;
L = 12; %inch Propeller Length
l = 12/2/39.37; %meter distance from propeller center to CG
g = 9.81; %m/s2

% Aerodynamic Coefficients
kt = 7e-7;
kd = 1e-8;
kpt = 8e-6;
kpd = 4e-7;

k1 = kd;
k2 = k1;
k3 = k1;
k4 = k1;
k5 = kpd;
k6 = k5;

% Controller Parameters
a1 = 2.8;
a3 = a1;
a5 = a1;
a2 = 3.75;
a4 = a2;
a6 = a2;

% a1 = 20;
% a3 = a1;
% a5 = a1;
% a2 = 100;
% a4 = a2;
% a6 = a2;

lam1 = 15.94;
lam3 = 15.94;
lam5 = 15.94;
lam2 = 52.42;
lam4 = lam2;
lam6 = lam2;

omg5pow2 = 3479; % rpm
omg6pow2 = omg5pow2;

%% Model Running
sim('Quadrotor_Simulink_Model.slx')

%% Positions and Orientations Plotting
figure(1)
px = plot(out.X(:,1),out.X(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('X [m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(px,'linewidth',2)

figure(2)
py = plot(out.Y(:,1),out.Y(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('Y [m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(py,'linewidth',2)

figure(3)
pz = plot(out.Z(:,1),out.Z(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('Z [m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pz,'linewidth',2)

figure(4)
ppsi = plot(out.Psi(:,1),out.Psi(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('\psi [Rad]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(ppsi,'linewidth',2)

figure(5)
pphi = plot(out.Phi(:,1),out.Phi(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('\phi [Rad]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pphi,'linewidth',2)

figure(6)
ptheta = plot(out.Theta(:,1),out.Theta(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('\theta [Rad]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(ptheta,'linewidth',2)

%% Control Inputs plotting
figure(7)
pux = plot(out.ux(:,1),out.ux(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('ux [N]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pux,'linewidth',2)

figure(8)
puy = plot(out.uy(:,1),out.uy(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('uy [N]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(puy,'linewidth',2)

figure(9)
pu1 = plot(out.u1(:,1),out.u1(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('u1 [N]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pu1,'linewidth',2)

figure(10)
pu2 = plot(out.u2(:,1),out.u2(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('u2 [N/m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pu2,'linewidth',2)

figure(11)
pu3 = plot(out.u3(:,1),out.u3(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('u3 [N/m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pu3,'linewidth',2)

figure(12)
pu4 = plot(out.u4(:,1),out.u4(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('u4 [N/m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pu4,'linewidth',2)

%% Rotor speeds' plotting
figure(13)
pomg1 = plot(out.Omg1(:,1),out.Omg1(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('\omega [rad/s]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pomg1,'linewidth',2)
title('Rotor 1')

figure(14)
pomg2 = plot(out.Omg2(:,1),out.Omg2(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('\omega [rad/s]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pomg2,'linewidth',2)
title('Rotor 2')

figure(15)
pomg3 = plot(out.Omg3(:,1),out.Omg3(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('\omega [rad/s]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pomg3,'linewidth',2)
title('Rotor 3')

figure(16)
pomg4 = plot(out.Omg4(:,1),out.Omg4(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('\omega [rad/s]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(pomg4,'linewidth',2)
title('Rotor 4')

%% Path plotting
figure(17)
path = plot3(out.X(:,2),out.Y(:,2),out.Z(:,2));
xlabel('X [m]','fontsize',18,'fontweight','b');
ylabel('Y [m]','fontsize',15,'fontweight','b');
zlabel('Z [m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(path,'linewidth',2)

%% Error plotting
figure(18)
ex = plot(out.ex(:,1),out.ex(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('Error X [m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(ex,'linewidth',2)

figure(19)
ey = plot(out.ey(:,1),out.ey(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('Error Y [m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(ey,'linewidth',2)

figure(20)
ez = plot(out.ez(:,1),out.ez(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('Error Z [m]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(ez,'linewidth',2)

figure(21)
epsi = plot(out.epsi(:,1),out.epsi(:,2));
xlabel('Time [second]','fontsize',18,'fontweight','b');
ylabel('Error \Psi [rad]','fontsize',15,'fontweight','b');
set(gca,'fontsize',15,'fontweight','b')
grid on;
set(epsi,'linewidth',2)

