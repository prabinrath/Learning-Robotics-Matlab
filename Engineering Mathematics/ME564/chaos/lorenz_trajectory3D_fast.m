clear;clc;
%% Initialization
sigma = 10;
beta = 8/3;
rho = 28;

dt = 0.01;
T = 5;
tspan = 0:dt:T;

L = 1; S = 0.1;
xvec = -L:S:L;
yvec = -L:S:L;
zvec = -L:S:L;
xi = [-8,8,27];
[x0,y0,z0] = meshgrid(xvec+xi(1),yvec+xi(2),zvec+xi(3));
x3d(1,:,:,:) = x0;
x3d(2,:,:,:) = y0;
x3d(3,:,:,:) = z0;
plot3(x3d(1,:),x3d(2,:),x3d(3,:), 'r.','MarkerSize',1)
axis([-40 40 -40 40 -10 50])
view(20,40)
drawnow
%% Step RK4
for stp = 2:length(tspan)
    tk = (stp-1)*dt;
    xin = x3d;
    xout = xin + rkstep(@(tk,xk) lorenz3D(tk,xk,sigma,beta,rho),tk,dt,xin);
    x3d = xout;
    plot3(x3d(1,:),x3d(2,:),x3d(3,:), 'r.','MarkerSize',1)
    axis([-40 40 -40 40 -10 50])
    view(20,40)
    drawnow
end