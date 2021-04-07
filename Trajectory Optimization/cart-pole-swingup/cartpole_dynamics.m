function x_d = cartpole_dynamics(x, u, m1, m2, l)
    q1 = x(1); q2 = x(2);
    q1_d = x(3); q2_d = x(4);
    g = 9.81;
    
    q1_dd = (l*m2*sin(q2)*q2_d^2 + u + m2*g*cos(q2)*sin(q2)) / ...
        (m1 + m2*(1-cos(q2)^2));
    q2_dd = -1 * (l*m2*cos(q2)*sin(q2)*q2_d^2 + u*cos(q2) + (m1+m2)*g*sin(q2)) / ...
        (l*m1 + l*m2*(1-cos(q2)^2));
    
    x_d = [q1_d, q2_d, q1_dd, q2_dd];
end

