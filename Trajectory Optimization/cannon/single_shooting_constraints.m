function [c,ceq] = single_shooting_constraints(x, target)
    c=[];
    x_distance = x(2)*x(1);
    y_distance = x(3)*x(1) - 0.5*9.8*x(1)^2;
    ceq = [x_distance-target(1), y_distance-target(2)];
end

