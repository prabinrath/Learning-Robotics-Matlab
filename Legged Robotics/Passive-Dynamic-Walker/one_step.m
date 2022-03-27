function [tsim,qsim,q0next] = one_step(tstart,deltat,q0,pdw)
    options = odeset('Abstol',1e-13,'Reltol',1e-13,'Events',@contact);
    [tsim,qsim] = ode113(@pdw_stance_dynamics,[tstart tstart+deltat],q0,options,pdw);
    qb = qsim(end,:);
    q0next = pdw_foot_strike_dynamics(qb,pdw);
end
