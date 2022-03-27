function sdiff = stepdiff(q0,deltat,pdw)
    [t,q,q0next] = one_step(0,deltat,q0,pdw);
    sdiff = q0next-q0;
end

