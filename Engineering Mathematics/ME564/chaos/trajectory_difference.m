clear;clc;

sigma = 10;
beta = 8/3;
rho = 28;

dt = 0.1;
T = 100;
tspan = 0:dt:T;
x = zeros([3,length(tspan)]);
y = zeros([3,length(tspan)]);
diff = zeros([1,length(tspan)]);
x0 = [-8;8;27];
y0 = x0;
eps = 0.01;
%y0 = x0+eps;
x(:,1) = x0;
y(:,1) = y0;
diff(:,1) = norm(x(:,1)-y(:,1));

for i = 2:length(tspan)
    tk = (i-1)*dt;
    x(:,i) = x(:,i-1) + rkstep(@(tk,xk) lorenz(tk,xk,sigma,beta,rho),tk,dt,x(:,i-1));
    y(:,i) = y(:,i-1) + rkstep(@(tk,xk) lorenz(tk,xk,sigma,beta,rho),tk,dt,y(:,i-1));
    diff(:,i) = norm(x(:,i)-y(:,i));
end

plot3(x(1,:),x(2,:),x(3,:),'b');
hold on;
plot3(y(1,:),y(2,:),y(3,:),'r');

figure;
plot(tspan,diff,'m');