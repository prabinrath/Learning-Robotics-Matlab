clear;clc;

k = 80; % Spring constant
d = 2.5; % Damping ratio
m = 1.5; % Mass in Kg

A = [0 1; (-k/m) (-d/m)]; % Damper ODE

dt = 0.001; T = 10; % Simulation time

x0 = [5;0]; % Initial conditions

Mb = inv((eye(2)-dt*A));
Mf = (eye(2)+dt*A);
yf = zeros([2,length(0:dt:T)]);
yf(:,1) = x0;
yb = zeros([2,length(0:dt:T)]);
yb(:,1) = x0;
for i = 2:length(0:dt:T)
    yf(:,i) = Mf*yf(:,i-1);
    yb(:,i) = Mb*yb(:,i-1);
end

[t,g] = ode45(@(t,x) A*x, 0:dt:T, x0); % Solve ODE at different timesteps

plot(t,g(:,1),'b','LineWidth',1); % Plot position
hold on;
plot(t,yf(1,:),'r','LineWidth',1); % Plot position
plot(t,yb(1,:),'g','LineWidth',1); % Plot position
legend('ode45','forward','backward');