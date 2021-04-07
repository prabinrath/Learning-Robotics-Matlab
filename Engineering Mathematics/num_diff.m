clear all;

dt = 0.1;
t = 0:dt:2*pi;
f = sin(t); % function to differentiate

plot(t,f,'black','LineWidth',1.2);
axis([0 2*pi -1 1]);
hold on;grid on;
n = length(f);
f = f + 0.01*randn(1,n); % Add sampling error
plot(t,f,'bx','LineWidth',1.2);

figure;
ediff = cos(t); % exact differentation
plot(t,ediff,'black','LineWidth',1.2);
axis([0 2*pi -1 1]);
hold on;grid on;

%{
%% Forward, Backward, Central Difference
diffF = (sin(t+dt)-sin(t))/dt;
diffB = (sin(t)-sin(t-dt))/dt;
diffC = (sin(t+dt)-sin(t-dt))/(2*dt);

plot(t,diffF,'red','LineWidth',1.2);
plot(t,diffB,'green','LineWidth',1.2);
plot(t,diffC,'yellow','LineWidth',1.2);

legend('function','exact diff','forward diff','backward diff','central diff');
%}

%% Assuming f as a data vector
diff = zeros([1 n]);
diff(1) = (f(2)-f(1))/dt; % forward
for i=2:n-1
    diff(i) = (f(i+1)-f(i-1))/(2*dt); % central
end
diff(n) = (f(n)-f(n-1))/dt; % backward

plot(t,diff,'rx','LineWidth',1.2); % The sampling error is amplified with smaller dt

