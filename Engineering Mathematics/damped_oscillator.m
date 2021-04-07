clear;clc;

k = 80; % Spring constant
d = 2.5; % Damping ratio
m = 1.5; % Mass in Kg

A = [0 1; (-k/m) (-d/m)]; % Damper ODE

dt = 0.01; T = 10; % Simulation time

x0 = [5 0]; % Initial conditions

[t,x] = ode45(@(t,x) A*x, 0:dt:T, x0); % Solve ODE at different timesteps
plot(t,x(:,1),'b','LineWidth',1); % Plot position
hold on;
plot(t,x(:,2),'r','LineWidth',1); % Plot velocity