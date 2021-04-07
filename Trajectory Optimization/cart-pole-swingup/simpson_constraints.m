function [c,ceq] = simpson_constraints(x, m1, m2, l, times, target)
    c = [];

    len = size(times, 2);
    dt = (times(end)-times(1))/(size(times, 2)-1);
    
    q1 = x(1:2*len-1);
    q2 = x(2*len:4*len-2);
    q1_d = x(4*len-1:6*len-3);
    q2_d = x(6*len-2:8*len-4);
    u = x(8*len-3:10*len-5);
    
    ceq = [q1(1), q2(1), q1_d(1), q2_d(1), ...
        q1(end)-target(1), q2(end)-target(2), q1_d(end)-target(3), q2_d(end)-target(4)];
    
    j = 1;
    for i = 1:len-1
       current_state = [q1(j), q2(j), q1_d(j), q2_d(j)];
       current_dynamics = cartpole_dynamics(current_state, u(j), m1, m2, l);
       half_state = [q1(j+1), q2(j+1), q1_d(j+1), q2_d(j+1)];
       half_dynamics = cartpole_dynamics(half_state, u(j+1), m1, m2, l);
       next_state = [q1(j+2), q2(j+2), q1_d(j+2), q2_d(j+2)];
       next_dynamics = cartpole_dynamics(next_state, u(j+2), m1, m2, l);
       ceq = [ceq, ...
           half_state - (0.5*(current_state+next_state)+(dt/8)*(current_dynamics-next_dynamics)), ...
           next_state - (current_state + (dt/6)*(current_dynamics+4*half_dynamics+next_dynamics))];
       j = j+2;
    end
end

