clear;clc;
%% Function space
x = 0:0.01:1;
for m = 0:5
    f = cos(m*pi*x);
    plot(x,f,'LineWidth',1.5);
    hold on;
end
%% Orthogonal functions
m = 3;
n = 15;
x = 0:0.01:1;
f1 = cos(m*pi*x);
f2 = cos(n*pi*x);
disp(trapz(x,f1.*f2));