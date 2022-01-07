clear;clc;

sigma = 10;
beta = 8/3;
rho = 28;

dt = 0.01;
T = 4;
tspan = 0:dt:T;
x = zeros([3,length(tspan)]);
x0 = [-8;8;27];
x(:,1) = x0;

for i = 2:length(tspan)
    tk = (i-1)*dt;
    x(:,i) = x(:,i-1) + rkstep(@(tk,xk) lorenz(tk,xk,sigma,beta,rho),tk,dt,x(:,i-1));
end

plot3(x(1,:),x(2,:),x(3,:),'b');
hold on;
[t,y] = ode45(@(t,y)lorenz(t,y,sigma,beta,rho),tspan,x0);
plot3(y(:,1),y(:,2),y(:,3),'r');