clear  all; close all;

x = -10:0.01:10;
y = exp(x);
plot(x,y,'k','LineWidth',2);
axis([-10 10 -50 50]);
xlabel('x')
ylabel('e^x')
set(gca,'FontSize',16,'LineWidth',2)
grid on; hold on;

%% Taylor First order approx about x=0
P = [1 1];
yT1 =  polyval(P,x);
plot(x,yT1,'b','LineWidth',1.2);

%% Taylor Second order approx about x=0
P = [1/factorial(2) 1 1];
yT1 =  polyval(P,x);
plot(x,yT1,'g','LineWidth',1.2);

%% Taylor Third order approx about x=0
P = [1/factorial(3) 1/factorial(2) 1 1];
yT1 =  polyval(P,x);
plot(x,yT1,'c','LineWidth',1.2);

%% Taylor Fourth order approx about x=0
P = [1/factorial(4) 1/factorial(3) 1/factorial(2) 1 1];
yT1 =  polyval(P,x);
plot(x,yT1,'r','LineWidth',1.2);

%% Taylor Fourth order approx about x=0
P = [1/factorial(5) 1/factorial(4) 1/factorial(3) 1/factorial(2) 1 1];
yT1 =  polyval(P,x);
plot(x,yT1,'m','LineWidth',1.2);