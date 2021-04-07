function [c,ceq] = direct_collocation_constraints(x, times, target)
    c = [];
    
    len = size(times, 2);
    dt = (times(end)-times(1))/(size(times, 2)-1);
    pos = x(1:len);
    vel = x(len+1:2*len);
    acc = x(2*len+1:3*len);
    
    ceq = [pos(1), vel(1), pos(end)-target, vel(end)]; %Boundary conditions
    
    for i = 1:len-1 %Trapezoidal quadrature
       ceq = [ceq, pos(i+1) - (pos(i) + 0.5*dt*(vel(i+1)+vel(i)))];
       ceq = [ceq, vel(i+1) - (vel(i) + 0.5*dt*(acc(i+1)+acc(i)))];
    end
end

