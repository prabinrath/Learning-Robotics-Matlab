clear;clc;

A = [0 1 0 0;
     0 0 1 0;
     0 0 0 1;
     -7 -1 -2 -5]; % Matrix A

dt = 0.01; T = 20; % Simulation time

x0 = [1 2 3 4]; % Initial conditions

[t,x] = ode45(@(t,x) A*x, 0:dt:T, x0); % Solve ODE at different timesteps
plot(t,x(:,1),'b','LineWidth',2); % Plot position
axis([0 T -15000 15000]); % Divergent curve