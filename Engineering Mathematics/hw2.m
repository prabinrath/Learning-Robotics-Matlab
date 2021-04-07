clear;clc;

%{
A = [0 1 0 0;0 0 1 0;0 0 0 1;6 5 -5 -5];
%A = [1 1;1 -1]*A*inv([1 1;1 -1]);

[T,D]=eig(A);
eDt = @(d,t) diag(exp(diag(d)*t));
x = @(x0,t) T*eDt(D,t)*inv(T)*x0; % Method 1: solve using eigan vectors and eigan values

dT = 0:0.01:10; % ODE always time from 0 to T, x(0) must be initial condition

y = [];
for tt = dT
    y = [y x([1;1;1;1],tt)];
end

plot(dT, y(1,:), 'r', 'LineWidth', 2);
%plot( y(1,:), y(2,:), 'r', 'LineWidth', 2);
%xlabel('X');
%ylabel('V');
r = 5;
axis([-r r -r r]);
grid on; hold on;

%quiver([0 0],[0 0],T(1,:),T(2,:),r); % Plot eigan vectors

%[t,xt] = ode45(@(t,xt) A*xt, dT, [10;10]); # Method 2: solve using inbuilt matlab function
%plot(dT, y(1,:), 'r', 'LineWidth', 2);
%plot(xt(:,1), xt(:,2), 'b', 'LineWidth', 2);
%legend('T*eDt*T^-1*x0','ode45');/
%}

val = @(epsl) eig([0 1 0 0;-(1^2+epsl) 0 epsl 0;0 0 0 1;epsl 0 -(1.5^2+epsl) 0]);

dT = 0:0.005:5;
eval = [];
for ep = dT
    f = val(ep)./i;
    eval = [eval [f(1);f(3)]];
end
eval = real(eval);

plot(dT, eval(1,:), 'r', 'LineWidth', 2);
hold on;
plot(dT, eval(2,:), 'b', 'LineWidth', 2);
plot(dT, eval(2,:)-eval(1,:), 'm', 'LineWidth', 2);
    
    
    
    
    
    
    
    
    
    
    