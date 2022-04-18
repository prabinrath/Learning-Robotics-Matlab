function qd = slip_stance_dynamics(t,q,slip)
x = q(1); y = q(2); xd = q(3); yd = q(4); th = slip.th;
qd = [xd; yd; -(50*(((x - sin(th))^2 + y^2)^(1/2) - 1)*(2*x - 2*sin(th)))/((x - sin(th))^2 + y^2)^(1/2); - (100*y*(((x - sin(th))^2 + y^2)^(1/2) - 1))/((x - sin(th))^2 + y^2)^(1/2) - 981/100];
end