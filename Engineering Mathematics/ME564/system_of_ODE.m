clear;clc;

%A = [0 1;-2 -3];
A = [-0.009 1;0 -0.01];
%A = [1 1;1 -1]*A*inv([1 1;1 -1]);

[T,D]=eig(A);
eDt = @(d,t) diag(exp(diag(d)*t));
x = @(x0,t) T*eDt(D,t)*inv(T)*x0; % Method 1: solve using eigan vectors and eigan values

dT = 0:0.1:1000; % ODE always time from 0 to T, x(0) must be initial condition

y = [];
for tt = dT
    y = [y x([1;1],tt)];
end

plot(dT, y(1,:), 'r', 'LineWidth', 2);
axis([0 1000 0 50]);
xlabel('t');
ylabel('X(t)');
%plot( y(1,:), y(2,:), 'r', 'LineWidth', 2);
%xlabel('X');
%ylabel('V');
r = 100;
%axis([-r r -r r]);
grid on; hold on;

%quiver([0 0],[0 0],T(1,:),T(2,:),r); % Plot eigan vectors

%[t,xt] = ode45(@(t,xt) A*xt, dT, [10;10]); # Method 2: solve using inbuilt matlab function
%plot(dT, y(1,:), 'r', 'LineWidth', 2);
%plot(xt(:,1), xt(:,2), 'b', 'LineWidth', 2);
%legend('T*eDt*T^-1*x0','ode45');/