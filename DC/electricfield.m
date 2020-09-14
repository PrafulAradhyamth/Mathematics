clc;close all;clear all;
%WG13 %frequency range 4.9 to 7.05 GHz %Dimensions 4.0386 x 2.0103 in cm   
a = 4.0386;    % Length in cm in x-direction
b = 2.0103;    % Length in cm in y-direction
f = 5*10.^9;   % Frequency of operation 5GHz
c = 3*10.^8;   % Velocity of light 
m = 1;         % Mode number in X-Direction
n = 0;         % Mode number in Y-Direction
Amn = 1;       % Amplitude
M =10;         % Number of points to be poltted
% Wave propagates in Z-Direction
fc = c*100/2*sqrt((m/a).^2+(n/b).^2);% fc in GHz
lambda = c*100/fc;                   % Wavelength in cm
epsilon = 8.8540e-12;                % Permittivity constant
epsilon_r = 1;                       % Relative Permittivity constant
mu1 = 4*pi*10e-7;                    % Permeability constant
mu1_r = 1;                           % Relative Permeability constant
omega = 2*pi*f;                      % Frequency of operation in rad/s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beta = omega*(sqrt(mu1*epsilon));    %Propagation constant
Bx = m*pi/a; By = n*pi/b;  
Bc = sqrt(Bx.^2+By.^2);              %cutoff wavenumber
Bz = sqrt(beta.^2-Bc.^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z = linspace(0,2*lambda,M);
x = linspace(0,a,M);
y = linspace(0,b,M);
[z,x,y] = meshgrid(z,x,y);
% Electric Field Expression for TEmn
Ex = Amn*(By/epsilon)*cos(m*pi.*x./a).*sin(n*pi.*y./b).*exp(-1i*Bz*z);
Ey = -Amn*(Bx/epsilon)*sin(Bx.*x).*cos(By.*y).*exp(-1i*Bz*z);
Ez =zeros(size(real(Ey)));
% Magnetic Field Expression for TEmn
Hx = Amn*(Bx*Bz/(omega*mu1*epsilon))*sin(m*pi.*x./a).*cos(n*pi.*y./b).*exp(-1i*Bz*z);
Hy = Amn*(By*Bz/(omega*mu1*epsilon))*cos(m*pi.*x./a).*sin(n*pi.*y./b).*exp(-1i*Bz*z);
Hz = -1i*Amn*(Bc.^2/(omega*mu1*epsilon))*cos(m*pi.*x./a).*cos(n*pi.*y./b).*exp(-1i*Bz*z);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure();
quiver(x,y,real(Ex),real(Ey));
grid on
title(['Plot of Front view of Electric field for TE_',num2str(m),'_',num2str(n)]);
legend('E-Field');
xlabel('x-axis');
ylabel('y-axis');
figure();
quiver(x,y,real(Hx),real(Hy));
grid on
title(['Plot of Front view of Magnetic field for for TE_',num2str(m),'_',num2str(n)]);
legend('H-Field');
xlabel('x-axis');
ylabel('y-axis');
figure();
quiver(x,y,real(Ex),real(Ey));
hold on
quiver(x,y,real(Hx),real(Hy));
grid on
title(['Plot of Front view for TE_',num2str(m),'_',num2str(n)]);
legend('E-Field','H-Field');
xlabel('x-axis');
ylabel('y-axis');
%%%%%%%%%
figure();
quiver(z,x,real(Ez),real(Ex));
grid on
title(['Plot of Top view of Electric field for for TE_',num2str(m),'_',num2str(n)]);
legend('E-Field');
xlabel('z-axis');
ylabel('x-axis');
figure();
quiver(z,x,real(Hz),real(Hx));
grid on
title(['Plot of Top view of Magnetic field for for TE_',num2str(m),'_',num2str(n)]);
legend('H-Field');
xlabel('z-axis');
ylabel('x-axis');
figure();
quiver(z,x,real(Ez),real(Ex));
hold on
quiver(z,x,real(Hz),real(Hx));
grid on
title(['Plot of Top view for for TE_',num2str(m),'_',num2str(n)]);
legend('E-Field','H-Field');
xlabel('z-axis');
ylabel('x-axis');
%%%%%%%
figure();
quiver(z,y,real(Ez),real(Ey));
grid on
title(['Plot of Side view of Electric field for for TE_',num2str(m),'_',num2str(n)]);
legend('E-Field');
xlabel('z-axis');
ylabel('y-axis');
figure();
quiver(z,y,real(Hz),real(Hy));
grid on
title(['Plot of Side view of Magnetic field for for TE_',num2str(m),'_',num2str(n)]);
legend('H-Field');
xlabel('z-axis');
ylabel('y-axis');
figure();
quiver(z,y,real(Ez),real(Ey));
hold on
quiver(z,y,real(Hz),real(Hy));
grid on
title(['Plot of Side view for for TE_',num2str(m),'_',num2str(n)]);
legend('E-Field','H-Field');
xlabel('z-axis');
ylabel('y-axis');