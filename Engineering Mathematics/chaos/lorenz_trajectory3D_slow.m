clear;clc;

%% Initialization
sigma = 10;
beta = 8/3;
rho = 28;

dt = 0.01;
T = 4;
tspan = 0:dt:T;

L = 20; S = 2;
xvec = -L:S:L;
yvec = -L:S:L;
zvec = -L:S:L;
[x0,y0,z0] = meshgrid(xvec,yvec,zvec);
x3d(1,:,:,:) = x0;
x3d(2,:,:,:) = y0;
x3d(3,:,:,:) = z0;
plot3(x3d(1,:),x3d(2,:),x3d(3,:), 'r.','MarkerSize',1)
axis([-40 40 -40 40 -40 40])
view(20,40)
drawnow
%% Step RK4
for step = 2:length(tspan)
    tk = (step-1)*dt;
    for i = 1:length(xvec)
        for j = 1:length(yvec)
            for k = 1:length(zvec)
                xin = x3d(:,i,j,k);
                xout = xin + rkstep(@(tk,xk) lorenz(tk,xk,sigma,beta,rho),tk,dt,xin);
                x3d(:,i,j,k) = xout;
            end
        end
    end
    plot3(x3d(1,:),x3d(2,:),x3d(3,:), 'r.','MarkerSize',1)
    axis([-40 40 -40 40 -40 40])
    view(20,40)
    drawnow
end