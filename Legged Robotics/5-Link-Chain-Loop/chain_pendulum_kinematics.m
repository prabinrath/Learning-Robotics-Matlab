function P = chain_pendulum_kinematics(q)
th1 = q(1); th2 = q(2); th3 = q(3); th4 = q(4); th5 = q(5);
P1 = [5*sin(th1); -5*cos(th1); 1];
P2 = [5*sin(th1 + th2) + 5*sin(th1); - 5*cos(th1 + th2) - 5*cos(th1); 1];
P3 = [5*sin(th1 + th2 + th3) + 5*sin(th1 + th2) + 5*sin(th1); - 5*cos(th1 + th2 + th3) - 5*cos(th1 + th2) - 5*cos(th1); 1];
P4 = [5*sin(th1 + th2 + th3) + 5*sin(th1 + th2 + th3 + th4) + 5*sin(th1 + th2) + 5*sin(th1); - 5*cos(th1 + th2 + th3) - 5*cos(th1 + th2 + th3 + th4) - 5*cos(th1 + th2) - 5*cos(th1); 1];
P5 = [5*sin(th1 + th2 + th3 + th4 + th5) + 5*sin(th1 + th2 + th3) + 5*sin(th1 + th2 + th3 + th4) + 5*sin(th1 + th2) + 5*sin(th1); - 5*cos(th1 + th2 + th3 + th4 + th5) - 5*cos(th1 + th2 + th3) - 5*cos(th1 + th2 + th3 + th4) - 5*cos(th1 + th2) - 5*cos(th1); 1];
P = [P1 P2 P3 P4 P5];
end