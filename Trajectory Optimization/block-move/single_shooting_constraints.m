function [c,ceq] = single_shooting_constraints(x, times, target)
    c = [];
    vels = cumtrapz(times, x);
    pos = trapz(times, vels);    
    ceq = [pos-target, vels(end)];
end

