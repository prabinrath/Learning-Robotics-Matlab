clear;clc;

%{
A = [-0.001]; % Matrix A
dt = 0.1; T = 10000; % Simulation time
x0 = [5]; % Initial conditions

[t,x] = ode45(@(t,x) A*x + [0.01], 0:dt:T, x0);
plot(t,x/100,'b','LineWidth',2);
axis([0 T 0 0.2]);
grid on;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
x = -5:0.01:5;
% y = x.*cos(x);
% y = cos(x)./(x.^2);
% y = exp(x.^2);
% y = 1./(1-x);
y = sin(1./x);
plot(x,y,'k','LineWidth',2);
axis([-5 5 -10 10]);
set(gca,'FontSize',16,'LineWidth',2)
grid on; hold on;

%% Taylor Third order approx about x=0
% P = [1/factorial(4) 0 -1/factorial(2) 0 1 0];
% P = [1/factorial(4) 0 -1/factorial(2) 0 1]; % use yTF
% P = [1/factorial(2) 0 1 0 1];
% P = [1 1 1];
P = [1 0 -1/factorial(3) 0 1/factorial(5)]; % use yTF

yT =  polyval(P,x);
% yTF = yT./(x.^2);
yTF = yT./(x.^5);

plot(x,yTF,'b','LineWidth',1.2);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
x = 0:0.01:10;
k1 = 1;
k2 = 3;
a = 1;

% y = k1*exp(a.*x) + k2*exp(-a.*x);
y = k1*exp(2.*x) + k2*exp(-2.*x);
plot(x,y,'b','LineWidth',2);
axis([0 10 -50 50]);
grid on;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 0:0.01:10;
% y = exp(i*(2*pi*t+pi/2));
y = exp(t*(-1+i));
plot(t,y,'b','LineWidth',2);
axis([-1 10 -1 1]);
grid on; hold on;
plot(y,'r','LineWidth',2);
legend('|z|','z');

