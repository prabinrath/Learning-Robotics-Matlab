clear;
clc;
%% Formulation

LB = [-5;-3]; %Lower Bounds
UB = [1;3]; %Upper Bounds

X0 = [-3;-3]; %Initial Condition

A = []; %No linear inequality constraints
B = [];

Aeq = []; %No linear equality constraints
Beq = [];

options = optimoptions('fmincon',...
                       'Algorithm', 'sqp',...
                       'Display', 'iter-detailed',...
                       'MaxFunctionEvaluations', 100000,...
                       'MaxIterations', 2000,...
                       'FunctionTolerance', 1e-10);

%% Solve NLP

[X, Cost] = fmincon(@(x) objective(x), X0, A, B, Aeq, Beq, LB, UB,...
            @(x) constraints(x), options);
        
%% Plot

[x1, x2] = meshgrid(-5:0.1:1, -3:0.1:3);

cost = sin(x1) + 0.1*x2.^2 + 0.05*x1.^2;

figure(1);
contour(x1, x2, cost, 20, 'LineWidth', 2);
xlabel('x1');
ylabel('x2');
zlabel('cost');

x = -5:0.1:1;
y = (x+3).^3;

hold on;

plot(x, y, 'k', 'LineWidth', 2);
xlim([-5 1]);
ylim([-3 3]);

plot(X(1), X(2), 'r.', 'MarkerSize', 30);
