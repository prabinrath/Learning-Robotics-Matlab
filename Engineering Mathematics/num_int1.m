clear; clc;
dt = 0.001;
t = 0:dt:10;
f = sin(t);

n = length(f);

%% Left Right rectangle rule
intLR = 0;
intRR = 0;
for i = 1:n-1
    intLR = intLR + f(i)*dt;
    intRR = intRR + f(i+1)*dt;
end

%% Trapezoidal rule
intTR = 0;
for i = 1:n-1
    intTR = intTR + (dt/2)*(f(i)+f(i+1));
end
% intTR = trapz(t,f);
%% Simpson's 1/3 rule
intSR = 0;
for i = 1:2:n-2
    intSR = intSR + (dt/3)*(f(i)+4*f(i+1)+f(i+2));
end
% intSR = quad(@(xd)spline(t,f,xd),0,10);