%% Cauchy Integral Formula
clear; clc;

N = 1000;
R = 1;
I = 0;

% Integrate
for k = 1:N
    theta = 2*pi*k/N;
    dtheta = 2*pi/N;
    z = R*exp(1i*theta);
    dz = 1i*R*exp(1i*theta)*dtheta;
    f = cos(z)/(z-pi/4);
    I = I + f*dz;
end

disp(I)