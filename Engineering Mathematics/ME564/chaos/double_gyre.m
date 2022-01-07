function [dy] = double_gyre(t,x,A,eps,om)
x1 = x(1,:,:);
x2 = x(2,:,:);

a = eps*sin(om*t);
b = 1-2*a;

f = a*x1.^2+b*x1;
df = 2*a*x1+b;

u = -pi*A*sin(pi*f).*cos(pi*x2);
v = pi*A*cos(pi*f).*df.*sin(pi*x2);

dy = [u;v];
end