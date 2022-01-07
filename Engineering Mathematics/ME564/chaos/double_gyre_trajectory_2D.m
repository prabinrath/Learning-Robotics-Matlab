clear;clc;
%% Initialization
A = 0.1;    % parameters from Shadden 2005 Physica D
eps = 0.25;
omega = 2*pi/10;  % frequency of gyre oscillations

dx = 0.025;
xvec = 0:dx:2;
yvec = 0:dx:1;

[x0,y0] = meshgrid(xvec,yvec);
xic(1,:,:) = x0';
xic(2,:,:) = y0';

subplot(2,1,1)
dy = double_gyre(0,xic,A,eps,omega);
quiver(xic(1,1:4:end,1:4:end),xic(2,1:4:end,1:4:end),dy(1,1:4:end,1:4:end),dy(2,1:4:end,1:4:end));
axis([0 2 0 1]), drawnow
subplot(2,1,2)
plot(xic(1,:),xic(2,:),'r.','LineWidth',2,'MarkerSize',4)
axis([0 2 0 1]), drawnow
%% Trajectory integration
dt = 0.025;
T = 15;
tspan = 0:dt:T;

xin = xic;
for stp = 1:length(tspan)
    tk = stp*dt;
    
    subplot(2,1,1)
    dy = double_gyre(tk,xic,A,eps,omega);
    quiver(xic(1,1:4:end,1:4:end),xic(2,1:4:end,1:4:end),dy(1,1:4:end,1:4:end),dy(2,1:4:end,1:4:end));
    axis([0 2 0 1]), drawnow
    
    xout = xin + rkstep(@(tk,xk) double_gyre(tk,xk,A,eps,omega),tk,dt,xin);
    xin = xout;
    
    subplot(2,1,2)
    plot(xout(1,:),xout(2,:),'r.','LineWidth',2,'MarkerSize',4)
    axis([0 2 0 1]), drawnow
end