clear;clc;

%% dx/dt = Ax + Bu; y = Cx + Du;
A = [0 1;-1 -0.1]; %Oscillating damped dynamics
B = [0;1];
C = eye(2);
D = [0;0];

sys = ss(A,B,C,D); %ODE defined as state space

%% Impulse to the system acts as an intial unit condition
%impulse(sys,100);

%% Response for generic input u(t)
td = 0:0.1:50;
u = 0*td;
u(100:200) = (1/sqrt(2))*(0:0.1:10);
u(200:300) = (1/sqrt(2))*(10:-0.1:0);
plot(td,u);
lsim(sys,u,td);