function qdd = pdw_stance_dynamics(t,q,pdw)
    th1 = q(1); th2 = q(2);
    th1d = q(3); th2d = q(4);
    gamma = pdw.gamma;
    l1 = pdw.l1; l2 = pdw.l2;
    m1 = pdw.m1; m2 = pdw.m2; mh = pdw.mh;
    qdd = [th1d; th2d; -(3*(1962*m1*sin(gamma - th1) + 3924*m2*sin(gamma - th1) + 3924*mh*sin(gamma - th1) + 2943*m2*sin(th1 - gamma + th2)*cos(th2) + 200*l2*m2*th1d^2*sin(th2) + 200*l2*m2*th2d^2*sin(th2) + 400*l2*m2*th1d*th2d*sin(th2) - 300*l1*m2*th1d^2*cos(th2)*sin(th2)))/(100*(4*l1*m1 + 12*l1*m2 + 12*l1*mh - 9*l1*m2*cos(th2)^2)); (3*(1962*l2*m1*sin(gamma - th1) + 3924*l2*m2*sin(gamma - th1) + 3924*l2*mh*sin(gamma - th1) - 1962*l1*m1*sin(th1 - gamma + th2) - 5886*l1*m2*sin(th1 - gamma + th2) - 5886*l1*mh*sin(th1 - gamma + th2) - 2943*l1*m1*sin(gamma - th1)*cos(th2) - 5886*l1*m2*sin(gamma - th1)*cos(th2) - 5886*l1*mh*sin(gamma - th1)*cos(th2) + 200*l1^2*m1*th1d^2*sin(th2) + 600*l1^2*m2*th1d^2*sin(th2) + 200*l2^2*m2*th1d^2*sin(th2) + 200*l2^2*m2*th2d^2*sin(th2) + 600*l1^2*mh*th1d^2*sin(th2) + 2943*l2*m2*sin(th1 - gamma + th2)*cos(th2) + 400*l2^2*m2*th1d*th2d*sin(th2) - 600*l1*l2*m2*th1d^2*cos(th2)*sin(th2) - 300*l1*l2*m2*th2d^2*cos(th2)*sin(th2) - 600*l1*l2*m2*th1d*th2d*cos(th2)*sin(th2)))/(100*l2*(4*l1*m1 + 12*l1*m2 + 12*l1*mh - 9*l1*m2*cos(th2)^2))];
end

