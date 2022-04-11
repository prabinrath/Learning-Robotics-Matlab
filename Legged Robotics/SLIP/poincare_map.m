function qnext = poincare_map(q0,deltat,slip)
    [~,~,q0next] = one_step(0,deltat,[0 q0 0],slip);
    qnext = q0next(2:3);
end

