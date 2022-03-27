function q0next = pdw_foot_strike_dynamics(qb,pdw)
    th1b = qb(1); th2b = qb(2);
    th1db = qb(3); th2db = qb(4);
    l1 = pdw.l1; l2 = pdw.l2;
    m1 = pdw.m1; m2 = pdw.m2; mh = pdw.mh;
    q0next = [th1b + th2b;-th2b;(6*l1*l2*m1*th1db - 2*l1*l2*m2*th2db + 6*l1*l2*mh*th1db + 3*l1^2*m1*th1db*cos(th2b) + 6*l1^2*m2*th1db*cos(th2b) + 3*l2^2*m2*th1db*cos(th2b) + 3*l2^2*m2*th2db*cos(th2b) + 12*l1^2*mh*th1db*cos(th2b) - 9*l1*l2*m1*th1db*cos(th2b)^2 - 9*l1*l2*m2*th1db*cos(th2b)^2 - 18*l1*l2*mh*th1db*cos(th2b)^2)/(l1*l2*(12*m1 + 4*m2 + 12*mh - 9*m1*cos(th2b)^2)) - (6*l1*m1*th1db + 2*l1*m2*th1db + 6*l1*mh*th1db + 3*l2*m2*th1db*cos(th2b) + 3*l2*m2*th2db*cos(th2b) - 9*l1*m1*th1db*cos(th2b)^2 - 9*l1*m2*th1db*cos(th2b)^2 - 18*l1*mh*th1db*cos(th2b)^2)/(l1*(12*m1 + 4*m2 + 12*mh - 9*m1*cos(th2b)^2));-(6*l1*l2*m1*th1db - 2*l1*l2*m2*th2db + 6*l1*l2*mh*th1db + 3*l1^2*m1*th1db*cos(th2b) + 6*l1^2*m2*th1db*cos(th2b) + 3*l2^2*m2*th1db*cos(th2b) + 3*l2^2*m2*th2db*cos(th2b) + 12*l1^2*mh*th1db*cos(th2b) - 9*l1*l2*m1*th1db*cos(th2b)^2 - 9*l1*l2*m2*th1db*cos(th2b)^2 - 18*l1*l2*mh*th1db*cos(th2b)^2)/(l1*l2*(12*m1 + 4*m2 + 12*mh - 9*m1*cos(th2b)^2))];
end

