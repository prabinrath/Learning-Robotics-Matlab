function [c,ceq] = trapezoidal_constraints(x, m1, m2, l, times, target)
    c = [];

    len = size(times, 2);
    dt = (times(end)-times(1))/(size(times, 2)-1);
    
    q1 = x(1:len);
    q2 = x(len+1:2*len);
    q1_d = x(2*len+1:3*len);
    q2_d = x(3*len+1:4*len);
    u = x(4*len+1:5*len);
    
    ceq = [q1(1), q2(1), q1_d(1), q2_d(1), ...
        q1(end)-target(1), q2(end)-target(2), q1_d(end)-target(3), q2_d(end)-target(4)];
    
    for i = 1:len-1
       current_state = [q1(i), q2(i), q1_d(i), q2_d(i)];
       current_dynamics = cartpole_dynamics(current_state, u(i), m1, m2, l);
       next_state = [q1(i+1), q2(i+1), q1_d(i+1), q2_d(i+1)];
       next_dynamics = cartpole_dynamics(next_state, u(i+1), m1, m2, l);
       ceq = [ceq, next_state - (current_state + 0.5*dt*(current_dynamics+next_dynamics))];
    end
end

