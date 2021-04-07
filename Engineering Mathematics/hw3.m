clear;clc;

A = [-0.01 0;1 -0.011];
[T,D]=eig(A)
dT = 0:0.1:1000; % ODE always time from 0 to T, x(0) must be initial condition

%quiver([0 0],[0 0],T(1,:),T(2,:),r); % Plot eigan vectors
x0 = [0.1;0];
[t,xt] = ode45(@(t,xt) A*xt, dT, x0); % Method 2: solve using inbuilt matlab function
figure;plot(dT, 0.5*xt(:,2).^2, 'r', 'LineWidth', 2); grid on;
axis([0 1000 0 10]);
xlabel('t');
ylabel('KE(t)');
figure;plot(xt(:,1), xt(:,2), 'b', 'LineWidth', 2); grid on;
r=5; axis([-r r -r r]);
xlabel('X');
ylabel('V');