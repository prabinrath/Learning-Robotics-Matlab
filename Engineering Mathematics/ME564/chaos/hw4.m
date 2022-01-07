clear;clc;

% sigma = 10;
% beta = 8/3;
% rho = 28;

% x = sym('x%d%d', [1 3]);
% m = double(subs(jacobian(lorenz(0,x,sigma,beta,rho),x),x,[6*sqrt(2),6*sqrt(2),27]));
% [T,D] = eig(m);

dt = 0.01;
T = 100;
tspan = 0:dt:T;

% y = zeros([3,length(tspan)]);
% y0 = [10;10;10];
% rho_arr = [5,10,15,20,25,30,35,40,45,50];
% for i=1:length(rho_arr)
%     disp('------------------ rho is ');disp(rho_arr(i));
%     m = double(subs(jacobian(lorenz(0,x,sigma,beta,rho_arr(i)),x),x,[0,0,0]));
%     disp([0,0,0]);
%     disp(eig(m));
%     disp('###');
%     m = double(subs(jacobian(lorenz(0,x,sigma,beta,rho_arr(i)),x),x,[sqrt(beta*(rho_arr(i)-1)),sqrt(beta*(rho_arr(i)-1)),rho_arr(i)-1]));
%     disp([sqrt(beta*(rho_arr(i)-1)),sqrt(beta*(rho_arr(i)-1)),rho_arr(i)-1]);
%     disp(eig(m));
%     disp('###');
%     m = double(subs(jacobian(lorenz(0,x,sigma,beta,rho_arr(i)),x),x,[-sqrt(beta*(rho_arr(i)-1)),-sqrt(beta*(rho_arr(i)-1)),rho_arr(i)-1]));
%     disp([-sqrt(beta*(rho_arr(i)-1)),-sqrt(beta*(rho_arr(i)-1)),rho_arr(i)-1]);
%     disp(eig(m));
%     
%     figure;
%     [t,y] = ode45(@(t,y)lorenz(t,y,sigma,beta,rho_arr(i)),tspan,y0);
%     plot3(y(:,1),y(:,2),y(:,3),'r');
% end

eps = 1;
% x = sym('x%d%d', [1 2]);
% m = double(subs(jacobian(vanderpol(0,x,eps),x),x,[0,0]))
% [T,D] = eig(m)

x0 = [0.1,-1];
[t,y] = ode45(@(t,y) vanderpol(0,y,eps),tspan,x0);
plot(y(:,1), y(:,2), 'b', 'LineWidth', 1.5);
grid on;
axis([-3 3 -3 3]);
xlabel('y');
ylabel('y dot');
legend('phase potrait');
%% Trajectory integration
clear;clc;
eps = 5;

dt = 0.025;
T = 20;
tspan = 0:dt:T;

dx = 0.025;
xvec = -1:dx:1;
yvec = 0:dx:0.1;

[x0,y0] = meshgrid(xvec,yvec);
xin(1,:,:) = x0';
xin(2,:,:) = y0';

for stp = 1:length(tspan)
    tk = stp*dt;
    
    xout = xin + rkstep(@(tk,xk) vanderpol_(tk,xk,eps),tk,dt,xin);
    xin = xout;

    plot(xout(1,:),xout(2,:),'r.','LineWidth',2,'MarkerSize',8);
    axis([-10 10 -10 10]);
    grid on;
    drawnow
    pause(0.01)
end
