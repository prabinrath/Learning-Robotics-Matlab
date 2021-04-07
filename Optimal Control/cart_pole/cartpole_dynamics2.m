function [A, B] = cartpole_dynamics2(x, m1, m2, l)
    q1 = x(1); q2 = x(2);
    q1_d = x(3); q2_d = x(4);
    g = 9.81;
    D = m1 + m2*(1-cos(q2)^2);
    
    q1_dd_d = (l*m2*sin(q2)*q2_d^2 + m2*g*cos(q2)*sin(q2)) / D;
    q2_dd_d = -1*(l*m2*cos(q2)*sin(q2)*q2_d^2 + (m1+m2)*g*sin(q2)) / (l*D);
    
    q1_dd_c = 1 / D;
    q2_dd_c = -cos(q2) / (l*D);
    
    A = [q1_d; q2_d; q1_dd_d; q2_dd_d];
    B = [0; 0; q1_dd_c; q2_dd_c];
end